Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3756FCA
	for <cryptsetup@lists.linux.dev>; Thu,  1 Dec 2022 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669905620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5zaK6nNrneo5wcF7LO7lYr+A+OVE3EKKUVwrxoszn3k=;
	b=im4ZXr230gx8mpO08kI9s+zcmP+D428zyshybq+dkMpCDpRYcqm+GXau1uBD0ifj2RaBwt
	jDbz9vpvaNqhGBVMw/M37f3G5KaV11ZVcyN4cZA40iB08K10/XYueHSoO1BVC0OzUC7nE+
	SW7GT/KxYxrttrlqu1ymAtvE2q9v8CI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-Fc4F6dDQOvCgv1oUZO7qvw-1; Thu, 01 Dec 2022 09:40:19 -0500
X-MC-Unique: Fc4F6dDQOvCgv1oUZO7qvw-1
Received: by mail-ed1-f72.google.com with SMTP id z16-20020a05640235d000b0046a31abc500so1000239edc.8
        for <cryptsetup@lists.linux.dev>; Thu, 01 Dec 2022 06:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:cc:from
         :content-language:references:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zaK6nNrneo5wcF7LO7lYr+A+OVE3EKKUVwrxoszn3k=;
        b=weuU1iPikOp+De+1xpgDReasxOlZlj4TIWrBgnsUsRrjxCVvdUkYzmU+tAokhtVYUz
         r5lqSFnpAictTPsh5JkYr/MZBdqq1KWgPwHoTRAS5knLmBoLmnTjcB2CO/6KOL5Zpr1L
         2OkNYZojG16PzjY9bzh3qkMJOjFXMKJmOGFEUF8RAw5gCw05S765AuwF1npXqZOVzor3
         JmeheF05nwPPTEPSPpM6pr/8A0u9PB2m10MjCywgGPln9crKQ3OlYkXXR1KTA59pWSrC
         rFPhN8G4KQg5ixJmHtkJoiTuu3yWEWgbYXiD/REN5y0Hsqtkct7zt9h/dxIEZz6aARWG
         BLPA==
X-Gm-Message-State: ANoB5pmz9fW+QLJsGrq6I3BK6E5W+piU8V9GapKhO2NRbFwe6RWb1PNr
	TqmroN1vnMzbKIoGQpfzIdZLrli/WB2myanTMG6eXgCSsM1/ul0bAIoBFPRnKni/QOieaL2tHLB
	G5xxt4nYQFtOnQ3s7fpoU6P7uIixXcH1s2L+3SwpDVOyS427r8P8+uC0Xmzl5J7jxday4vok=
X-Received: by 2002:a17:906:a294:b0:7be:1ce1:ce3b with SMTP id i20-20020a170906a29400b007be1ce1ce3bmr20561150ejz.135.1669905618082;
        Thu, 01 Dec 2022 06:40:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf431OG7lCGUbxX3BTghvr8+vhwdbd9Xop52T1+pMkilBIzWfII5wzCG/QnU35SVkJGd0qF2XA==
X-Received: by 2002:a17:906:a294:b0:7be:1ce1:ce3b with SMTP id i20-20020a170906a29400b007be1ce1ce3bmr20561131ejz.135.1669905617813;
        Thu, 01 Dec 2022 06:40:17 -0800 (PST)
