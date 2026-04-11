Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D129311958
	for <cryptsetup@lists.linux.dev>; Sat, 11 Apr 2026 18:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775933422; cv=pass; b=d7XsFXxDgjDspS21dVG3O2oLEZyYbX+RHYHG0Uay0A2M6rudr6Ts2DgiS6UGkYlD3rGh2qFyoLRsnpupwEmtG51kpOAmkFIrRl/gcg0VtephPzLOJ8NBZPD4KRIvjMJTRtAe6GGo5tH6faLXr50jJ8SjdearZ0QK0ddrsMEpFpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775933422; c=relaxed/simple;
	bh=7UjsARhh9fH5sCEk8GKoXMzd8jV+ewZeWPqvxanaFq0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=H9AGB+ddVI5Yyu31Z+hpdZM8wzqPzRCdNF9L5z37retZVPXWrWBTMpCS2m7YM/yjFP8fMFCc9DQro5a3URmbDeEDiABAyVIl2OXI/UEBHFZxmiyOONjm3w3PfREQWpIiPRm7odVgYw6Y1WZN2mHSObPUx/clJkJ1ZdLwRT+iCOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ha8lNbC1; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ha8lNbC1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b258576d8cso18288615ad.0
        for <cryptsetup@lists.linux.dev>; Sat, 11 Apr 2026 11:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775933420; cv=none;
        d=google.com; s=arc-20240605;
        b=J+EOCXE0VM09TUg23OkMD9mx5lJOVwYG0QfOJG+Mg0qQR0FP8fkfkf7qCCEQRVIeLf
         9Sq5Q7ryvt0YtNDKVFmwnbLmB1BTcROYf8hZ2DuXAI4lqn0fNaQV/oaM4RNgYDFX41Ih
         RWTkMxe44tzYkJQL+5oKKG3UxA1aYQuHxAfhjw8KSirN6iJNAbF96ev93QKihKN9oUUn
         7XIMzPRrTeHt2lLL6Odxd25VTFT0riEV/KrTwuevY7+mjpW/nuQrl0ot75QSWH+U0Hv/
         J2Bwo/pZN3V3PIfFyYzYDg7QkbbjG4ap/V4L7ckKrprTrtDh6OYOnh8eR8x5qcKZiq7E
         NGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=fxt+mA6JzWVlMcdUlvPkNQNOiz1zmeImdef9859yUTU=;
        fh=utADXtLkPiKS2hXB71aeoagFkVnFKmPav6Pf9j2RSNc=;
        b=XKH4yVNQOhV2l0m29bNxq6F3dTxrJXorLwv0XWHSnSzR48WvbjYqJu6ll9rmHO1NUi
         NsuHGY+mtDHsC4rQtiCwMCqLYezrcEdxzX5bFfR8mJkW0PjP9yCv5DwWyR2eOqvyNntz
         EuI9goYaaE+Dv7Pgl/A9ZD4ktjZHCZEjB79pPZyrdGxkoZ5idsGuhlxUDVcSibmvrgET
         P+F67UCD6c3yrqm/Rdv9EFQpZnvryvvTTYdcrfzRZRUjNJjFu3o2LcjgZg/wmYf1UK8D
         Iu4dyeiADNYTI3qw4WGsrGhGP6UCfXvgg5TrGjArQLPdBt8PHxNU0OwsotGCstAq9mNL
         cncQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775933420; x=1776538220; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fxt+mA6JzWVlMcdUlvPkNQNOiz1zmeImdef9859yUTU=;
        b=ha8lNbC1kh+YhwnEYJ8zsJNw4Hlr2Kr8IqCdqZMOdpUUCdD3Y4ESRwJsGWQVG09n4f
         SCVdQtwMFkZ83TAT0llze/UXatDCZ+Q4uq/f7pFSkwEi0GdovteP2F4RTU37oqNbXSf0
         j0EcFd62riNMKWjoWLOGCsLHW57jGjw/zjUkZqvT1VcK9Am8d5xRGdPcSizECXr9LLQp
         wEf+pcAF1eL+an3C62FZdz+5wKy81DGSgUTVR6RlkH931jEUmdKhk4A6M4N8090X8C+s
         EFAzW1jff5QIOmIGOqOBCVJPeEVVRsM9q16xLUpXTHIvOTUMNQw/+nLVvKYBNZeeeZIN
         KR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775933420; x=1776538220;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxt+mA6JzWVlMcdUlvPkNQNOiz1zmeImdef9859yUTU=;
        b=SeR3Eqdqa9+Fl6/3fOoU64qGgTPy18NTsoBcZw2K9nGkc8iirCkq4gLWIVyn8Hb0wn
         VNbDUkQPefFvbwPbp/uxjXU5ycZfYSK07PzqeQHj0KYcMePwfxPRIbETtdCnoGmgEOe+
         jIbiC0037UEM1QP5hlysnHw+8irITR7xiFultBTAjtKS+emzOUg2oub55oKfa2OEqTj0
         8oOlzNTYVjFxIa64Ph5Vw8UyeOroxHkoJJLH2G2P0RcNmDOEpZAoqsJwZFyuut3GPBiG
         8vp5PlyjUlPMhVqZPbw16ZI+lZPVHhtF5FrwgYm/E0Zny/adjY+GFvrau7FT5P09Ggva
         ykTA==
