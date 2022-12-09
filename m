Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D2F7E
	for <cryptsetup@lists.linux.dev>; Fri,  9 Dec 2022 22:57:47 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h10so6666214wrx.3
        for <cryptsetup@lists.linux.dev>; Fri, 09 Dec 2022 14:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3snNedA3E765z/Ih+zcapKMQIY6u8L3ONLx5RoQmGxQ=;
        b=qxvx5oTouPD3/QXxcNKvFWpZe6u5jqEr+npBhOub7AFDZ0jDNx0ihIxFFs5cYMR/8n
         KyXBocMHLNrWA6x7p1Co5ow5pqKUCsbk08bTkriM4AjzO/+FciQBJTd2KdFXbPjQAMfg
         B1hj+CFKwyjJhCtD07uhi0TGCaofpqU1P9qm6S742NvsN9PdFI5ibjasCccrr2G5sEZd
         olzwy4E6FH3Itxq5207ulkgWku00DQ+AvyhIrZzelah6bc9SjANF+a17gFKuXdOZMWKo
         QBTOGRFmBJxrB6/Eupv0JfRFKpd9LMRBpf2xaSNvpWrFMsQvWkpFFXR0Nu500QeXsVWK
         c1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3snNedA3E765z/Ih+zcapKMQIY6u8L3ONLx5RoQmGxQ=;
        b=T7XyVajJlbXmiaEWX+ydj2xYK9/+bKrqHh1G8lpeDJ6rQSlaSV40dofyKEolUmEX7b
         9l9oilF/7BSU2Zy52XM0nxzVMOvrpcRnUjIzlf0q1XyCWhu0tomqcXQgxe5V272TPSCa
         TLF2iBng2M+AOTpvCQcRsokDvhONxVbNmLVowsuRl1kt2IA96tVTWCRFbG7SlXMciLd0
         iS6UFU013nwzSxeCUZTlk/mWIs2r8MxCeIpFrQZM6B9Tn1GVSbxatFtzkcJL0RNYNrmT
         lR64NNE86kBZwQb3ZuKsvG3N5cV1A7dAMa6i0epk5F7SZi1jLW2MnCDOieLTFb24pgxf
         hbLg==
X-Gm-Message-State: ANoB5pm5iGF7anY8/9pr6GVRxVei88T6V0E2YgtX696KPP81o0rn2uSe
	2M4Zpkn10Ht09ePVAL4pE0ZZWzOAHQg=
X-Google-Smtp-Source: AA0mqf4bKYyiszsppNHjQKF1o0uZGjG9T42Dwl2gwt7CDc1XetYLQO8JHcxaeV4qhRvLAe3x13oA2A==
X-Received: by 2002:adf:a4c4:0:b0:242:83a:6f98 with SMTP id h4-20020adfa4c4000000b00242083a6f98mr4974392wrb.16.1670626665505;
        Fri, 09 Dec 2022 14:57:45 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:7d40:97e3:68d0:9a5d? ([2a09:80c0:192:0:7d40:97e3:68d0:9a5d])
        by smtp.gmail.com with ESMTPSA id bt4-20020a056000080400b002365cd93d05sm2425091wrb.102.2022.12.09.14.57.44
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 14:57:44 -0800 (PST)
Message-ID: <69f9a846-4f28-0cc2-95b9-0e826093d3ce@gmail.com>
Date: Fri, 9 Dec 2022 23:57:35 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: cryptsetup@lists.linux.dev
Content-Language: en-US, de-DE
From: Lamy Geier <lamyergeier@gmail.com>
Subject: LUKS container inside Full Disk encrypted Drive
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello!

I have used Full disk Encryption using LUKS. But with login the entire 
drive is unencrypted.

I want to lock some sensitive data (about 1 GB) and access it only when 
I want it. Is it recommended to create a LUKS container of 1.5 GB inside 
the partition? Is there any other best practice associated with LUKS 
container inside another LUKS device?

Note: I found the procedure at [LUKS Encrypted Container Chuck 
Nemeth](https://www.chucknemeth.com/encryption/luks-container), which 
uses dd to create an image file and then encrypts it with LUKS.

-- 
Thanks and Regards

Lamy
