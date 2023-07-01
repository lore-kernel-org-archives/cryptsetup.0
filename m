Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D146D2F32
	for <cryptsetup@lists.linux.dev>; Sat,  1 Jul 2023 21:00:20 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-314313f127fso382900f8f.1
        for <cryptsetup@lists.linux.dev>; Sat, 01 Jul 2023 14:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688245219; x=1690837219;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFim9WdsCKhI4HrccRxR01KN2kEl1ndLt/kOcEp6v/w=;
        b=g/YZrvW1+XriAH3BAz7WpX8cHzPrqpIMOQCfOw66qtKimBAE7A85eRS8mZu2YywymH
         41gQJLEq8XYjBnJ/ZGthKBZ8QicmNKsZoCm3m7tVka8wyrHPVD1lPvx4vZfQ3QbtFivL
         q+Z8l5+6kJFxk97HI2F+vcz9IDMmyDDfQHvzy4TZqxXXAVt3IOMHyc2/fe0jKUl6dFdV
         ZY7hm2w59zt05pQzZ6/CnhuJ8ysWO4ww3dtOyzYAa1sDgvo4hP/lfLDk8Ex2AuKPEqSc
         IMYIhdQBRCuTfit/lQiFcHx9uSQ2M25gUprRPvirskcPkyR+kJVnguxTXQnxISeU5Pxk
         iSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688245219; x=1690837219;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFim9WdsCKhI4HrccRxR01KN2kEl1ndLt/kOcEp6v/w=;
        b=EaVOxQ+7ZNYheUdMpO5dBvVDSRRNq4RHvkeejIugmkH/fA90YauWgJc71JgmTIDyGf
         Y+iHze0QSvJxobBDvjWElBDackBnjCVmez2Hlzl10qyEou4jifXBhpLI4CyA6oaKvXKd
         T8faCu1TW3a1koBIKKnk/XYl0+gjDSnMt+sYLsBM1xJC8l7yhW4aODw58UP9mkA/HzWa
         aenVWPF8plEzOKB1mWCnlY1MQTaxA3Mb2TR5H5s67xvY1obUd4nlDwuk7m1hpFKdE1Ac
         pyYwaCQLujyLlYSR0jwJPTr9iUr3iEdP/ecJs2p2+JkjceTdAHCsGO4BXens62kOirTj
         t8Nw==
X-Gm-Message-State: ABy/qLbhGfdmv0MFNhjhHBfEoOS8RJ4jj3XbUh+JbXMkhsEFUJ9I6OGt
	kxSN3nBR0T9H+kX449RJscQ=
X-Google-Smtp-Source: APBJJlFColukg4Nya/uG9EcLOzTywO1llvzev5+/Oi931QhKIrnpB09GmaDt1VNPrXX++ZPgLWydfQ==
X-Received: by 2002:a5d:5543:0:b0:314:1dc1:6178 with SMTP id g3-20020a5d5543000000b003141dc16178mr4510097wrw.1.1688245218588;
        Sat, 01 Jul 2023 14:00:18 -0700 (PDT)
Received: from [192.168.8.101] (37-48-42-197.nat.epc.tmcz.cz. [37.48.42.197])
        by smtp.gmail.com with ESMTPSA id x5-20020adff645000000b0031432f1528csm210165wrp.45.2023.07.01.14.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 14:00:17 -0700 (PDT)
Message-ID: <7424eaa5-ea88-d746-9bc6-e8b04cc48769@gmail.com>
Date: Sat, 1 Jul 2023 23:00:16 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: Problem after detaching the header
Content-Language: en-US
To: Darek Hisc <darek.hisc@aleeas.com>, cryptsetup@lists.linux.dev
References: <168806625127.6.2008140751957055524.147127853@aleeas.com>
 <baaf0d13-97a2-8846-ca4f-8f89d96ef499@gmail.com>
 <168823123339.9.10246224821676034944.147890655@aleeas.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <168823123339.9.10246224821676034944.147890655@aleeas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/23 19:06, Darek Hisc wrote:
> 
>> - luksErase will destroy keyslots (key material)
> Does it also destroy the Master Key?

Volume Key (also known as Master Key) is stored in keyslot(s).
luksErase removes all keyslots, thus removes all keys, see man cryptsetup-luksErase

>> but still keeps LUKS header on the device, including UUID (so you can reference the device through UUID
>> even if it cannot be unlocked without detached header)
>  From the comments I've received here https://unix.stackexchange.com/questions/750288/properly-detach-the-luks-header-from-the-existing-fdelvm-encryption it also appears that the missing UUID is to blame after destroying the entire header.
> 
>> Check that UUID is not referenced in config.
> How to check?

It depends on your distro. Crypttab, bootloader config, old blkid cache, whatever.
I have no idea, it was just a hint.
The FAQ contains generic info, various distros can have various additional steps
(we should update it to mention it, though).

> 
>> But as Arno said, this is really question for your distro (note that cryptab
>> file can be managed by systemd, but there are also non-systemd versions).
> If it's not a cryptsetup problem, it probably affects many (or all) distributions. I suggest to add the relevant information to FAQ 2.20 because the current wording suggests that the given procedure is sufficient and it is not (because it causes a UUID problem that needs to be solved somehow)
> 
>> Also without console log it is not clear what exactly fails.
> Please tell me what to enter in the initramfs console to check it and I will give you the result
> 
> Another solution that looks very interesting:
> In a comment on stackexchange, someone suggested creating a dummy header instead of the original one, but using a detached one. Do you see any potential problems and is this a good idea?

LUKS header after calling luksErase is actually "dummy" header (if it means header without keyslots).
So I think this is what you get after calling luksErase in your steps 1-5.

Your device can be only unlocked with detached header, but data device is still visible marked as LUKS,
that should be enough if your goal is to store key separately.

Milan