X-Gm-Message-State: AOJu0YyyEdO9ifWKyQv4PN4FHokfQK7QOQA2kqXh38AvgXW4G0p7+lJv
	Q/qkaByxaqi0+rHuzeAVHsoiuNo9ibE2ICd0dZBFypzkp+2pijByl4ZJhRbe0312KWXOUbwOI+4
	PHrPopHVZTbgf1W3i25Ui9oAUG2ia8BLfOnPT
X-Gm-Gg: AeBDiesPvJz3/ukVUr2SpW6FMbPJNiv50GgmWPDuxXjTy38nc3OOKHAFvFgeEYfbWpZ
	G+qg9No1YdWOYXNWlvuh7n08HpyFk9e3+IeHZHJ5QCYqIaax5iS04SjhRh+sWPWzC8qFV8XNgB+
	4A/dP4y8HaPo22z34EokyJRY3oH1pShdSdo76W8Gkxyc5Fm20R7dxU0413OgZ8MX+RJBA/UsVQc
	mqxC24jVWl6+SKEEpKoAoaLoqshovFJVkHapyjggjBlJX5sW+b/SD0zCzj+mFxEuBXxvWR76ryc
	R2DR3PWJSgzfrRxbGLcv9pccqt3BKuYmH8hoJ+WdKw==
X-Received: by 2002:a17:903:2492:b0:2b2:45b7:307f with SMTP id
 d9443c01a7336-2b2d59434admr57119125ad.9.1775933420358; Sat, 11 Apr 2026
 11:50:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: j4ck32 <j4ck32@gmail.com>
Date: Sat, 11 Apr 2026 20:50:07 +0200
X-Gm-Features: AQROBzD6PP2wVLYFXxIJj3Vb7HbFttg6kGcInIJ25G5lZ8B0gPh8u52WPmEq-kg
Message-ID: <CA+vw=V+c4SP+dPwY6oYk=V+QQS=797XuqSRan8N5vSSFwvN8aw@mail.gmail.com>
Subject: Unable to use a keyfile
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I have a strange problem with my LUKS setup.

I can successfully add a keyfile to my LUKS container, but when I try
to open the container with it the keyfile is rejected.
I made many attempts with different iterations, but the result is
always the same.

short version:
livecd /mnt # dd if=/dev/urandom of=/root/key_new bs=64 count=1
1+0 records in
1+0 records out
64 bytes copied, 6.3416e-05 s, 1.0 MB/s

livecd /mnt # cryptsetup luksAddKey /dev/md126 /root/key_new
Enter any existing passphrase:

livecd /mnt # cryptsetup luksOpen /dev/md126 temp --key-file /root/key_new
No key available with this passphrase.

background:
I have two raid 1s "root" and "files". root gets decrypted on boot and
contains a key to files.
root had filesystem errors and the files container would no longer
open with the keyfile.
I fixed the root file system and tried to unlock the file container
with the existing key_file.
Sometimes the existing keyfile would work, sometimes it would work
when the container was first unlocked
with the passphrase and closed. Now the existing key_file refuses to
work at all. passphrase always works.

Then I switched strategies and wanted to add a new key_file like
above. I am long on a live system booted from usb,
so the issues from the original root should not contribute.

The raids are healthy, smartdata is good, and the filesystem is checked.

