Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C080B29B0
	for <cryptsetup@lists.linux.dev>; Thu,  2 Mar 2023 14:04:04 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id y3so11687994qvn.4
        for <cryptsetup@lists.linux.dev>; Thu, 02 Mar 2023 06:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677765843;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rLX5ar5EMEzkmAW9fG0eW6/hTby92dB2eVOpb45XMss=;
        b=fgEH+Q4oNnDvlgIkqXzElDxJIT3Jybm0JRecaNJENhOQngDaldXwISqZMbfhev7CWT
         toOgvIweT/h6jFue1BkWcYSGd7UXOp+S3ddTJDkjBe+E36ZEK56HGjRDz0GxHeahCxTc
         6fSL4XrN3ZgJ75MJF71WmN0RWndoMGKvPssZo29TsXFPR+3MUHaqCGp3qCLZ/9bkMi3/
         QbQt/9SpSao94YA9R6uyFinb6b5XaJYNTJyfNdtUcp4XTvJ9dxo6jbldYLBQ2xIrpIvG
         y+6ske5K1GL4otdSJNXlONaLX9ErYsH/AePHDt4e1kpOc5mh0tEyLnRNBhT2GlFongDG
         HkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677765843;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLX5ar5EMEzkmAW9fG0eW6/hTby92dB2eVOpb45XMss=;
        b=kA6AN5oMIPOGOBj3MF+bXKD121FTKftctTxacZRNGCnLi6S++YnZLYSh/0BRg6fu0l
         t3Hu1PkboKS1ACxZqPiTTGa/hGz37lPZ1jbIALJMcSQ6g8yCF6BHW6/THltcP/OrOuq/
         T3lgNwm9vpmLXi9qRNaF5HZZZ3Ho1twubIiXdHQH91uJXcGOqdFmdHAGmfyyOmDQo4gW
         XFLE2471xcfASqiP/JPp1VRuULLF7dLOdjK6jYmrwix2h6yeQKct/KQ31MRZ9wtaxoKN
         jvp3oPDg+cOYpDx3LL0OW88CDSHymweRwhbH4d1hTQ9p2lz+TKpyHgQRgkFt/tZpYZQQ
         ttpg==
X-Gm-Message-State: AO0yUKX1cTbYcNWdyJIHaoaSbc3spcWoE+QIX/RUwPBspp8CFH5XOZDP
	yNxJ25SngRWl4b1Pjvkc5oCdJUfHaYQoSYyA3l2Tur+xT72QFg==
X-Google-Smtp-Source: AK7set8A4uEDwnKvpKAAtClEjdnWRTNBvgu7b0tPYsIm1QTXX5tSN2I8TGaCjxlU+0lPkA85bBkqu3/rFwUevGEIy5M=
X-Received: by 2002:a05:6214:8f1:b0:56e:f4f0:e71d with SMTP id
 dr17-20020a05621408f100b0056ef4f0e71dmr2742464qvb.6.1677765842968; Thu, 02
 Mar 2023 06:04:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Lars Francke <lars.francke@gmail.com>
Date: Thu, 2 Mar 2023 15:03:26 +0100
Message-ID: <CAD-Ua_hj1hkymLbyEyT-eNyCj_naiqHqg7nr3nos8tp9XCERDg@mail.gmail.com>
Subject: cryptsetup - No key available with passphrase
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to setup LUKS (and I've done it like this in the past,
like...two weeks ago and it just stopped working) and am running into
the following issue:

root@archiso ~ # echo 'a' | cryptsetup  luksFormat --batch-mode /dev/nvme0n1p5 -
root@archiso ~ # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot -
No key available with this passphrase.

I have included all the debug output below, I also extracted the
header and uploaded it here:
https://drive.google.com/file/d/1-NhDbjZM0c29Mbt0_XEfx4yYzWwy0IyE/view?usp=sharing

This is on an ISO from Arch Linux from March 2023.

2 root@archiso ~ # uname -a
Linux archiso 6.2.1-arch1-1 #1 SMP PREEMPT_DYNAMIC Sun, 26 Feb 2023
03:39:23 +0000 x86_64 GNU/Linux

--------------------------------------------------

I created the partition from scratch:

Disk /dev/nvme0n1: 1.82 TiB, 2000398934016 bytes, 3907029168 sectors
Disk model: WDS200T1X0E-00AFY0
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 4468378F-0C43-4E08-A042-17E10464878A

