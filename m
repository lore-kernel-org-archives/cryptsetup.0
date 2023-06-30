Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E091779E6
	for <cryptsetup@lists.linux.dev>; Fri, 30 Jun 2023 10:54:23 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 60D0F1400FD;
	Fri, 30 Jun 2023 12:53:45 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id E838917A22A; Fri, 30 Jun 2023 12:54:19 +0200 (CEST)
Date: Fri, 30 Jun 2023 12:54:19 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: Darek Hisc <darek.hisc@aleeas.com>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Problem after detaching the header
Message-ID: <20230630105419.GB3092@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <168806625127.6.2008140751957055524.147127853@aleeas.com>
 <20230630025026.GA3372@tansi.org>
 <168811588839.6.11593174509180454664.147320636@aleeas.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168811588839.6.11593174509180454664.147320636@aleeas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

That would be a question for your distribution.

On Fri, Jun 30, 2023 at 11:04:34 CEST, Darek Hisc wrote:
> 
> > Looks like the initrd cannot deal with detached headers.
> Please note that until the luksErase operation everything is fine and the header is read from the detached location (since the original slots no longer exist)
> 
> > Can you manually map the LUKS container from the
> > initrd console? If not, waht errot do you get?
> I'm sorry but I don't know how to do it :(
> Can you provide the command to type in the console initramfs?
> 
> 

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