long version:
livecd /mnt # cryptsetup luksDump /dev/md126
LUKS header information
Version:        2
Epoch:          12
Metadata area:  16384 [bytes]
Keyslots area:  16744448 [bytes]
UUID:           d37b8c3e-7e51-417d-a3f4-41dd6d981966
Label:          (no label)
Subsystem:      (no subsystem)
Flags:          (no flags)

Data segments:
  0: crypt
        offset: 16777216 [bytes]
        length: (whole device)
        cipher: aes-xts-plain64
        sector: 512 [bytes]

Keyslots:
  0: luks2
        Key:        512 bits
        Priority:   normal
        Cipher:     aes-xts-plain64
        Cipher key: 512 bits
        PBKDF:      argon2i
        Time cost:  4
        Memory:     184084
        Threads:    4
        Salt:       ...
        AF stripes: 4000
        AF hash:    sha256
        Area offset:32768 [bytes]
        Area length:258048 [bytes]
        Digest ID:  0
  1: luks2
        Key:        512 bits
        Priority:   normal
        Cipher:     aes-xts-plain64
        Cipher key: 512 bits
        PBKDF:      argon2id
        Time cost:  4
        Memory:     1048576
        Threads:    4
        Salt:       ...
        AF stripes: 4000
        AF hash:    sha256
        Area offset:290816 [bytes]
        Area length:258048 [bytes]
        Digest ID:  0
Tokens:
Digests:
  0: pbkdf2
        Hash:       sha256
        Iterations: 19140
        Salt:       ...
        Digest:     ...

livecd /mnt # dd if=/dev/urandom of=/root/key_new bs=64 count=1
1+0 records in
1+0 records out
64 bytes copied, 7.8571e-05 s, 815 kB/s

