Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD52AD5E
	for <cryptsetup@lists.linux.dev>; Tue, 29 Nov 2022 19:50:40 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id ho10so36430865ejc.1
        for <cryptsetup@lists.linux.dev>; Tue, 29 Nov 2022 11:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgVdjKf/ojM2QdXxU9dBIYuLzHd1hvilopZB2pi6Z2k=;
        b=BhMyaPz3j8K/flsoCI7JjgHjSytA2pX4g39vWYYFEoX2LrXuZkoQSGPYt2N+Hyub1I
         qKhRWPScpoqxKxhxG2oHM3E9XLYTdz4pCapFXRPqLBJaIlo46F5G1db4mXA8ogreqM17
         /xBmoPI2Uq8AbcZhsWNAJm62YzpTbhP05inSzQEcKpByM3WTmrzx0ruYiH5lpOhG2c/h
         iG30vPRJilfHtgn/V49pYX8C5be73Hvs8EBJQPM9sokHYJN2PmjNzhkgOIe7f3esMq4h
         oG3bWjZgTanKt7wHq0U9EsaUvSuqjjk2SMT2FFFixNfcRw4JgRiUuNhKV0weRtPycDkU
         mSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jgVdjKf/ojM2QdXxU9dBIYuLzHd1hvilopZB2pi6Z2k=;
        b=Dect2ZuWPK5RKkGdbfI62LLRMe4Dt1yES3flXo5UALo4bJwqGBx2tr9cnGFu7uyJpH
         CNpfTtCX4CFeXDqT4VReQezLRvlCbjOqp+Vx7T6zJy+fnnHTNP18fX4DUcLp7dU1YlTy
         fgOVbviIEC+1fq/SJPUEX4gbkkhIcMkyTLNWoTjrhfO2vzf7aitejY8gqGrpgtvVfM3U
         S59SaEX9p00HUBve94sL920dXTUcYnYj/n5dmOUVuX8xv8AYicIMA0cy/Z4K+e5uqxtK
         08zci1UqCckCZ1dYALAqa8MGtO1oHj+Hhcz9GGuM4ypX7o5Sw/zbb/py6vzPeJ0lWXRw
         4g1g==
X-Gm-Message-State: ANoB5pk4vbcuXsUbIZYja/DzgcoY69sfQBRxldw/YuKgSlJ2sa3DmJSA
	izhsP8KhvPSRV/S6ENQFaAmIml/WVWw=
X-Google-Smtp-Source: AA0mqf7Aa5gBV6SJG6c+jDEi5zfNZBk0FWtZi0Y5xVTG9U8ibCcw4QiebeezaAznU32nyrFX7sEOJg==
X-Received: by 2002:a17:907:d383:b0:7c0:9973:20a3 with SMTP id vh3-20020a170907d38300b007c0997320a3mr912006ejc.30.1669751438986;
        Tue, 29 Nov 2022 11:50:38 -0800 (PST)
Received: from ?IPV6:2001:a61:ac8:e002:982f:781e:b730:5a95? ([2001:a61:ac8:e002:982f:781e:b730:5a95])
        by smtp.gmail.com with ESMTPSA id ba12-20020a0564021acc00b0046b847d6a1csm1016577edb.21.2022.11.29.11.50.38
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 11:50:38 -0800 (PST)
Message-ID: <15a19597-423a-8fc0-02d9-3ea4da34b490@gmail.com>
Date: Tue, 29 Nov 2022 20:50:35 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: cryptsetup@lists.linux.dev
Content-Language: en-US, de-DE
From: Lamy Geier <lamyergeier@gmail.com>
Subject: Slow unlock of the LUKS device at boot
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

My boot partition (/dev/nvme0n1p1) is using LUKS1. And another partition 
(/dev/nvme0n1p5) is using LUKS2 which has LVM with root volume,  home 
volume and swap volumes. Both of these have same passphrase.

I am using Grub. While booting I enter the passphrase to unlock the boot 
partition. To automatically unlock the partition with LVM volumes, I 
have created a keyfile (boot_os.keyfile) which is stored in the device 
itself, which is used to unlock it. I have created it as follows:

```bash
# echo "KEYFILE_PATTERN=/etc/luks/*.keyfile" >> 
/etc/cryptsetup-initramfs/conf-hook
# echo "UMASK=0077" >> /etc/initramfs-tools/initramfs.conf
```

- Create a randomised key-file of 4096 bits (512 bytes), secure it, and 
add it to the LUKS volumes (Man-pages for dd chmod):

```bash
# mkdir /etc/luks
# dd if=/dev/urandom of=/etc/luks/boot_os.keyfile bs=512 count=1
1+0 records in u=rx,go-rwx /etc/luks
1+0 records out
512 bytes (0.5 kB, 0.5 KiB) copied, 0.0002368 s, 17.3 MB/s

# chmod u=rx,go-rwx /etc/luks
# chmod u=r,go-rwx /etc/luks/boot_os.keyfile

# cryptsetup luksAddKey /dev/nvme0n1p1 /etc/luks/boot_os.keyfile
Enter any existing passphrase:

# cryptsetup luksAddKey /dev/nvme0n1p5 /etc/luks/boot_os.keyfile
Enter any existing passphrase:
```

