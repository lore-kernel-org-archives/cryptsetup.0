Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778103EA65
	for <cryptsetup@lists.linux.dev>; Wed, 15 Nov 2023 15:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lukav.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lukav.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lukav.com header.i=@lukav.com header.b="TNBC4hLR"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-41cc75c55f0so8457481cf.1
        for <cryptsetup@lists.linux.dev>; Wed, 15 Nov 2023 07:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lukav.com; s=google2; t=1700062455; x=1700667255; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :from:references:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=na38roiAh546d5xmiOLVtL4nzbgVCPKP6WEsN2aRRnY=;
        b=TNBC4hLRRyi2gyLKlsLZ5cHbHoD2O6zPKldf3Iepnq30Z87nizHOstossBX7WQcKzH
         Zo1q+NvPw+eGC81CCtlNORVisQ/xFow/VNGTQfMPHPFLvt1Zw7VEEkMCk7ViBpWF961p
         UUCeopQv8Q5T8C0TVRZP7GvhWicdP9vYQHHH57/gmZr0oWaFQYDkMYz3t+4n8c5a8xCj
         94LZbKs1wsxs4fZrcmWRJr+bVtk78+AriU8ZydxxGCAObjFwdTKn6guRTU/7S9z1OUqb
         cNixJ4EcMQGwkXSgJRDY38mNICEDeRvzb7xp2WyM9YCJAOEA1g172cEbU6kPLOb6gG+W
         BM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700062455; x=1700667255;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :from:references:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=na38roiAh546d5xmiOLVtL4nzbgVCPKP6WEsN2aRRnY=;
        b=kDKTU2PorjHkBY9bNefPsbrf4DyvxISo1r/a73BrzwMFFmKBijIchapFpEeNaEylsj
         6tQVgwFEaPHYmzi3TU/kDBFoAqYj7T/aI98wc6xLx2ZrhY89GDgzjU9UPPotxGLu7Qmj
         i5p3nSealcTB8YfUjNjS+afOom/GfreY2qTPRcAPDiXliexLqEMRDaabbvdzNCXvks5d
         Dph2vVhwQ0p6p4W3kYZNWg7iAGRdXW8+n0deZAycLq2e4Bvsvc5yj4Vl0RjIcnhnIcWE
         CJB8nIZSNK+BekvYkODW6AI3BwAdwduMWuA3FhW8iMk+4hqe4muVV5AqKRnkRJyeZ3ei
         +RuA==
X-Gm-Message-State: AOJu0YzOgd7XBX8DOqR90ScT3X4kc39sJ32F6atnFUg2KGk1C7TtqpEh
	wBt4tB/jSnlKyLTG42aN07mtlSYBAEzjWATtSmHafg==
X-Google-Smtp-Source: AGHT+IFaQN+LU8OzUXtgtLvM3EU3ZANQjk49fmGLkdyQayL9iI88PrVMj5/xhxAbdijS/tpe/59Ugg==
X-Received: by 2002:a05:622a:190b:b0:408:392e:2aa5 with SMTP id w11-20020a05622a190b00b00408392e2aa5mr10061983qtc.20.1700062455097;
        Wed, 15 Nov 2023 07:34:15 -0800 (PST)
Received: from ?IPV6:2607:fea8:1bc3:fe00::a7d6? ([2607:fea8:1bc3:fe00::a7d6])
        by smtp.googlemail.com with ESMTPSA id h17-20020ac85491000000b00419ab6ffedasm3633186qtq.29.2023.11.15.07.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 07:34:14 -0800 (PST)
Message-ID: <445d7af3-40b6-453d-b1c1-718f222407e6@lukav.com>
Date: Wed, 15 Nov 2023 10:34:13 -0500
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problem after converting to LUKS2
Content-Language: en-CA
To: Milan Broz <gmazyland@gmail.com>, cryptsetup@lists.linux.dev
References: <72f6c041-14d4-473e-bcba-7bf3b9fd47aa@lukav.com>
 <979f56ca-14f3-46fd-9935-6365223ab3b8@gmail.com>
From: Anton Avramov <lukav@lukav.com>
In-Reply-To: <979f56ca-14f3-46fd-9935-6365223ab3b8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023-11-15 10:04, Milan Broz wrote:
> On 11/15/23 15:47, Anton Avramov wrote:
>> Hi,
>>
>> I have 3 partitions encrypted years ago with LUKS1.
>> I've decided to migrate them to LUKS2 and the first 2 there was no
>> problem, but the last I can open it anymore after the conversion.
>>
>> I've been using key-files for all of them, so there is no wrong password
>> input issue.
>>
>> The bad think is I don't have a header backup before the conversion (Yes
>> I know! Lessen learned!)
>
> Users either do not read warnings or just ignore them... :-)
>
>> I've tried different things like converting back to luks1 and header
>> repair but to no avail.
>
> And you tried this without backup too, I guess...
>
> Which cryptsetup version was used for conversion?
cryptsetup 2.4.3
>
>> As a last resort I'm writing here for help. Is there anything I can try
>> to at least read the partition?
>
> Please post log from failing command (luksOpen?) with --debug option, 
> so we can see what
> is failing and what exact version (toolss, kernel) you are using.
Ubuntu 22.04.3 LTS

