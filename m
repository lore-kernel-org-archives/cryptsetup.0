Received: from mail3.g24.pair.com (mail3.g24.pair.com [66.39.134.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78B110979
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 15:06:34 +0000 (UTC)
Received: from mail3.g24.pair.com (localhost [127.0.0.1])
	by mail3.g24.pair.com (Postfix) with ESMTP id 88B53124120
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 11:06:33 -0400 (EDT)
Received: from ra21 (ip-50-5-131-223.dynamic.fuse.net [50.5.131.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail3.g24.pair.com (Postfix) with ESMTPSA id 702F9123CD2
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 11:06:33 -0400 (EDT)
Received: (nullmailer pid 1116334 invoked by uid 11111);
	Thu, 24 Aug 2023 15:06:33 -0000
Date: Thu, 24 Aug 2023 11:06:33 -0400
From: Chris X Edwards <chris@xed.ch>
To: cryptsetup@lists.linux.dev
Subject: Re: Can AddKey not use stdin for the new key?
Message-ID: <ZOdx+Z5dq9wjD54E@xed.ch>
References: <ZOcoDVa4p+vJfAm9@xed.ch>
 <20230824105155.GA24581@tansi.org>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230824105155.GA24581@tansi.org>
X-Scanned-By: mailmunge 3.11 on 66.39.134.11

Hi,
Thanks for the reply. I did see this in the man page. Am I right to
assume this suggestion doesn't relate to the "how much time" aspect of
this passage? This leaves the much more treacherous formatting details
between the input modes. Certainly a cause for concern. The reason I
concluded this was an unlikely cause is that the Remove works as I
would imagine (with a piped key) and the Add does not. 

Another check is to go with a very simple passphrase key that can not
possibly have newline entanglements. (That's the goal, correct me if I'm
wrong.) We can start with a very simple key file.

    echo "simple" > simplekey

Let's try just the file.

    cryptsetup luksAddKey /dev/sdb --new-keyfile simplekey --new-key-slot 1
    Enter any existing passphrase: 

Works fine. (Passphrase to add is for existing slot 0 as desired.) Now
removing it.

    cat simplekey | cryptsetup luksRemoveKey /dev/sdb -

Works fine. Now try adding again but with piping instead of the file.

    cat simplekey | cryptsetup luksAddKey /dev/sdb --new-keyfile - --new-key-slot 1
    No key available with this passphrase.

And fail.

This may be a basic limitation of what is possible, but I'm just
trying to establish that fact clearly so I can give up on my dream of
using cryptsetup in the elegant way I imagine it can be used. :-)

Thanks,
Chris

On 2023-08-24 12:51 +0200, Arno Wagner wrote:
> the convengtion for reading passphrases from file and from stdin
> are different. 
> 
> Very likely your passphrase runs into these differences.
>
> From "man cryptsetup":
> 
> NOTES ON PASSPHRASE PROCESSING FOR LUKS
>        LUKS uses PBKDF2 to protect against dictionary attacks and to give some
>        protection to low-entropy passphrases (see RFC 2898 and the  cryptsetup
>        FAQ).
> 
>        From  a  terminal:  The  passphrase is read until the first newline and
>        then processed by PBKDF2 without the newline character.
> 
>        From stdin: LUKS will read passphrases from stdin up to the first  new‐
>        line  character  or  the compiled-in maximum key file length. If --key‐
>        file-size is given, it is ignored.
> 
>        From key file: The complete keyfile is read up to the compiled-in maxi‐
>        mum  size.  Newline  characters  do not terminate the input. The --key‐
>        file-size option can be used to limit what is read.
> 
>        Passphrase processing: Whenever a passphrase is added to a LUKS  header
>        (luksAddKey,  luksFormat),  the  user may specify how much the time the
>        passphrase processing should consume. The time is used to determine the
>        iteration  count  for PBKDF2 and higher times will offer better protec‐
>        tion for low-entropy passphrases, but open will  take  longer  to  com‐
>        plete.  For  passphrases  that  have  entropy  higher than the used key
>        length, higher iteration times will not increase security.
> 
>        The default setting of one second  is  sufficient  for  most  practical
>        cases.  The only exception is a low-entropy passphrase used on a device
>        with a slow CPU, as this will result in a low  iteration  count.  On  a
>        slow  device  it  may be advisable to increase the iteration time using
>        the --iter-time option in order to obtain  a  higher  iteration  count.
>        This does slow down all later luksOpen operations accordingly.
> 
> On Thu, Aug 24, 2023 at 11:51:09 CEST, Chris X Edwards wrote:
> > Hi,
> > 
> > I'm looking for some clarification into why what I'm attempting does
> > not work.
> > 
> > What I'd like to do is have a large number of (e.g. regular backup)
> > drives all encrypted with the same key; I don't want to type a
> > password every time I connect one so it would be great if I could have
> > some kind of SSH-like agent. I believe GPG has such a thing. So...
> > 
> > I create an encrypted secret that I only have to unlock once:
> > 
> >     dd if=/dev/urandom bs=512 count=1 | gpg --symmetric --output drivekey.gpg
> > 
> > Now I'd like to add that to a LUKS keyslot so that the following
> > works.
> > 
> >     gpg --decrypt drivekey.gpg | cryptsetup luksOpen --key-file=- /dev/sdb backup
> > 
> > When I add the key like this, it (this luksAddKey command and the
> > previous luksOpen) does all work.
> > 
> >     gpg --decrypt drivekey.gpg > INSECUREdrivekey
> >     cryptsetup luksAddKey /dev/sdb  --new-keyfile INSECUREdrivekey --new-key-slot 1
> >     rm INSECUREdrivekey
> > 
> > This asks for a passphrase for one of the existing slots as I'd
> > expect. However, I'd like to avoid that insecure part with something
> > like this.
> > 
> >     gpg --decrypt drivekey.gpg | cryptsetup luksAddKey /dev/sdb --new-keyfile - --new-key-slot 1
> > 
> > This does not work. I was hoping it would still ask for a passphrase
> > of an existing slot. But it just complains of "No key available with
> > this passphrase."
> > 
> > What's also interesting is that _removing_ the key works exactly how I
> > think it should.
> > 
> >     gpg --decrypt drivekey.gpg | cryptsetup luksRemoveKey /dev/sdb -
> > 
> > Am I misunderstanding the syntax? Is there a way to have the
> > `luksAddKey` command accept the new key on stdin while verifying that
> > it can be added by typing a passphrase? Maybe manual passphrase and
> > stdin mixing is too confusing. Obviously I can work around it but I'm
> > now curious.
> > 
> > Thanks!

-- 
++++++++++[>++++++++++++<-]>-...<++++++[>>+++++++<<-]>>++++.<+.<++++[>
Chris X Edwards-----<-]>+.- Have a nice day. >.<-.+++++><chris@xed.ch>