Device             Start       End   Sectors  Size Type
/dev/nvme0n1p1      2048   4196351   4194304    2G EFI System
/dev/nvme0n1p2   4196352   4229119     32768   16M Microsoft reserved
/dev/nvme0n1p3   4229120 979460095 975230976  465G Microsoft basic data
/dev/nvme0n1p4 979460096 980756479   1296384  633M Windows recovery environment

Command (m for help): n
Partition number (5-128, default 5):
First sector (980756480-3907029134, default 980756480):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (980756480-3907029134,
default 3907028991):

Created a new partition 5 of type 'Linux filesystem' and of size 1.4 TiB.
Partition #5 contains a crypto_LUKS signature.

Do you want to remove the signature? [Y]es/[N]o: Y

The signature will be removed by a write command.

Command (m for help): write
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.


--------------------------------------------------
fdisk output after creating the partition:

root@archiso ~ # fdisk -l
Disk /dev/nvme0n1: 1.82 TiB, 2000398934016 bytes, 3907029168 sectors
Disk model: WDS200T1X0E-00AFY0
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 4468378F-0C43-4E08-A042-17E10464878A

Device             Start        End    Sectors  Size Type
/dev/nvme0n1p1      2048    4196351    4194304    2G EFI System
/dev/nvme0n1p2   4196352    4229119      32768   16M Microsoft reserved
/dev/nvme0n1p3   4229120  979460095  975230976  465G Microsoft basic data
/dev/nvme0n1p4 979460096  980756479    1296384  633M Windows recovery
environment
/dev/nvme0n1p5 980756480 3907028991 2926272512  1.4T Linux filesystem


--------------------------------------------------
luksFormat in debug mode:

