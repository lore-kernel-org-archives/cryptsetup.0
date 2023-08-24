Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41312454A
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 10:52:02 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 3842C140083
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 12:51:15 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 5130D17A1DA; Thu, 24 Aug 2023 12:51:55 +0200 (CEST)
Date: Thu, 24 Aug 2023 12:51:55 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: cryptsetup@lists.linux.dev
Subject: Re: Can AddKey not use stdin for the new key?
Message-ID: <20230824105155.GA24581@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <ZOcoDVa4p+vJfAm9@xed.ch>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZOcoDVa4p+vJfAm9@xed.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Chris,

the convengtion for reading passphrases from file and from stdin
are different. 

Very likely your passphrase runs into these differences.

Regards,
Arno

---
From "man cryptsetup":

NOTES ON PASSPHRASE PROCESSING FOR LUKS
       LUKS uses PBKDF2 to protect against dictionary attacks and to give some
       protection to low-entropy passphrases (see RFC 2898 and the  cryptsetup
       FAQ).

       From  a  terminal:  The  passphrase is read until the first newline and
       then processed by PBKDF2 without the newline character.

       From stdin: LUKS will read passphrases from stdin up to the first  new‐
       line  character  or  the compiled-in maximum key file length. If --key‐
       file-size is given, it is ignored.

       From key file: The complete keyfile is read up to the compiled-in maxi‐
       mum  size.  Newline  characters  do not terminate the input. The --key‐
       file-size option can be used to limit what is read.

       Passphrase processing: Whenever a passphrase is added to a LUKS  header
       (luksAddKey,  luksFormat),  the  user may specify how much the time the
       passphrase processing should consume. The time is used to determine the
       iteration  count  for PBKDF2 and higher times will offer better protec‐
       tion for low-entropy passphrases, but open will  take  longer  to  com‐
       plete.  For  passphrases  that  have  entropy  higher than the used key
       length, higher iteration times will not increase security.

       The default setting of one second  is  sufficient  for  most  practical
       cases.  The only exception is a low-entropy passphrase used on a device
       with a slow CPU, as this will result in a low  iteration  count.  On  a
       slow  device  it  may be advisable to increase the iteration time using
       the --iter-time option in order to obtain  a  higher  iteration  count.
       This does slow down all later luksOpen operations accordingly.




On Thu, Aug 24, 2023 at 11:51:09 CEST, Chris X Edwards wrote:
> Hi,
> 
> I'm looking for some clarification into why what I'm attempting does
> not work.
> 
> What I'd like to do is have a large number of (e.g. regular backup)
> drives all encrypted with the same key; I don't want to type a
> password every time I connect one so it would be great if I could have
> some kind of SSH-like agent. I believe GPG has such a thing. So...
> 
> I create an encrypted secret that I only have to unlock once:
> 
>     dd if=/dev/urandom bs=512 count=1 | gpg --symmetric --output drivekey.gpg
> 
> Now I'd like to add that to a LUKS keyslot so that the following
> works.
> 
>     gpg --decrypt drivekey.gpg | cryptsetup luksOpen --key-file=- /dev/sdb backup
> 
> When I add the key like this, it (this luksAddKey command and the
> previous luksOpen) does all work.
> 
>     gpg --decrypt drivekey.gpg > INSECUREdrivekey
>     cryptsetup luksAddKey /dev/sdb  --new-keyfile INSECUREdrivekey --new-key-slot 1
>     rm INSECUREdrivekey
> 
> This asks for a passphrase for one of the existing slots as I'd
> expect. However, I'd like to avoid that insecure part with something
> like this.
> 
>     gpg --decrypt drivekey.gpg | cryptsetup luksAddKey /dev/sdb --new-keyfile - --new-key-slot 1
> 
> This does not work. I was hoping it would still ask for a passphrase
> of an existing slot. But it just complains of "No key available with
> this passphrase."
> 
> What's also interesting is that _removing_ the key works exactly how I
> think it should.
> 
>     gpg --decrypt drivekey.gpg | cryptsetup luksRemoveKey /dev/sdb -
> 
> Am I misunderstanding the syntax? Is there a way to have the
> `luksAddKey` command accept the new key on stdin while verifying that
> it can be added by typing a passphrase? Maybe manual passphrase and
> stdin mixing is too confusing. Obviously I can work around it but I'm
> now curious.
> 
> Thanks!
> 
> -- 
> ++++++++++[>++++++++++++<-]>-...<++++++[>>+++++++<<-]>>++++.<+.<++++[>
> Chris X Edwards-----<-]>+.- Have a nice day. >.<-.+++++><chris@xed.ch>

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
