Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E6723AF
	for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 16:53:38 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 727FA1400E0
	for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 18:48:14 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 04A9217A45A; Sat, 13 Aug 2022 18:48:27 +0200 (CEST)
Date: Sat, 13 Aug 2022 18:48:27 +0200
From: Arno Wagner <arno@wagner.name>
To: cryptsetup@lists.linux.dev
Subject: Re: cryptsetup LUKS: Too low iteration count: only 14
Message-ID: <20220813164827.GA7844@tansi.org>
References: <CACHosL-U7pWY95fHP08D7FGoCk7=kZfRTudfSs4E1h8buxjaLQ@mail.gmail.com>
 <de150ba2-46fe-36f6-86b5-37411af760e6@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de150ba2-46fe-36f6-86b5-37411af760e6@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Aug 13, 2022 at 18:11:48 CEST, Milan Broz wrote:
> On 13/08/2022 17:50, doffloster@gmail.com wrote:
> > Hi all,
> > 
> > I was playing around with LUKS extension in cryptsetup and noticed
> > that the iteration count was 14 in my case.
> > The iteration time that I chose (arbitrarily) is 4123ms which is above
> > 4 seconds!
> > So I was astonished to see an iteration count which is very low.
> > As far as I know, using a modern computer, the iteration count should
> > be above 100k.
> 
> Please do not confuse iteration for PBKDF2 (default in LUKS1) and
> memory-hard Argon2 KDF.
> 
> These are completely different algorithms, you cannot compare iteration
> costs here.
> 
> If you set 100k iteration with 1G memory cost for Argon2, you will get
> unlocking time that is perhaps in years... :-)

Argon2 operates on a completely different iteration scale than
PBKDF2 by a factor of 100'000 or so. 

A look into the documentation may help. If I remember correctly
the recommended minimal iteration count for Argon2 is 4.

Regards,
Arno

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
