Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70411448E0
	for <cryptsetup@lists.linux.dev>; Sat,  4 Oct 2025 18:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759602871; cv=none; b=kzk5pLHfdswBZaBIF4Snj1NgdwzlecJL4G++EIYJERX1vfxg/7Dv6ISPjCSBeqF6NbM+lbIapFFkTSy1K7+/T/8Rwb2S0hBk9YAx+Cltx3CgLdWNffLFFt8WnHqmuX3S3pIKt6YQS0VUrRSVeg1ldkitcib37WwTKK5hpQjgKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759602871; c=relaxed/simple;
	bh=QyrJO8GJE06Dz8KQ9U8niHSekSiDKWPRs99WHxfBlas=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RbTscT+guJc8aJcFszAQRhVJI+5wmuK0GJuUFJ5YmPtpXXpMHL4ktq3zZt/z7/7elevtNgxzpb8xcvhRr8WX6aWSNKmzsDwMdfPgsDQISBsS1su0UuOZ1sxd2oMrhHZRfsXfHQePL2kSlo1pKqnShi28Sx58pqI4wiX0z59j6pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5wUqt3H; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5wUqt3H"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e48d6b95fso30120065e9.3
        for <cryptsetup@lists.linux.dev>; Sat, 04 Oct 2025 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759602868; x=1760207668; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yu96ksSBCMqK3NW4s6K3DvAfHx9AYuTxYEJUiY+9PFc=;
        b=g5wUqt3Hm0bw6aFb/Cn5+M6yEFYNeUQpanBqffORtejnal3atw+lbWTCZjmgPFI4e1
         IiXtvCEppzLADKEirlyFy2ZFT3BjeWDnlL7Ml8ayeDuGbd8G42jWB8YLGI5dRLVehZH+
         9lNWRFks7COYZTKyqUFWX9fCPX6AdhsGJfxu+u65hhSpgOv+wP1T9QEmBRSJBpe0QHXx
         4pjw896S2uiK3zl++ibWjDuefuLxQyCu504rU1Z2skO+BCpCVcXOSp+kAkgLmDzEWoco
         b9iaj1EjWEoGogR9pScreiX14HjSpqLakzhO0GZD6nCGvjBe+evN9Oldl4msNNyhY1OT
         TV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759602868; x=1760207668;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu96ksSBCMqK3NW4s6K3DvAfHx9AYuTxYEJUiY+9PFc=;
        b=SRVweJL+67a/JRNaCm+b2GpCcJUVZxvLE6QIF0x07g2wb9E06MVqMMdSJkxlHRJUUK
         Fx1PsivOrxEg51LWsp97zweLYUgoA9VYZkfX1xw/6hdX/7HKDCBsNr1vaLohR1koCqDH
         2qGM5n5WSHa2B1t8ybOexXr8XzbKM5WmCwgamJs8/me8rojxxmxDglo9cXW9SqhKHmBW
         XSgLt+Y0I6ZEwNDQPWeQnvL8eKtWEcXv2BcnHQbEZkM58SUtPFDxG/w0DZfvghsjB+26
         urc1I4YJeDIkWDXmscyrBnOkNN+qXgQDGkLckUe4VxbGGvlNR5MUsCZn52ZKjFWRTgeS
         FOMw==
X-Forwarded-Encrypted: i=1; AJvYcCVNYReA/9Nqj0C8lkskLpibsCqB94bjOg6MLTmcGKbrFCFIAN+fcZv64NmEm0/+exanaAfFYdhIO/6H@lists.linux.dev
X-Gm-Message-State: AOJu0YyGlfk5NQojiLqp3LKDelfDmN5AM6VfNrMC5pgYyKpf4CEisCh2
	hCsnDgaFo247XaADESYHhAjaqB7LSpO2F5GrJve6qHUi3MMdphkdwSUB
X-Gm-Gg: ASbGncvajkWPLLIOkBjIlELdJbSr5tmXfUzJ+ErTlhbODfmH+xWobj1o1EwgwrQSL8x
	VYTtfb6EYYC/ndcjqu9cUzZTKKxjO/oTlfWbLxZyOvgaS1GKQwVwHJIF2V1WDyIC55lmO3IVP4G
	hsyZNDIrouDKIew7xxck2OhjR/yEFtffphYHHP5GRfV+glVwWDK1Gav4eEZZ/xOBEU4Pj7I+2dI
	S1W0MF8wxE66yKYJPMvMRIo+E5sw9fwS6VuK40qn+jwXGLUZT183mauQWXQ0MCw3oXjeObu80w9
	2scKPKZravas+gjpSd6hekvt+mLnY0d9s/XJ0vu4ZeEaibOtehvnsX6DLzwk1KouItJogVS4IQy
	SLTDpUYoM9lK8SpAckqqknrsEpMLcDwqo+ZUHyGgqqm9BWhSUU7kSpJQ3vuKtOC2cKsi8o3aLiS
	zGUvEBRMs=
