Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362006E60B
	for <cryptsetup@lists.linux.dev>; Fri,  1 Mar 2024 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709296031; cv=none; b=gUVoggEwROEdvs7I34EkFQdCQKXEZw+oIjqe8+jzxwKCxqHlV1gNCnQ/lXiPSEPOHgbt4G2wTP4SgInx94yQ5PKPmzDtFiUpPUFDMEZKUBBhA5sPmSO2+zOxSygMfZY0q/9wRpNGVs/CRKP9ZKLIqjlOb4j1KmMAx6LpwusZ9Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709296031; c=relaxed/simple;
	bh=qk9kV6jJZHNTN2O3hR5FvP6dJvuUnBJua9z5/ztZS00=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=YOml8mXPbONeQE935ztY7G3MJamc5FE9V4BY15kKtLLc7SMNNo2JREM6j8WWSWKydnd+Viuwus/1NVquPEzlNqoMUpkVBEwDZoU7rwcUeyGL8CLYBBoqrWEWJJpUEYVZmYA0vFmc4vdzMDv6AcSOonRokfpCazVcZuB7zoqCnNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ei9hjjqm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ei9hjjqm"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-566e1e94b47so502404a12.0
        for <cryptsetup@lists.linux.dev>; Fri, 01 Mar 2024 04:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709296028; x=1709900828; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHwqnz6ekzsLS1pCSkX5ku+TrDztlBgV/ZwUNNBlaR8=;
        b=ei9hjjqmhCTHkwYNEuCYax/zGF7TMmrhKlP6zlsvLxTypBFLaYAzxQdKCSX79idrH+
         XTbNFZMeo9vypffGOJET+sBaEifMA079g5BN85RE5EJs2cxs02JhejH0SJ74zoGw8JGj
         3Pg6OkQ65KJKTzki5VPrRoLVl5Omhinpcllq5w6m6et+7b4OAF/23omzGENEi6ahPH5E
         NXllFM//JILwOIs81KhIKvKzQdwkIg5a4Of1RXIeHBr8caeJByytd3eQirmEHXYy7kVu
         G8ajULEQN0OFaK34yxhtj7T/C7hMXOsSu7VJOL6zm7/BKh/6lPrpKdcl6mHfm4pxxggK
         3dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709296028; x=1709900828;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iHwqnz6ekzsLS1pCSkX5ku+TrDztlBgV/ZwUNNBlaR8=;
        b=c2o5Q4q6EC/9n93w8moO+N38MW/mJP1xiuPom1efms6SsJ6vjp00tfsvGxR+Y/svGV
         /YNOR8OFZipBmlqkc3rnG+GuEE/S3XE0NfhOcZfUB9R1hBUGEYlko1CLVBbK+In7OnHh
         ePLnHWw0CWRjPd7G8spXjWcOiK3KA6NbbAxCTh1PkFXLFN65XpI8kcQoImWXWZ+OOTNw
         4PAVxIQRE7pDyIem1EjE61OpPZ1lV6FxixshM8wPUdSEArVyjIC1DX8WORsb1m8RbAG9
         T+YfvWYvkRLzXmIWKItjdQkUYaAPRsCYkCV4eVV+YVRsgWpQ6up13o99hR2XaJFQJ7YV
         RJBQ==
X-Gm-Message-State: AOJu0YwMerT4GzqpGety6GaOrWnX+K5Ix4q5w4Ur5uIMIFx5FEsAfC5D
	j3fp9eXZ4MAtRBOCZwfMOLZEHqqy8qbG8R3RG7HIUB5SYYlOgIFxl5C7bvoK
X-Google-Smtp-Source: AGHT+IGrCNlFPwrRYM4XtyR5XPIu4GilVBJdKovysfi8XIEqwK48qjk7KidXCyaPwCrJ6bzyfndetA==
X-Received: by 2002:a17:906:b75a:b0:a44:8abd:7b41 with SMTP id fx26-20020a170906b75a00b00a448abd7b41mr1135298ejb.37.1709296027460;
        Fri, 01 Mar 2024 04:27:07 -0800 (PST)
