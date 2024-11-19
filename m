Received: from mailgw1.uni-kl.de (mailgw1.uni-kl.de [131.246.120.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39B21CEAAA
	for <cryptsetup@lists.linux.dev>; Tue, 19 Nov 2024 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=131.246.120.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732036011; cv=none; b=UkWADPGnek+kxz60gbvuETMQ/4vY2txBid7L6kue6q6Svwfx6n5XicrC4fMnG/0kJZcGP0I/vpz+emH+0RcLk7CYu98FspzAEawoEuoCauElx6yWxjKsDsJNJ89gVsRZ8DVzqnJJn6PoJt8kJwvrDvcLdTUDCaMnFHFg73AaqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732036011; c=relaxed/simple;
	bh=+5Zzomo8leUI495FN2NGxO43qaeLEch0Aig2GAljg2c=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Xntltc8IdaUFA3/Gu6rVCY6eh39tkPajwMSLPfRaRcjz87rdQl4OMi+SXEMxneXSv3h49cW3bUvrBbIhPYTupF1MRM8dbajn241HXc8X/k5ltz/S0tzgt8K7SoMgP/0a0jFFwk2/V0dAfYzT24kCpNTH7rAH/XTee5v0oWwshT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rptu.de; spf=pass smtp.mailfrom=rptu.de; arc=none smtp.client-ip=131.246.120.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rptu.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rptu.de
Received: from [IPV6:2003:c2:1703:bc00:aba5:5547:3244:bea2] (p200300c21703bc00aba555473244bea2.dip0.t-ipconnect.de [IPv6:2003:c2:1703:bc00:aba5:5547:3244:bea2])
	(authenticated bits=0)
	by mailgw1.uni-kl.de (8.14.4/8.14.4/Debian-8+deb8u2) with ESMTP id 4AJH6bO2025931
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <cryptsetup@lists.linux.dev>; Tue, 19 Nov 2024 18:06:45 +0100
Message-ID: <36eee136-9d15-4f4e-ac0b-083e6d6c3f95@rptu.de>
Date: Tue, 19 Nov 2024 18:06:37 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cryptsetup@lists.linux.dev
Content-Language: en-GB, de-DE
From: Thorsten Giese <tgiese@rptu.de>
Subject: can't mount LUKS partition with cryptsetup
Organization: =?UTF-8?Q?Technische_Universit=C3=A4t_Kaiserslautern?=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score:  (0.862)
X-Spam-Flag: NO

Hello there,

tl;dr I have a Ubuntu on a NVME with encrypted root where I can boot the 
system with the correct passphrase but can not mount the partition in a 
live Liux with cryptsetup.

I have a weird problem and no clue where to go with it.
I try to keep it short and really hope someone can push me in the right 
direction.

I have a setup with an encrypted root partition from the Ubunut/Debian 
installer, 3 partitions nvme0n1p1 (BIOS boot, 1M), nvme0n1p2 (ext2, 
/boot, 1G) and nvme0n1p3 (LUKS, propably with LVM inside (I know lvscan)).

I had a rather long system freeze, and after that /boot was empty (no 
clue why) and I was at the grub rescue shell with no options. I ran 
multiple live-Linux-Distros (grml, ubuntu, ...) and read everywhere, 
that a dm-crypt Partition ist mountable with "cryptsetup open" (to get 
my data).

When presented with

Enter passphrase for /dev/nvme0n1p3:
No key available with this passphrase.

I thought the LUKS header might also be corrupted and just thought: bad 
luck.

root@foobar:~# cryptsetup luksDump /dev/nvme0n1p3
LUKS header information
Version:       	2
Epoch:         	3
Metadata area: 	16384 [bytes]
Keyslots area: 	16744448 [bytes]
UUID:          	18d1e37e-3960-4f86-82f2-231bee10d5f0
Label:         	(no label)
Subsystem:     	(no subsystem)
Flags:       	(no flags)

Data segments:
   0: crypt
	offset: 16777216 [bytes]
	length: (whole device)
	cipher: aes-xts-plain64
	sector: 512 [bytes]

Keyslots:
   0: luks2
	Key:        512 bits
	Priority:   normal
	Cipher:     aes-xts-plain64
	Cipher key: 512 bits
	PBKDF:      argon2i
	Time cost:  7
	Memory:     1048576
	Threads:    4
	Salt:       2d d6 9d 46 b8 84 10 d4 22 e9 d4 71 31 37 63 91
	            70 93 c4 01 87 b7 b2 ea 17 14 8f 9b 9b e9 40 1a
	AF stripes: 4000
	AF hash:    sha256
	Area offset:32768 [bytes]
	Area length:258048 [bytes]
	Digest ID:  0
Tokens:
Digests:
   0: pbkdf2
	Hash:       sha256
	Iterations: 140183
	Salt:       23 13 a0 eb 7d bd ab 94 e2 17 94 ea 35 cb 21 be
	            7f 6f 13 03 b3 7c 9f a5 0d 5d b7 aa 0c 95 98 0e
	Digest:     77 5e 1d 86 8d f9 ad 68 b2 b0 07 84 a9 d3 b4 14
	            fb 36 e3 3b 1b 12 bc 35 27 18 db b6 04 0a 9b 46

(UUID, Salt and Digest modified)

Now it gets interesting: when I set up originally the NVME had some 
strange errors and I thought it might be broken and ordered a new one. 
The new one had the same errors and I ended up to fix it with 
nvme_core.default_ps_max_latency_us=0. I put the first NVME aside as a 
spare part.

Now I wanted to install fresh on that NVME. I put it in my server and 
after entering the passphrase the system came up (proof: this NVME works 
AND I know the correct passphrase). I looked for any data.

Then I booted a live Linux to see if I could mount it with cryptsetup 
and got the same error message as with the "broken" NVME. Now I hope 
there is a way to get it to boot and recover my data. I read around and 
can't find any recent documentation for the process. I read (from 2023) 
that grub2 does not support argon2i also it is in my header, so maybe 
that is a clue or Ubuntu has a patched Version.

Before entering the passphrase it says something about 
/scripts/init-premount, maybe there is a hint on how to mount it, but I 
can't find it anywhere.

How can I mount a dm-crypt Volume from command line or how can I 
reinstall grub/boot without a system. I also tried supergrml to no success.

Thank you very much for your attention
kind regards
Thorsten


