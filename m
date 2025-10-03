Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C4627FB25
	for <cryptsetup@lists.linux.dev>; Fri,  3 Oct 2025 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759504960; cv=none; b=j24QKXE+YfBDRaokYnK/w2PqHDMxU/DGw53HX3fxgG/+yfjHgrk735k/DCntiONs8t0wdq6i/JDZ+f1KfJbaL4WdxwobGDZDPdyDEUXL24CfyThz386j5D1HaM5wj3BO6DiU9JRrK5kav96YiM9bKM+m8eMMmZSIffwF78cr0Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759504960; c=relaxed/simple;
	bh=hHf1p3GLS3uAmBFS46VkttB+pHkP3okG0NK40otPu3o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AkKYVVi+Y9dBXodN2VrpGHcv2wtc+6woSbwKc8cARYYpYMXhU8aRxOdNcNQJU9KxgTmD/fns9wzQk1kma5voONmT4rU7pBxMM3/a+Ix6ws852gyDyejPygPUXeePwkteD0afFME8ni5YnrymYjmnD8Gu3TyDkkyHNzjesbitRos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=ht3YIYij; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="ht3YIYij"
Received: from localhost.localdomain (localhost [127.0.0.1])
	by shakotay.alphanet.ch (Postfix) with ESMTP id B4C1330451F0
	for <cryptsetup@lists.linux.dev>; Fri,  3 Oct 2025 17:01:19 +0200 (CEST)
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 6C95B304344D
	for <cryptsetup@lists.linux.dev>; Fri,  3 Oct 2025 17:01:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1759503675; bh=hHf1p3GLS3uAmBFS46VkttB+pHkP3okG0NK40otPu3o=;
	h=Date:From:To:Subject:From;
	b=ht3YIYijLPhPpP11Z5flvf4ptMd71kvUrJRnAIkSLYztieNeFeMYhcHEZXHlY0Swl
	 SPs3WbIhl2ihlPbisvpjH+KKEFegG1oAyFDkwpKv24+P1+jKo3d40akUoFIf4s8PsB
	 m10ZccsYbGW80xoIt5DAM+wPr68g5ySI/QsXw+Q+8GA4LI5HFr+0waD3AJP0MiYJev
	 nh6Q5Dfc6lJlIdxUTw2Ar1bDXstSC60zgbNIieKWUVFTSoGp5EvYNxhxWpOf6n5c9L
	 ME73WeTrudAcJUfRK/ldY459dnXJ0CarenUAeuxP3K8IoH+ZSl3oJv51zMUBXA0VY1
	 DV9q9RhJDWUIg==
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 5F2F276CA4F; Fri,  3 Oct 2025 17:01:15 +0200 (CEST)
Date: Fri, 3 Oct 2025 17:01:15 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: cryptsetup@lists.linux.dev
Subject: known issue with specific kernel releases and snapshots on LVM on md
 RAID integrity devices
Message-ID: <aN/lO3XNKyrinSz5@alphanet.ch>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

kernel version (Debian): Linux virtual 6.1.0-40-amd64 #1 SMP PREEMPT_DYNAMIC
Debian 6.1.153-1 (2025-09-20) x86_64 GNU/Linux.

My setup is as follows:

/var/lib/lxc/121 is ext4-mounted from /dev/vg1/lxc-121 which is a LVM volume,
built on the physical volume /dev/md127 which is md RAID1 implemented on the
integrity devices md127_i_0 and md127_i_1, which are integrity devices as:

/usr/sbin/integritysetup --integrity crc32 --integrity-bitmap-mode --allow-discards open /dev/sda3 md127_i_0
/usr/sbin/integritysetup --integrity crc32 --integrity-bitmap-mode --allow-discards open /dev/nvme0n1p3 md127_i_1

This setup runs for months on two different systems and works like a charm. I also tried at the beginning to
force errors on one of the physical devices and they were correctly detected and rewritten at the md level.
Apart from that, no other errors so far.

It's quite fast, also.

I preferred this stacking option instead of doing the dm-integrity within LVM
itself, since this does not seem to work well with snapshots.

I never had any issue: the systems creates dozens of snapshots every few hours
for backup purposes and deletes them.

However, today I had integrity errors [1], without actual device errors nor anything specific
in the smartctl output [1]. It looks like some sectors could be redirected to the other
RAID1 mirror. However some other seem to have been also incorrect on the other devices,
thus was not corrected. This led to the snapshot device being invalidated. The only issue
is that the backup of this snapshot did not complete (I restic-backup and rsync it
to local and remote devices).

This could be a completely minor issue, e.g. if there was some reboot which did
not complete integrity the CRC writes, for example, however there was no such
issue (the system is on a UPS and only experienced controlled reboots since it
was installed).

Do you see anything peculiar with this?

As a work-around I did the following:
   - deleted all snapshots
   - allocated a LVM volume with all free blocks on the volume group
   - wrote /dev/zero to it with dd
   - sync
   - destroyed that LVM volume

Thank you for any idea or pointers!


