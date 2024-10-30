Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A639A1E0E0E
	for <cryptsetup@lists.linux.dev>; Wed, 30 Oct 2024 07:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730272248; cv=none; b=ZusLfyt7zlGVuW89NFLdYYch5Z6nGePyNWHKMwQfK2R7PeCsBslb0rRsYZbfgfjzn9G0aDqhrD2yRXXZLjFOQ5bRAXpuu631OOUYpN4R+ZHBGSkxDJ+Kj4+efTsNgMi5BjVRlqzeA0VSvvtpiMq0FkN+Bzr8tPJQqAvyZ9M9IlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730272248; c=relaxed/simple;
	bh=oJ+AmhsUmDDOv8fqaf+AyqaHK489VbCTI9c4IKIDssg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LQwO1/ojHNGfSh9EM0Rw7gg7iGunzZPK6evgNDk9fjI+2dTGHA8gHkSHZgdJDQNEx7MT4oeRln11rIhkXt47LbE86uCPNGmHNojiNSMBqTr5kHpXqb48L1gQcGmqAcjur6j5/hWcSKjDlz8AHwJKUklqj4ZlqlMgaQHPzq2QCr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTvc9G49; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTvc9G49"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c96936065dso7297268a12.3
        for <cryptsetup@lists.linux.dev>; Wed, 30 Oct 2024 00:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730272245; x=1730877045; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/JRmqHV9/QePXNiI2qTOlb91cxqfUmb8ZUoMShApznQ=;
        b=VTvc9G49wHNDzvXaNH237+aNpbmN12Rn2VnvlaKOSu58ZiekpR+RZfJJUA7tROlkvy
         S1rcDuRtTccmyrbbktlfTHr6+G6NW5o2BgeXXN9yIK4X0KIdHgeMG6q6nfxritvPxlSW
         zeyUPjC9wiskiZO+5/Fda/7HMZOLnwhupLPZy16f2YAJ5BUcuZKjQcAxkkrtI1JDiUtJ
         Gq3PnfV9NHnqfXGhwaFwp8ysjtp9iTSGqxHUcDA78x1pMMFItaFWVzeS7rnmAVgDgRgh
         0KAZqmoFhZeK3q+cAowL8WmgwnZWQ2pH1MFfPsRP28Zq9c27X6HHH6QiCmEgwWQEnh8+
         glYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730272245; x=1730877045;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JRmqHV9/QePXNiI2qTOlb91cxqfUmb8ZUoMShApznQ=;
        b=s8zFLs6oABS1RlgugbJ3VfaV0UyXACv2PVJoU4zHD7w91+IMzoN4xa/ca/ZZ3SKEKS
         Dyey6evIalgchV/gVnZfj0u4sqkzgtnUXrAD1KdUZ4s4Gls46iYqcdo8gre3mdwcQEK7
         68J26qFDMDxF5duxGgZX29rgum/dk/oIuU9fpR7eWyquwU39j8AAZgPUmJFhqS7rtnJX
         aBjTr8FOmmfkhSr4wPuijzPOh8M527YvpIAAXuXHzt6vnrGpzICIWg4WbMnzHxSaxuax
         gtLCvRa7nWGliUtpjG1ROkRGQ5tu6RLWrgQ5ho0Bton8ByE1yGD5Eey46qxnFfNWlRdu
         mghQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+M0U06Jc7FzjYOfnr5pImhihTvXF1/nJph3Qm/pitVhLRiocN2oaLyz9r91DeMl43Jld7iZbPpoHq@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf/kG9kWtgzBMqtBXFloeL7Cf/tj9+zW8cEW+wkXEAhDxwLRDS
	ELzYDuULVvcw9WuB4rPY+3Y5xRtfPhtDwLsOnCYxR4nCVQuAfnLY/xDXzA==
X-Google-Smtp-Source: AGHT+IHupBPs9Njlnnfm9trBNQhlHd7WiQojGaekyE8FdSGgHXJHMXJARaNBfy1exTjnrsGRja/fkA==
X-Received: by 2002:a17:907:3f09:b0:a9a:2d04:b577 with SMTP id a640c23a62f3a-a9e3a620e06mr231073266b.32.1730272244643;
        Wed, 30 Oct 2024 00:10:44 -0700 (PDT)