X-Google-Smtp-Source: AGHT+IGxVWT06eYhFsj7pNWcp/BIlieBJyPY1aVIJB0KVU2RMhZ5vp8YVtA+Ec4laoeEGYvBFQBWZA==
X-Received: by 2002:a05:6000:2408:b0:3e8:b4cb:c3dc with SMTP id ffacd0b85a97d-425671351a7mr4270173f8f.3.1759602867864;
        Sat, 04 Oct 2025 11:34:27 -0700 (PDT)
Received: from [192.168.2.12] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e970esm13171777f8f.35.2025.10.04.11.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Oct 2025 11:34:27 -0700 (PDT)
Message-ID: <f71c3ee6-4c31-418e-a141-f941b22b8f5c@gmail.com>
Date: Sat, 4 Oct 2025 20:34:26 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: known issue with specific kernel releases and snapshots on LVM on
 md RAID integrity devices
To: Marc SCHAEFER <schaefer@alphanet.ch>, cryptsetup@lists.linux.dev
References: <aN/lO3XNKyrinSz5@alphanet.ch>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <aN/lO3XNKyrinSz5@alphanet.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/25 5:01 PM, Marc SCHAEFER wrote:

> However, today I had integrity errors [1], without actual device errors nor anything specific
> in the smartctl output [1]. It looks like some sectors could be redirected to the other
> RAID1 mirror. However some other seem to have been also incorrect on the other devices,
> thus was not corrected. This led to the snapshot device being invalidated. The only issue
> is that the backup of this snapshot did not complete (I restic-backup and rsync it
> to local and remote devices).

I would not trust smart much, it is a nice indicator, but usually it prints error
too late (or never...) 
> This could be a completely minor issue, e.g. if there was some reboot which did
> not complete integrity the CRC writes, for example, however there was no such
> issue (the system is on a UPS and only experienced controlled reboots since it
> was installed).
> 
> Do you see anything peculiar with this?
I do not see anything special, just checksum errors that can be caused by many things.

I would start with checking hardware, specifically reseat RAM modules and cables,
check and run some extensive memory and other system tests etc.
The error could happen just by flipping some bits in memory.
Check system logs, there could be something that precedes this issue.

Also, if you re testing writes (likde with dd), do it with direct-io (dd oflag=direct).
It will require to use proper block size, but writes should got directly
to drive and not through cache (so you will see error immediately).

Milan

