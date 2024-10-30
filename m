Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCFE33E7
	for <cryptsetup@lists.linux.dev>; Wed, 30 Oct 2024 04:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730261649; cv=none; b=QN5XrZCB0uJTJTEc4HP63IzSulFOedbzZRr3A4G0y3HYChF7h3n+ipK94+KTotlONwS7S3p5TglVIfFhk3VEcYnwuyOYKE6tUM1mgP1b4nIOCUsLL1Lr/l1v+o6bMmD+Uu0Skan/Dn+1xOhQaJnAoan1eMhxrHIGkRlVyNpTqL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730261649; c=relaxed/simple;
	bh=niJmIxcV+tsYR/Sqf7Mt05S4oN8SqU7/Lkt2d60xEbI=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bVJ+5q3cvq7zfaLsYiHGRxu7lf4Y/iJwdWY7YcOBFVrXTjxIAlgzsCv0Bals5zDTNu3YfVO4WpsaN7sJ7RWLaMMiikfqrPFkUXhp+xby2j/6nKxNGBR4m1GSoBQqtEPuN+1cpS7iZ3CyyAVTO27G2GwjwKM8rnbM12uktVcLFI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=punchcutter.ml1.net; spf=pass smtp.mailfrom=punchcutter.ml1.net; dkim=pass (2048-bit key) header.d=ml1.net header.i=@ml1.net header.b=be5uIDSf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kyY3Hoga; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=punchcutter.ml1.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=punchcutter.ml1.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ml1.net header.i=@ml1.net header.b="be5uIDSf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kyY3Hoga"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 2AC67138019F
	for <cryptsetup@lists.linux.dev>; Wed, 30 Oct 2024 00:14:06 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-10.internal (MEProxy); Wed, 30 Oct 2024 00:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ml1.net; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1730261646;
	 x=1730348046; bh=ycq9YQGwgiLYaoElzSxbxdeQpzsP682CrQcq4n3t428=; b=
	be5uIDSfLlXVynTA9VZT1ialDN9g8XEIW5TqEwJDrqmcNxQNfbsmCKO3vPMV08Ob
	pnbkA74CKUIwULHAsheA5JWi2T6vN1RWVd3g04KMVfxvnKLy1cCP7lvWBaE7YlA0
	APohpslv+/HlEtNwIso2Dvce8h+Id87wfRB1ry7+f25ujo/JszDDzj54iHG6FqM3
	Hfsb5luolEJ1ADBQOna3scLkyRs4w30QDKZIMEZVAxTtj+t3LZt0cKyR4k+wrEOY
	MOejBLng3Z+kZK8A+NVI27q4MbgwK+FRV1FBuOj/qGkemDSNqKIUd66zCRj7L0a3
	8tTyCcso9Dvq747bCocQxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1730261646; x=1730348046; bh=y
	cq9YQGwgiLYaoElzSxbxdeQpzsP682CrQcq4n3t428=; b=kyY3HogaP5HwrBUGI
	QDpDTVMap/P+2xNp8aAAUIAPKRGxd/xA1ST0sFGIQmmbxRU3HqTLFXTXvYRKZacH
	YBjhi2pnezF3tHOPji3awPuC8y5usUdeEzT4xulouUCAj0FZeRR3XkTSKk6mIWos
	/SP1AwgBr8aC9lAnXdu65VvmqVnzTK4DLI2tfx4Qfgo3H5Shz7kqjb/X07PV7yWb
	hFavpClUGzjds5cOFDtnW60gNL/3OG7d/+4zpwwjEui3BeL8iFahiUtTFsp26Jy7
	LFX5LhCFWhcSLYa+67Zr6OGCLxgCVwYBR0JtPimFVlq501QTKSAsixOJC4285b9K
	4qb4A==
X-ME-Sender: <xms:jbIhZ66nkrXfQEsSbc2JU86HBwxS5tHm2_5cc8BhJXHGt6Qfw89VRA>
    <xme:jbIhZz7VddKoatsEaDaAdS0G-5gbJx0mBQFywPuCc0gp8hwO-ifCJj3zj9CDWb8mQ
    dK1DzdWmTR8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekvddgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucforghilhcuufhprhhinh
    hgucdlfedtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertdertddtnecuhfhr
    ohhmpedfffgrvhhiugculfcukfgrnhhnuhgttghifdcuoehpvghltghgfhhrghhhtgiihi
    esphhunhgthhgtuhhtthgvrhdrmhhluddrnhgvtheqnecuggftrfgrthhtvghrnhepgeff
    leefffekuefhgfetteehudejgfduueetudelgeefgfejgeehtdeftdefieegnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvlhgtghhfrhhg
    hhgtiiihsehpuhhntghhtghuthhtvghrrdhmlhdurdhnvghtpdhnsggprhgtphhtthhope
    dupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrhihphhtshgvthhupheslhhi
    shhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:jbIhZ5fXScqlM7FecEGx7wJ2Kx2J9OuJYegT8UdlC32zMVFHjwo42g>
    <xmx:jbIhZ3LhOW-91U9Jt9IB56Dzn4-nmm8o1taCCBlcAMaLhfAnF1FyJg>
    <xmx:jbIhZ-ItjUnymweX0RWSACnUSYw3ZuKj-X5wnhNd_8MYOxGRS14x0g>
    <xmx:jbIhZ4wxlPHjZT-iZQM7oI80vZ9aU9CKWdpzwgoDJT04Sym88Op1hQ>
    <xmx:jrIhZ4ywiwrNTHuFiBvIiokx5lDBQanDNFwl7Gk8jMr3ATysb9elozUb>