[1]
2025-10-03T13:15:16.359650+02:00 virtual kernel: [612220.519671] device-mapper: integrity: dm-2: Checksum failed at sector 0xd50a6b8
2025-10-03T13:15:16.359662+02:00 virtual kernel: [612220.519703] md/raid1:md127: dm-2: rescheduling sector 223125176
2025-10-03T13:15:16.361212+02:00 virtual kernel: [612220.524315] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514028
2025-10-03T13:15:16.361217+02:00 virtual kernel: [612220.524342] md/raid1:md127: dm-3: rescheduling sector 223164456
2025-10-03T13:15:16.361218+02:00 virtual kernel: [612220.524393] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514030
2025-10-03T13:15:16.361219+02:00 virtual kernel: [612220.524415] md/raid1:md127: dm-3: rescheduling sector 223164464
2025-10-03T13:15:16.361219+02:00 virtual kernel: [612220.524461] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514020
2025-10-03T13:15:16.361220+02:00 virtual kernel: [612220.524479] md/raid1:md127: dm-3: rescheduling sector 223164448
2025-10-03T13:15:16.361220+02:00 virtual kernel: [612220.524550] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514038
2025-10-03T13:15:16.361221+02:00 virtual kernel: [612220.524570] md/raid1:md127: dm-3: rescheduling sector 223164472
2025-10-03T13:15:16.361221+02:00 virtual kernel: [612220.524604] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514008
2025-10-03T13:15:16.361221+02:00 virtual kernel: [612220.524621] md/raid1:md127: dm-3: rescheduling sector 223164424
2025-10-03T13:15:16.365237+02:00 virtual kernel: [612220.524712] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514040
2025-10-03T13:15:16.365246+02:00 virtual kernel: [612220.524731] md/raid1:md127: dm-3: rescheduling sector 223164480
2025-10-03T13:15:16.365247+02:00 virtual kernel: [612220.524827] device-mapper: integrity: dm-3: Checksum failed at sector 0xd51401c
2025-10-03T13:15:16.365248+02:00 virtual kernel: [612220.524842] md/raid1:md127: dm-3: rescheduling sector 223164440
2025-10-03T13:15:16.381305+02:00 virtual kernel: [612220.542185] device-mapper: integrity: dm-2: Checksum failed at sector 0xd50a6b8
2025-10-03T13:15:16.381317+02:00 virtual kernel: [612220.544723] md/raid1:md127: read error corrected (8 sectors at 223389368 on dm-2)
2025-10-03T13:15:16.381351+02:00 virtual kernel: [612220.544729] md/raid1:md127: redirecting sector 223125176 to other mirror: dm-2
2025-10-03T13:15:16.385216+02:00 virtual kernel: [612220.545002] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514028
2025-10-03T13:15:16.385227+02:00 virtual kernel: [612220.545204] md/raid1:md127: redirecting sector 223164456 to other mirror: dm-2
2025-10-03T13:15:16.385228+02:00 virtual kernel: [612220.547073] md/raid1:md127: dm-2: rescheduling sector 223164456
2025-10-03T13:15:16.393219+02:00 virtual kernel: [612220.553809] md/raid1:md127: redirecting sector 223164464 to other mirror: dm-2
2025-10-03T13:15:16.393232+02:00 virtual kernel: [612220.554002] md/raid1:md127: dm-2: rescheduling sector 223164464
2025-10-03T13:15:16.401225+02:00 virtual kernel: [612220.561696] md/raid1:md127: redirecting sector 223164448 to other mirror: dm-2
2025-10-03T13:15:16.414212+02:00 virtual kernel: [612220.576446] md/raid1:md127: redirecting sector 223164472 to other mirror: dm-2
2025-10-03T13:15:16.421730+02:00 virtual kernel: [612220.584276] md/raid1:md127: redirecting sector 223164424 to other mirror: dm-2
2025-10-03T13:15:16.429237+02:00 virtual kernel: [612220.592338] md/raid1:md127: redirecting sector 223164480 to other mirror: dm-2
2025-10-03T13:15:16.437263+02:00 virtual kernel: [612220.599077] md/raid1:md127: redirecting sector 223164440 to other mirror: dm-2
2025-10-03T13:15:16.445281+02:00 virtual kernel: [612220.605304] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164456
2025-10-03T13:15:16.449231+02:00 virtual kernel: [612220.612399] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164464
2025-10-03T13:15:16.477217+02:00 virtual kernel: [612220.637038] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164448
2025-10-03T13:15:16.485263+02:00 virtual kernel: [612220.647901] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164472
2025-10-03T13:15:16.505219+02:00 virtual kernel: [612220.664740] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164424
2025-10-03T13:15:16.533219+02:00 virtual kernel: [612220.696016] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164480
2025-10-03T13:15:16.565224+02:00 virtual kernel: [612220.725286] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164440
2025-10-03T13:15:16.629223+02:00 virtual kernel: [612220.789079] device-mapper: snapshots: Invalidating snapshot: Error reading/writing.
2025-10-03T13:15:16.641509+02:00 virtual dmeventd[3523319]: WARNING: Snapshot vg1-121_snapshot changed state to: Invalid and should be removed.
2025-10-03T13:15:16.641620+02:00 virtual dmeventd[3523319]: Unmounting invalid snapshot vg1-121_snapshot from /mnt/snapshot/121_snapshot.


