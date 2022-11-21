Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E39ECB
	for <cryptsetup@lists.linux.dev>; Mon, 21 Nov 2022 13:26:32 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id E11ED14022A;
	Mon, 21 Nov 2022 14:26:10 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id C091517A22E; Mon, 21 Nov 2022 14:26:30 +0100 (CET)
Date: Mon, 21 Nov 2022 14:26:30 +0100
From: Arno Wagner <arno@wagner.name>
To: Lamy Geier <lamyergeier@gmail.com>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Single User (single or multiple keyslots with similar or
 different passphrase)
Message-ID: <20221121132630.GB22361@tansi.org>
References: <5b560ee4-2813-6aa5-484d-1754e118bb90@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b560ee4-2813-6aa5-484d-1754e118bb90@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

One Keyslot should be enough, but you should hve a header backup.
The only redundancy multiple passphrases give you is basically
multiple passphrases.

Regards,
Arno


On Mon, Nov 21, 2022 at 09:42:37 CET, Lamy Geier wrote:
> Hello!
> 
> I am a single user and owner of the data in my laptop. I was wondering if it
> is any better to have single or multiple keyslots with same or different
> passphrases. I am using LUKS2 on a partition for root, home and swap volumes
> (LVM). And LUKS1 for a boot partition. Please suggest which of the following
> is better choice and why:
> 
> 1. Should I have single passphrase and single keyslot for LUKS1 and LUKS2?
> 2. Multiple Keyslots for LUKS1 and LUKS2 with same passphrase.
> 3. Multiple Keyslots for LUKS1 and LUKS2 with different passphrase.
> 
> 
> - My reasoning was that may be having redundant information, it helps in
> times of crisis for recovery.
> 
> - Note: The data will be owned and used only by me.
> 
> -- 
> Thanks and Regards
> 
> Lamy

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
