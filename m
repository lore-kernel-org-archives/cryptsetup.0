Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7162853E2E
	for <cryptsetup@lists.linux.dev>; Wed, 13 Mar 2024 21:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710366135; cv=none; b=c0FpKaGYCnNDPWTzFNxpvVLxyrnzgTksKHn63xfHqZ4KdoA5IV+O9v4Z3AmUU8G96radeC7mg652+hjipDteUn2Zya9zdJglvjLZdKg6OUNbJdg2JSfurs8bd9ZjJ+sLJ1McMzxKmjE2iBiVRQwAlLbQZtHfM8wusv6bCc7jO0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710366135; c=relaxed/simple;
	bh=2afZU1R5tofwwN7ACQOB7q/IY6Uplse7BN7zhrDAdSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KWU8XB6uzYtyRtyr9nmejRlnOSi6SvsXijLezL4NGFAexFiYwtyrIgZYUz94XZnVmih25w6mevzwUmeBlxJeThhVrPwZc3nRneukLIf6ZVTPQjnYmRE8j+qtlzpSACErjio9zjkbXR2fRhaPYhNVymq4GKf0LFP3ogyw+5lPdS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7zOt4T7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7zOt4T7"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a466f796fc1so6697766b.3
        for <cryptsetup@lists.linux.dev>; Wed, 13 Mar 2024 14:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710366131; x=1710970931; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=69DbHhbLmEwBsSWX2JIgZC/XTH64n88xGsyvRHa061Q=;
        b=C7zOt4T7wFvWfBvUBPHe11ZFhaaFFg7FsZac1u8cW6GiYI9s2zGBeITu3h5ktobdWA
         sX6UFTb2Z86TlhX1Q6NNlCqiZcjpCIrmgXHueC6jIt4R2va+CIa66aS+Pe4lUifsU6JR
         n5x/dgqqs0G/NnFfxXf88c6l9r/bHFMRR0IbjPc2AypmbqWHGfCf0MMhisN9SmrqxSVm
         J12WXg4cqvqdjlsI+AbNZj/OinLtmBmyKu32yc0TQID/ZiQT/3EnYYb3UhRlaxscfs0g
         l3URdA8zXyeMXo+GmQYvpq88xbkyEvnnQUkf9yWjOX+o4ZiC6Xxk0rFKTbUTUG20kzUj
         yFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366131; x=1710970931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69DbHhbLmEwBsSWX2JIgZC/XTH64n88xGsyvRHa061Q=;
        b=X2p3sCGiAiK0GFakRCM9Nq/+Q6GXqMVEktTLfD4hADSNkGRQT/nl0GPoH2x1/KWNg4
         sf+D0tB6IL6BJjxsLy/rwGL09HJ+uNU594cmq+m4dzsfGswuEfVHRDTouTmJwoCGby4Q
         wSmEJ/+cDW1y3s/wLibUVZFZiz8AsmpBl5E3J6UiEjqHg7LVnGWHx1EN/EJhyivsluxW
         BZr13ZxXCkdMFhrWJzJjPYLBIIHnbJV4XCoHYMipV0OCoFnyuwL+08b043fH9zsFNR0V
         oYKBP44HUgr5WWtD30dC5OxeDGu1581yBdf1+DYWkDgJNbQ8ugsaX/3b85XfsfutFT1T
         YdtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Okr2feQY+0kSGQZLQ7uvhuyO1SPVJoO1IA99MI+PJv5RhyE1gqSLG7zqn8h9FnsHewpVOy1oR28wF3FheNPcsYCSu6qIIdan1A==
X-Gm-Message-State: AOJu0YzlOKSEnyZtXqQr42xT2F17wYIee0VQka4KzRpMlRw12V53/aLl
	HyImgKkzOFuya9j4mkVSXcJsb5Cz+g3ZBPKY+FVVGMyPPoLNanTJqUw3QJOG