livecd /mnt # cryptsetup -v --debug luksAddKey /dev/md126 /root/key_new
# cryptsetup 2.7.5 processing "cryptsetup -v --debug luksAddKey
/dev/md126 /root/key_new"
# Verifying parameters for command luksAddKey.
# Running command luksAddKey.
# Installing SIGINT/SIGTERM handler.
# Unblocking interruption on signal.
# Allocating context for crypt device /dev/md126.
# Trying to open and read device /dev/md126 with direct-io.
# Direct-io is supported and works.
# Initialising device-mapper backend library.
# Trying to load any crypt type from device /dev/md126.
# Crypto backend (OpenSSL 3.3.2 3 Sep 2024
[default][legacy][threads][argon2]) initialized in cryptsetup library
version 2.7.5.
# Detected kernel Linux 6.6.74 x86_64.
# Loading LUKS2 header (repair disabled).
# Acquiring read lock for device /dev/md126.
# Opening lock resource file /run/cryptsetup/L_9:126
# Verifying lock handle for /dev/md126.
# Device /dev/md126 READ lock taken.
# Trying to read primary LUKS2 header at offset 0x0.
# Opening locked device /dev/md126
# Verifying locked device handle (bdev)
# LUKS2 header version 2 of size 16384 bytes, checksum sha256.
# Checksum:de769906d3be7ed904ba290989bc621e2d9b4b069442a503204d9f39abca5361
(on-disk)
# Checksum:de769906d3be7ed904ba290989bc621e2d9b4b069442a503204d9f39abca5361
(in-memory)
# Trying to read secondary LUKS2 header at offset 0x4000.
# Reusing open ro fd on device /dev/md126
# LUKS2 header version 2 of size 16384 bytes, checksum sha256.
# Checksum:b87ffc10e5dab50c5e956c7f9d7e3591902c2e50dc0fe3fbc6f8087ad5bb08f4
(on-disk)
# Checksum:b87ffc10e5dab50c5e956c7f9d7e3591902c2e50dc0fe3fbc6f8087ad5bb08f4
(in-memory)
# Device size 7942915293184, offset 16777216.
# Device /dev/md126 READ lock released.
# PBKDF argon2id, time_ms 2000 (iterations 0), max_memory_kb 1048576,
parallel_threads 4.
# PBKDF argon2id, time_ms 2000 (iterations 0), max_memory_kb 1048576,
parallel_threads 4.
# Interactive passphrase entry requested.
Enter any existing passphrase:
# Checking volume passphrase [keyslot -1] using passphrase.
# Keyslot 0 priority 1 != 2 (required), skipped.
# Keyslot 1 priority 1 != 2 (required), skipped.
# Trying to open LUKS2 keyslot 0.
# Running keyslot key derivation.
# Reading keyslot area [0x8000].
# Acquiring read lock for device /dev/md126.
# Opening lock resource file /run/cryptsetup/L_9:126
# Verifying lock handle for /dev/md126.
# Device /dev/md126 READ lock taken.
# Reusing open ro fd on device /dev/md126
# Device /dev/md126 READ lock released.
# Verifying key from keyslot 0, digest 0.
# dm version   [ opencount flush ]   [16384] (*1)
# dm versions   [ opencount flush ]   [16384] (*1)
# Detected dm-ioctl version 4.48.0.
# Detected dm-crypt version 1.24.0.
# Detected dm-zero version 1.2.0.
# Device-mapper backend running with UDEV support enabled.
Key slot 0 unlocked.
# Adding new keyslot -1 by keyfile, volume key provided by passphrase (-1).
# Selected keyslot 2.
# Keyslot 0 priority 1 != 2 (required), skipped.
# Keyslot 1 priority 1 != 2 (required), skipped.
# Trying to open LUKS2 keyslot 0.
# Running keyslot key derivation.
# Reading keyslot area [0x8000].
# Acquiring read lock for device /dev/md126.
# Opening lock resource file /run/cryptsetup/L_9:126
# Verifying lock handle for /dev/md126.
# Device /dev/md126 READ lock taken.
# Reusing open ro fd on device /dev/md126
# Device /dev/md126 READ lock released.
# Verifying key from keyslot 0, digest 0.
# Keyslot 2 assigned to digest 0.
# Trying to allocate LUKS2 keyslot 2.
# Found area 548864 -> 806912
# Running argon2id() benchmark.
# PBKDF benchmark: memory cost = 65536, iterations = 4, threads = 4
(took 163 ms)
# PBKDF benchmark: memory cost = 100515, iterations = 4, threads = 4
(took 243 ms)
# PBKDF benchmark: memory cost = 103410, iterations = 4, threads = 4
(took 220 ms)
# PBKDF benchmark: memory cost = 117511, iterations = 4, threads = 4
(took 316 ms)
# PBKDF benchmark: memory cost = 743740, iterations = 4, threads = 4
(took 1341 ms)
# Benchmark returns argon2id() 4 iterations, 1048576 memory, 4 threads
(for 512-bits key).
# Calculating attributes for LUKS2 keyslot 2.
# Acquiring write lock for device /dev/md126.
# Opening lock resource file /run/cryptsetup/L_9:126
# Verifying lock handle for /dev/md126.
# Device /dev/md126 WRITE lock taken.
# Checking context sequence id matches value stored on disk.
# Reusing open ro fd on device /dev/md126
# Running keyslot key derivation.
# Updating keyslot area [0x86000].
# Opening locked device /dev/md126
# Verifying locked device handle (bdev)
# Device size 7942915293184, offset 16777216.
# Device /dev/md126 WRITE lock already held.
# Trying to write LUKS2 header (16384 bytes) at offset 0.
# Reusing open rw fd on device /dev/md126
# Checksum:121cca8db7794c007ade712398606772bbbab9b964a1a4f2cbcba4a66dd5d6ae
(in-memory)
# Trying to write LUKS2 header (16384 bytes) at offset 16384.
# Reusing open rw fd on device /dev/md126
# Checksum:21274d07ebb492fb4d1e5b6ae3fddb82bff764572d1f9e3795bfa9352801a712
(in-memory)
# Device /dev/md126 WRITE lock released.
Key slot 2 created.
# Releasing crypt device /dev/md126 context.
# Releasing device-mapper backend.
# Closing read only fd for /dev/md126.
# Closing read write fd for /dev/md126.
Command successful.

