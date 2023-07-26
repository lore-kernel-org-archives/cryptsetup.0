Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B451AA65
	for <cryptsetup@lists.linux.dev>; Wed, 26 Jul 2023 17:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 36B2A3F3C3
	for <cryptsetup@lists.linux.dev>; Wed, 26 Jul 2023 19:49:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.166
X-Spam-Level:
X-Spam-Status: No, score=-1.166 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xyvTvUfVkYUQ for <cryptsetup@lists.linux.dev>;
	Wed, 26 Jul 2023 19:49:33 +0200 (CEST)
Received: 
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 2A0563F24F
	for <cryptsetup@lists.linux.dev>; Wed, 26 Jul 2023 19:49:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 73CC91D00111
	for <cryptsetup@lists.linux.dev>; Wed, 26 Jul 2023 19:49:32 +0200 (CEST)
Date: Wed, 26 Jul 2023 17:49:31 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Looking for confirmation as I enter the acceptance stage.
Message-ID: <789e3a66-3fe5-44a8-a151-f2c08eead23b@home.arpa>
References: <2159917.irdbgypaU6@laptop>
 <4863669.GXAFRqVoOG@laptop>
 <a8146e16-1d32-4952-9b38-af1affefb1cb@home.arpa>
 <3286045.aeNJFYEL58@laptop>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3286045.aeNJFYEL58@laptop>

On 26 Jul 2023 12:10 -0400, from blobfish@gmx.com (blobfish):
> command: sudo file -s /dev/dm-4
> result: /dev/dm-4: BTRFS Filesystem label "mediaLibrary", sectorsize 4096, 
> nodesize 16384, leafsize 16384, UUID=0e2b9dfb-46ca-4064-bd09-826431b4eafb, 
> 6943296638976/8001469083648 bytes used, 1 devices
> 
> another good sign!

Absolutely!

At this point I feel confident enough to say that you have a _very_
good chance of getting your data back, because:

* We've found a way to open a copy of the first few hundred MB of the
broken LUKS container (by nothing more than introducing an offset, as
it happens)

* The LUKS header that gets used for that appears undamaged

* The contents of the opened container look sensible (which leads me
to believe that there's a good chance that the full file system within
the container is largely undamaged)

Ideally, the next step would be to use the copy you made of the broken
container (that is, in effect, the new drive) to extract data, while
keeping the original untouched until you have a copy (so that if you
make a mistake, you can start over from the original). _Do you have,
or can you get, anywhere that you can realistically put that ~7TB of
data during copying?_

I suspect that the safest approach would be to set things up to open
the actual LUKS container and mount the Btrfs file system(s), copy the
data out, then create a new LUKS container on that drive, then copy
the data to there; then once you've verified that it's a good copy,
create a new LUKS container on the other drive, and set up to use that
for backups going forward. This, however, requires creating a third
temporary copy of the data currently within that Btrfs file system.
Conveniently, `file` tells us how much data that is.

If you can't get somewhere to realistically and temporarily store the
data during copying, it would be possible to work with only the two
drives you currently have; but that would mean introducing the risk of
writes to an only copy, which is rather anathema to data recovery (and
especially since we don't yet know the state of that Btrfs file system,
I'm still thinking in terms of data recovery). Hence my question above.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

