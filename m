Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CA1BA25
	for <cryptsetup@lists.linux.dev>; Sun,  6 Nov 2022 22:15:54 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 1D1BB140048;
	Sun,  6 Nov 2022 23:15:29 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 0F51117A468; Sun,  6 Nov 2022 23:15:47 +0100 (CET)
Date: Sun, 6 Nov 2022 23:15:47 +0100
From: Arno Wagner <arno@wagner.name>
To: Fourhundred Thecat <400thecat@gmx.ch>
Cc: cryptsetup@lists.linux.dev
Subject: Re: mapping with --readonly option
Message-ID: <20221106221547.GA6476@tansi.org>
References: <0e25bcff-4cc7-5416-90fe-0a3f630688c9@gmx.ch>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e25bcff-4cc7-5416-90fe-0a3f630688c9@gmx.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)

You probably should mount it as readonly instead. Because
that gets remounted in the typical boot-process as r/w
so it definitely is possible.

If you want protection against a malicious root, this is
probably not the way to go, I think.

Regards,
Arno


On Sat, Nov 05, 2022 at 11:15:12 CET, Fourhundred Thecat wrote:
> Hello,
> 
> if I use the --readonly option to create a mapping, and mount it as my
> root partition, can the mapping later be changed during runtime to
> read-write ?
> 
> Or, in other words, if mapping was created as readonly, can I be sure
> that it cannot be remapped to read-write while being mounted as my root
> filesystem?
> 
> Ofcourse mapping can be closed and opened again, but I am asking here
> specifically for mapping that is mounted as root filesystem, which
> cannot be unmounted at runtime (as far as I know)
> 
> I am interested whether I can use readonly mapping as sort of security
> feature to enforce read-only filesystem?
> 
> thank you

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
