Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17231494B3
	for <cryptsetup@lists.linux.dev>; Sat,  2 Nov 2024 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730588123; cv=none; b=pPAjVbrKdWKvOdpJYVbSmWTdaZXB8dKeg3DK5cpCd7axBAStGTuIv08jkNsqE9HWcKzcZJgHnCFpfG8E8zzQCK188Xg3NMS1UYfvdC5Sd6/0SfochpI85CHYeMCisJW9LSbpERK3Zxw3StS67DTf8TeVnCzn9hXlZ32LssQHw5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730588123; c=relaxed/simple;
	bh=KEE9Ct247j7dehUQA4tvYmBdhswC/Uim+ln/34g3UxA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rmWkpjVWfCPV1Yd0ewn0+FI13mOquBIcG5IZLYZt0BTD1bVe9qvy7KSnf6qVnlCbdhP7j6EMr+RGj8QGmmMrfaJALCf5h/SJLIBqYVxoWOOT6CbOTZwe4syGKUoyty+1Hn9LIWKwHktyzPFt7lAndSt9mqLfBN/111FfbHTaFDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=punchcutter.ml1.net; spf=pass smtp.mailfrom=punchcutter.ml1.net; dkim=pass (2048-bit key) header.d=ml1.net header.i=@ml1.net header.b=TpFt+mKf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JJXX/Qpz; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=punchcutter.ml1.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=punchcutter.ml1.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ml1.net header.i=@ml1.net header.b="TpFt+mKf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JJXX/Qpz"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 68485114015A;
	Sat,  2 Nov 2024 18:55:17 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-10.internal (MEProxy); Sat, 02 Nov 2024 18:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ml1.net; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1730588117;
	 x=1730674517; bh=rOjolIgH+QcjakguupLrO7wlqQYCKDy1S19pxwmS47M=; b=
	TpFt+mKfS3AdmbWiKaOarY1S6UD4hHpJnwCjsH5QRV8yNw4lL/TxHXrrCyQJlkcT
	fhvUK6rIOjZVImQHhB0WLbQGinpea6DfB1zw6kdbzk6Bx7tcz9mDe2X4ppT7UvoP
	AOVVpm+GO9lU/6hJSo1W2ruH8uTM0oTRjtXSrKvVOViA0k4Y5kfCyGZTD9mbkSpT
	Q0bOf/gtVxE0SuhrRJ0FO2yefluIbh6HAxuDwjB9HKVWH5MwUDYINbho3Iq8PqvB
	uSMBmXg7TcPI8sq1ZZiiKiu3g3HkCbw3IwnPFA2OlRvcCOQghLojrmcs9sKLz0zb
	B9KpSWyjihfPX9dlXHuOPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730588117; x=
	1730674517; bh=rOjolIgH+QcjakguupLrO7wlqQYCKDy1S19pxwmS47M=; b=J
	JXX/QpzO1mKy522TFppImZ1y0bs8eohnCbzwPmv5zfjSrzKVV2puR/i4/5txhk51
	CE9O8Iy3KS/HjcxXlasoYRTO/znCW2Dn+3dfw3KnPVl4Ns91JdLu7Wpm/Pb/GEUi
	mGTrztUENkC3coh7RH0/dyHciPZkLXu+ga/5hbtrNK4gSjE3PxTCvTsh1qbdcQna
	5LnEclnbOkAQfjVnS97uaEcR5opsSt2xlBSePI8d1W03kCTOWgjpIEDJ7GuMbS4r
	2dJjC4B3nG5KwfALT+7Ph+xz26jbNJZR22YIrgCozGMBCTRwSHJpcrhJ9rLtsS6i
	gvkAgOb9q3Xkm3zIn31mg==
