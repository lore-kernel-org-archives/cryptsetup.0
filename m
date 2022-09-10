Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9DEEA2
	for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 10:28:16 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso6780661wmc.0
        for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 03:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ngmgMN2k4EdUIEBQ5aiYC77/+yDrEtptW7mHB9gPx9A=;
        b=Ijc/RfgjQVJtD3NgHyOSReGd4i/jVkK1+Fqwl8Yc/dAFCZRCxr5pVdsCIGY8W8OmDb
         1YwSkcMq+nsRHbWxGjWJvsFFm2bxkEI8c0p7HIc/c4L270RJa21yKd8UFfI6JvRYdPcP
         j5XkTq/f5ZVoPFLHLHgAFm2VpiCZ+5V+UjTMwr6sXzvIy9n5I/N++5Alma4k7dLtcYdD
         fNgrMGUJUixaCQJd42lglgS9mab92ZRGaHEoqowA/eDFTG3+BNIbpSzdr6LHWGdbvUxP
         cqxnuhFew5YZZdzUhrDsvQWNmS+jFnt4y+/ynGMcCg7gx6AI0amkT4h8fHfFYMXAxhc/
         AWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ngmgMN2k4EdUIEBQ5aiYC77/+yDrEtptW7mHB9gPx9A=;
        b=0RI+TsbVjagImNbXnP9Hyxzlmeq7zKOEDCtYLZhVw5tl4EJvKgOV1f6sSgG1mVdfxY
         M2dpPEOq+2E0zzsFa2fkApTROZR2pO00YbSxAWQA3Sq+KVAKijtVxNmrl2cvG/Gieulg
         WXPtOOVr+cxGtzgmVidKYlA1aLJ4WGpbdhduFrTex4KljFg1sA9LuROntvJ6L/2+4UUG
         WQqun44tLvJEvqh9EiSHtGN4cL4evY83l86eVtVBJ9wSPVelb+zYeov7q2obR+nYK6wS
         FvkSge2YYXHm+rlsGToaaAqJYx71h13DA5s8KtXoIWpUFanufKM2quP4gUWFJsNnltnu
         y8nw==
X-Gm-Message-State: ACgBeo0vWbTL97sD/JeHMC4AwP/XRH2B88oaevf8a0EcEnoAQbmPh+IS
	E2/J5wCD7uwI6vab7QmH/PSl0/uNcu0=
X-Google-Smtp-Source: AA6agR5ErQF8qY1eBnWZ6wsFPa0bnc9BL4KBrijYHU0CidZv78h/N6RMCsumufzNY5JTWBuRK30QkQ==
X-Received: by 2002:a05:600c:1497:b0:3a5:f608:d765 with SMTP id c23-20020a05600c149700b003a5f608d765mr7666774wmh.19.1662805694650;
        Sat, 10 Sep 2022 03:28:14 -0700 (PDT)
Received: from [192.168.8.101] (78-80-105-246.customers.tmcz.cz. [78.80.105.246])
        by smtp.gmail.com with ESMTPSA id k9-20020a7bc409000000b003ab1a870daasm3948354wmi.5.2022.09.10.03.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 03:28:14 -0700 (PDT)
Message-ID: <8d17f923-271f-d0a2-f28a-5cbc910b6513@gmail.com>
Date: Sat, 10 Sep 2022 12:28:12 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: sha256 in "AF hash" despite using sha512 during luksFormat
Content-Language: en-US
To: "doffloster@gmail.com" <doffloster@gmail.com>
Cc: cryptsetup@lists.linux.dev
References: <CACHosL-Nxs5dHJddw8RjqnK4d7OewzA2FT6G1ZQcAhw=PzLLpQ@mail.gmail.com>
 <7f403984-bd0d-9b75-d0eb-0cacbb41810d@gmail.com>
 <CACHosL8YcOXCouZvhTX4rn_F7buVj7tdiefEbHvgGwbfC3t-CQ@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CACHosL8YcOXCouZvhTX4rn_F7buVj7tdiefEbHvgGwbfC3t-CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2022 09:26, doffloster@gmail.com wrote:
> Hi Milan,
> 
> I appreciate your reply.
> 
> Note that I don't have a very good knowledge in crypto.

Then it is always better use defaults :-)

> 
> I prefer sha512 over sha256 only because I've read that it is slightly
> more difficult for GPUs to brute force, because they normally have
> 32bit operations.
> Links to two sources (same author, "Thomas Pornin"):
> https://security.stackexchange.com/questions/86082/hashing-algorithm-for-cryptsetup
> https://security.stackexchange.com/questions/40208/recommended-options-for-luks-cryptsetup

Both are obsoleted for LUKS2 as we switched to Argon2 from PBKDF2 for keyslot
password key derivation. This is what is important here.
(Argon2 is memory hard algorithm and uses internally Blake64b hash.)

For the remaining use of hash (digest, AF, checskum etc) there is no reason
to use anything else than sha256. Of course, you you can, but it will not improve
security of your device.
  
> I don't mind the relatively minor performance impact for read/write operations.

These are not used for data, only for key derivation and has no impact for any
IO operation.  (Please read cryptsetup FAQ document, I think many things are explained there.)

m.