X-Google-Smtp-Source: AGHT+IFCqfH4eOcfVGx0Z5H7sQvujp+KgcIy8FNGwIHakv8uvAcih93fUvrhXJLCtOrjWd6inujywg==
X-Received: by 2002:a17:906:3c49:b0:a46:3dde:d7ef with SMTP id i9-20020a1709063c4900b00a463dded7efmr2648816ejg.42.1710366130264;
        Wed, 13 Mar 2024 14:42:10 -0700 (PDT)
Received: from ?IPV6:2a01:110f:491e:5c00:37ae:90d0:36b1:d067? (2a01-110f-491e-5c00-37ae-90d0-36b1-d067.aa.ipv6.supernova.orange.pl. [2a01:110f:491e:5c00:37ae:90d0:36b1:d067])
        by smtp.gmail.com with ESMTPSA id ci11-20020a170906c34b00b00a466ec7eb11sm39115ejb.43.2024.03.13.14.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 14:42:09 -0700 (PDT)
Message-ID: <0fa222a8-027a-4ad0-ad9f-6bd876758083@gmail.com>
Date: Wed, 13 Mar 2024 22:42:09 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unexpected behavior of reencrypt performed after partition resize
To: Ondrej Kozina <okozina@redhat.com>, cryptsetup@lists.linux.dev
References: <a27e8008-9a85-4218-8d20-d1d56fa73671@gmail.com>
 <1155f74e-5328-4a1f-9b73-d22093ed8261@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Aleksander_=C5=81ukasz?= <allllllx@gmail.com>
In-Reply-To: <1155f74e-5328-4a1f-9b73-d22093ed8261@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, thanks for your feedback!

On 7.03.2024 13:11, Ondrej Kozina wrote:
>
> Would you mind sharing whole vda device partition table _before_ and 
> _after_ the aforementioned vda4 resize? The dm-crypt device is 
> unaligned to 1MiB (not an issue at the moment), but that's what I plan 
> to focus on with my tests.
>
> Also, please share a LUKS2 header dump (luksDump command) output for 
> luks device before and after the first reencryption run takes place.
>
Sure. First - resize of the partition. Running under pid1, the very 
first boot after VM creation, so, as expected, fdisk notes size mismatch 
(underlying disk device is already resized):

```
~# fdisk -l /dev/vda
GPT PMBR size mismatch (5265407 != 6291455) will be corrected by write.
The backup GPT table is not on the end of the device.
Disk /dev/vda: 3 GiB, 3221225472 bytes, 6291456 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 8A893502-D7FC-F84F-ADAD-D8B2BE8DFD53

Device       Start     End Sectors  Size Type
/dev/vda1     2048    8191    6144    3M BIOS boot
/dev/vda2     8192  262143  253952  124M EFI System
/dev/vda3   262144 1300479 1038336  507M Linux extended boot
/dev/vda4  1300480 5265374 3964895  1.9G Linux root (x86-64)

~# growpart /dev/vda 4
CHANGED: partition=4 start=1300480 old: size=3964895 end=5265374 new: 
size=4990943 end=6291422


~# fdisk -l /dev/vda
Disk /dev/vda: 3 GiB, 3221225472 bytes, 6291456 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 8A893502-D7FC-F84F-ADAD-D8B2BE8DFD53

Device       Start     End Sectors  Size Type
/dev/vda1     2048    8191    6144    3M BIOS boot
/dev/vda2     8192  262143  253952  124M EFI System
/dev/vda3   262144 1300479 1038336  507M Linux extended boot
/dev/vda4  1300480 6291422 4990943  2.4G Linux root (x86-64)

```

Now, after rebooting to initramfs (with visible effect of vda4 hash 
change after first reencryption):