X-ME-Sender: <xms:1a0mZ8IUzdIrkdDK3zr4mLk-0cpGdwiOTAy-vW-Itnu34qr8PDHPmA>
    <xme:1a0mZ8I-xqjLZYD4zTpkXRDvir0ocHmdlI5CcnTIQgHTkVTvIbw-B9OM60DijXd8F
    yHWnYR4SxZC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelvddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucforghilhcuufhprhhinh
    hgucdlfedtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfh
    rhhomhepfdffrghvihguucflucfkrghnnhhutggtihdfuceophgvlhgtghhfrhhghhgtii
    ihsehpuhhntghhtghuthhtvghrrdhmlhdurdhnvghtqeenucggtffrrghtthgvrhhnpeff
    kedtgffgieegtdeifeevuddvledvhfduteeljeeugfefleetleekgeelteetudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghltghgfhhr
    ghhhtgiihiesphhunhgthhgtuhhtthgvrhdrmhhluddrnhgvthdpnhgspghrtghpthhtoh
    epvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhmrgiihihlrghnugesghhm
    rghilhdrtghomhdprhgtphhtthhopegtrhihphhtshgvthhupheslhhishhtshdrlhhinh
    hugidruggvvh
X-ME-Proxy: <xmx:1a0mZ8tcAwe4K-z4pMPmB_h1WLNq-cWdD5r2ZN3xjqkfemw8r8l2BQ>
    <xmx:1a0mZ5ZQ1Ntm-b9AZn04YBtKa_nFyoRasfjAeXJScdKrwS0xGRyggQ>
    <xmx:1a0mZzbYWPSaUsLa8rcr6ccrzOKs_jqDR-6hUbIVaItyjPfudEmf0A>
    <xmx:1a0mZ1Avw4IFx30emUDQAnMQw07YRzfnzgw1865ilx_tPnyMoRjEkQ>
    <xmx:1a0mZ6yYcB9fIb7zWvXMNXp2Z73rQvZgMpwxL_scAs1O-lhtMBO7K2-E>
Feedback-ID: i5bfa418f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0FC551C20066; Sat,  2 Nov 2024 18:55:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 02 Nov 2024 16:53:43 -0600
From: "David J Iannucci" <pelcgfrghczy@punchcutter.ml1.net>
To: cryptsetup@lists.linux.dev
Cc: "Milan Broz" <gmazyland@gmail.com>
Message-Id: <12f16036-a407-4ca7-9708-1c0f751f5e5d@app.fastmail.com>
In-Reply-To: <1b63da83-8290-4d15-8f58-adf5ca6d903a@gmail.com>
References: <1730260948-20104-mlmmj-67cc752c@lists.linux.dev>
 <444a19f7-c557-4b7e-aad9-202a3f2e4876@app.fastmail.com>
 <1b63da83-8290-4d15-8f58-adf5ca6d903a@gmail.com>
Subject: Re: device-mapper: reload ioctl ... failed: No such file or directory
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 30, 2024, at 01:10, Milan Broz wrote:
>> I'm using cryptsetup 2.7.5 on Gentoo to try to open an old TrueCrypt
>> volume that I haven't looked at in at least a few years. Yes, I have
>> the passphrase :=)  Below is a trace of what's happening. Without --
>> debug, all I see is the error message:
>> 
>>    device-mapper: reload ioctl on coreswp (254:0) failed: No such file or directory
>> 
>> Any help in figuring this out would be much appreciated.
>
> The log shows, that TrueCrypt part works, you have correct password.
> The issue is only in the last step - activation through kernel dm-crypt.

Thank you for the response. I have tried again after copying the TC file
to local (SSD) disk per your suggestion (I had been accessing it on an
external spinning USB HDD before), and also adding --readonly.
The same error occurs.

It seems I do have dm-crypt:
# lsmod | grep crypt
dm_crypt               49152  0
dm_mod                139264  1 dm_crypt


> I expect that you have device-mapper udev rules properly installed.

I'm not sure - how can I check this? This is a fairly bare-bones Gentoo
install and I'm not a big expert on everything that I should be, so that
might have slipped through the cracks.