Received: from [192.168.2.30] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec8196sm539724466b.2.2024.10.30.00.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 00:10:44 -0700 (PDT)
Message-ID: <1b63da83-8290-4d15-8f58-adf5ca6d903a@gmail.com>
Date: Wed, 30 Oct 2024 08:10:43 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: device-mapper: reload ioctl ... failed: No such file or directory
To: David J Iannucci <pelcgfrghczy@punchcutter.ml1.net>,
 cryptsetup@lists.linux.dev
References: <1730260948-20104-mlmmj-67cc752c@lists.linux.dev>
 <444a19f7-c557-4b7e-aad9-202a3f2e4876@app.fastmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <444a19f7-c557-4b7e-aad9-202a3f2e4876@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/30/24 5:12 AM, David J Iannucci wrote:
> Hello,
> 
> I'm using cryptsetup 2.7.5 on Gentoo to try to open an old TrueCrypt volume that I haven't
> looked at in at least a few years. Yes, I have the passphrase :=)  Below is a trace of what's
> happening. Without --debug, all I see is the error message:
> 
>    device-mapper: reload ioctl on coreswp (254:0) failed: No such file or directory
> 
> Any help in figuring this out would be much appreciated.

The log shows, that TrueCrypt part works, you have correct password.
The issue is only in the last step - activation through kernel dm-crypt.

I expect that you have device-mapper udev rules properly installed.

Is there anything in syslog? Kernel dm-crypt kernel module, is available?

Where it is mounted? (/mnt path) - some remote nfs/samba?

Could you try to copy the container to local fs and open it from there?
Also, try to open it read-only (-r flag).
(There were some issues with detecting direct-io, this tries to avoid them.)

Thanks,
Milan
...

> # Device-mapper backend running with UDEV support enabled.
> # dm status coreswp  [ opencount noflush ]   [16384] (*1)
> # Allocating a free loop device (block size: 512).
> # Trying to open and read device /dev/loop0 with direct-io.
> # Direct-io is supported and works.
> # Attached loop device block size is 512 bytes.
> # Calculated device size is 209714688 sectors (RW), offset 256.
> # Trying to activate TCRYPT device coreswp using cipher aes-xts-plain64.
> # DM-UUID is CRYPT-TCRYPT-coreswp
> # Udev cookie 0xd4dfe53 (semid 65598) created
> # Udev cookie 0xd4dfe53 (semid 65598) incremented to 1
> # Udev cookie 0xd4dfe53 (semid 65598) incremented to 2
> # Udev cookie 0xd4dfe53 (semid 65598) assigned to CREATE task(0) with flags DISABLE_LIBRARY_FALLBACK         (0x20)
> # dm create coreswp CRYPT-TCRYPT-coreswp [ opencount flush ]   [16384] (*1)
> # dm reload   (254:0) [ opencount flush securedata ]   [16384] (*1)
> device-mapper: reload ioctl on coreswp (254:0) failed: No such file or directory
> # Udev cookie 0xd4dfe53 (semid 65598) decremented to 1
> # Udev cookie 0xd4dfe53 (semid 65598) incremented to 2
> # Udev cookie 0xd4dfe53 (semid 65598) assigned to REMOVE task(2) with flags DISABLE_LIBRARY_FALLBACK       (0x20)
> # dm remove coreswp  [ opencount flush securedata ]   [16384] (*1)
> # Uevent not generated! Calling udev_complete internally to avoid process lock-up.
> # Udev cookie 0xd4dfe53 (semid 65598) decremented to 1
> # DM create task failed, dm_task errno: 0.
> # dm versions   [ opencount flush ]   [16384] (*1)
> # dm status coreswp  [ opencount noflush ]   [16384] (*1)
> # Device status returned -19.
> # Data device /mnt/disk1/core.swp is OK.
> # No referenced device missing, some device in use.
> # Udev cookie 0xd4dfe53 (semid 65598) decremented to 0
> # Udev cookie 0xd4dfe53 (semid 65598) waiting for zero
> # Udev cookie 0xd4dfe53 (semid 65598) destroyed
> # Releasing crypt device /mnt/disk1/core.swp context.
> # Releasing device-mapper backend.
> # Closing read only fd for /mnt/disk1/core.swp.
> # Closed loop /dev/loop0 (/mnt/disk1/core.swp).
> Command failed with code -5 (device already exists or device is busy).
> 
> ----end----
> 

