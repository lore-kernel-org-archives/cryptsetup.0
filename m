Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3682C749C
	for <cryptsetup@lists.linux.dev>; Sun, 10 Sep 2023 17:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 608403F39E
	for <cryptsetup@lists.linux.dev>; Sun, 10 Sep 2023 18:53:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.154
X-Spam-Level:
X-Spam-Status: No, score=-1.154 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, URIBL_DBL_BLOCKED=0.001,
	URIBL_ZEN_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVf0fS48_mUS for <cryptsetup@lists.linux.dev>;
	Sun, 10 Sep 2023 18:53:06 +0200 (CEST)
Received: 
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id C6CF83F356
	for <cryptsetup@lists.linux.dev>; Sun, 10 Sep 2023 18:53:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 1C91E1D001D0
	for <cryptsetup@lists.linux.dev>; Sun, 10 Sep 2023 18:53:06 +0200 (CEST)
Date: Sun, 10 Sep 2023 16:53:04 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Is it possible to set the amount of CRC32C hashes per a data
 sector in integritysetup?
Message-ID: <207ef66a-7797-480e-8ffd-75fd8c5c1d97@home.arpa>
References: <4685725c-4b76-47c2-86b8-377b4e1fc7fd@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4685725c-4b76-47c2-86b8-377b4e1fc7fd@gmail.com>

On 10 Sep 2023 18:12 +0300, from bodqhrohro@gmail.com (Горбешко Богдан):
> AFAIU, the primary goal of dm-integrity is checking if the data are not
> corrupted and throwing read errors otherwise. Though it still supports
> checksums besides of hashes. Can they be used for recovering the data
> on-the-fly?

_My understanding_ (which may be wrong) is that this is not what
dm-integrity is intended for; nor does it look like it supports it.


> Maybe there is some other way?

I would suggest looking at Btrfs or ZFS. Both support self-healing of
data based on redundant storage within an array; and at least ZFS (and
I don't see why not Btrfs) can work with a set of partitions on the
same underlying storage device. It's not a typically recommended
setup, but it is technically possible.

In both cases you'd sacrifice a fair bit of performance, but it sounds
like you are more interested in ensuring data integrity, so maybe that
will be an acceptable trade-off in your situation.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

