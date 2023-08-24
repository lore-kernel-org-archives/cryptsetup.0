Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362B31549C
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 19:16:18 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 01DF9140083
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 21:15:36 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 26DC417A1DA; Thu, 24 Aug 2023 21:16:16 +0200 (CEST)
Date: Thu, 24 Aug 2023 21:16:16 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: cryptsetup@lists.linux.dev
Subject: Re: Can AddKey not use stdin for the new key?
Message-ID: <20230824191615.GA904@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <ZOcoDVa4p+vJfAm9@xed.ch>
 <20230824105155.GA24581@tansi.org>
 <ZOdx+Z5dq9wjD54E@xed.ch>
 <20230824152350.GA29323@tansi.org>
 <ZOd9KJ6uLqlZFoLi@xed.ch>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOd9KJ6uLqlZFoLi@xed.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)

Ah, luksAddKey has two key arguments and you can only read
one from stdin. Somwetimes the most obvious mistakes are
hard to spot ;-)

You need: 
1. The existing passprase from --key-file or interactively
2. The new passprase from positional argument or interactively

That is why you can delete. Deletion has only the passphrase 
as input.

Hence you need one passprase from file, no matter
what, you can only have one from stdin. Workarounds, I 
can think of

1. Use a ramdisk to temporarily store the key and then wipe it
2. Use an encrypted volume to hold the existing pasprase(s) as
   described by Michael. Can be luks in a file via losetup.
3. Use libcryptsetup and write your own code.

Regards,
Arno


On Thu, Aug 24, 2023 at 17:54:16 CEST, Chris X Edwards wrote:
> That is a sensible addition. I would have assumed that rather than
> have some possibly randomly occurring newline (or whatever the problem
> is) the straight echo would at least put the newline in a safe
> (ignorable) place in my previous example. However, even using `-n` I
> get the same situation.
> 
>     $ echo -n "simple" > simplekey
>     $ cat simplekey |  cryptsetup luksAddKey /dev/sdb --new-keyfile - --new-key-slot 1
>     No key available with this passphrase.
> 
> That's definitely a smart thing to try to rule out newline mischief
> but the error message makes me think that it's just looking for the
> authorizing passphrase using the new key I'm trying to add (which is
> different behavior than when I actually specify a file). That may be
> the case, but I'm not sure.
> 
> Thanks,
> Chris
> 
> 
> On 2023-08-24 17:23 +0200, Arno Wagner wrote:
> > Make that "echo -n" and try again ;-)
> > 
> > Arno
> > 
> > 
> > On Thu, Aug 24, 2023 at 17:06:33 CEST, Chris X Edwards wrote:
> > > Hi,
> > > Thanks for the reply. I did see this in the man page. Am I right to
> > > assume this suggestion doesn't relate to the "how much time" aspect of
> > > this passage? This leaves the much more treacherous formatting details
> > > between the input modes. Certainly a cause for concern. The reason I
> > > concluded this was an unlikely cause is that the Remove works as I
> > > would imagine (with a piped key) and the Add does not. 
> > > 
> > > Another check is to go with a very simple passphrase key that can not
> > > possibly have newline entanglements. (That's the goal, correct me if I'm
> > > wrong.) We can start with a very simple key file.
> > > 
> > >     echo "simple" > simplekey
> > > 
> > > Let's try just the file.
> > > 
> > >     cryptsetup luksAddKey /dev/sdb --new-keyfile simplekey --new-key-slot 1
> > >     Enter any existing passphrase: 
> > > 
> > > Works fine. (Passphrase to add is for existing slot 0 as desired.) Now
> > > removing it.
> > > 
> > >     cat simplekey | cryptsetup luksRemoveKey /dev/sdb -
> > > 
> > > Works fine. Now try adding again but with piping instead of the file.
> > > 
> > >     cat simplekey | cryptsetup luksAddKey /dev/sdb --new-keyfile - --new-key-slot 1
> > >     No key available with this passphrase.
> > > 
> > > And fail.
> > > 
> > > This may be a basic limitation of what is possible, but I'm just
> > > trying to establish that fact clearly so I can give up on my dream of
> > > using cryptsetup in the elegant way I imagine it can be used. :-)
> > > 
> > > Thanks,
> > > Chris
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