```

~ # while true; do \
 >   echo "hello" | cryptsetup luksDump /dev/vda4 \
 >   && (echo -n "hello" | cryptsetup open /dev/vda4 test ) \
 >   && dd if=/dev/mapper/test | md5sum \
 >   && cryptsetup close /dev/mapper/test \
 >   && (echo -n "hello" | cryptsetup reencrypt /dev/vda4) done
LUKS header information
Version:        2
Epoch:          3
Metadata area:  16384 [bytes]
Keyslots area:  16744448 [bytes]
UUID:           e03c6c01-ac56-454d-9a6f-c8a83356a2d0
Label:          (no label)
Subsystem:      (no subsystem)
Flags:          (no flags)

Data segments:
   0: crypt
         offset: 16777216 [bytes]
         length: (whole device)
         cipher: aes-xts-plain64
         sector: 512 [bytes]

Keyslots:
   0: luks2
         Key:        512 bits
         Priority:   normal
         Cipher:     aes-xts-plain64
         Cipher key: 512 bits
         PBKDF:      argon2i
         Time cost:  55
         Memory:     102400
         Threads:    4
         Salt:       75 38 ee ea bd 96 7f f5 79 0d f2 c2 67 c1 a4 e8
                     43 7c 3e 02 d6 88 d2 f5 1d 65 62 2a 56 59 cb ac
         AF stripes: 4000
         AF hash:    sha256
         Area offset:32768 [bytes]
         Area length:258048 [bytes]
         Digest ID:  0
Tokens:
Digests:
   0: pbkdf2
         Hash:       sha256
         Iterations: 112219
         Salt:       8d bf 43 5f 1b f6 06 ff 51 5e be 08 bb cb 98 5a
                     fb 16 ca 97 91 f6 ec 94 74 23 60 b7 37 bf 50 5c
         Digest:     cf 95 25 63 1d fa f0 97 33 4d 10 2d 2e 5a 15 95
                     34 cf 3d 6e 86 8b f6 53 bd c1 7f b6 52 8f d8 ae
930b15301ed163117ad6efef821522e8  -
4958175+0 records in
4958175+0 records out
Finished, time 01m30s, 2420 MiB written, speed  26.7 MiB/s
LUKS header information
Version:        2
Epoch:          29
Metadata area:  16384 [bytes]
Keyslots area:  16744448 [bytes]
UUID:           e03c6c01-ac56-454d-9a6f-c8a83356a2d0
Label:          (no label)
Subsystem:      (no subsystem)
Flags:          (no flags)

Data segments:
   0: crypt
         offset: 16777216 [bytes]
         length: (whole device)
         cipher: aes-xts-plain64
         sector: 512 [bytes]

Keyslots:
   1: luks2
         Key:        512 bits
         Priority:   normal
         Cipher:     aes-xts-plain64
         Cipher key: 512 bits
         PBKDF:      argon2i
         Time cost:  55
         Memory:     102400
         Threads:    2
         Salt:       9a 22 40 7e 02 b5 3c e2 b4 96 e3 89 0f ac 9c 73
                     82 fa 86 4d c6 b2 35 21 a2 29 d5 5b b1 b6 41 93
         AF stripes: 4000
         AF hash:    sha256
         Area offset:290816 [bytes]
         Area length:258048 [bytes]
         Digest ID:  1
Tokens:
Digests:
   1: pbkdf2
         Hash:       sha256
         Iterations: 1000
         Salt:       bc e0 7f 12 66 7c dc 64 59 f1 82 99 1a eb 7c 51
                     96 90 e9 e3 53 49 b5 69 e3 1b 56 3f 99 4c da db
         Digest:     06 7b 7d 04 7d 29 9c 1c aa 8c 24 72 8e 09 b8 b4
                     b2 57 46 6f d5 1b 9b 18 a9 96 23 eb 34 53 28 1b
a1cb0baaeb94f4e3337bc192d5227206  -
4958175+0 records in
4958175+0 records out
Finished, time 01m29s, 2420 MiB written, speed  27.1 MiB/s
LUKS header information
Version:        2
Epoch:          55
Metadata area:  16384 [bytes]
Keyslots area:  16744448 [bytes]
UUID:           e03c6c01-ac56-454d-9a6f-c8a83356a2d0
Label:          (no label)
Subsystem:      (no subsystem)
Flags:          (no flags)

Data segments:
   0: crypt
         offset: 16777216 [bytes]
         length: (whole device)
         cipher: aes-xts-plain64
         sector: 512 [bytes]

Keyslots:
   0: luks2
         Key:        512 bits
         Priority:   normal
         Cipher:     aes-xts-plain64
         Cipher key: 512 bits
         PBKDF:      argon2i
         Time cost:  55
         Memory:     102400
         Threads:    2
         Salt:       6a 31 c9 2f a9 68 01 cb 1f ec 53 63 11 17 90 0a
                     4c 60 9a c3 ed a4 a8 82 d1 4f d7 7a 47 33 57 c0
         AF stripes: 4000
         AF hash:    sha256
         Area offset:32768 [bytes]
         Area length:258048 [bytes]
         Digest ID:  0
Tokens:
Digests:
   0: pbkdf2
         Hash:       sha256
         Iterations: 1000
         Salt:       ff 08 66 12 a0 c4 ed bf 69 47 5b e4 ce f4 49 a4
                     2b 58 a6 f3 a3 5b 29 20 38 61 45 80 68 d2 01 8c
         Digest:     d3 5a 80 53 22 a4 f6 0d 19 a9 cd 33 d9 9f 20 d6
                     42 15 59 00 c5 a4 32 10 83 15 b9 0b fc 8e c9 19
a1cb0baaeb94f4e3337bc192d5227206  -
4958175+0 records in
4958175+0 records out

```