Linux  5.15.0-88-generic #98-Ubuntu SMP Mon Oct 2 15:18:56 UTC 2023 
x86_64 x86_64 x86_64 GNU/Linux

# cryptsetup 2.4.3 processing "cryptsetup luksOpen --key-file 
/root/.luks/.p2pool.keyfile /dev/sda1 CryptP2Pool --debug"
# Running command open.
# Locking memory.
# Installing SIGINT/SIGTERM handler.
# Unblocking interruption on signal.
# Allocating context for crypt device /dev/sda1.
# Trying to open and read device /dev/sda1 with direct-io.
# Initialising device-mapper backend library.
# Trying to load any crypt type from device /dev/sda1.
# Crypto backend (OpenSSL 3.0.2 15 Mar 2022 [default][legacy]) 
initialized in cryptsetup library version 2.4.3.
# Detected kernel Linux 5.15.0-88-generic x86_64.
# Loading LUKS2 header (repair disabled).
# Acquiring read lock for device /dev/sda1.
# Opening lock resource file /run/cryptsetup/L_8:1
# Verifying lock handle for /dev/sda1.
# Device /dev/sda1 READ lock taken.
# Trying to read primary LUKS2 header at offset 0x0.
# Opening locked device /dev/sda1
# Verifying locked device handle (bdev)
# LUKS2 header version 2 of size 16384 bytes, checksum sha256.
# 
Checksum:7f72b2a6318880d0a698c23f7e04202139ea7c1c165633778507a58ff600af13 
(on-disk)
# 
Checksum:7f72b2a6318880d0a698c23f7e04202139ea7c1c165633778507a58ff600af13 
(in-memory)
# Trying to read secondary LUKS2 header at offset 0x4000.
# Reusing open ro fd on device /dev/sda1
# LUKS2 header version 2 of size 16384 bytes, checksum sha256.
# 
Checksum:b51c668d3b315ec1b1413023f8e0434171712520f3d8e7cf61c6a70bd6a8e5e4 
(on-disk)
# 
Checksum:b51c668d3b315ec1b1413023f8e0434171712520f3d8e7cf61c6a70bd6a8e5e4 
(in-memory)
# Device size 256059113472, offset 2097152.
# Device /dev/sda1 READ lock released.
# PBKDF argon2id, time_ms 2000 (iterations 0), max_memory_kb 1048576, 
parallel_threads 4.
# Activating volume CryptP2Pool using token (any type) -1.
# dm version   [ opencount flush ]   [16384] (*1)
# dm versions   [ opencount flush ]   [16384] (*1)
# Detected dm-ioctl version 4.45.0.
# Detected dm-crypt version 1.23.0.
# Device-mapper backend running with UDEV support enabled.
# dm status CryptP2Pool  [ opencount noflush ]   [16384] (*1)
No usable token is available.
# File descriptor passphrase entry requested.
# Activating volume CryptP2Pool [keyslot -1] using passphrase.
# dm versions   [ opencount flush ]   [16384] (*1)
# dm status CryptP2Pool  [ opencount noflush ]   [16384] (*1)
# Keyslot 0 priority 1 != 2 (required), skipped.
# Keyslot 1 priority 1 != 2 (required), skipped.
# Trying to open LUKS2 keyslot 0.
# Running keyslot key derivation.
# Reading keyslot area [0x8000].
# Acquiring read lock for device /dev/sda1.
# Opening lock resource file /run/cryptsetup/L_8:1
# Verifying lock handle for /dev/sda1.
# Device /dev/sda1 READ lock taken.
# Reusing open ro fd on device /dev/sda1
# Device /dev/sda1 READ lock released.
# Verifying key from keyslot 0, digest 0.
# Digest 0 (pbkdf2) verify failed with -1.
# Trying to open LUKS2 keyslot 1.
# Running keyslot key derivation.
# Reading keyslot area [0x28000].
# Acquiring read lock for device /dev/sda1.
# Opening lock resource file /run/cryptsetup/L_8:1
# Verifying lock handle for /dev/sda1.
# Device /dev/sda1 READ lock taken.
# Reusing open ro fd on device /dev/sda1
# Device /dev/sda1 READ lock released.
# Verifying key from keyslot 1, digest 0.
# Digest 0 (pbkdf2) verify failed with -1.
No key available with this passphrase.
# Releasing crypt device /dev/sda1 context.
# Releasing device-mapper backend.
# Closing read only fd for /dev/sda1.
# Unlocking memory.
Command failed with code -2 (no permission or bad passphrase).

>
> It can be trivial issue, but also something that cannot be recovered - 
> without
> logs nobody can say what's the problem.
>
> If some devices were converted correctly - what is the difference from 
> the failing one?
I did the first with a live ubuntu usb drive since 1 was the root.

The failed one I did after booting and dismounting and closing it.

Another difference is the others are mdadm raids where this one doesn't 
have raid.

>
> Milan
Thank you for your time and effort