But...! I just found something... it seems I am running a systemd-udevd,
which would not have been my choice... I have taken steps to keep
systemd completely off my machine, so this is a surprise. Will consult
Gentoo forums about this.

> Is there anything in syslog?

This is what comes out in /var/log/messages:

Nov  2 16:31:36 linux kernel: loop0: detected capacity change from 0 to 209715200
Nov  2 16:31:36 linux kernel: device-mapper: table: 254:0: crypt: Error allocating crypto tfm
Nov  2 16:31:36 linux kernel: device-mapper: ioctl: error adding target to table


> Where it is mounted? (/mnt path) - some remote nfs/samba?

As mentioned, it was on external drive, but now in my home dir.

Thanks again,
Dave

p.s. I note that simple reply on this list goes only to the sender
     rather than back to the list, which is maybe the way the list
     prefers it? Though in my experience most tech lists like to keep
     this kind of discussion on the list so that more eyes are on
     things, and solutions are documented, but if that's not the case
     here, kindly let me know and I'll use simple reply to individuals
     from now on.


> Could you try to copy the container to local fs and open it from there?
> Also, try to open it read-only (-r flag).
> (There were some issues with detecting direct-io, this tries to avoid them.)
>
> Thanks,
> Milan
> ...
>
>> # Device-mapper backend running with UDEV support enabled.
>> # dm status coreswp  [ opencount noflush ]   [16384] (*1)
>> # Allocating a free loop device (block size: 512).
>> # Trying to open and read device /dev/loop0 with direct-io.
>> # Direct-io is supported and works.
>> # Attached loop device block size is 512 bytes.
>> # Calculated device size is 209714688 sectors (RW), offset 256.
>> # Trying to activate TCRYPT device coreswp using cipher aes-xts-plain64.
>> # DM-UUID is CRYPT-TCRYPT-coreswp
>> # Udev cookie 0xd4dfe53 (semid 65598) created
>> # Udev cookie 0xd4dfe53 (semid 65598) incremented to 1
>> # Udev cookie 0xd4dfe53 (semid 65598) incremented to 2
>> # Udev cookie 0xd4dfe53 (semid 65598) assigned to CREATE task(0) with flags DISABLE_LIBRARY_FALLBACK         (0x20)
>> # dm create coreswp CRYPT-TCRYPT-coreswp [ opencount flush ]   [16384] (*1)
>> # dm reload   (254:0) [ opencount flush securedata ]   [16384] (*1)
>> device-mapper: reload ioctl on coreswp (254:0) failed: No such file or directory
>> # Udev cookie 0xd4dfe53 (semid 65598) decremented to 1
>> # Udev cookie 0xd4dfe53 (semid 65598) incremented to 2
>> # Udev cookie 0xd4dfe53 (semid 65598) assigned to REMOVE task(2) with flags DISABLE_LIBRARY_FALLBACK       (0x20)
>> # dm remove coreswp  [ opencount flush securedata ]   [16384] (*1)
>> # Uevent not generated! Calling udev_complete internally to avoid process lock-up.
>> # Udev cookie 0xd4dfe53 (semid 65598) decremented to 1
>> # DM create task failed, dm_task errno: 0.
>> # dm versions   [ opencount flush ]   [16384] (*1)
>> # dm status coreswp  [ opencount noflush ]   [16384] (*1)
>> # Device status returned -19.
>> # Data device /mnt/disk1/core.swp is OK.
>> # No referenced device missing, some device in use.
>> # Udev cookie 0xd4dfe53 (semid 65598) decremented to 0
>> # Udev cookie 0xd4dfe53 (semid 65598) waiting for zero
>> # Udev cookie 0xd4dfe53 (semid 65598) destroyed
>> # Releasing crypt device /mnt/disk1/core.swp context.
>> # Releasing device-mapper backend.
>> # Closing read only fd for /mnt/disk1/core.swp.
>> # Closed loop /dev/loop0 (/mnt/disk1/core.swp).
>> Command failed with code -5 (device already exists or device is busy).
>> 
>> ----end----
>>