>>
>> As you can see, first reencryption changes contents of the LUKS
>> container (as read via the dm-crypt mapper) and all the subsequent ones
>> do not (which I would expect to always be the case).
>
> Would you mind completely skip the reencryption step and just 
> overwrite the device with data read from the same device? But write 
> directly to vda4 (that's what reencryption actually does).
>
> First lets try without direct flag (I skip 16MiB, default LUKS2 header 
> size)
>
> dd if=/dev/vda4 of=/dev/vda4 seek=32768 skip=32768


I'm not 100% sure I understood you correctly. I assume you meant to 
replace reencryption step with just pure rewriting.

Fresh VM,  resize step as previously, now from initramfs. Checksums do 
not change:

```

~ # while true; do \
 >   (echo -n "hello" | cryptsetup open /dev/vda4 test ) \
 >   && dd if=/dev/mapper/test | md5sum \
 >   && cryptsetup close /dev/mapper/test \
 >   && (dd if=/dev/vda4 of=/dev/vda4 seek=32768 skip=32768) done
4d56a69ae41eccd3f41cf36bbb3d9962  -
4958175+0 records in
4958175+0 records out
4958175+0 records in
4958175+0 records out
4958175+0 records in
4958175+0 records out
4d56a69ae41eccd3f41cf36bbb3d9962  -
4958175+0 records in
4958175+0 records out
4d56a69ae41eccd3f41cf36bbb3d9962  -
4958175+0 records in
4958175+0 records out
4958175+0 records in
4958175+0 records out
4d56a69ae41eccd3f41cf36bbb3d9962  -
4958175+0 records in
4958175+0 records out

```

>
> or alternatively with direct flag like (again this assumes default 
> LUKS2 header size 16 MiB).
>
> dd if=/dev/vda4 of=/dev/vda4 bs=1M seek=16 skip=16 iflag=direct 
> oflag=direct,dsync
>

Again, fresh VM, initramfs stage. I could not set dsync as it's not 
supported in this dd version. Checksums again do not change:

```

~ # while true; do \
 >   (echo -n "hello" | cryptsetup open /dev/vda4 test ) \
 >   && dd if=/dev/mapper/test | md5sum \
 >   && cryptsetup close /dev/mapper/test \
 >   && (dd if=/dev/vda4 of=/dev/vda4 bs=1M seek=16 skip=16 iflag=direct 
oflag=direct) done
4958175+0 records in
4958175+0 records out
827cea8270d4bff2553a06477f41efae  -
2420+1 records in
2420+1 records out
4958175+0 records in
4958175+0 records out
827cea8270d4bff2553a06477f41efae  -
2420+1 records in
2420+1 records out
4958175+0 records in
4958175+0 records out
827cea8270d4bff2553a06477f41efae  -
2420+1 records in
2420+1 records out

```


>>
>> I can trigger this behavior by resizing /dev/vda4 partition just before
>> booting into initramfs, using any of the tools like systemd-repart or
>> growpart
>> (which extends /dev/vda4 to the end of also just extended /dev/vda). If
>
> How did you extend vda itself? And how did you pass the change in the 
> guest VM?
>
Currently I'm building a raw system image from scratch, converting it to 
qcow2 format and then using it with Terraform libvirt provider, 
specifying disk size bigger than the original disk (in 
https://registry.terraform.io/providers/multani/libvirt/latest/docs/resources/volume#size). 
Earlier I've also tested with running same way but directly from raw 
image (skipped raw to qcow2 conversion) and observed same problem as 
discussed.

So the first start of the new VM is already with bigger disk - bigger 
than the original image. To be extra sure I will eliminate libvirt and 
will try with pure qemu + resizing disk with truncate (at the moment not 
sure what libvirt does exactly for resizing under the hood, some qemu-* 
tool?), will let you now.


>> Any tips on what I could be doing wrong or what to look for would be
>> very appreciated as I'm running out of idea
> "lsblk -t /dev/vda" output might also help (again before and after the 
> resize)
>
```

Fresh VM, under pid1:

~# fdisk -l
GPT PMBR size mismatch (5265407 != 6291455) will be corrected by write.
The backup GPT table is not on the end of the device.
Disk /dev/vda: 3 GiB, 3221225472 bytes, 6291456 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 8A893502-D7FC-F84F-ADAD-D8B2BE8DFD53

Device       Start     End Sectors  Size Type
/dev/vda1     2048    8191    6144    3M BIOS boot
/dev/vda2     8192  262143  253952  124M EFI System
/dev/vda3   262144 1300479 1038336  507M Linux extended boot
/dev/vda4  1300480 5265374 3964895  1.9G Linux root (x86-64)


Disk /dev/mapper/root-crypt: 1.87 GiB, 2013249024 bytes, 3932127 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

~# lsblk -t /dev/vda
NAME           ALIGNMENT MIN-IO OPT-IO PHY-SEC LOG-SEC ROTA SCHED       
RQ-SIZE  RA WSAME
vda                    0    512      0     512     512    1 
mq-deadline     256 128    0B
├─vda1                 0    512      0     512     512    1 
mq-deadline     256 128    0B
├─vda2                 0    512      0     512     512    1 
mq-deadline     256 128    0B
├─vda3                 0    512      0     512     512    1 
mq-deadline     256 128    0B
└─vda4                 0    512      0     512     512    1 
mq-deadline     256 128    0B
   └─root-crypt         0    512      0     512     512 
1                 128 128    0B

~# growpart /dev/vda 4
CHANGED: partition=4 start=1300480 old: size=3964895 end=5265374 new: 
size=4990943 end=6291422

~# fdisk -l
Disk /dev/vda: 3 GiB, 3221225472 bytes, 6291456 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 8A893502-D7FC-F84F-ADAD-D8B2BE8DFD53

Device       Start     End Sectors  Size Type
/dev/vda1     2048    8191    6144    3M BIOS boot
/dev/vda2     8192  262143  253952  124M EFI System
/dev/vda3   262144 1300479 1038336  507M Linux extended boot
/dev/vda4  1300480 6291422 4990943  2.4G Linux root (x86-64)


Disk /dev/mapper/root-crypt: 1.87 GiB, 2013249024 bytes, 3932127 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

~# lsblk -t /dev/vda
NAME           ALIGNMENT MIN-IO OPT-IO PHY-SEC LOG-SEC ROTA SCHED       
RQ-SIZE  RA WSAME
vda                    0    512      0     512     512    1 
mq-deadline     256 128    0B
├─vda1                 0    512      0     512     512    1 
mq-deadline     256 128    0B
├─vda2                 0    512      0     512     512    1 
mq-deadline     256 128    0B
├─vda3                 0    512      0     512     512    1 
mq-deadline     256 128    0B
└─vda4                 0    512      0     512     512    1 
mq-deadline     256 128    0B
   └─root-crypt         0    512      0     512     512 
1                 128 128    0B

[ + confirmed that this VM later shows issues with hash changing ]

```

> Could you show me also last 2 cycles of reencryption debug output?
> Everything in between
>
> # Progress ????????????, device_size 2538585600
> # Next reencryption offset will be X sectors.
> # Next reencryption chunk size will be Y sectors).
> (...)
> # Progress ????????????, device_size 2538585600
> # Next reencryption offset will be XX sectors.
> # Next reencryption chunk size will be YY sectors).
> (...)
> # Next reencryption offset will be 2538585600 sectors.
> # Next reencryption chunk size will be 0 sectors).
> # Destroying keyslot ??.
> # Acquiring write lock for device /dev/vda4.
>
First reencryption in sequence:

```
Progress:  79.3%, ETA 00m21s, 1920 MiB written, speed  23.5 MiB/s# Next 
reencryption offset will be 2266048512 sectors.
# Next reencryption chunk size will be 251783168 sectors).
# Calculating segments.
# Calculating hot segments (forward direction).
# Calculating post segments (forward direction).
# Setting 'hot' segments.
# Segment 1 assigned to digest 1.
# Segment 1 assigned to digest 0.
# Segment 0 assigned to digest 1.
# Segment 2 assigned to digest 0.
# Segment 3 assigned to digest 0.
# Segment 4 assigned to digest 1.
# Reencrypting chunk starting at offset: 2266048512, size :251783168.
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# data_offset: 16777216
# Checksums hotzone resilience.
# Going to store 15736448 bytes in reencrypt keyslot.
# Reencrypt keyslot 2 store.
# Acquiring write lock for device /dev/vda4.
# Opening lock resource file /run/cryptsetup/L_254:4
# Verifying lock handle for /dev/vda4.
# Device /dev/vda4 WRITE lock taken.
# Reusing open rw fd on device /dev/vda4
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# Device size 2555362816, offset 16777216.
# Device /dev/vda4 WRITE lock already held.
# Trying to write LUKS2 header (16384 bytes) at offset 0.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:cea322757b21f00ca01e174ba0b9d72a111e6bfb3f10b2da64f73286f559ee3c 
(in-memory)
# Trying to write LUKS2 header (16384 bytes) at offset 16384.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:5b5a9a2c25599f627a4bcaf2bc7b725641da35bc7b96c1fd38adabff4847295e 
(in-memory)
# Device /dev/vda4 WRITE lock released.
# Setting 'post' segments.
# Segment 0 assigned to digest 1.
# Segment 1 assigned to digest 0.
# Segment 2 assigned to digest 0.
# Segment 3 assigned to digest 1.
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# Device size 2555362816, offset 16777216.
# Acquiring write lock for device /dev/vda4.
# Opening lock resource file /run/cryptsetup/L_254:4
# Verifying lock handle for /dev/vda4.
# Device /dev/vda4 WRITE lock taken.
# Trying to write LUKS2 header (16384 bytes) at offset 0.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:ffe71cb33aaaabd2b08670e354f0bf1c77161cfeb89d7fb793ab02b2689f9482 
(in-memory)
# Trying to write LUKS2 header (16384 bytes) at offset 16384.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:512c81644fe606c716b1580572547cc8f42505ca774114633d544773d514689d 
(in-memory)
# Device /dev/vda4 WRITE lock released.
# Progress 2266048512, device_size 2538585600
Progress:  89.3%, ETA 00m10s, 2161 MiB written, speed  24.1 MiB/s# Next 
reencryption offset will be 2517831680 sectors.
# Next reencryption chunk size will be 20753920 sectors).
# Calculating segments.
# Calculating hot segments (forward direction).
# Calculating post segments (forward direction).
# Setting 'hot' segments.
# Segment 1 assigned to digest 1.
# Segment 1 assigned to digest 0.
# Segment 0 assigned to digest 1.
# Segment 2 assigned to digest 0.
# Segment 3 assigned to digest 1.
# Reencrypting chunk starting at offset: 2517831680, size :20753920.
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# data_offset: 16777216
# Checksums hotzone resilience.
# Going to store 1297120 bytes in reencrypt keyslot.
# Reencrypt keyslot 2 store.
# Acquiring write lock for device /dev/vda4.
# Opening lock resource file /run/cryptsetup/L_254:4
# Verifying lock handle for /dev/vda4.
# Device /dev/vda4 WRITE lock taken.
# Reusing open rw fd on device /dev/vda4
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# Device size 2555362816, offset 16777216.
# Device /dev/vda4 WRITE lock already held.
# Trying to write LUKS2 header (16384 bytes) at offset 0.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:261d7c966ed417ccf873b5f80e9ba1fdd5e5d7a8c528c1b2f92cb37315e66983 
(in-memory)
# Trying to write LUKS2 header (16384 bytes) at offset 16384.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:90a8ee330e71b45416382a9dc1877613366cbe8bd09aedc0a1edfd6331ed253c 
(in-memory)
# Device /dev/vda4 WRITE lock released.
# Setting 'post' segments.
# Segment 0 assigned to digest 1.
# Segment 1 assigned to digest 0.
# Segment 2 assigned to digest 1.
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# Device size 2555362816, offset 16777216.
# Acquiring write lock for device /dev/vda4.
# Opening lock resource file /run/cryptsetup/L_254:4
# Verifying lock handle for /dev/vda4.
# Device /dev/vda4 WRITE lock taken.
# Trying to write LUKS2 header (16384 bytes) at offset 0.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:5ee46386f1abeb7429f341a1d5cc4d90d13773e536ebc2750ab1b51c5ec13119 
(in-memory)
# Trying to write LUKS2 header (16384 bytes) at offset 16384.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:bf6ce322a8eba364613a16d5c48d143ab40c045b80775ec8b2d50e326449f70d 
(in-memory)
# Device /dev/vda4 WRITE lock released.
# Progress 2517831680, device_size 2538585600
Progress:  99.2%, ETA 00m00s, 2401 MiB written, speed  26.6 MiB/s# Next 
reencryption offset will be 2538585600 sectors.
# Next reencryption chunk size will be 0 sectors).
Finished, time 01m30s, 2420 MiB written, speed  26.8 MiB/s
# Destroying keyslot 0.
# Acquiring write lock for device /dev/vda4.
```

--

Second reencryption in sequence:

```
Progress:  79.3%, ETA 00m21s, 1920 MiB written, speed  23.4 MiB/s# Next 
reencryption offset will be 2266048512 sectors.
# Next reencryption chunk size will be 251783168 sectors).
# Calculating segments.
# Calculating hot segments (forward direction).
# Calculating post segments (forward direction).
# Setting 'hot' segments.
# Segment 1 assigned to digest 0.
# Segment 1 assigned to digest 1.
# Segment 0 assigned to digest 0.
# Segment 2 assigned to digest 1.
# Segment 3 assigned to digest 1.
# Segment 4 assigned to digest 0.
# Reencrypting chunk starting at offset: 2266048512, size :251783168.
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# data_offset: 16777216
# Checksums hotzone resilience.
# Going to store 15736448 bytes in reencrypt keyslot.
# Reencrypt keyslot 2 store.
# Acquiring write lock for device /dev/vda4.
# Opening lock resource file /run/cryptsetup/L_254:4
# Verifying lock handle for /dev/vda4.
# Device /dev/vda4 WRITE lock taken.
# Reusing open rw fd on device /dev/vda4
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# Device size 2555362816, offset 16777216.
# Device /dev/vda4 WRITE lock already held.
# Trying to write LUKS2 header (16384 bytes) at offset 0.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:a2258bf5bc19066797adf597e43406b2114cf0f72b923ab2f60a3102050fbfc4 
(in-memory)
# Trying to write LUKS2 header (16384 bytes) at offset 16384.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:00addb68a000bf05a8caee7e61abff447e7f642dd32a97913f9631bb82cc9528 
(in-memory)
# Device /dev/vda4 WRITE lock released.
# Setting 'post' segments.
# Segment 0 assigned to digest 0.
# Segment 1 assigned to digest 1.
# Segment 2 assigned to digest 1.
# Segment 3 assigned to digest 0.
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# Device size 2555362816, offset 16777216.
# Acquiring write lock for device /dev/vda4.
# Opening lock resource file /run/cryptsetup/L_254:4
# Verifying lock handle for /dev/vda4.
# Device /dev/vda4 WRITE lock taken.
# Trying to write LUKS2 header (16384 bytes) at offset 0.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:5755d7ba05dd8e58363def22fb3541a5c0110ab558a0e220882f40efe8adac65 
(in-memory)
# Trying to write LUKS2 header (16384 bytes) at offset 16384.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:c4017146996609aa1b9397aeaa7d5c9bed2aed58161317613cf330c70f895c24 
(in-memory)
# Device /dev/vda4 WRITE lock released.
# Progress 2266048512, device_size 2538585600
Progress:  89.3%, ETA 00m10s, 2161 MiB written, speed  24.0 MiB/s# Next 
reencryption offset will be 2517831680 sectors.
# Next reencryption chunk size will be 20753920 sectors).
# Calculating segments.
# Calculating hot segments (forward direction).
# Calculating post segments (forward direction).
# Setting 'hot' segments.
# Segment 1 assigned to digest 0.
# Segment 1 assigned to digest 1.
# Segment 0 assigned to digest 0.
# Segment 2 assigned to digest 1.
# Segment 3 assigned to digest 0.
# Reencrypting chunk starting at offset: 2517831680, size :20753920.
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# data_offset: 16777216
# Checksums hotzone resilience.
# Going to store 1297120 bytes in reencrypt keyslot.
# Reencrypt keyslot 2 store.
# Acquiring write lock for device /dev/vda4.
# Opening lock resource file /run/cryptsetup/L_254:4
# Verifying lock handle for /dev/vda4.
# Device /dev/vda4 WRITE lock taken.
# Reusing open rw fd on device /dev/vda4
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# Device size 2555362816, offset 16777216.
# Device /dev/vda4 WRITE lock already held.
# Trying to write LUKS2 header (16384 bytes) at offset 0.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:1458810674e3bb32f4cc4be9da3f03749e0ab5b12d225874adf0c36d49e93066 
(in-memory)
# Trying to write LUKS2 header (16384 bytes) at offset 16384.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:b5d67229e0571fa5071e5352b5f2770a3c9debee66c06ae9f27b664eb65a6156 
(in-memory)
# Device /dev/vda4 WRITE lock released.
# Setting 'post' segments.
# Segment 0 assigned to digest 0.
# Segment 1 assigned to digest 1.
# Segment 2 assigned to digest 0.
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# LUKS2 requirements detected:
# online-reencrypt-v2 - known
# Device size 2555362816, offset 16777216.
# Acquiring write lock for device /dev/vda4.
# Opening lock resource file /run/cryptsetup/L_254:4
# Verifying lock handle for /dev/vda4.
# Device /dev/vda4 WRITE lock taken.
# Trying to write LUKS2 header (16384 bytes) at offset 0.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:f2ef048cba6cdcf98ffeeb00c3f3dca685d94bf716d82602ff4a65dbae9736f3 
(in-memory)
# Trying to write LUKS2 header (16384 bytes) at offset 16384.
# Reusing open rw fd on device /dev/vda4
# 
Checksum:434998528804666561b9b50a592a7d3dbda70d0a01ff0d95e510c4f24d8769a4 
(in-memory)
# Device /dev/vda4 WRITE lock released.
# Progress 2517831680, device_size 2538585600
Progress:  99.2%, ETA 00m00s, 2401 MiB written, speed  26.4 MiB/s# Next 
reencryption offset will be 2538585600 sectors.
# Next reencryption chunk size will be 0 sectors).
Finished, time 01m30s, 2420 MiB written, speed  26.7 MiB/s
# Destroying keyslot 1.
# Acquiring write lock for device /dev/vda4.

```

Regards

