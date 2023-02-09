Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se [213.80.101.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A494679F8
	for <cryptsetup@lists.linux.dev>; Thu,  9 Feb 2023 15:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 668F1400C5
	for <cryptsetup@lists.linux.dev>; Thu,  9 Feb 2023 16:37:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.155
X-Spam-Level:
X-Spam-Status: No, score=-1.155 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, URIBL_BLOCKED=0.001]
	autolearn=no autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBu75T3d-gHK for <cryptsetup@lists.linux.dev>;
	Thu,  9 Feb 2023 16:37:58 +0100 (CET)
Received: 
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 634913FFCC
	for <cryptsetup@lists.linux.dev>; Thu,  9 Feb 2023 16:37:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 7495C2E01B0
	for <cryptsetup@lists.linux.dev>; Thu,  9 Feb 2023 16:37:57 +0100 (CET)
Date: Thu, 9 Feb 2023 15:37:56 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Filling a device with random data
Message-ID: <c2a2929d-29dd-48c4-9b37-b3ac7a6f072f@home.arpa>
References: <aec223f2-34f1-45ca-83a4-024e66490ee5@app.fastmail.com>
 <20230209040200.GA3642@tansi.org>
 <d30a4af6-8a91-42ea-973d-f16f1f361023@app.fastmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d30a4af6-8a91-42ea-973d-f16f1f361023@app.fastmail.com>

On 9 Feb 2023 16:01 +0100, from david@djsp.eu (David Joaquín Shourabi Porcel):
> $ dd if=/dev/urandom of=/dev/null status=progress
> 4819285504 bytes (4,8 GB, 4,5 GiB) copied, 12 s, 402 MB/s^C
> 9708379+0 records in
> 9708378+0 records out
> 4970689536 bytes (5,0 GB, 4,6 GiB) copied, 12,379 s, 402 MB/s

That's doing I/O in blocks of 512 bytes, so syscall overhead is likely
to be a large limiting factor. (Each block requires at least a few
kernel/userspace context switches through syscalls; at an _absolute_
minimum, for each block, it's likely going to go through userspace dd
to kernel read through kernel /dev/urandom driver to userspace dd to
kernel write through kernel /dev/null driver to userspace dd.) Compare
and contrast that to a cryptsetup benchmark which is likely (I haven't
looked) primarily one or the other. If you want to gauge the
performance of /dev/urandom, I suggest trying with something like
bs=1M to reduce that overhead. Going from bs=512 to bs=1M I get an
about 60% speed increase, although it still comes up far short of a
cryptsetup benchmark (with bs=1M at about a quarter of the throughput
of the cryptsetup benchmark on my particular system). So for fast
storage media, going through a crypt mapping can still be beneficial,
although the degree of benefit will obviously depend on the relative
performance of CPU (including encryption instructions) and storage
device. Whether you use a plain dm-crypt mapping or a LUKS container
should be largely irrelevant for these purposes, however.

Similarly, when you're writing to a real-life storage device, doing so
in blocks of 512 bytes is going to utterly devastate performance
compared to using blocks on the order of tens of megabytes or even
larger. (I realize that's not what either of your tests do.)

Also, what kernel version are you running?

The major advantage to doing a separate full-disk write with a
throwaway key is that the data is going to be meaningless also through
the eyes of the final LUKS container mapping. Depending on your use
case, this can provide a slight confidentiality advantage.

Doing a full-disk overwrite pass on SSDs has its problems, though;
primarily that it forces the SSD to consider every user-accessible
block as being in use, hampering wear leveling. That becomes a far
more delicate balancing act between storage metadata confidentiality
(the full-disk overwrite hampers an attacker's ability to determine
what blocks are in use) and giving the SSD's firmware a decent chance
of doing wear leveling (for which you want to leave the underlying
storage pristine and perhaps also allow TRIM passthrough, but which
leaks information about which parts of the storage device are in use).

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