Received: from ?IPV6:2a01:110f:491e:5c00:ebe4:686b:29ff:5cc6? ([2a01:110f:491e:5c00:ebe4:686b:29ff:5cc6])
        by smtp.gmail.com with ESMTPSA id jw20-20020a170906e95400b00a44936527b5sm461263ejb.99.2024.03.01.04.27.06
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 04:27:07 -0800 (PST)
Message-ID: <a27e8008-9a85-4218-8d20-d1d56fa73671@gmail.com>
Date: Fri, 1 Mar 2024 13:27:06 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?Q?Aleksander_=C5=81ukasz?= <allllllx@gmail.com>
Subject: Unexpected behavior of reencrypt performed after partition resize
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I'm trying to debug a mysterious data corruption apparently happening 
during cryptsetup reencryption step that follows partition resize.

I can deterministically reproduce the following behavior from the 
initramfs boot stage when reencrypting root partition:

```
BusyBox v1.35.0 (Debian 1:1.35.0-4+b3) built-in shell (ash)
Enter 'help' for a list of built-in commands.

~ # while true; do \
 >     (echo -n "hello" | cryptsetup open /dev/vda4 test ) \
 >     && dd if=/dev/mapper/test | md5sum \
 >     && cryptsetup close /dev/mapper/test \
 >     && (echo -n "hello" | cryptsetup reencrypt /dev/vda4) done
d53129dd093a5ac0be99995bd5e46edc  -
4958175+0 records in
4958175+0 records out
Finished, time 01m28s, 2420 MiB written, speed  27.5 MiB/s
c4d10b8b556fe4ea1c2430f866b6aa76  -
4958175+0 records in
4958175+0 records out
Finished, time 01m25s, 2420 MiB written, speed  28.4 MiB/s
c4d10b8b556fe4ea1c2430f866b6aa76  -
4958175+0 records in
4958175+0 records out
Finished, time 01m30s, 2420 MiB written, speed  26.7 MiB/s
c4d10b8b556fe4ea1c2430f866b6aa76  -
4958175+0 records in
4958175+0 records out
Finished, time 01m34s, 2420 MiB written, speed  25.7 MiB/s
c4d10b8b556fe4ea1c2430f866b6aa76  -
4958175+0 records in
4958175+0 records out
```

As you can see, first reencryption changes contents of the LUKS 
container (as read via the dm-crypt mapper) and all the subsequent ones 
do not (which I would expect to always be the case).

This first call changing the contents is what I'm trying to understand, 
as to the best of my knowledge, this shouldn't happen in any 
circumstances, no data shifts take place here and observed behavior of 
checksum changing is unexpected. Am I right or do I miss something?

I can trigger this behavior by resizing /dev/vda4 partition just before 
booting into initramfs, using any of the tools like systemd-repart or 
growpart
(which extends /dev/vda4 to the end of also just extended /dev/vda). If 
I don't do such resize, then the effect of first iteration of 
reencryptions changing the checksum is not present.

This is Debian stable and Debian Sid, so on Linux 6.1.0-18-amd64 #1 SMP 
PREEMPT_DYNAMIC Debian 6.1.76-1 (2024-02-01) x86_64 GNU/Linux) + 
cryptsetup 2.6.1 flags: UDEV BLKID KEYRING KERNEL_CAPI) and on Linux 
6.6.15-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.6.15-2 (2024-02-04) x86_64 
GNU/Linux + cryptsetup 2.7.0 flags: UDEV BLKID KEYRING KERNEL_CAPI 
HW_OPAL. All running in QEMU.

So far I've tried:

- reviewing output of running with --debug ,

- reencrypting with and without active mapping open,

- resizing partition after full boot or from initramfs phase, using 
various tools for that,

- manipulating partition size change step,

- reviewing LUKS header changes between first and subsequent reencryptions,

- measuring checksums of partition segments related to previous and new 
size separately (both do change),

- running reencrypt with various --resilience modes,

- ensuring cryptsetup-initramfs tooling did not interfere with reencryption,

- ... .

Could always reproduce the behavior mentioned and did not found any 
obvious (to my untrained eyes) indications of what could be happening wrong.

I've also reviewed https://github.com/mbroz/cryptsetup/blob/main/FAQ.md 
and saw short mention of corruption risk in context of partition 
resizing under the section 2.8, but I think it does not apply here? 
Also, I'm aware of resizing related mention in cryptsetup 2.7 release 
notes, but I also believe this is not such a case (and I did not observe 
the warning mentioned there).

Also, I've tried to reproduce the issue using disk image file and a loop 
device, but did not succeed - that is I could not force the first 
iteration after resize to change checksum - all were always the same.

Any tips on what I could be doing wrong or what to look for would be 
very appreciated as I'm running out of ideas!

