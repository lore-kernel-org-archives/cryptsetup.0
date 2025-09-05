Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACAD27A46F
	for <cryptsetup@lists.linux.dev>; Fri,  5 Sep 2025 20:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757103237; cv=none; b=GeBzymqjYp0MXdnr6YiNJxuX5iOcZ8bwzifhnN+e5AefNsRExwYraYXK9ShoNZVqUML5I0iQEwJDmfmnkvsKMH3RfmoGzvD9JJ69hRM1ULTZEoUNafSqpvYcvtdUzuh3GTpodgdEz+u+f7urp4Cju4T2W2IzYvfLX9Q/LN9KcyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757103237; c=relaxed/simple;
	bh=owi9zk7xk0z43eVieI9hAI/hDgBJk3d+WwoAaBX3IWo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UQCTh3dzPXqEAHBopODOe5//2/ViDg9fCfOh+5olJW/PvLtpumaSazvIXICWWigUGrjxDkeBOlNGFNJmCnnlor7bNTTPXLkEjKP7pvzN42/ZLAL63vgFL5uyqvLGR/zGJ7fgl8HpHuDggSroZl0YyZjoQqgfpXxo/q/OrDr6pVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgDdC1jx; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgDdC1jx"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6032c696bd6so155201d50.1
        for <cryptsetup@lists.linux.dev>; Fri, 05 Sep 2025 13:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757103235; x=1757708035; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9vqVUVK+aCj1BZxeA4BCT/IbShZ/DaPtmdqLaJjnG8g=;
        b=hgDdC1jxHSWhfQpzH1eKxT4cf9WlC1mF/chGc+LgZuX8DwhONwJeyZPbRELTn8B6tu
         zyfpd3HK2ZyIlavgnHkcjUBseLyXyk27X8VwC4DITCxpmbqyhZe+PwQg7dtnFp1G8Y1h
         13M9UMyT5V2d5HDCvZrtRcEHrNY/srqAhfX3ZeYrOAUHRit4vyspxLiYY1vHGAr0blrq
         5/ZXFKgcL24TaiamtRYBYXsCK6zVWVHyPRmVsnYL0Zvkip3qoHfQLmf5VJVah+PMVieI
         ZLjfPfsswbKP5MMZoEAUeiYlXQLJOwf8HhCezqnx0SMSi6l2nlcc/u8LHguH+fB1oIiG
         Do9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757103235; x=1757708035;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9vqVUVK+aCj1BZxeA4BCT/IbShZ/DaPtmdqLaJjnG8g=;
        b=LazVSXESb77MaZwC2tAs2pOPmB3goKhxBqNUvTZ1oViVSqvBFrBe1w8k0u45uj1lFX
         Olh8h/ALSDqpLOoifHuaC141z9yzZ+fN/FFxxojLVYc77EbdULLoWejOPybRwJ+IcQPM
         M4bFVUM6D/euLbHKR9/2CTZFg0m/FaufZy4TFA38WSYbpJ1s2KJBqWZVXPy4+KI9WfC2
         ovmGnWbsOZDU5ecE5JSeix3hANAkrxwcNFxio2dGknc0GoRad5lk4pu9iE1zYLOByHKl
         jIGxTMdakN3h1FWb9DJ4bsNMk9e6yR8f0QjHOhiYRed0ZvGA3m4xGfMW+4Y18LEBumam
         Rl/A==
X-Gm-Message-State: AOJu0YxGNKKiEbdB+XJ6A4YVNnU1do/eLcGi4QWgVa1aXuSQ8DQdnXrZ
	KlCf9ojBKxJsVhHpBfwYMBUcB5TJxKQIY3X8Z9j4/41wYyG7I+zBOjlvs/cdzDsqeAFF/Fzz12K
	cclr1IFijMdXyfGypj4wbOCJXR6TLc/Et2R/D
X-Gm-Gg: ASbGncsyXM3Vu91q2EWYgUBYwaeU0BrximwhdA9gnfy73wnQLz2QhgczHpSCDCd/bkm
	Zc61uDYOGTyxJ2S7+lK4bHT9jqThaUt+PqI1F0twirSw+hzW/h++bOgq99iTnSkABZlF2aLLgx8
	qCqzRxdnnzFTL9UXvChQlQwllpShBhekOYFoCmjl3CpymmhIVBIeIGy2RYQaLU2MvgIwsxqekP2
	UHZfh/srqbx/wzd8BG6bLTDqNOSXL7X97mgSfEGKPFqh/sNY417
X-Google-Smtp-Source: AGHT+IFG/hPRJnklFW2F6eCRCehactvMCyW5eT6wQbLDHaaAzFnB7alPPTF5u/aW5oFpXWtKNXNYOmRd7fFV70RfZ6k=
X-Received: by 2002:a05:690e:2506:20b0:5fc:2821:3956 with SMTP id
 956f58d0204a3-61036122653mr194196d50.37.1757103234959; Fri, 05 Sep 2025
 13:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mattwood2000@gmail.com