> 
> As a work-around I did the following:
>     - deleted all snapshots
>     - allocated a LVM volume with all free blocks on the volume group
>     - wrote /dev/zero to it with dd
>     - sync
>     - destroyed that LVM volume
> 
> Thank you for any idea or pointers!
> 
> 
> [1]
> 2025-10-03T13:15:16.359650+02:00 virtual kernel: [612220.519671] device-mapper: integrity: dm-2: Checksum failed at sector 0xd50a6b8
> 2025-10-03T13:15:16.359662+02:00 virtual kernel: [612220.519703] md/raid1:md127: dm-2: rescheduling sector 223125176
> 2025-10-03T13:15:16.361212+02:00 virtual kernel: [612220.524315] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514028
> 2025-10-03T13:15:16.361217+02:00 virtual kernel: [612220.524342] md/raid1:md127: dm-3: rescheduling sector 223164456
> 2025-10-03T13:15:16.361218+02:00 virtual kernel: [612220.524393] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514030
> 2025-10-03T13:15:16.361219+02:00 virtual kernel: [612220.524415] md/raid1:md127: dm-3: rescheduling sector 223164464
> 2025-10-03T13:15:16.361219+02:00 virtual kernel: [612220.524461] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514020
> 2025-10-03T13:15:16.361220+02:00 virtual kernel: [612220.524479] md/raid1:md127: dm-3: rescheduling sector 223164448
> 2025-10-03T13:15:16.361220+02:00 virtual kernel: [612220.524550] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514038
> 2025-10-03T13:15:16.361221+02:00 virtual kernel: [612220.524570] md/raid1:md127: dm-3: rescheduling sector 223164472
> 2025-10-03T13:15:16.361221+02:00 virtual kernel: [612220.524604] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514008
> 2025-10-03T13:15:16.361221+02:00 virtual kernel: [612220.524621] md/raid1:md127: dm-3: rescheduling sector 223164424
> 2025-10-03T13:15:16.365237+02:00 virtual kernel: [612220.524712] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514040
> 2025-10-03T13:15:16.365246+02:00 virtual kernel: [612220.524731] md/raid1:md127: dm-3: rescheduling sector 223164480
> 2025-10-03T13:15:16.365247+02:00 virtual kernel: [612220.524827] device-mapper: integrity: dm-3: Checksum failed at sector 0xd51401c
> 2025-10-03T13:15:16.365248+02:00 virtual kernel: [612220.524842] md/raid1:md127: dm-3: rescheduling sector 223164440
> 2025-10-03T13:15:16.381305+02:00 virtual kernel: [612220.542185] device-mapper: integrity: dm-2: Checksum failed at sector 0xd50a6b8
> 2025-10-03T13:15:16.381317+02:00 virtual kernel: [612220.544723] md/raid1:md127: read error corrected (8 sectors at 223389368 on dm-2)
> 2025-10-03T13:15:16.381351+02:00 virtual kernel: [612220.544729] md/raid1:md127: redirecting sector 223125176 to other mirror: dm-2
> 2025-10-03T13:15:16.385216+02:00 virtual kernel: [612220.545002] device-mapper: integrity: dm-3: Checksum failed at sector 0xd514028
> 2025-10-03T13:15:16.385227+02:00 virtual kernel: [612220.545204] md/raid1:md127: redirecting sector 223164456 to other mirror: dm-2
> 2025-10-03T13:15:16.385228+02:00 virtual kernel: [612220.547073] md/raid1:md127: dm-2: rescheduling sector 223164456
> 2025-10-03T13:15:16.393219+02:00 virtual kernel: [612220.553809] md/raid1:md127: redirecting sector 223164464 to other mirror: dm-2
> 2025-10-03T13:15:16.393232+02:00 virtual kernel: [612220.554002] md/raid1:md127: dm-2: rescheduling sector 223164464
> 2025-10-03T13:15:16.401225+02:00 virtual kernel: [612220.561696] md/raid1:md127: redirecting sector 223164448 to other mirror: dm-2
> 2025-10-03T13:15:16.414212+02:00 virtual kernel: [612220.576446] md/raid1:md127: redirecting sector 223164472 to other mirror: dm-2
> 2025-10-03T13:15:16.421730+02:00 virtual kernel: [612220.584276] md/raid1:md127: redirecting sector 223164424 to other mirror: dm-2
> 2025-10-03T13:15:16.429237+02:00 virtual kernel: [612220.592338] md/raid1:md127: redirecting sector 223164480 to other mirror: dm-2
> 2025-10-03T13:15:16.437263+02:00 virtual kernel: [612220.599077] md/raid1:md127: redirecting sector 223164440 to other mirror: dm-2
> 2025-10-03T13:15:16.445281+02:00 virtual kernel: [612220.605304] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164456
> 2025-10-03T13:15:16.449231+02:00 virtual kernel: [612220.612399] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164464
> 2025-10-03T13:15:16.477217+02:00 virtual kernel: [612220.637038] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164448
> 2025-10-03T13:15:16.485263+02:00 virtual kernel: [612220.647901] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164472
> 2025-10-03T13:15:16.505219+02:00 virtual kernel: [612220.664740] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164424
> 2025-10-03T13:15:16.533219+02:00 virtual kernel: [612220.696016] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164480
> 2025-10-03T13:15:16.565224+02:00 virtual kernel: [612220.725286] md/raid1:md127: dm-2: unrecoverable I/O read error for block 223164440
> 2025-10-03T13:15:16.629223+02:00 virtual kernel: [612220.789079] device-mapper: snapshots: Invalidating snapshot: Error reading/writing.
> 2025-10-03T13:15:16.641509+02:00 virtual dmeventd[3523319]: WARNING: Snapshot vg1-121_snapshot changed state to: Invalid and should be removed.
> 2025-10-03T13:15:16.641620+02:00 virtual dmeventd[3523319]: Unmounting invalid snapshot vg1-121_snapshot from /mnt/snapshot/121_snapshot.
> 
> 
> 