Add the keys to the crypttab:

```bash
# echo "LUKS_BOOT UUID=$(blkid -s UUID -o value ${DEVP}1) 
/etc/luks/boot_os.keyfile luks,discard" >> /etc/crypttab
# echo "${DM}5_crypt UUID=$(blkid -s UUID -o value ${DEVP}5) 
/etc/luks/boot_os.keyfile luks,discard" >> /etc/crypttab
```

The above is taken from: [Full_Disk_Encryption_Howto_2019 - Community 
Help 
Wiki](https://help.ubuntu.com/community/Full_Disk_Encryption_Howto_2019#Post-Installation_Steps)

---

# Issue

The boot partition unlocks very quickly (5 seconds) but the LVM volume 
takes about 6 minutes to unlock.

Following are the key dump of both these partitions. With the keyslot 0 
in both being the same passphrase, and keyslot 1 being the key file:

```
$ sudo cryptsetup luksDump /dev/nvme0n1p1
Place your right index finger on the fingerprint reader
LUKS header information for /dev/nvme0n1p1

Version:        1
Cipher name:    aes
Cipher mode:    xts-plain64
Hash spec:      sha256
Payload offset: 4096
MK bits:        512
MK digest:      ec 22 27 de c1 ef 40 0f a5 cf 37 d3 96 5c d5 b2 6e c8 dd 90
MK salt:        62 1a 05 81 ba 60 3b 0d b1 8a 9f f0 04 98 27 54
                 06 b6 8d 72 53 23 09 47 ea 5f 80 1d d7 c5 ca 50
MK iterations:  305173
UUID:           586de9a0-14c7-40d7-b721-7fdba2e3b184

Key Slot 0: ENABLED
         Iterations:             1000
         Salt:                   4b f1 99 85 84 a5 00 d6 a4 e8 e1 07 35 
b4 da a1
                                 fc 97 59 5f 4c f8 e1 9b 49 71 29 af e5 
56 b1 19
         Key material offset:    8
         AF stripes:             4000
Key Slot 1: ENABLED
         Iterations:             4848906
         Salt:                   91 70 85 49 f3 31 e8 53 1f 39 aa 6d 7a 
3e 84 de
                                 e4 3f bd 3d 65 bf f6 b1 e6 8c 15 fa 34 
b9 e3 e0
         Key material offset:    512
         AF stripes:             4000
```

```
$ sudo cryptsetup luksDump /dev/nvme0n1p5
LUKS header information
Version:        2
Epoch:          10
Metadata area:  16384 [bytes]
Keyslots area:  16744448 [bytes]
UUID:           ee8854e8-54f6-4f7b-b326-02fdee357d0e
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
         Time cost:  1000
         Memory:     1048576
         Threads:    4
         Salt:       93 17 44 b3 39 82 ab 0c 20 81 0b 2b 8d 38 b1 42
                     57 53 bf ad 11 5c d5 f5 8e 42 47 45 21 73 74 84
         AF stripes: 4000
         AF hash:    sha256
         Area offset:806912 [bytes]
         Area length:258048 [bytes]
         Digest ID:  0
   1: luks2
         Key:        512 bits
         Priority:   normal
         Cipher:     aes-xts-plain64
         Cipher key: 512 bits
         PBKDF:      argon2id
         Time cost:  9
         Memory:     1048576
         Threads:    4
         Salt:       b9 84 4c ee e5 38 5d 3e 7e c3 1f 12 b3 6c 42 9b
                     a4 61 7c f8 12 55 99 25 fe d6 76 15 4b 65 11 66
         AF stripes: 4000
         AF hash:    sha256
         Area offset:32768 [bytes]
         Area length:258048 [bytes]
         Digest ID:  0
Tokens:
Digests:
   0: pbkdf2
         Hash:       sha256
         Iterations: 305529
         Salt:       db 22 26 2b b0 dc 12 19 a1 e1 13 d2 98 92 43 2c
                     d3 e6 f2 da 9a 08 e5 a3 56 42 f5 e7 b0 89 bc 75
         Digest:     bb e0 6e 95 50 0c 86 ce 3a 1b bd 7e 7b da 16 ba
                     84 c7 9a 41 a2 09 9c b1 a5 a6 3d 80 31 5a 27 64
```

# Help request?

Can you please suggest if I need to change the order of the keys or 
change the iteration time cost or any other parameter to make my LVM 
volume to unlock faster?

Note: My passphrase has high entropy and the keyfile also has high 
entropy as it is generated with random numbers.


-- 
Thanks and Regards

Lamy