Date: Fri, 5 Sep 2025 16:13:44 -0400
X-Gm-Features: Ac12FXxwqK_GJA8pfoODBrqFp6eSIx9shw7y30qqxqp-dCgjtNZwHMhTThTPh3I
Message-ID: <CADjezmZ3BCvsOimijKjjkAsw5KRDtC1gFNpJi5PX4qGU-tkU7Q@mail.gmail.com>
Subject: luksOpen with pkcs11 token error: The field is sensitive and cannot
 be revealed
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm working with a secure element and trying to unlock a luks2 partition.

I have successfully enrolled the device with a pkcs11 URI, but when I
attempt to unlock the partition I get:

Failed to get attributes of a found private key: The field is
sensitive and cannot be revealed

Digging into this a bit it seems that the the private key slot is
marked as CKR_ATTRIBUTE_SENSITIVE, which to me makes sense.

I'm confused why this error is happening because it's my understanding
that the purpose of the secure element is to keep the private key safe
and perform the cryptographic operations within the device.  I would
not expect the private key to be returned.

The device is a Microchip ECC608.

Any advice would be appreciated.  Full log below.

Thanks, Matt

cryptsetup luksOpen /dev/mmcblk0p4 test --token-id 0 --token-only --debug
# cryptsetup 2.7.2 processing "cryptsetup luksOpen /dev/mmcblk0p4 test
--token-id 0 --token-only --debug"
# Verifying parameters for command open.
# Running command open.
# Installing SIGINT/SIGTERM handler.
# Unblocking interruption on signal.
# Allocating context for crypt device /dev/mmcblk0p4.
# Trying to open and read device /dev/mmcblk0p4 with direct-io.
# Initialising device-mapper backend library.
# Trying to load any crypt type from device /dev/mmcblk0p4.
# Crypto backend (OpenSSL 3.2.4 11 Feb 2025
[default][legacy][threads][argon2]) initialized in cryptsetup library
version 2.7.2.
# Detected kernel Linux 6.12.22-linux4microchip-2025.04 armv7l.
# Loading LUKS2 header (repair disabled).
# Acquiring read lock for device /dev/mmcblk0p4.
# Opening lock resource file /run/cryptsetup/L_179:4
# Verifying lock handle for /dev/mmcblk0p4.
# Device /dev/mmcblk0p4 READ lock taken.
# Trying to read primary LUKS2 header at offset 0x0.
# Opening locked device /dev/mmcblk0p4
# Verifying locked device handle (bdev)
# LUKS2 header version 2 of size 16384 bytes, checksum sha256.
# Checksum:56ae1c95c37b2df138652ed1c587ce1aa1ee5f38baf80609e04329a3e70cbe5d
(on-disk)
# Checksum:56ae1c95c37b2df138652ed1c587ce1aa1ee5f38baf80609e04329a3e70cbe5d
(in-memory)
# Trying to read secondary LUKS2 header at offset 0x4000.
# Reusing open ro fd on device /dev/mmcblk0p4
# LUKS2 header version 2 of size 16384 bytes, checksum sha256.
# Checksum:5f527aa9c9c9f2343bbd38d27f80d065399b5523d8676987aa0003d0e3b67dec
(on-disk)
# Checksum:5f527aa9c9c9f2343bbd38d27f80d065399b5523d8676987aa0003d0e3b67dec
(in-memory)
# Device size 134217728, offset 16777216.
# Device /dev/mmcblk0p4 READ lock released.
# Only 1 active CPUs detected, PBKDF threads decreased from 4 to 1.
# Not enough physical memory detected, PBKDF max memory decreased from
1048576kB to 76828kB.
# PBKDF argon2i, time_ms 2000 (iterations 0), max_memory_kb 76828,
parallel_threads 1.
# Activating volume test [keyslot -1] using token.
# dm version   [ opencount flush ]   [16384] (*1)
# dm versions   [ opencount flush ]   [16384] (*1)
# Detected dm-ioctl version 4.48.0.
# Detected dm-verity version 1.10.0.
# Detected dm-crypt version 1.28.0.
# Device-mapper backend running with UDEV support enabled.
# dm status test  [ opencount noflush ]   [16384] (*1)
# Trying to load /usr/lib/cryptsetup/libcryptsetup-token-systemd-pkcs11.so.
# Loading symbol cryptsetup_token_open@CRYPTSETUP_TOKEN_1.0.
# Loading symbol cryptsetup_token_buffer_free@CRYPTSETUP_TOKEN_1.0.
# Loading symbol cryptsetup_token_validate@CRYPTSETUP_TOKEN_1.0.
# Loading symbol cryptsetup_token_dump@CRYPTSETUP_TOKEN_1.0.
# Loading symbol cryptsetup_token_open_pin@CRYPTSETUP_TOKEN_1.0.
# Loading symbol cryptsetup_token_version@CRYPTSETUP_TOKEN_1.0.
# Token handler systemd-pkcs11-1.0 systemd-v256.5 (256.5) loaded successfully.
# Requesting JSON for token 0.
No login into security token 'MCHP' required.
Failed to get attributes of a found private key: The field is
sensitive and cannot be revealed
# Token 0 (systemd-pkcs11) open failed with -5.
# Releasing crypt device /dev/mmcblk0p4 context.
# Releasing device-mapper backend.
# Closing read only fd for /dev/mmcblk0p4.
Command failed with code -1 (wrong or missing parameters).
# Unloading systemd-pkcs11 token handler.