Received: from [10.43.17.42] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id k3-20020a17090632c300b007aece68483csm1805867ejk.193.2022.12.01.06.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 06:40:16 -0800 (PST)
Message-ID: <28ce5fe7-89c3-7548-d8e8-71c830f25711@redhat.com>
Date: Thu, 1 Dec 2022 15:40:15 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: cryptsetup@lists.linux.dev
References: <15a19597-423a-8fc0-02d9-3ea4da34b490@gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Cc: Lamy Geier <lamyergeier@gmail.com>
Subject: Re: Slow unlock of the LUKS device at boot
In-Reply-To: <15a19597-423a-8fc0-02d9-3ea4da34b490@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29. 11. 22 20:50, Lamy Geier wrote:
> My boot partition (/dev/nvme0n1p1) is using LUKS1. And another partition
> (/dev/nvme0n1p5) is using LUKS2 which has LVM with root volume,  home
> volume and swap volumes. Both of these have same passphrase.
> 
> I am using Grub. While booting I enter the passphrase to unlock the boot
> partition. To automatically unlock the partition with LVM volumes, I
> have created a keyfile (boot_os.keyfile) which is stored in the device
> itself, which is used to unlock it. I have created it as follows:
> 
> ```bash
> # echo "KEYFILE_PATTERN=/etc/luks/*.keyfile" >>
> /etc/cryptsetup-initramfs/conf-hook
> # echo "UMASK=0077" >> /etc/initramfs-tools/initramfs.conf
> ```
> 
> - Create a randomised key-file of 4096 bits (512 bytes), secure it, and
> add it to the LUKS volumes (Man-pages for dd chmod):
> 
> ```bash
> # mkdir /etc/luks
> # dd if=/dev/urandom of=/etc/luks/boot_os.keyfile bs=512 count=1
> 1+0 records in u=rx,go-rwx /etc/luks
> 1+0 records out
> 512 bytes (0.5 kB, 0.5 KiB) copied, 0.0002368 s, 17.3 MB/s
> 
> # chmod u=rx,go-rwx /etc/luks
> # chmod u=r,go-rwx /etc/luks/boot_os.keyfile
> 
> # cryptsetup luksAddKey /dev/nvme0n1p1 /etc/luks/boot_os.keyfile
> Enter any existing passphrase:
> 
> # cryptsetup luksAddKey /dev/nvme0n1p5 /etc/luks/boot_os.keyfile
> Enter any existing passphrase:
> ```
> 
> Add the keys to the crypttab:
> 
> ```bash
> # echo "LUKS_BOOT UUID=$(blkid -s UUID -o value ${DEVP}1)
> /etc/luks/boot_os.keyfile luks,discard" >> /etc/crypttab
> # echo "${DM}5_crypt UUID=$(blkid -s UUID -o value ${DEVP}5)
> /etc/luks/boot_os.keyfile luks,discard" >> /etc/crypttab
> ```
> 
> The above is taken from: [Full_Disk_Encryption_Howto_2019 - Community
> Help
> Wiki](https://help.ubuntu.com/community/Full_Disk_Encryption_Howto_2019#Post-Installation_Steps)
> 
> ---
> 
> # Issue
> 
> The boot partition unlocks very quickly (5 seconds) but the LVM volume
> takes about 6 minutes to unlock.
> 
> Following are the key dump of both these partitions. With the keyslot 0
> in both being the same passphrase, and keyslot 1 being the key file:
> 
> ```
> $ sudo cryptsetup luksDump /dev/nvme0n1p1
> Place your right index finger on the fingerprint reader
> LUKS header information for /dev/nvme0n1p1
> 
> Version:        1
> Cipher name:    aes
> Cipher mode:    xts-plain64
> Hash spec:      sha256
> Payload offset: 4096
> MK bits:        512
> MK digest:      ec 22 27 de c1 ef 40 0f a5 cf 37 d3 96 5c d5 b2 6e c8 dd 90
> MK salt:        62 1a 05 81 ba 60 3b 0d b1 8a 9f f0 04 98 27 54
>                   06 b6 8d 72 53 23 09 47 ea 5f 80 1d d7 c5 ca 50
> MK iterations:  305173
> UUID:           586de9a0-14c7-40d7-b721-7fdba2e3b184
> 
> Key Slot 0: ENABLED
>           Iterations:             1000
>           Salt:                   4b f1 99 85 84 a5 00 d6 a4 e8 e1 07 35
> b4 da a1
>                                   fc 97 59 5f 4c f8 e1 9b 49 71 29 af e5
> 56 b1 19
>           Key material offset:    8
>           AF stripes:             4000
> Key Slot 1: ENABLED
>           Iterations:             4848906
>           Salt:                   91 70 85 49 f3 31 e8 53 1f 39 aa 6d 7a
> 3e 84 de
>                                   e4 3f bd 3d 65 bf f6 b1 e6 8c 15 fa 34
> b9 e3 e0
>           Key material offset:    512
>           AF stripes:             4000
> ```
> 
> ```
> $ sudo cryptsetup luksDump /dev/nvme0n1p5
> LUKS header information
> Version:        2
> Epoch:          10
> Metadata area:  16384 [bytes]
> Keyslots area:  16744448 [bytes]
> UUID:           ee8854e8-54f6-4f7b-b326-02fdee357d0e
> Label:          (no label)
> Subsystem:      (no subsystem)
> Flags:          (no flags)
> 
> Data segments:
>     0: crypt
>           offset: 16777216 [bytes]
>           length: (whole device)
>           cipher: aes-xts-plain64
>           sector: 512 [bytes]
> 
> Keyslots:
>     0: luks2
>           Key:        512 bits
>           Priority:   normal
>           Cipher:     aes-xts-plain64
>           Cipher key: 512 bits
>           PBKDF:      argon2id
>           Time cost:  1000
                         ^^^^
This is insane value for argon2 and it would explain your 6 minutes 
unlock time. Usually on my 2 years old laptop I get values in range 6-9 
iterations (Time cost) with 4 threads and 1GiB ram used when I let 
cryptsetup do the benchmark with default target time ~2 seconds. Are you 
sure you did not add --pbkdf-force-iterations parameter in your 
luksAddKey command earlier?

With regards
O.