livecd /mnt # cryptsetup -v --debug luksOpen /dev/md126 files
--key-file /root/key_new
# cryptsetup 2.7.5 processing "cryptsetup -v --debug luksOpen
/dev/md126 files --key-file /root/key_new"
# Verifying parameters for command open.
# Running command open.
# Installing SIGINT/SIGTERM handler.
# Unblocking interruption on signal.
# Allocating context for crypt device /dev/md126.
# Trying to open and read device /dev/md126 with direct-io.
# Direct-io is supported and works.
# Initialising device-mapper backend library.
# Trying to load any crypt type from device /dev/md126.
# Crypto backend (OpenSSL 3.3.2 3 Sep 2024
[default][legacy][threads][argon2]) initialized in cryptsetup library
version 2.7.5.
# Detected kernel Linux 6.6.74 x86_64.
# Loading LUKS2 header (repair disabled).
# Acquiring read lock for device /dev/md126.
# Opening lock resource file /run/cryptsetup/L_9:126
# Verifying lock handle for /dev/md126.
# Device /dev/md126 READ lock taken.
# Trying to read primary LUKS2 header at offset 0x0.
# Opening locked device /dev/md126
# Verifying locked device handle (bdev)
# LUKS2 header version 2 of size 16384 bytes, checksum sha256.
# Checksum:121cca8db7794c007ade712398606772bbbab9b964a1a4f2cbcba4a66dd5d6ae
(on-disk)
# Checksum:121cca8db7794c007ade712398606772bbbab9b964a1a4f2cbcba4a66dd5d6ae
(in-memory)
# Trying to read secondary LUKS2 header at offset 0x4000.
# Reusing open ro fd on device /dev/md126
# LUKS2 header version 2 of size 16384 bytes, checksum sha256.
# Checksum:21274d07ebb492fb4d1e5b6ae3fddb82bff764572d1f9e3795bfa9352801a712
(on-disk)
# Checksum:21274d07ebb492fb4d1e5b6ae3fddb82bff764572d1f9e3795bfa9352801a712
(in-memory)
# Device size 7942915293184, offset 16777216.
# Device /dev/md126 READ lock released.
# PBKDF argon2id, time_ms 2000 (iterations 0), max_memory_kb 1048576,
parallel_threads 4.
# Activating volume files [keyslot -1] using token.
# dm version   [ opencount flush ]   [16384] (*1)
# dm versions   [ opencount flush ]   [16384] (*1)
# Detected dm-ioctl version 4.48.0.
# Detected dm-crypt version 1.24.0.
# Detected dm-zero version 1.2.0.
# Device-mapper backend running with UDEV support enabled.
# dm status files  [ opencount noflush ]   [16384] (*1)
No usable token is available.
# File descriptor passphrase entry requested.
# Activating volume files [keyslot -1] using passphrase.
# dm versions   [ opencount flush ]   [16384] (*1)
# dm status files  [ opencount noflush ]   [16384] (*1)
# Keyslot 0 priority 1 != 2 (required), skipped.
# Keyslot 1 priority 1 != 2 (required), skipped.
# Keyslot 2 priority 1 != 2 (required), skipped.
# Trying to open LUKS2 keyslot 0.
# Running keyslot key derivation.
# Reading keyslot area [0x8000].
# Acquiring read lock for device /dev/md126.
# Opening lock resource file /run/cryptsetup/L_9:126
# Verifying lock handle for /dev/md126.
# Device /dev/md126 READ lock taken.
# Reusing open ro fd on device /dev/md126
# Device /dev/md126 READ lock released.
# Verifying key from keyslot 0, digest 0.
# Digest 0 (pbkdf2) verify failed with -1.
# Trying to open LUKS2 keyslot 1.
# Running keyslot key derivation.
# Reading keyslot area [0x47000].
# Acquiring read lock for device /dev/md126.
# Opening lock resource file /run/cryptsetup/L_9:126
# Verifying lock handle for /dev/md126.
# Device /dev/md126 READ lock taken.
# Reusing open ro fd on device /dev/md126
# Device /dev/md126 READ lock released.
# Verifying key from keyslot 1, digest 0.
# Digest 0 (pbkdf2) verify failed with -1.
# Trying to open LUKS2 keyslot 2.
# Running keyslot key derivation.
# Reading keyslot area [0x86000].
# Acquiring read lock for device /dev/md126.
# Opening lock resource file /run/cryptsetup/L_9:126
# Verifying lock handle for /dev/md126.
# Device /dev/md126 READ lock taken.
# Reusing open ro fd on device /dev/md126
# Device /dev/md126 READ lock released.
# Verifying key from keyslot 2, digest 0.
# Digest 0 (pbkdf2) verify failed with -1.
No key available with this passphrase.
# Releasing crypt device /dev/md126 context.
# Releasing device-mapper backend.
# Closing read only fd for /dev/md126.
Command failed with code -2 (no permission or bad passphrase).

Any ideas?
