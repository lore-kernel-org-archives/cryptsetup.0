Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2293273FA
	for <cryptsetup@lists.linux.dev>; Wed, 15 Nov 2023 14:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lukav.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lukav.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lukav.com header.i=@lukav.com header.b="Juh9h7rA"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-778a92c06d6so417696285a.2
        for <cryptsetup@lists.linux.dev>; Wed, 15 Nov 2023 06:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lukav.com; s=google2; t=1700059658; x=1700664458; darn=lists.linux.dev;
        h=content-transfer-encoding:disposition-notification-to:subject:from
         :content-language:to:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zh/CAthE/0R/jLQBBgz4NyLEEnB7Lz56hR9htcO+dec=;
        b=Juh9h7rAOK1ED8oIpiSo/71X81wgWw9I3fsj5tZa3F99sMMCNCdIvZD2ydxen6lHNC
         iMclRgLGTwV7cYrx+oUW0iIQy4uL+q5qFsPYzvfCQnNYEp7GqTO6jocQYC6qu0yUwtca
         HJzPlKKoRQdoot5ji/gIW1GHfsoD2m3jNr084L3f0dyI1M0Zhqtj6nVoWWbyBDLewrmN
         jTitaddAJkQcd+kLZDP1ztAIMlMuHvum/k+pX0PZoZmUUaiCE2Nsj4LWiZkMURCmBPIq
         cqJ5tFTOosU/dbSn6MgxQrRKkEemZXNxsNewsuUvxoP4q7Snmqx+kAeRJRr5zwQJAwjk
         mVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700059658; x=1700664458;
        h=content-transfer-encoding:disposition-notification-to:subject:from
         :content-language:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zh/CAthE/0R/jLQBBgz4NyLEEnB7Lz56hR9htcO+dec=;
        b=X2avcy48rodCHR1AJGsskHAQzYWsIYKAIopq2CgIawpqYH8diOCZ+2bNRk0zS7TgRb
         X/+vfmqUhQZTnErwdbQLLp4oYOCWHNBFJwLjq6lx+tvvRWLR9nLN4oRGFopJZqc506NV
         ZZ5YVRt1YT//hXPMoo9cSzptMEQ2KmBoj1H0ilV93QaAa4p64CLLIAZeL9Jc+D8lVp1x
         /af+ir3Ba7uxG569/51B/FykWzHzHJItRUqDNezzGsdq+wxYh0fEJWyvkvCKwrqbunYq
         HoqcVsuLyCCBLvEsMl5tfazia+7avrWR08IyBXc4Q7mlveeB4VFT8NhYspJbR2hwxUs7
         YYCQ==
X-Gm-Message-State: AOJu0YwOfak3sA6pYNtw6xf6OlQMiW5J25/niiHtTP0T+tgWAOsebmLw
	mV07MNulNA5gpMtXOu1EzF02Knn9Myhll8q1cc4QGA==
X-Google-Smtp-Source: AGHT+IHLJTZAOlDWBnu/Ujue2umaxB5DatxcZfPFifRsiWvYkIQkhvxTufBztJ8dd960IaQVe3POTQ==
X-Received: by 2002:a05:620a:1350:b0:774:19cf:f3e3 with SMTP id c16-20020a05620a135000b0077419cff3e3mr5008828qkl.76.1700059658023;
        Wed, 15 Nov 2023 06:47:38 -0800 (PST)
Received: from ?IPV6:2607:fea8:1bc3:fe00::a7d6? ([2607:fea8:1bc3:fe00::a7d6])
        by smtp.googlemail.com with ESMTPSA id y6-20020a37e306000000b00770f3e5618esm3532228qki.101.2023.11.15.06.47.37
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 06:47:37 -0800 (PST)
Message-ID: <72f6c041-14d4-473e-bcba-7bf3b9fd47aa@lukav.com>
Date: Wed, 15 Nov 2023 09:47:36 -0500
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cryptsetup@lists.linux.dev
Content-Language: en-CA
From: Anton Avramov <lukav@lukav.com>
Subject: Problem after converting to LUKS2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have 3 partitions encrypted years ago with LUKS1.
I've decided to migrate them to LUKS2 and the first 2 there was no 
problem, but the last I can open it anymore after the conversion.

I've been using key-files for all of them, so there is no wrong password 
input issue.

The bad think is I don't have a header backup before the conversion (Yes 
I know! Lessen learned!)

I've tried different things like converting back to luks1 and header 
repair but to no avail.

As a last resort I'm writing here for help. Is there anything I can try 
to at least read the partition?

Thanks in advance.

