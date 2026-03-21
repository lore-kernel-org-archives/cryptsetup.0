Received: from mail-24426.protonmail.ch (mail-24426.protonmail.ch [109.224.244.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901E227FD44
	for <cryptsetup@lists.linux.dev>; Sat, 21 Mar 2026 08:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774080206; cv=none; b=j5AHd/JABSey0E8neBQGDHbvhcxV0bLv8APvDI12j3PNB219qkxCIpLS/KERMZGj+vi00Y+gLMRP/uOG+Jt1jvyD1Fgl6F2gTFg+gjudW5A2Iqzw7U3qh0nlEVB3ygAC5hgT+AlmCRKp+D2DPDIWukfyilwF6FF2nK4p7260HNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774080206; c=relaxed/simple;
	bh=qXtursXk7Xlz1SwyfKTdvqGmxcaQKOJn5NPFJMECTIk=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=nElNDuCZfY5Rn0o1vmYxteWKz9wSnrhxrttcCTnTaM66ar2MVeTT1Pc+ugx+t3PgLOlVbfyID2MVwIohGG2Reixg7DMLPky3wjrkJ1VGsAfPEO+Fp9S7K4HIWBNiRb9pjo8X8o2ImnF8cvMneDkm6H4rw6n0E2L9Y5qAFD2G6Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KnTobR1U; arc=none smtp.client-ip=109.224.244.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KnTobR1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=e7ctjkpl5nafjcwyxhgjsaym7y.protonmail; t=1774080198; x=1774339398;
	bh=qXtursXk7Xlz1SwyfKTdvqGmxcaQKOJn5NPFJMECTIk=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KnTobR1UNXaAdAJY/VxpFdqG6kzguq1NndLSo1M04o+Zf9j+b8wCABA2Vdw1/NPqI
	 ORTwIwKdwpmObVbQEez/6lHqcOgIS8lqgsBYh1ugnchK/hLdc3iNH15gbOgdoQ0CG9
	 4AG0MuvrSWMb6fEakg2P3Q/LsihU6Fpz7+P0BhiEqJMzs9hce6c1Npxx09akuVq1Xa
	 WAcvWJtD59BxayejeuODPxCvfxmQvRvUrvTHrDRePGxuR3kyaGFPmd97k0dVg5fhkY
	 WNSAOKWtLZvmGr9ttLevZtaJRg6lR3g08UxCxcBFuEqq3xIdLxHtRvaYv/QWqGo7Qc
	 TY3I33euK+xpg==
Date: Sat, 21 Mar 2026 08:03:16 +0000
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
From: Mike Wong <mikewongmai@proton.me>
Subject: Cryptsetup renecrypt failed in LUKS2 metadata initialization
Message-ID: <7XqkTH2BWNTfXhvFglwFhH9JKJD4Zk-w6454Gib-gGCqgQDBJZc1owm-UH9fVNGXuUHwOtj5mqBHatFNjawEouB-qpJTzv2G6njL-8TmT-I=@proton.me>
Feedback-ID: 115009693:user:proton
X-Pm-Message-ID: 0c965bb246ac1c67bf95e66b2ebea25dee7a4bc5
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I got a "Command failed with code -1 (wrong or missing parameters)" error w=
hen trying to reencrypt a plain btrfs partition. I'm using the latest versi=
on 2.8.4 in a ubuntu 24.04 box.

What's the cause of the problem and how could it be solved? Help is much ap=
preciated.

Below is the --debug output:
```
# cryptsetup 2.8.4 processing "cryptsetup reencrypt --encrypt --type luks2 =
--reduce-device-size 32M --init-only --debug /dev/sda4"
# Verifying parameters for command reencrypt.
# Running command reencrypt.
# Installing SIGINT/SIGTERM handler.
# Unblocking interruption on signal.
# Allocating context for crypt device /dev/sda4.
# Trying to open device /dev/sda4 with direct-io.
# Initialising device-mapper backend library.
# Trying to load any crypt type from device /dev/sda4.
# Crypto backend (OpenSSL 3.0.13 30 Jan 2024 [default][legacy] [cryptsetup =
libargon2]) initialized in cryptsetup library version 2.8.4.
# Detected kernel Linux 6.17.0-19-generic x86_64.
# Loading LUKS2 header (repair disabled).
# Acquiring read lock for device /dev/sda4.
# Opening lock resource file /run/cryptsetup/L_8:4
# Verifying lock handle for /dev/sda4.
# Device /dev/sda4 READ lock taken.
# Trying to read primary LUKS2 header at offset 0x0.
# Opening locked device /dev/sda4
# Verifying locked device handle (bdev)
# Trying to read secondary LUKS2 header at offset 0x4000.
# Reusing open ro fd on device /dev/sda4
# Trying to read secondary LUKS2 header at offset 0x8000.
# Reusing open ro fd on device /dev/sda4
# Trying to read secondary LUKS2 header at offset 0x10000.
# Reusing open ro fd on device /dev/sda4
# Trying to read secondary LUKS2 header at offset 0x20000.
# Reusing open ro fd on device /dev/sda4
# Trying to read secondary LUKS2 header at offset 0x40000.
# Reusing open ro fd on device /dev/sda4
# Trying to read secondary LUKS2 header at offset 0x80000.
# Reusing open ro fd on device /dev/sda4
# Trying to read secondary LUKS2 header at offset 0x100000.
# Reusing open ro fd on device /dev/sda4
# Trying to read secondary LUKS2 header at offset 0x200000.
# Reusing open ro fd on device /dev/sda4
# Trying to read secondary LUKS2 header at offset 0x400000.
# Reusing open ro fd on device /dev/sda4
# LUKS2 header read failed (-22).
# Device /dev/sda4 READ lock released.
# Releasing crypt device /dev/sda4 context.
# Releasing device-mapper backend.
# Closing read only fd for /dev/sda4.
# Blkid check (LUKS only).
# Allocating context for crypt device LUKS2-temp-93a07248-f438-413f-8606-04=
a62d05852a.new.
# Trying to open device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new=
 with direct-io.
# Direct-io read works.
# Initialising device-mapper backend library.
# Data offset set to 32768 (512-byte) sectors.
# Blkid check (filter none).

WARNING!
=3D=3D=3D=3D=3D=3D=3D=3D
This will overwrite data on LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a=
.new irrevocably.

Are you sure? (Type 'yes' in capital letters): # Interactive passphrase ent=
ry requested.
# PBKDF argon2id, time_ms 2000 (iterations 0), max_memory_kb 1048576, paral=
lel_threads 4.
# Formatting device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new as =
type LUKS2.
# Trying to open device /dev/sda4 with direct-io.
# Auto-detected optimal encryption sector size for device /dev/sda4 is 512 =
bytes.
# Checking if cipher aes-xts-plain64 is usable.
# Using userspace crypto wrapper to access keyslot area.
# Formatting LUKS2 with JSON metadata area 12288 bytes and keyslots area 16=
744448 bytes.
# Creating new digest 0 (pbkdf2).
# Setting PBKDF2 type key digest 0.
# Running pbkdf2(sha256) benchmark.
# PBKDF benchmark: memory cost =3D 0, iterations =3D 2048000, threads =3D 0=
 (took 16 ms)
# PBKDF benchmark: memory cost =3D 0, iterations =3D 2231012, threads =3D 0=
 (took 235 ms)
# PBKDF benchmark: memory cost =3D 0, iterations =3D 2247751, threads =3D 0=
 (took 933 ms)
# Benchmark returns pbkdf2(sha256) 2247751 iterations, 0 memory, 0 threads =
(for 512-bits key).
# Segment 0 assigned to digest 0.
# Wiping LUKS areas (0x000000 - 0x001000) with zeroes.
# Wipe device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new [0], offs=
et 0, length 4096, block 1048576, bsize 4096, align 4096.
# Device size 4096, offset 16777216.
# Wiping keyslots area (0x008000 - 0x1000000) with random data.
# Wipe device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new [1], offs=
et 32768, length 16744448, block 1048576, bsize 4096, align 4096.
# Reusing open rw fd on device LUKS2-temp-93a07248-f438-413f-8606-04a62d058=
52a.new
# Device size 16777216, offset 16777216.
# Acquiring write lock for device LUKS2-temp-93a07248-f438-413f-8606-04a62d=
05852a.new.
# Verifying lock handle for LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a=
.new.
# Device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new WRITE lock tak=
en.
# Trying to write LUKS2 header (12288 bytes) at offset 0.
# Reusing open rw fd on device LUKS2-temp-93a07248-f438-413f-8606-04a62d058=
52a.new
# Checksum:995c0d19ed8dfa7ae16f803d0e9eae383e441358fcd005437480c37a61ce3f73=
 (in-memory)
# Trying to write LUKS2 header (12288 bytes) at offset 16384.
# Reusing open rw fd on device LUKS2-temp-93a07248-f438-413f-8606-04a62d058=
52a.new
# Checksum:e55b357382872b41071b3a7b22ad7319d95af4185736ede9aab0486b4fc9720f=
 (in-memory)
# Device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new WRITE lock rel=
eased.
# Adding new keyslot -1 by passphrase, volume key provided by key (-1).
# Selected keyslot 0.
# Keyslot 0 assigned to digest 0.
# Trying to allocate LUKS2 keyslot 0.
# Found area 32768 -> 290816
# Running argon2id() benchmark.
# PBKDF benchmark: memory cost =3D 65536, iterations =3D 4, threads =3D 4 (=
took 73 ms)
# PBKDF benchmark: memory cost =3D 224438, iterations =3D 4, threads =3D 4 =
(took 214 ms)
# PBKDF benchmark: memory cost =3D 262193, iterations =3D 4, threads =3D 4 =
(took 239 ms)
# PBKDF benchmark: memory cost =3D 274260, iterations =3D 4, threads =3D 4 =
(took 247 ms)
# PBKDF benchmark: memory cost =3D 277591, iterations =3D 4, threads =3D 4 =
(took 247 ms)
# PBKDF benchmark: memory cost =3D 280962, iterations =3D 4, threads =3D 4 =
(took 254 ms)
# PBKDF benchmark: memory cost =3D 1048576, iterations =3D 8, threads =3D 4=
 (took 1691 ms)
# PBKDF benchmark: memory cost =3D 1048576, iterations =3D 9, threads =3D 4=
 (took 1898 ms)
# Benchmark returns argon2id() 9 iterations, 1048576 memory, 4 threads (for=
 512-bits key).
# Calculating attributes for LUKS2 keyslot 0.
# Acquiring write lock for device LUKS2-temp-93a07248-f438-413f-8606-04a62d=
05852a.new.
# Verifying lock handle for LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a=
.new.
# Device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new WRITE lock tak=
en.
# Checking context sequence id matches value stored on disk.
# Reusing open ro fd on device LUKS2-temp-93a07248-f438-413f-8606-04a62d058=
52a.new
# Running keyslot key derivation.
# Updating keyslot area [0x8000].
# Reusing open rw fd on device LUKS2-temp-93a07248-f438-413f-8606-04a62d058=
52a.new
# Device size 16777216, offset 16777216.
# Device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new WRITE lock alr=
eady held.
# Trying to write LUKS2 header (736 bytes) at offset 0.
# Reusing open rw fd on device LUKS2-temp-93a07248-f438-413f-8606-04a62d058=
52a.new
# Checksum:3dce86f6be9d8c08c7914694137c862bda8578626f4e3c86d33377f96f25e2c2=
 (in-memory)
# Trying to write LUKS2 header (736 bytes) at offset 16384.
# Reusing open rw fd on device LUKS2-temp-93a07248-f438-413f-8606-04a62d058=
52a.new
# Checksum:026df6310fd08708181d75daa8ce8b14144a93b5a2d60c8f20839aaf86917443=
 (in-memory)
# Device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new WRITE lock rel=
eased.
Key slot 0 created.
# Checking if cipher aes-xts-plain64 is usable (storage wrapper).
# Acquiring write lock for device LUKS2-temp-93a07248-f438-413f-8606-04a62d=
05852a.new.
# Verifying lock handle for LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a=
.new.
# Device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new WRITE lock tak=
en.
# Checking context sequence id matches value stored on disk.
# Reusing open ro fd on device LUKS2-temp-93a07248-f438-413f-8606-04a62d058=
52a.new
# Initializing reencryption (mode: encrypt) in LUKS2 metadata.
# Device size 790487891968, offset 16777216.
# Device /dev/sda4 is blocked for exclusive open.
# Segment 4 assigned to digest 0.
# Allocating reencrypt keyslot 1.
# Found area 290816 -> 294912
# Setting reencrypt keyslot for datashift protection.
# Checking new volume key (digest 0, segment: 4) using keyslot 0.
# Creating new digest 1 (pbkdf2).
# Setting PBKDF2 type key digest 1.
# Running pbkdf2(sha256) benchmark.
# PBKDF benchmark: memory cost =3D 0, iterations =3D 642509, threads =3D 0 =
(took 51 ms)
# PBKDF benchmark: memory cost =3D 0, iterations =3D 642509, threads =3D 0 =
(took 816 ms)
# Benchmark returns pbkdf2(sha256) 642509 iterations, 0 memory, 0 threads (=
for 1640-bits key).
# Keyslot 1 unassigned from digest 0.
# Keyslot 1 unassigned from digest 1.
# Keyslot 1 assigned to digest 1.
# Failed to read data at offset 0 (size: 16777216)
# Closed exclusive fd for /dev/sda4.
# Rolling back in-memory LUKS2 json metadata.
# Device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new WRITE lock rel=
eased.
# Destroying keyslot 0.
# Acquiring write lock for device LUKS2-temp-93a07248-f438-413f-8606-04a62d=
05852a.new.
# Verifying lock handle for LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a=
.new.
# Device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new WRITE lock tak=
en.
# Checking context sequence id matches value stored on disk.
# Reusing open ro fd on device LUKS2-temp-93a07248-f438-413f-8606-04a62d058=
52a.new
# Wipe device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new [3], offs=
et 32768, length 258048, block 258048, bsize 4096, align 4096.
# Reusing open rw fd on device LUKS2-temp-93a07248-f438-413f-8606-04a62d058=
52a.new
# Non-rotational device, using random data wipe mode.
# Keyslot 0 unassigned from digest 0.
# Device size 16777216, offset 16777216.
# Device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new WRITE lock alr=
eady held.
# Trying to write LUKS2 header (736 bytes) at offset 0.
# Reusing open rw fd on device LUKS2-temp-93a07248-f438-413f-8606-04a62d058=
52a.new
# Checksum:e47b39e9acab1c09e2432d111240e1f09bd116b11bab98d21dcb9990346ee4bd=
 (in-memory)
# Trying to write LUKS2 header (736 bytes) at offset 16384.
# Reusing open rw fd on device LUKS2-temp-93a07248-f438-413f-8606-04a62d058=
52a.new
# Checksum:96bec787fa065fa3ec65119ecd1e9d69a481ffb4cbc7f7f18d01407295ef722a=
 (in-memory)
# Device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.new WRITE lock rel=
eased.
# Releasing crypt device LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.ne=
w context.
# Releasing device-mapper backend.
# Closing read write fd for /dev/sda4.
# Closing read only fd for LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a.=
new.
# Closing read write fd for LUKS2-temp-93a07248-f438-413f-8606-04a62d05852a=
.new.
Command failed with code -1 (wrong or missing parameters).
```

Regards,
Mike


