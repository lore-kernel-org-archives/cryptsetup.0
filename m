Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F007C
	for <cryptsetup@lists.linux.dev>; Fri,  4 Nov 2022 11:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 9D6C23F838;
	Fri,  4 Nov 2022 12:06:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.155
X-Spam-Level:
X-Spam-Status: No, score=-1.155 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, URIBL_BLOCKED=0.001]
	autolearn=no autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PS71t8-dvjdE; Fri,  4 Nov 2022 12:06:21 +0100 (CET)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 489CF3F81D;
	Fri,  4 Nov 2022 12:06:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id F10B42E0295;
	Fri,  4 Nov 2022 12:06:20 +0100 (CET)
Date: Fri, 4 Nov 2022 11:06:19 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Cc: Lamy Geier <lamyergeier@gmail.com>
Subject: Re: Questions about Backup and Restore Strategy for LVM2 on LUKS2
 and for LUKS1 on boot partition
Message-ID: <0689a63c-6a48-44d4-830c-079cbc36e4b9@home.arpa>
References: <56bfad6c-2ddc-b095-f57e-b6675ce29cc0@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56bfad6c-2ddc-b095-f57e-b6675ce29cc0@gmail.com>

On 3 Nov 2022 21:59 +0100, from lamyergeier@gmail.com (Lamy Geier):
> This is my first ever post in any mailing list, please be a bit forgiving.
> First of all do I need to subscribe to cryptsetup+subscribe@lists.linux.dev
> to receive a reply? Or replies to my email would be delivered to me
> automatically?

To receive replies that are sent only through the list, you need to
subscribe to the list. Since this list is publicly archived, you can
also check the archives at <https://lore.kernel.org/cryptsetup/>.


> I have installed
> 
>     - LUKS1 on ext4 `/boot` partition.
> 
>     - LVM2 on LUKS2 in a separate partition.
> 
>     - In LVM2, I have one physical volume (my NVME SSD), one volume group
> consisting of 3 logical volume all formatted with ext4: `/`, `/home`,
> `swap`.

Minor detail perhaps, but the order of nesting matters for clarity.
I'm assuming that the logical layout is something much like:

    storage device
        partition 1
            LUKS1
                ext4 /boot
        partition 2
            LUKS2
                LVM2
                    single-PV VG
                        LV
                            ext4 /
                        LV
                            ext4 /home
                        LV
                            swap


> ## Backup Startegy
> 
> On an external drive,
> 
>     - I want to use rsync based [linuxmint/timeshift: System restore tool
> for Linux](https://github.com/linuxmint/timeshift) to backup `/` logical
> volume.
> 
>     - Further, I want to use rsync based [bit-team/backintime: Back In Time
> - A simple backup tool for Linux](https://github.com/bit-team/backintime)
> solution to backup my `/home` logical volume.
> 
>     - I am going to backup the LUKS header of both of the above partitions
> (one of which is `/boot` and the other is the LVM on LUKS partition).
> 
> ## Questions
> 
> 1. It was mentioned in the FAQ to avoid the LVM if possible, but
> unfortunately I read the FAQ only after installing my operating system.
> Could you please tell me if my backup strategy is enough to mitigate any
> disaster (expect that I am not keeping a third backup as per 3-2-1
> strategy)?

Generally, exactly how you lay out your partitions doesn't make much
difference to how you back them up. That said, LVM _does_ add a fair
bit of complexity here.

Since it sounds like you have fairly recently installed your system, I
would suggest at least considering redoing the installation without
LVM but instead use just plain partitions. Having a separate /home is
convenient if you ever want to completely wipe your system and
reinstall from scratch but keep the user data, but for a single-user
system, you can definitely get away with keeping /home within the root
file system. My preferred setup would be more along the lines of three
partitions, each with a LUKS container; within the first two, /boot
and / respectively; within the last, swap (with a random key). Swap on
Linux has historically been to a dedicated partition, but I understand
that swap files are becoming increasingly common.


> 3. If the pre-boot authentication fails in case of disaster, I am wondering
> how will I mitigate it. Should I be using a LIVE USB and do LUKS1 Header
> restore for boot partition and then open it using `cryptsetup open` and
> inspect if the data got decrypted? And the same process for the LVM on LUKS
> partition to inspect if the root directory is decrypted?

If you use LUKS, then opening the container will either succeed or
fail. (If you use plain dm-crypt, there's no way to tell except by
examining the decrypted data, such as by trying to mount the file
system through the dm-crypt mapping and see if that works.) If you
have a LUKS header backup, you can give that directly to `cryptsetup
open` to bypass the on-disk header completely if the header has been
corrupted. Note that you need to guard the header backup carefully,
since an adversary who gets hold of a copy of the header can do an
offline attack on your passphrase. The latter can be mitigated by
using a longer passphrase or a higher iteration count; since GRUB's
password hashing seems to not be as optimized as that of cryptsetup,
the former may be preferable.


> 4. Regarding timeshift:
> 
> 4a. Do you think I would be able to restore my system?
> 
> 4b. Also, do you think I also need to backup the `/boot` partition with
> timeshift?

I'm not familiar with either timeshift or backintime, so I can't
really comment on either of those or on how you would do a bare-metal
restore based on what either has done. However, for backups, my advice
would be: keep it simple!

Personally, I use rsnapshot, which is simply a convenient front-end to
rsync for keeping multiple backups in such a way that only the
difference between the backups need to be stored separately (the rest
is hardlinked); you can do that with rsync and a few standard tools
directly, but rsnapshot makes it more convenient. Restoring would
involve simply copying the most recent valid copy back onto freshly
partitioned media, maybe updating some file system references in
boot-relevant configuration files such as /etc/fstab and
/etc/crypttab, and reinstalling the boot loader. I have also written
two helper scripts around it, one to perform a backup onto an external
drive (itself holding a LUKS container) which is normally kept soft
powered down along with a few other housekeeping tasks, and one to
purge old backups when it starts filling up. Neither of the those
scripts is strictly _necessary_; they are just tools of convenience.


> 5. To restore  the  home logical volume I can do it after the operating
> system is loaded. I was just not sure when and how will I be able to restore
> the  root  logical volume and the boot partition .

The easiest way to do that would probably be to use some live media to
partition and format new media as needed, in your case set up a LVM
hierarchy identical to the old storage, mount the file systems, and
copy everything. Since identifiers such as /dev/disk/by-id/* will
likely change, you will also need to update those and, of course,
reinstall the boot loader.

-- 
🪶 Michael Kjörling                  🏡 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