Feedback-ID: i5bfa418f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DAEB21C20066; Wed, 30 Oct 2024 00:14:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 29 Oct 2024 22:12:27 -0600
From: "David J Iannucci" <pelcgfrghczy@punchcutter.ml1.net>
To: cryptsetup@lists.linux.dev
Message-Id: <444a19f7-c557-4b7e-aad9-202a3f2e4876@app.fastmail.com>
In-Reply-To: <1730260948-20104-mlmmj-67cc752c@lists.linux.dev>
References: <1730260948-20104-mlmmj-67cc752c@lists.linux.dev>
Subject: device-mapper: reload ioctl ... failed: No such file or directory
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

I'm using cryptsetup 2.7.5 on Gentoo to try to open an old TrueCrypt volume that I haven't
looked at in at least a few years. Yes, I have the passphrase :=)  Below is a trace of what's
happening. Without --debug, all I see is the error message:

  device-mapper: reload ioctl on coreswp (254:0) failed: No such file or directory

Any help in figuring this out would be much appreciated.

Dave

------
root# cryptsetup open --debug --type tcrypt /mnt/disk1/core.swp coreswp
# cryptsetup 2.7.5 processing "cryptsetup open --debug --type tcrypt /mnt/disk1/core.swp coreswp"
# Verifying parameters for command open.
# Running command open.
# Installing SIGINT/SIGTERM handler.
# Unblocking interruption on signal.
# Allocating context for crypt device /mnt/disk1/core.swp.
# Trying to open and read device /mnt/disk1/core.swp with direct-io.
# Direct-io is supported and works.
# Initialising device-mapper backend library.
# Interactive passphrase entry requested.
Enter passphrase for /mnt/disk1/core.swp: 
# Trying to load TCRYPT crypt type from device /mnt/disk1/core.swp.
# Crypto backend (OpenSSL 3.3.2 3 Sep 2024 [default][legacy][threads][argon2]) initialized in cryptsetup library version 2.7.5.
# Detected kernel Linux 5.15.167-gentoo x86_64.
# Reading TCRYPT header of size 512 bytes from device /mnt/disk1/core.swp.
# TCRYPT: trying KDF: pbkdf2-ripemd160-2000.
# TCRYPT:  trying cipher aes-xts-plain64
# TCRYPT: Signature magic detected.
# TCRYPT: Magic: TRUE, Header version: 5, req. 1792, sector 512, mk_offset 131072, hidden_size 0, volume size 107373920256
# TCRYPT: Header cipher aes-xts-plain64, key size 64
# Activating volume coreswp [keyslot -1] using key.
# dm version   [ opencount flush ]   [16384] (*1)
# dm versions   [ opencount flush ]   [16384] (*1)
# Detected dm-ioctl version 4.45.0.
# Detected dm-crypt version 1.23.0.
# Device-mapper backend running with UDEV support enabled.
# dm status coreswp  [ opencount noflush ]   [16384] (*1)
# Allocating a free loop device (block size: 512).
# Trying to open and read device /dev/loop0 with direct-io.
# Direct-io is supported and works.
# Attached loop device block size is 512 bytes.
# Calculated device size is 209714688 sectors (RW), offset 256.
# Trying to activate TCRYPT device coreswp using cipher aes-xts-plain64.
# DM-UUID is CRYPT-TCRYPT-coreswp
# Udev cookie 0xd4dfe53 (semid 65598) created
# Udev cookie 0xd4dfe53 (semid 65598) incremented to 1
# Udev cookie 0xd4dfe53 (semid 65598) incremented to 2
# Udev cookie 0xd4dfe53 (semid 65598) assigned to CREATE task(0) with flags DISABLE_LIBRARY_FALLBACK         (0x20)
# dm create coreswp CRYPT-TCRYPT-coreswp [ opencount flush ]   [16384] (*1)
# dm reload   (254:0) [ opencount flush securedata ]   [16384] (*1)
device-mapper: reload ioctl on coreswp (254:0) failed: No such file or directory
# Udev cookie 0xd4dfe53 (semid 65598) decremented to 1
# Udev cookie 0xd4dfe53 (semid 65598) incremented to 2
# Udev cookie 0xd4dfe53 (semid 65598) assigned to REMOVE task(2) with flags DISABLE_LIBRARY_FALLBACK       (0x20)
# dm remove coreswp  [ opencount flush securedata ]   [16384] (*1)
# Uevent not generated! Calling udev_complete internally to avoid process lock-up.
# Udev cookie 0xd4dfe53 (semid 65598) decremented to 1
# DM create task failed, dm_task errno: 0.
# dm versions   [ opencount flush ]   [16384] (*1)
# dm status coreswp  [ opencount noflush ]   [16384] (*1)
# Device status returned -19.
# Data device /mnt/disk1/core.swp is OK.
# No referenced device missing, some device in use.
# Udev cookie 0xd4dfe53 (semid 65598) decremented to 0
# Udev cookie 0xd4dfe53 (semid 65598) waiting for zero
# Udev cookie 0xd4dfe53 (semid 65598) destroyed
# Releasing crypt device /mnt/disk1/core.swp context.
# Releasing device-mapper backend.
# Closing read only fd for /mnt/disk1/core.swp.
# Closed loop /dev/loop0 (/mnt/disk1/core.swp).
Command failed with code -5 (device already exists or device is busy).

----end----
