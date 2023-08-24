Received: from mail3.g24.pair.com (mail3.g24.pair.com [66.39.134.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190D0D524
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 09:51:10 +0000 (UTC)
Received: from mail3.g24.pair.com (localhost [127.0.0.1])
	by mail3.g24.pair.com (Postfix) with ESMTP id 0AF9E11A835
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 05:51:10 -0400 (EDT)
Received: from ra21 (ip-50-5-131-223.dynamic.fuse.net [50.5.131.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail3.g24.pair.com (Postfix) with ESMTPSA id EAD7A11AE9C
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 05:51:09 -0400 (EDT)
Received: (nullmailer pid 1040790 invoked by uid 11111);
	Thu, 24 Aug 2023 09:51:09 -0000
Date: Thu, 24 Aug 2023 05:51:09 -0400
From: Chris X Edwards <chris@xed.ch>
To: cryptsetup@lists.linux.dev
Subject: Can AddKey not use stdin for the new key?
Message-ID: <ZOcoDVa4p+vJfAm9@xed.ch>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: mailmunge 3.11 on 66.39.134.11

Hi,

I'm looking for some clarification into why what I'm attempting does
not work.

What I'd like to do is have a large number of (e.g. regular backup)
drives all encrypted with the same key; I don't want to type a
password every time I connect one so it would be great if I could have
some kind of SSH-like agent. I believe GPG has such a thing. So...

I create an encrypted secret that I only have to unlock once:

    dd if=/dev/urandom bs=512 count=1 | gpg --symmetric --output drivekey.gpg

Now I'd like to add that to a LUKS keyslot so that the following
works.

    gpg --decrypt drivekey.gpg | cryptsetup luksOpen --key-file=- /dev/sdb backup

When I add the key like this, it (this luksAddKey command and the
previous luksOpen) does all work.

    gpg --decrypt drivekey.gpg > INSECUREdrivekey
    cryptsetup luksAddKey /dev/sdb  --new-keyfile INSECUREdrivekey --new-key-slot 1
    rm INSECUREdrivekey

This asks for a passphrase for one of the existing slots as I'd
expect. However, I'd like to avoid that insecure part with something
like this.

    gpg --decrypt drivekey.gpg | cryptsetup luksAddKey /dev/sdb --new-keyfile - --new-key-slot 1

This does not work. I was hoping it would still ask for a passphrase
of an existing slot. But it just complains of "No key available with
this passphrase."

What's also interesting is that _removing_ the key works exactly how I
think it should.

    gpg --decrypt drivekey.gpg | cryptsetup luksRemoveKey /dev/sdb -

Am I misunderstanding the syntax? Is there a way to have the
`luksAddKey` command accept the new key on stdin while verifying that
it can be added by typing a passphrase? Maybe manual passphrase and
stdin mixing is too confusing. Obviously I can work around it but I'm
now curious.

Thanks!

-- 
++++++++++[>++++++++++++<-]>-...<++++++[>>+++++++<<-]>>++++.<+.<++++[>
Chris X Edwards-----<-]>+.- Have a nice day. >.<-.+++++><chris@xed.ch>
