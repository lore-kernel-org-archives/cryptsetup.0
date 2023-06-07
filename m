Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468457C
	for <cryptsetup@lists.linux.dev>; Wed,  7 Jun 2023 03:36:17 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 41F971401A5;
	Wed,  7 Jun 2023 05:30:06 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 8DFD617A45F; Wed,  7 Jun 2023 05:30:38 +0200 (CEST)
Date: Wed, 7 Jun 2023 05:30:38 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: cryptsetup@lists.linux.dev
Cc: bugcounterism@malbolge.net
Subject: Re: Wiping disk vs. initializing container
Message-ID: <20230607033038.GA26586@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <20230606230850.630aa048@moon>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606230850.630aa048@moon>
User-Agent: Mutt/1.10.1 (2018-07-13)

If it is crypto-grade randomness, yes.
But note that Section 5.3 may still be faster.

Regards,
Arno


On Tue, Jun 06, 2023 at 23:08:50 CEST, bugcounterism@malbolge.net wrote:
> Hi there,
> 
> does overwriting an entire hard disk with random data before setting up
> encryption make initializing a LUKS container (as described in section
> 5.3 of the FAQ) obsolete?
> 
> 
> Thanks
> Michael
> 

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