root@archiso ~ # echo 'a' | cryptsetup  luksFormat --debug
--batch-mode -y /dev/nvme0n1p5 -d -
# cryptsetup 2.6.1 processing "cryptsetup luksFormat --debug
--batch-mode -y /dev/nvme0n1p5 -d -"
# Verifying parameters for command luksFormat.
# Running command luksFormat.
# Installing SIGINT/SIGTERM handler.
# Unblocking interruption on signal.
# Allocating context for crypt device /dev/nvme0n1p5.
# Trying to open and read device /dev/nvme0n1p5 with direct-io.
# Initialising device-mapper backend library.
Can't do passphrase verification on non-tty inputs.
# STDIN descriptor passphrase entry requested.
# Crypto backend (OpenSSL 3.0.8 7 Feb 2023 [default][legacy])
initialized in cryptsetup library version 2.6.1.
# Detected kernel Linux 6.2.1-arch1-1 x86_64.
# PBKDF argon2id, time_ms 2000 (iterations 0), max_memory_kb 1048576,
parallel_threads 4.
# Formatting device /dev/nvme0n1p5 as type LUKS2.
# Auto-detected optimal encryption sector size for device
/dev/nvme0n1p5 is 512 bytes.
# Topology: IO (512/0), offset = 0; Required alignment is 1048576 bytes.
# Checking if cipher aes-xts-plain64 is usable.
# Using userspace crypto wrapper to access keyslot area.
# Formatting LUKS2 with JSON metadata area 12288 bytes and keyslots
area 16744448 bytes.
# Creating new digest 0 (pbkdf2).
# Setting PBKDF2 type key digest 0.
# Running pbkdf2(sha256) benchmark.
# PBKDF benchmark: memory cost = 0, iterations = 3640888, threads = 0
(took 9 ms)
# PBKDF benchmark: memory cost = 0, iterations = 3495253, threads = 0
(took 150 ms)
# PBKDF benchmark: memory cost = 0, iterations = 3483641, threads = 0
(took 602 ms)
# Benchmark returns pbkdf2(sha256) 3483641 iterations, 0 memory, 0
threads (for 512-bits key).
# Segment 0 assigned to digest 0.
# Device size 1498251526144, offset 16777216.
# Wiping LUKS areas (0x000000 - 0x1000000) with zeroes.
# Wiping keyslots area (0x008000 - 0x1000000) with random data.
# Reusing open rw fd on device /dev/nvme0n1p5
# Device size 1498251526144, offset 16777216.
# Acquiring write lock for device /dev/nvme0n1p5.
# Opening lock resource file /run/cryptsetup/L_259:15
# Verifying lock handle for /dev/nvme0n1p5.
# Device /dev/nvme0n1p5 WRITE lock taken.
# Trying to write LUKS2 header (16384 bytes) at offset 0.
# Reusing open rw fd on device /dev/nvme0n1p5
# Checksum:e28bc1af6f8e60c6111b1287de0b6e3a0e49358de1735d7e603a51249f43539f
(in-memory)
# Trying to write LUKS2 header (16384 bytes) at offset 16384.
# Reusing open rw fd on device /dev/nvme0n1p5
# Checksum:64078bdc3a7527bfe748522e15c3f2427ab5c9f8d168b97ab3035386dadb2bc1
(in-memory)
# Device /dev/nvme0n1p5 WRITE lock released.
# Adding new keyslot -1 by passphrase, volume key provided by key (-1).
# Selected keyslot 0.
# Keyslot 0 assigned to digest 0.
# Trying to allocate LUKS2 keyslot 0.
# Found area 32768 -> 290816
# Running argon2id() benchmark.
# PBKDF benchmark: memory cost = 65536, iterations = 4, threads = 4 (took 36 ms)
# PBKDF benchmark: memory cost = 455111, iterations = 4, threads = 4
(took 222 ms)
# PBKDF benchmark: memory cost = 512512, iterations = 4, threads = 4
(took 247 ms)
# PBKDF benchmark: memory cost = 518736, iterations = 4, threads = 4
(took 250 ms)
# PBKDF benchmark: memory cost = 1048576, iterations = 15, threads = 4
(took 1872 ms)
# PBKDF benchmark: memory cost = 1048576, iterations = 16, threads = 4
(took 1991 ms)
# Benchmark returns argon2id() 16 iterations, 1048576 memory, 4
threads (for 512-bits key).
# Calculating attributes for LUKS2 keyslot 0.
# Acquiring write lock for device /dev/nvme0n1p5.
# Opening lock resource file /run/cryptsetup/L_259:15
# Verifying lock handle for /dev/nvme0n1p5.
# Device /dev/nvme0n1p5 WRITE lock taken.
# Checking context sequence id matches value stored on disk.
# Reusing open ro fd on device /dev/nvme0n1p5
# Running keyslot key derivation.
# Updating keyslot area [0x8000].
# Reusing open rw fd on device /dev/nvme0n1p5
# Device size 1498251526144, offset 16777216.
# Device /dev/nvme0n1p5 WRITE lock already held.
# Trying to write LUKS2 header (16384 bytes) at offset 0.
# Reusing open rw fd on device /dev/nvme0n1p5
# Checksum:a77d2382f7c79354c04778a3600264fc4275686e1e32f6d83c535ecfdb7fac86
(in-memory)
# Trying to write LUKS2 header (16384 bytes) at offset 16384.
# Reusing open rw fd on device /dev/nvme0n1p5
# Checksum:32192a11bec3e8d6b8e09f25f7cc3d41341f0511a0b530ac610396e1d1c00eb4
(in-memory)
# Device /dev/nvme0n1p5 WRITE lock released.
Key slot 0 created.
# Releasing crypt device /dev/nvme0n1p5 context.
# Releasing device-mapper backend.
# Closing read only fd for /dev/nvme0n1p5.
# Closing read write fd for /dev/nvme0n1p5.
Command successful.


--------------------------------------------------

luksOpen in debug mode:

root@archiso ~ # echo 'a' | cryptsetup luksOpen --debug /dev/nvme0n1p5
cryptroot -
# cryptsetup 2.6.1 processing "cryptsetup luksOpen --debug
/dev/nvme0n1p5 cryptroot -"
# Verifying parameters for command open.
# Running command open.
# Installing SIGINT/SIGTERM handler.
# Unblocking interruption on signal.
# Allocating context for crypt device /dev/nvme0n1p5.
# Trying to open and read device /dev/nvme0n1p5 with direct-io.
# Initialising device-mapper backend library.
# Trying to load any crypt type from device /dev/nvme0n1p5.
# Crypto backend (OpenSSL 3.0.8 7 Feb 2023 [default][legacy])
initialized in cryptsetup library version 2.6.1.
# Detected kernel Linux 6.2.1-arch1-1 x86_64.
# Loading LUKS2 header (repair disabled).
# Acquiring read lock for device /dev/nvme0n1p5.
# Opening lock resource file /run/cryptsetup/L_259:15
# Verifying lock handle for /dev/nvme0n1p5.
# Device /dev/nvme0n1p5 READ lock taken.
# Trying to read primary LUKS2 header at offset 0x0.
# Opening locked device /dev/nvme0n1p5
# Verifying locked device handle (bdev)
# LUKS2 header version 2 of size 16384 bytes, checksum sha256.
# Checksum:a77d2382f7c79354c04778a3600264fc4275686e1e32f6d83c535ecfdb7fac86
(on-disk)
# Checksum:a77d2382f7c79354c04778a3600264fc4275686e1e32f6d83c535ecfdb7fac86
(in-memory)
# Trying to read secondary LUKS2 header at offset 0x4000.
# Reusing open ro fd on device /dev/nvme0n1p5
# LUKS2 header version 2 of size 16384 bytes, checksum sha256.
# Checksum:32192a11bec3e8d6b8e09f25f7cc3d41341f0511a0b530ac610396e1d1c00eb4
(on-disk)
# Checksum:32192a11bec3e8d6b8e09f25f7cc3d41341f0511a0b530ac610396e1d1c00eb4
(in-memory)
# Device size 1498251526144, offset 16777216.
# Device /dev/nvme0n1p5 READ lock released.
# PBKDF argon2id, time_ms 2000 (iterations 0), max_memory_kb 1048576,
parallel_threads 4.
# Activating volume cryptroot using token (any type) -1.
# dm version   [ opencount flush ]   [16384] (*1)
# dm versions   [ opencount flush ]   [16384] (*1)
# Detected dm-ioctl version 4.47.0.
# Device-mapper backend running with UDEV support enabled.
# dm status cryptroot  [ opencount noflush ]   [16384] (*1)
No usable token is available.
# STDIN descriptor passphrase entry requested.
# Activating volume cryptroot [keyslot -1] using passphrase.
# dm versions   [ opencount flush ]   [16384] (*1)
# dm status cryptroot  [ opencount noflush ]   [16384] (*1)
# Keyslot 0 priority 1 != 2 (required), skipped.
# Trying to open LUKS2 keyslot 0.
# Running keyslot key derivation.
# Reading keyslot area [0x8000].
# Acquiring read lock for device /dev/nvme0n1p5.
# Opening lock resource file /run/cryptsetup/L_259:15
# Verifying lock handle for /dev/nvme0n1p5.
# Device /dev/nvme0n1p5 READ lock taken.
# Reusing open ro fd on device /dev/nvme0n1p5
# Device /dev/nvme0n1p5 READ lock released.
# Verifying key from keyslot 0, digest 0.
# Digest 0 (pbkdf2) verify failed with -1.
No key available with this passphrase.
# Releasing crypt device /dev/nvme0n1p5 context.
# Releasing device-mapper backend.
# Closing read only fd for /dev/nvme0n1p5.
Command failed with code -2 (no permission or bad passphrase).

--------------------------------------------------
luksDump:

root@archiso ~ # cryptsetup luksDump /dev/nvme0n1p5
LUKS header information
Version:        2
Epoch:          3
Metadata area:  16384 [bytes]
Keyslots area:  16744448 [bytes]
UUID:           cea31415-b712-4863-9948-b71171b8484a
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
        PBKDF:      argon2id
        Time cost:  16
        Memory:     1048576
        Threads:    4
        Salt:       59 d1 0d e2 4d e4 09 e9 e0 fe df a0 d2 04 60 66
                    a0 1b 68 6f 5b 56 ac 98 90 f1 99 d3 a0 af 83 57
        AF stripes: 4000
        AF hash:    sha256
        Area offset:32768 [bytes]
        Area length:258048 [bytes]
        Digest ID:  0
Tokens:
Digests:
  0: pbkdf2
        Hash:       sha256
        Iterations: 442810
        Salt:       c6 03 98 1a 7a b4 9b 79 50 ee c1 c5 8b ce e8 21
                    0d 12 4d cb f0 37 54 a9 7a 24 34 c7 99 2b de a8
        Digest:     9c 63 5a d5 f5 17 77 0e 82 0f 94 5c 33 3a 57 d9
                    b3 e1 dc 71 45 f2 5d a4 56 e3 c9 ec ce f5 64 8b


This can only be a stupid minor thing.
Almost all search results basically say that the keyboard layout is
wrong or a keyboard is broken or whatever but I'm 100% certain that
this is not the case here.
I would appreciate any help.

Thank you very much.

Cheers,
Lars
