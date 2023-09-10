Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445CE257E
	for <cryptsetup@lists.linux.dev>; Sun, 10 Sep 2023 15:12:54 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-501bd7711e8so6208850e87.1
        for <cryptsetup@lists.linux.dev>; Sun, 10 Sep 2023 08:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694358772; x=1694963572; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhxoDKqOnXjo5rMQpolvXYvcx3wcymnM7xf4/rNEdR0=;
        b=FXhkyUG37Q5m2V0LnT14WDZmIUA8L/dkVkqwJE+k+KmhulxAEaLn/kT2xMksB1ifIa
         SONAZLr4tNL+37o7c2D3ANF6DZrHf2jN9pYbN+5hOqx60HZMatnDoA36Mw09FTqPUIIp
         ygJ83EYuzoOdHctFvioXmGiB85gHFZCl9Z2u876XHMVzQSuPzvQFoszSP1owdBiT0X1j
         e0osGlccRwfRFr73F0GpiDDaiNM0qNg3UIHtGDw8BfknrAupzUM3+yVSxo4sKVQ1YDAG
         t8fVS3FFT6yXYTNT1Afky32Yho0GQQLoDxtjz6FzuoHN2FZ5m8ikFxRRQgzk4CFpKLeT
         Jkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694358772; x=1694963572;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NhxoDKqOnXjo5rMQpolvXYvcx3wcymnM7xf4/rNEdR0=;
        b=UbAH8H9Ccy4hMh0WUFWQbmLgUK7SRG920mo5cryJzNAZAMEpfgTnTbdp7r7yMxos4x
         k2ZpVmZghcfHny9LgCBYbwFAyjO4H6pHiRQbqvckhIwYlQaC4GXsSbQvFTv7HiAHkTow
         SlJzVW14PquXPzAsQbtO/XpOd1gn6yLZtZErC8lRS3TfKH/LMYtih+xgAFU9rsAV/LzM
         sb6ttnyHXfrQLcfxFP+rDj9iDdSsEqacJBV8pR1Z2ob0sa4WTyvxBJVvOmRKMuWplxX1
         qi2M7CecBxSpyRqhLtDHgG0pnCVWg4LjR3sd5RLkNHVT5101nLohI3jtFqJX8iz/WnZG
         F+XQ==
X-Gm-Message-State: AOJu0YzeA/GrvgJOSMWSMtCGSsg7XTYJwk/oQPfYX6oQNxLpyGzZejwp
	6eK5kpJwE9oUSiLb0b4GE5PBNBqqh8HXXPfe
X-Google-Smtp-Source: AGHT+IE5N3P6g4ebZ9FIHZz0AQ3uR+Sdqoa2Wd6HdNWqXsYV9OMbszeBStkbf84jbVg2ozswRu1jvQ==
X-Received: by 2002:a05:6512:23a4:b0:4fe:af1:c3ae with SMTP id c36-20020a05651223a400b004fe0af1c3aemr7655918lfv.15.1694358771765;
        Sun, 10 Sep 2023 08:12:51 -0700 (PDT)
Received: from [0.0.0.0] ([94.177.207.80])
        by smtp.googlemail.com with ESMTPSA id jj27-20020a170907985b00b009929d998abcsm3876514ejc.209.2023.09.10.08.12.50
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 08:12:51 -0700 (PDT)
Message-ID: <4685725c-4b76-47c2-86b8-377b4e1fc7fd@gmail.com>
Date: Sun, 10 Sep 2023 18:12:49 +0300
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: cryptsetup@lists.linux.dev
From: =?UTF-8?B?0JPQvtGA0LHQtdGI0LrQviDQkdC+0LPQtNCw0L0=?=
 <bodqhrohro@gmail.com>
Subject: Is it possible to set the amount of CRC32C hashes per a data sector
 in integritysetup?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I'd like to sacrifice a significant amount of disk space (let's say, 
20%) for recovery checksums: in a way RAR or Parchive can do that, or in 
a way it's implemented in some physical-level media (DVD, HDD, digital 
TV, etc.) Some of them store the checksums separately, some among the 
data; my goal is to store them among the data on the same medium.

Currently, I came up with splitting a medium into 6 even partitions and 
making a RAID 5 array out of them. It seems to work, though I was 
suggested that dm-integrity might be a more straightforward solution for 
the task. So, before I started using the RAID 5 solution in practice, 
I'd like to make sure if the same is possible with dm-integrity first.

AFAIU, the primary goal of dm-integrity is checking if the data are not 
corrupted and throwing read errors otherwise. Though it still supports 
checksums besides of hashes. Can they be used for recovering the data 
on-the-fly?

I've read the manual of integritysetup and still not sure if it's 
possible to achieve a significantly big checksum/data ratio. Reducing 
the sector size lower than 512 does not work. If I increase the tag 
size, would it be used to store a larger checksum, or just would be 
padded to store one tiny checksum per a tag? Maybe there is some other way?

Thanks.

