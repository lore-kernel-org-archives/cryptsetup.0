Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0ED6AB4
	for <cryptsetup@lists.linux.dev>; Wed,  7 Jun 2023 11:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 0784B401FB
	for <cryptsetup@lists.linux.dev>; Wed,  7 Jun 2023 13:09:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.166
X-Spam-Level:
X-Spam-Status: No, score=-1.166 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Wxuw8-MYoKX for <cryptsetup@lists.linux.dev>;
	Wed,  7 Jun 2023 13:09:13 +0200 (CEST)
Received: 
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 02AFF401F6
	for <cryptsetup@lists.linux.dev>; Wed,  7 Jun 2023 13:09:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 670C52E0262
	for <cryptsetup@lists.linux.dev>; Wed,  7 Jun 2023 13:09:12 +0200 (CEST)
Date: Wed, 7 Jun 2023 11:09:11 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Wiping disk vs. initializing container
Message-ID: <ea574f22-87c0-4751-a59f-8e20a01e1e37@home.arpa>
References: <20230606230850.630aa048@moon>
 <20230607033038.GA26586@tansi.org>
 <20230607120331.2125480b@moon>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230607120331.2125480b@moon>

On 7 Jun 2023 12:03 +0200, from bugcounterism@malbolge.net:
> 1. Would `cat /dev/urandom > /dev/sdX` give me crypto-grade randomness?

With a modern kernel, it should, yes.

Or you could set up a temporary mapping with a throwaway key and write
from /dev/zero through that. The result should be much the same but my
experience is that the latter is more performant.


> 2. Is initializing a LUKS container with zeroes equivalent to filling a
>    whole drive with crypto-grade random data if the LUKS container
>    spans the whole disk?

It should be. If not, that would be a more general vulnerability.


> 3. The FAQ says:
> 
>      If the target was in use previously, it is a good idea to wipe it
>      before creating the LUKS container in order to remove any trace of
>      old file systems and data.
> 
>    So, isn't just filling the whole disk with random data before setting
>    up the LUKS container the simplest solution if you want to a) destroy
>    old data reliably, b) put the disk into a clean state, and c) make
>    sure that parts of the LUKS container that have not been written to
>    cannot be distinguished from those that have?

Generally, absent the key, ciphertext should be indistinguishable from
random data. So for an adversary who does not have access to the key,
the disk having been filled with random data (e.g. cat from
/dev/urandom) or a container having been filled with predictable data
(e.g. cat from /dev/zero) should be largely equivalent.

Also, any random data should be as good as any other random data, so
there would be no easy way to tell whether a particular chunk of
random data is there because of an initial overwrite with random data,
or because of useful data being stored through the later-created LUKS
container.


> 4. Should new hard disks that have not been used previously also be
>    filled with random data in order to achieve c)?

I would argue that it should, and by extension also for another
reason: allocation patterns can provide very strong clues both about
the amount of data stored, and the type of file system within the
container. A NTFS file system looks very different in terms of
allocation patterns from an ext4 or Btrfs or exfat file system.

SSDs introduce other factors, particularly relating to wear leveling,
where a different trade-off might be reasonable.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

