Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DA729A8
	for <cryptsetup@lists.linux.dev>; Thu,  3 Nov 2022 20:59:57 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id f27so8620449eje.1
        for <cryptsetup@lists.linux.dev>; Thu, 03 Nov 2022 13:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vl4OCdoFLsMxwAT1VY63W1kXDWJWsprIlCIQXNpsAV0=;
        b=W3u2laSzFhZx7OTpbBOHprzGmIzCGO/EnTHwOl73AJ+J9wJvP0qJv2OrhQPew8vw3k
         2DPzc9EjTosZvlKfEORaqF+fVp5yQmT3tlC6pDCJNxLBisQIsYc/aiH71YSUCZaxM7p0
         HxsqfMcU5GhDVoxVF69Lfqe6urRZPlzXPHV/eIgLIBoYgveYzRVOQd6xyTZxebLLggLX
         40ZafAfvkUA1vKeAy0WrYi3lZ/YdJD96F7mVF7Vyv4xf7HVYsD8mIi0f0g3xMdCfuBP0
         1Fshc9THmdHOmVanc+WU6rVwbZa+1PvEIgR+GyZSB0ghnxyAxemsbulBi/Aaub2HmLL8
         VCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vl4OCdoFLsMxwAT1VY63W1kXDWJWsprIlCIQXNpsAV0=;
        b=HvAi2M7OCMcypkrCgUnGCwWAazpDDgmknmx/YdrBkHABZ3QZoeLiD1XEIqz/Fhr5Hw
         KbBpv8FaICZgSQwPQGPdguaUJ8NiAU5F2WUPS66Co8dRl1aI7saIY4c4pIWVVZcKg/3k
         rPKqW1zW1FUUJ8vrfh8UCrYuqySAPjtyWBQvA7A/j7u8hVyGIKgEFr5VNnARPz6bWMZx
         eTmpPrydxyobm47fJWYXfq1fhEQ8xNDXxmVuReXH7Y2fJ2SvySxc4Tx4w0swBYIbGDh5
         CcKFZfwjWMHtYNsSHMWE7bMafC2bQfqOwECONTFtUKUyVWVdUdFNu0ig0J5cLhDl4sUE
         JJXQ==
X-Gm-Message-State: ACrzQf0bmnt/GPORvTCZXs1J3BCNey5QiQn1zL9RVpgqzi00qmroDBEX
	oYLM45J7/TABS5x7mEO6fHYO5BGHrWp5mw==
X-Google-Smtp-Source: AMsMyM5Jsu7fjyXasdcW1682lggOL+CPdCHXxlK+l1zzB+++YcVqtjnaVtEOmx3rDQY20Pwf3RP4CA==
X-Received: by 2002:a17:907:6d9b:b0:78d:f24b:e358 with SMTP id sb27-20020a1709076d9b00b0078df24be358mr30278024ejc.714.1667509195921;
        Thu, 03 Nov 2022 13:59:55 -0700 (PDT)
Received: from ?IPV6:2001:a61:3aed:e502:8df0:f2ab:8194:fdf2? ([2001:a61:3aed:e502:8df0:f2ab:8194:fdf2])
        by smtp.gmail.com with ESMTPSA id v4-20020aa7d644000000b0044e01e2533asm964574edr.43.2022.11.03.13.59.55
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 13:59:55 -0700 (PDT)
Message-ID: <56bfad6c-2ddc-b095-f57e-b6675ce29cc0@gmail.com>
Date: Thu, 3 Nov 2022 21:59:54 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: cryptsetup@lists.linux.dev
Content-Language: en-US
From: Lamy Geier <lamyergeier@gmail.com>
Subject: Questions about Backup and Restore Strategy for LVM2 on LUKS2 and for
 LUKS1 on boot partition
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello!

This is my first ever post in any mailing list, please be a bit 
forgiving. First of all do I need to subscribe to 
cryptsetup+subscribe@lists.linux.dev to receive a reply? Or replies to 
my email would be delivered to me automatically?

I have read the entire [FrequentlyAskedQuestions · Wiki · cryptsetup / 
cryptsetup · 
GitLab](https://gitlab.com/cryptsetup/cryptsetup/-/wikis/FrequentlyAskedQuestions), 
but I am a beginner and inexperiences and I would be happy to receive 
any suggestions.

## Operating System Installation with LUKS and LVM

I have installed

     - LUKS1 on ext4 `/boot` partition.

     - LVM2 on LUKS2 in a separate partition.

     - In LVM2, I have one physical volume (my NVME SSD), one volume 
group consisting of 3 logical volume all formatted with ext4: `/`, 
`/home`, `swap`.

     - I followed the installation of Ubuntu 22.04 instruction from 
Ubuntu Community Wiki [Full_Disk_Encryption_Howto_2019 - Community Help 
Wiki](https://help.ubuntu.com/community/Full_Disk_Encryption_Howto_2019).

## Backup Startegy

On an external drive,

     - I want to use rsync based [linuxmint/timeshift: System restore 
tool for Linux](https://github.com/linuxmint/timeshift) to backup `/` 
logical volume.

     - Further, I want to use rsync based [bit-team/backintime: Back In 
Time - A simple backup tool for 
Linux](https://github.com/bit-team/backintime) solution to backup my 
`/home` logical volume.

     - I am going to backup the LUKS header of both of the above 
partitions (one of which is `/boot` and the other is the LVM on LUKS 
partition).

## Questions

1. It was mentioned in the FAQ to avoid the LVM if possible, but 
unfortunately I read the FAQ only after installing my operating system. 
Could you please tell me if my backup strategy is enough to mitigate any 
disaster (expect that I am not keeping a third backup as per 3-2-1 
strategy)?

2. What exactly I need to  be careful about while using LVM on LUKS?

3. If the pre-boot authentication fails in case of disaster, I am 
wondering how will I mitigate it. Should I be using a LIVE USB and do 
LUKS1 Header restore for boot partition and then open it using 
`cryptsetup open` and inspect if the data got decrypted? And the same 
process for the LVM on LUKS partition to inspect if the root directory 
is decrypted?

4. Regarding timeshift:

4a. Do you think I would be able to restore my system?

4b. Also, do you think I also need to backup the `/boot` partition with 
timeshift?

4c. I am not exactly sure how the system restore with timeshift work. If 
the LUKS header have been restored as mentioned in step 3, will the 
timeshift be able to restore the system from the external drive after 
the pre-boot authentication. Because the LVM on LUKS partition is 
unlocked during the bootinf and not right after pre boot authentication.

5. To restore  the  home logical volume I can do it after the operating 
system is loaded. I was just not sure when and how will I be able to 
restore the  root  logical volume and the boot partition .

6. Anything else I need to be careful about LVM on LUKS?

Thanks and Regards

Lamy

