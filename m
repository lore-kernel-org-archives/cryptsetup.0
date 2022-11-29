Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE2BA28
	for <cryptsetup@lists.linux.dev>; Tue, 29 Nov 2022 20:19:55 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id vp12so35291653ejc.8
        for <cryptsetup@lists.linux.dev>; Tue, 29 Nov 2022 12:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AqoAIp4nr4j4WWn16wAbBpkWj5IHFwAVAwnOenLiOI=;
        b=mEYsMy/pL8HvyB1MNJNT3SsVPpQJWI46aatzROcYXp4VmrbWv7gQc9RgX8GKP7gqF9
         rP0bQ4kZbfVmqQbc8xkwrz3/ppgCiZRaClhRs1lQ8Er/wCmIw9HNiVU5tbCVyW/CB82D
         GOu5l1AqIBVgLtHFpgY1Q//DZxGuWJKhnyjSjwkrqUBzCbsI8YDdXteYuq1TPnzcefOh
         R2bLZlMygQc0fRgLp4oI+TLel2F2avtF7k781TfgyBUroEw762krVy58wMuEzzPv3PS7
         HMgJNJaB8syQELO+WDZYlSnG5Oyd5Lmm7OKLAGoyii/Xokz6hNimFy3rowi1yTFAiBs8
         j9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9AqoAIp4nr4j4WWn16wAbBpkWj5IHFwAVAwnOenLiOI=;
        b=1+vgSOz5cd/K8iHHtbpofMdEdm/m7XN5fgTSmJxozmZQkEw8byjY4A4Gehco0r1cgm
         JwCcBI2yktPQ5L92BZEs1soHG43vL9VfNRVl+U4+zn+YmxMh8Lbeo1JGxA+wLlp3rxVX
         hMihtuAbJLadBqyE+GJenY2bYm650XuceTVTFbhOTJInOxavVsWuuBRqAACoCiVrzhcv
         n2Y+BpBwPwb1PMiOvE8hbUVaeB7qvSeccDYgH8wpJzI9GDmbPqJyMsA08vXhTWqCco/O
         Kb/BXoPGdEggkbZnqiaVJZvlY456m0YUFizBmIHKLC8Wp+NssYTo6d+BbgBJiKy8HEqb
         qUbg==
X-Gm-Message-State: ANoB5pkQNFTsgJdflaQuvbEWOkCTzJ4uH3BOStHoIn6cI0CpKJqeFZS+
	b1oReYdgNkeT8mZVuiYf3tPPZJ9djfk=
X-Google-Smtp-Source: AA0mqf41tKLoTUUQRWBz3gGrlEVXJ1KOh5ykyM4XRYHBa90+4H+QGGFJh0yHLJ6k7IpeKIizSHWgIQ==
X-Received: by 2002:a17:906:2785:b0:78d:98a7:2e7 with SMTP id j5-20020a170906278500b0078d98a702e7mr31788429ejc.535.1669753194251;
        Tue, 29 Nov 2022 12:19:54 -0800 (PST)
Received: from ?IPV6:2001:a61:ac8:e002:982f:781e:b730:5a95? ([2001:a61:ac8:e002:982f:781e:b730:5a95])
        by smtp.gmail.com with ESMTPSA id m11-20020aa7c2cb000000b004618a89d273sm6649673edp.36.2022.11.29.12.19.53
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 12:19:54 -0800 (PST)
Message-ID: <84bc33e5-c264-c1bc-a17a-9e4229a08a1e@gmail.com>
Date: Tue, 29 Nov 2022 21:19:50 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Slow unlock of the LUKS device at boot
From: Lamy Geier <lamyergeier@gmail.com>
To: cryptsetup@lists.linux.dev
References: <15a19597-423a-8fc0-02d9-3ea4da34b490@gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <15a19597-423a-8fc0-02d9-3ea4da34b490@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

# Observation

For the slow partition (that uses LUKS2 and has LVM) takes about 6 
minutes to test passphrase as follows and returns a warning "No usable 
token is available."

```bash
sudo cryptsetup -v open --test-passphrase --type luks /dev/nvme0n1p5 
--key-file /etc/luks/boot_os.keyfile
sudo cryptsetup -v open --test-passphrase --type luks /dev/nvme0n1p5
```

For the boot partition (LUKS1), which used the same passphrase and 
keyfile as the above partition it takes just 5 seconds to test passphrase


```bash
sudo cryptsetup -v open --test-passphrase --type luks /dev/nvme0n1p1 
--key-file /etc/luks/boot_os.keyfile
sudo cryptsetup -v open --test-passphrase --type luks /dev/nvme0n1p1
```

---

Also, I did cryptsetup benchmark as follows

   ``` bash
   $ cryptsetup benchmark
   # Tests are approximate using memory only (no storage IO).
   PBKDF2-sha1      2631307 iterations per second for 256-bit key
   PBKDF2-sha256    5637505 iterations per second for 256-bit key
   PBKDF2-sha512    2118335 iterations per second for 256-bit key
   PBKDF2-ripemd160 1115506 iterations per second for 256-bit key
   PBKDF2-whirlpool 1006310 iterations per second for 256-bit key
   argon2i       9 iterations, 1048576 memory, 4 parallel threads (CPUs) 
for 256-bit key (requested 2000 ms time)
   argon2id      9 iterations, 1048576 memory, 4 parallel threads (CPUs) 
for 256-bit key (requested 2000 ms time)
   #     Algorithm |       Key |      Encryption |      Decryption
           aes-cbc        128b      1727.7 MiB/s      6931.8 MiB/s
       serpent-cbc        128b       116.2 MiB/s       868.9 MiB/s
       twofish-cbc        128b       252.9 MiB/s       566.7 MiB/s
           aes-cbc        256b      1313.0 MiB/s      5684.8 MiB/s
       serpent-cbc        256b       120.3 MiB/s       867.2 MiB/s
       twofish-cbc        256b       257.5 MiB/s       563.5 MiB/s
           aes-xts        256b      5342.5 MiB/s      5333.8 MiB/s
       serpent-xts        256b       748.8 MiB/s       783.1 MiB/s
       twofish-xts        256b       517.7 MiB/s       530.6 MiB/s
           aes-xts        512b      4779.9 MiB/s      4819.2 MiB/s
       serpent-xts        512b       756.1 MiB/s       779.9 MiB/s
       twofish-xts        512b       521.5 MiB/s       529.2 MiB/s
   ```



- Is the warning responsible for this slow behavior: "No usable token is 
available." Or can you suggest if I should tweak some key parameters or 
change the order of keys in keyslots.


-- 
Thanks and Regards

Lamy
