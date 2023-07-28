Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E4D12B7E
	for <cryptsetup@lists.linux.dev>; Fri, 28 Jul 2023 13:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id EC1A53FB33
	for <cryptsetup@lists.linux.dev>; Fri, 28 Jul 2023 15:17:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.165
X-Spam-Level:
X-Spam-Status: No, score=-1.165 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, T_SCC_BODY_TEXT_LINE=-0.01,
	URIBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TI2eJ3r-duvX for <cryptsetup@lists.linux.dev>;
	Fri, 28 Jul 2023 15:17:44 +0200 (CEST)
Received: 
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id B47F33F68C
	for <cryptsetup@lists.linux.dev>; Fri, 28 Jul 2023 15:17:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 2B3F21D00111
	for <cryptsetup@lists.linux.dev>; Fri, 28 Jul 2023 15:17:44 +0200 (CEST)
Date: Fri, 28 Jul 2023 13:17:43 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Looking for confirmation as I enter the acceptance stage.
Message-ID: <c5d4730e-a1d3-401b-9be5-aa5311ca3166@home.arpa>
References: <2159917.irdbgypaU6@laptop>
 <3286045.aeNJFYEL58@laptop>
 <789e3a66-3fe5-44a8-a151-f2c08eead23b@home.arpa>
 <3554948.iIbC2pHGDl@laptop>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3554948.iIbC2pHGDl@laptop>

On 27 Jul 2023 10:12 -0400, from blobfish@gmx.com (blobfish):
> Ok I got a third drive to receive files. I was getting everything hooked up and 
> ready and I ran into a problem. Apparently the clone wasn't completely 
> successful? 
> 
> parted: //on cloned drive
> Error: Invalid argument during seek for read on /dev/sdc
> Retry/Ignore/Cancel? I                                                    
> Error: The backup GPT table is corrupt, but the primary appears OK, so that 
> will be used.
> OK/Cancel? OK                                                             
> Model: WD easystore 264D (scsi)
> Disk /dev/sdc: 8002GB
> Sector size (logical/physical): 512B/4096B
> Partition Table: unknown
> Disk Flags: 

Your ddrescue screenshot indicates that 8001 GB was copied, but your
pasted parted interaction indicates that some drive is 8002 GB. The
backup GPT is at the very end of the device. Thus, if the sizes don't
match exactly, the backup GPT won't be found. It's hard to follow
exactly based on the short /dev/sd* names (because those can change,
especially with reboots and hotplugging drives), but even if the new
drive is slightly smaller, that isn't necessarily a showstopper either
because you can set up a LVM group or a mdraid JBOD array of it and a
file elsewhere that makes up for the difference in size. (The
mechanics of how to do that is definitely off topic on this list,
however.)

If the drive sizes matched exactly, or if the target device was
larger, then I don't think your ddrescue execution would have run out
of space on the target.


> Your procedure for dumping and testing the luks header doesn't work on this 
> cloned drive.

Unfortunately, "doesn't work" isn't very helpful. The offsets I
mentioned previously were based on what you sent, which presumably was
based on the partition. If for some reason the partition table isn't
readable on the new drive, then at a minimum that means that those
exact offsets likely no longer apply. You will need to determine how
far into the device the initial "L" in "LUKS" in the LUKS header
appears; then skip that many bytes when reading such that that "LUKS"
is the very first four bytes that cryptsetup sees on the device (or in
the file) that you give it. That was the purpose of the dd skip=X
bs=Y; the offset was X*Y bytes.

The general idea is that once you have a copy of the drive holding the
broken LUKS container, you can work with that copy and just make a new
copy from the untouched original if you make a mistake; then, given
the offset at which the header you did find begins in the copy you're
working with, use e.g. `losetup -o N -f /dev/<something>` for that
offset N to set up a loopback device which offsets I/O through to
/dev/<something> (see the man page for details); then give the
resulting /dev/loop* device to cryptsetup. From there, once cryptsetup
successfully unlocks the container (which it should be able to, based
on the experimentation with the smaller portion of the container), I
believe that you should be able to mount the Btrfs file system
normally through the symlink in /dev/mapper to whichever /dev/dm-*
that happens to become. Once the file system is mounted, it should all
hopefully be a perfectly normal file copy operation.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

