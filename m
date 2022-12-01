Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4089110782
	for <cryptsetup@lists.linux.dev>; Thu,  1 Dec 2022 21:07:30 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id F1A6314004F;
	Thu,  1 Dec 2022 22:07:01 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 82ACB17A25A; Thu,  1 Dec 2022 22:07:22 +0100 (CET)
Date: Thu, 1 Dec 2022 22:07:22 +0100
From: Arno Wagner <arno@wagner.name>
To: Ondrej Kozina <okozina@redhat.com>
Cc: cryptsetup@lists.linux.dev, Lamy Geier <lamyergeier@gmail.com>
Subject: Re: Slow unlock of the LUKS device at boot
Message-ID: <20221201210722.GA29541@tansi.org>
References: <15a19597-423a-8fc0-02d9-3ea4da34b490@gmail.com>
 <28ce5fe7-89c3-7548-d8e8-71c830f25711@redhat.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28ce5fe7-89c3-7548-d8e8-71c830f25711@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Dec 01, 2022 at 15:40:15 CET, Ondrej Kozina wrote:
> On 29. 11. 22 20:50, Lamy Geier wrote:
[...]
> > Keyslots:
> >     0: luks2
> >           Key:        512 bits
> >           Priority:   normal
> >           Cipher:     aes-xts-plain64
> >           Cipher key: 512 bits
> >           PBKDF:      argon2id
> >           Time cost:  1000
>                         ^^^^
> This is insane value for argon2 and it would explain your 6 minutes unlock
> time. Usually on my 2 years old laptop I get values in range 6-9 iterations
> (Time cost) with 4 threads and 1GiB ram used when I let cryptsetup do the
> benchmark with default target time ~2 seconds. Are you sure you did not add
> --pbkdf-force-iterations parameter in your luksAddKey command earlier?
> 
> With regards
> O.

That seems to be it. So misconfiguration after all as I suspected.

Regards,
Arno 

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
