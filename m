Received: from mail3.g24.pair.com (mail3.g24.pair.com [66.39.134.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AEFDDB5
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 15:54:17 +0000 (UTC)
Received: from mail3.g24.pair.com (localhost [127.0.0.1])
	by mail3.g24.pair.com (Postfix) with ESMTP id 05FAF11CBBF
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 11:54:17 -0400 (EDT)
Received: from ra21 (ip-50-5-131-223.dynamic.fuse.net [50.5.131.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail3.g24.pair.com (Postfix) with ESMTPSA id E8C1B11CE02
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 11:54:16 -0400 (EDT)
Received: (nullmailer pid 1127896 invoked by uid 11111);
	Thu, 24 Aug 2023 15:54:16 -0000
Date: Thu, 24 Aug 2023 11:54:16 -0400
From: Chris X Edwards <chris@xed.ch>
To: cryptsetup@lists.linux.dev
Subject: Re: Can AddKey not use stdin for the new key?
Message-ID: <ZOd9KJ6uLqlZFoLi@xed.ch>
References: <ZOcoDVa4p+vJfAm9@xed.ch>
 <20230824105155.GA24581@tansi.org>
 <ZOdx+Z5dq9wjD54E@xed.ch>
 <20230824152350.GA29323@tansi.org>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824152350.GA29323@tansi.org>
X-Scanned-By: mailmunge 3.11 on 66.39.134.11

That is a sensible addition. I would have assumed that rather than
have some possibly randomly occurring newline (or whatever the problem
is) the straight echo would at least put the newline in a safe
(ignorable) place in my previous example. However, even using `-n` I
get the same situation.

    $ echo -n "simple" > simplekey
    $ cat simplekey |  cryptsetup luksAddKey /dev/sdb --new-keyfile - --new-key-slot 1
    No key available with this passphrase.

That's definitely a smart thing to try to rule out newline mischief
but the error message makes me think that it's just looking for the
authorizing passphrase using the new key I'm trying to add (which is
different behavior than when I actually specify a file). That may be
the case, but I'm not sure.

Thanks,
Chris


On 2023-08-24 17:23 +0200, Arno Wagner wrote:
> Make that "echo -n" and try again ;-)
> 
> Arno
> 
> 
> On Thu, Aug 24, 2023 at 17:06:33 CEST, Chris X Edwards wrote:
> > Hi,
> > Thanks for the reply. I did see this in the man page. Am I right to
> > assume this suggestion doesn't relate to the "how much time" aspect of
> > this passage? This leaves the much more treacherous formatting details
> > between the input modes. Certainly a cause for concern. The reason I
> > concluded this was an unlikely cause is that the Remove works as I
> > would imagine (with a piped key) and the Add does not. 
> > 
> > Another check is to go with a very simple passphrase key that can not
> > possibly have newline entanglements. (That's the goal, correct me if I'm
> > wrong.) We can start with a very simple key file.
> > 
> >     echo "simple" > simplekey
> > 
> > Let's try just the file.
> > 
> >     cryptsetup luksAddKey /dev/sdb --new-keyfile simplekey --new-key-slot 1
> >     Enter any existing passphrase: 
> > 
> > Works fine. (Passphrase to add is for existing slot 0 as desired.) Now
> > removing it.
> > 
> >     cat simplekey | cryptsetup luksRemoveKey /dev/sdb -
> > 
> > Works fine. Now try adding again but with piping instead of the file.
> > 
> >     cat simplekey | cryptsetup luksAddKey /dev/sdb --new-keyfile - --new-key-slot 1
> >     No key available with this passphrase.
> > 
> > And fail.
> > 
> > This may be a basic limitation of what is possible, but I'm just
> > trying to establish that fact clearly so I can give up on my dream of
> > using cryptsetup in the elegant way I imagine it can be used. :-)
> > 
> > Thanks,
> > Chris

-- 
++++++++++[>++++++++++++<-]>-...<++++++[>>+++++++<<-]>>++++.<+.<++++[>
Chris X Edwards-----<-]>+.- Have a nice day. >.<-.+++++><chris@xed.ch>
