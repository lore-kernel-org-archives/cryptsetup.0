Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8710AA4F
	for <cryptsetup@lists.linux.dev>; Mon, 21 Nov 2022 08:42:55 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id ud5so26818579ejc.4
        for <cryptsetup@lists.linux.dev>; Mon, 21 Nov 2022 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDBN8XW7ovPkLOX3Sd7DvBxBVl3tDDHw01LNUXscfQg=;
        b=ahY4SPU3LbsivaY1HshEBq6AnpySGMqAxn5A/im9pzMbYTCxUIIg1dlnxe5EDkx9YL
         4nw6KQZV1YOH5nVTSWnxSywzZBMMxCA5Wa5UtT0MzLD9RgNF1OCWV0zEEtz9o54FmId/
         hhqRKuOkN/6Y1fXn+1FBavpcabSmY+UiL3gH8cs7a66Bykh5vxOiF6S25MhRanhF2aS8
         M7FHCjIqdP1QzLX3gxxhJxnG9Re7jKAgDVLva9GvK2/SJvBxToey1fTQdAbEhaMT429v
         IAQqEFbfjv/yTYvmAIcOkSh451o8l/Qi0Z2OsTFO4yCAMXW45KLcmAc+00l/uuzz+7el
         5sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MDBN8XW7ovPkLOX3Sd7DvBxBVl3tDDHw01LNUXscfQg=;
        b=LQSKS3lDXMChpEML37HBM/TvdBirG5H+WV9dM8bW4DS/Y3kWiEqFL8TuhkNJ+MS+Gk
         DeAdCKPgRNPM6rKn9xTPRnbXeEfPlTTi3Lj4+f2I74B+fLoiRKVwipDRLPiuG1lC1Sb+
         waO5bMS6YUAoKLAUxkG7TV4uNSjGq1+IGpLHXOaR+LbOG/Q+kB9hrUO5wsW8UwS0g4NC
         ap6Ce/05mp79tzpknDt+khJp+vtmoCyPMkJDoWo3jN59SFZWPXsoZ3G7ocgPlDxZ5rlW
         INubCOliLPVQTx5YLSZQHkQFJCpzPVReAU4/LgsliOXAGVDuzSJ0KiCHgtXx6vNY/BUe
         DKkQ==
X-Gm-Message-State: ANoB5pkGFW1rKk11jKzPT7PivnyPgNjYjvSGHrhvHKUELBzajQ8i1rVq
	5rE/SVqy14IcKWJCN2JTwlVxAUC6rPw=
X-Google-Smtp-Source: AA0mqf5cajwyIxObft4jN71CzFS3R4g+Xa9P9RwaZ91PPDJf/uvZXLvasjoJEGXAHDaAI4GJW9mwDg==
X-Received: by 2002:a17:906:7ac8:b0:7ad:c8d6:bc7f with SMTP id k8-20020a1709067ac800b007adc8d6bc7fmr14308738ejo.118.1669020173759;
        Mon, 21 Nov 2022 00:42:53 -0800 (PST)
Received: from ?IPV6:2001:a61:a82:ad02:e6f9:f45c:5b7:c62f? ([2001:a61:a82:ad02:e6f9:f45c:5b7:c62f])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906198600b0076ff600bf2csm4739052ejd.63.2022.11.21.00.42.53
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:42:53 -0800 (PST)
Message-ID: <5b560ee4-2813-6aa5-484d-1754e118bb90@gmail.com>
Date: Mon, 21 Nov 2022 09:42:37 +0100
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
Subject: Single User (single or multiple keyslots with similar or different
 passphrase)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello!

I am a single user and owner of the data in my laptop. I was wondering 
if it is any better to have single or multiple keyslots with same or 
different passphrases. I am using LUKS2 on a partition for root, home 
and swap volumes (LVM). And LUKS1 for a boot partition. Please suggest 
which of the following is better choice and why:

1. Should I have single passphrase and single keyslot for LUKS1 and LUKS2?
2. Multiple Keyslots for LUKS1 and LUKS2 with same passphrase.
3. Multiple Keyslots for LUKS1 and LUKS2 with different passphrase.


- My reasoning was that may be having redundant information, it helps in 
times of crisis for recovery.

- Note: The data will be owned and used only by me.

-- 
Thanks and Regards

Lamy
