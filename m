Received: from mail3.g24.pair.com (mail3.g24.pair.com [66.39.134.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8923CA76
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 18:35:31 +0000 (UTC)
Received: from mail3.g24.pair.com (localhost [127.0.0.1])
	by mail3.g24.pair.com (Postfix) with ESMTP id 91DC9144B78
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 14:35:30 -0400 (EDT)
Received: from ra21 (ip-50-5-131-223.dynamic.fuse.net [50.5.131.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail3.g24.pair.com (Postfix) with ESMTPSA id 80FE5144C82
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 14:35:30 -0400 (EDT)
Received: (nullmailer pid 1166598 invoked by uid 11111);
	Thu, 24 Aug 2023 18:35:30 -0000
Date: Thu, 24 Aug 2023 14:35:30 -0400
From: Chris X Edwards <chris@xed.ch>
To: cryptsetup@lists.linux.dev
Subject: Re: Can AddKey not use stdin for the new key?
Message-ID: <ZOei8rjDNiJwnHbr@xed.ch>
References: <ZOcoDVa4p+vJfAm9@xed.ch>
 <f28150bc-89d0-4998-95b4-a4509d3a0624@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f28150bc-89d0-4998-95b4-a4509d3a0624@home.arpa>
X-Scanned-By: mailmunge 3.11 on 66.39.134.11

Hi,
These are two very interesting suggestions! I think you're right that
decrypting a volume that contains the secrets is a pretty rational
approach. The Bash process redirect looks fun but I couldn't get it to
work and it would be pretty extraordinary if the options parsing
handled that well.

Another approach I thought might work is to set up the second slot
with luksAddKey and just put in a nonce passphrase normally; then
immediately try a luksChangeKey to swap it for a file. 

The cryptsetup-luksChangeKey 8 man page (under -d option) says:

  If you want to set a new passphrase via key file, you have to use a
  positional argument or parameter --new-keyfile.

And that would be exactly what would be required. Unfortunately, I
think this might be a man page error since that option produces:

    cryptsetup: Option --new-keyfile is not allowed with luksChangeKey action

It definitely seems like all the options are kind of in place to do
this (especially `--new-keyfile=-` in luksAddKey) but they're just not
quite doing what I'd hope. Not a big deal. Just thought I'd run it by
this list and see if anyone could spot an obvious error in my
thinking. 

Thanks for all the suggestions!
Cheers,
Chris

On 2023-08-24 17:27 +0000, Michael Kj??rling wrote:
> On 24 Aug 2023 05:51 -0400, from chris@xed.ch (Chris X Edwards):
> > I create an encrypted secret that I only have to unlock once:
> > 
> If you are willing to unlock once, you can also use a small LUKS
> container to hold a file system holding passphrase or key files for
> other LUKS containers. Or you can derive further keys from contents or
> metadata of another LUKS container; I've seen suggestions for how to
> do this scattered about the Web.
> 
> 
> > Now I'd like to add that to a LUKS keyslot so that the following
> > works.
> > 
> >     gpg --decrypt drivekey.gpg | cryptsetup luksOpen --key-file=- /dev/sdb backup
> 
> Assuming bash, you might want to try:
> 
>     cryptsetup luksOpen --key-file=<(gpg --decrypt drivekey.gpg) /dev/sdb backup
> 
> and corresponding variations of your other commands as well.

-- 
++++++++++[>++++++++++++<-]>-...<++++++[>>+++++++<<-]>>++++.<+.<++++[>
Chris X Edwards-----<-]>+.- Have a nice day. >.<-.+++++><chris@xed.ch>
