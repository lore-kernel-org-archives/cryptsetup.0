Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC482584
	for <cryptsetup@lists.linux.dev>; Thu, 27 Apr 2023 12:01:44 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-506767f97f8so14560061a12.1
        for <cryptsetup@lists.linux.dev>; Thu, 27 Apr 2023 05:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682596902; x=1685188902;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxNI9TzmlZCNqbpEN9RIqKbNtxFxgD+WKfm1uE3X8Vg=;
        b=FeyAB4VC+oBZPUNS7ZKi45fyvoCBdE0fuOCkiDT/MoBQESfayXjFYNsPOf++XHVMn5
         JcbB/82Z+xq8l9qm7nypymdlre57wxmZpMblArcyCO50PynyY0+zCy2iVpYr99WBrb/0
         hGgGG4Qb4uMyjEd+2uoJg5JpA2R2mr2Tt1wV057usNbOlzCKrinuO3bx3XtzDLHHRc7E
         TaYZsMpD+zxGh2hCswKPQwKk2s3x/hVmxm+N/11Dn65r9nCjyZ5T7uj5SI9lCx40lOYw
         6mwzgWN1Rqm0SQiKWC0eSrd561q26ryPuzTnFBY5TkL2p8ZOCOkpPjVJp+DL2ukEIWmq
         O6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682596902; x=1685188902;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxNI9TzmlZCNqbpEN9RIqKbNtxFxgD+WKfm1uE3X8Vg=;
        b=RSGKtJnKOqLa8jh7csOrJLo5MzwL2pu+br84dwx/Kyu5SWjzUy8U4N70l1i2YLWiP0
         w+wyd2YJFjSVxl4ikvq4JeSEsGvSCkMPBDK8Mp787KNxNKOK4ijl7XtH2zh0AqUBi3WA
         0t+Lr8XozZHMc22ltW+1DCdw64BiSwoot+FqLpeLUBdbplL8VbOdh5rgTmoZKE1+ccOK
         g9bkvaeEn2gVCiWfrYLgxQ7jO9NEowsFAgIfLPMMz7C8EZ8C7bGT+3RMamovM4/2hmHw
         Uj1iMkIPT0hTzCu5Xf+9GwGsgoWN71GD+0lXLmcmTtDaPX3DwcGnKnPHypo5u0py0hSB
         T2PA==
X-Gm-Message-State: AC+VfDz5H93i9+Mtf0LKXW5i2gfA+p4KcrtcHGiOkm3fWWv56UjrrUCI
	AKVI3cIzoCLuDfZkTN7UpHw=
X-Google-Smtp-Source: ACHHUZ6rS7RjXGADukzIuPTBXCQ3HUu7HiBv1eJtDs+vEVGU33RJCmdkH+Eg12GEbF+hrW9N7sxgYA==
X-Received: by 2002:aa7:dd49:0:b0:50a:9e4:998e with SMTP id o9-20020aa7dd49000000b0050a09e4998emr1326923edw.34.1682596902196;
        Thu, 27 Apr 2023 05:01:42 -0700 (PDT)
Received: from [147.251.42.107] (nbbroz2.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id i17-20020a056402055100b0050685927971sm7819152edx.30.2023.04.27.05.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 05:01:41 -0700 (PDT)
Message-ID: <eb371bc1-6210-95d7-ee63-d8dc243b7da6@gmail.com>
Date: Thu, 27 Apr 2023 14:01:40 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: Performance issue LUKS1 vs LUKS2
Content-Language: en-US
To: Lodewyk van der Westhuizen <jl.westhuizen@gmail.com>,
 cryptsetup@lists.linux.dev
References: <CABOqr=M+uDDXC-xG_hnxGB-7MZnWUwONizC6c=r5NCYaCz6Pxg@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CABOqr=M+uDDXC-xG_hnxGB-7MZnWUwONizC6c=r5NCYaCz6Pxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/26/23 16:53, Lodewyk van der Westhuizen wrote:
> Hey All,
> 
> Sorry for the long message but figured the more detail the better... I
> was hoping someone could point me in the right direction. I have
> machine that runs two different operating systems + cryptsetup
> versions and I am seeing big slowdown on the newer setup. Please see
> details below:
> 
> Setup 1 (using LUKS1):
> cryptsetup 1.7+
> kernel 3.10.0
> 
> Setup 2 (using LUKS2):
> cryptsetup 2.3+
> kernel 4.18.0

NOTE: LUKS1 is not cryptsetup version 1.x, it ia a metadata format.
All recent cryptsetup 2.x versions can use LUKS1 as well - just use "--type luks1"
in format (so you will compare the same formats on different kernels).

> 
> Hardware:
> CPU(s):                48
> On-line CPU(s) list:   0-47
> Thread(s) per core:    2
> Core(s) per socket:    12
> Socket(s):             2

You mean slowdown with access to encrypted data, not unlocking time, right?

The difference is almost for sure in kernel, LUKS2 is only about key management
(the dm-crypt parameters should be the same in the end).

But kernel 3.10 is really very old, so if it is "enterprise" heavily patched distro,
it is hard to say if it is really 3.10 or it includes a lot more recent backported changes.

Which crypto modules are used? What architecture it is - do you use AES-NI
acceleration on both systems?

> When running cryptsetup benchmark the results are the same (but AFAIK
> it only uses a single core for that).

Benchmark calls userspace kernel API, so it should use more cores
(you can easily see it for CBC mode - decryption should be always faster
as it can be run in parallel - unlike encryption).
But benchmark does not use dm-crypt, and dm-crypt changed a lot between kernels 3.x/4.x.

> I am using the same encryption algorithm/cipher - the only difference
> is the LUKS format (using LUKS2 instead of LUKS1). On the older
> machine there is good cpu utilization amongst the cores but for the
> newer setup performance is roughly a 1/3 of older setup. It's as if
> the other socket + cores are not being used at all.> 
> Here is how I format/encrypt (again only difference would be luks1 vs luks2):
> 
> cryptsetup luksFormat --verbose --batch-mode --type luks2 --cipher
> aes-cbc-essiv:sha256 partition

Is the keysize 256bits in both cases? You should paste luksDump from both
systems to be sure.

> 
> Perhaps I am just missing a flag with the new setup?

There are some flags to try that can help (basically revert dmcrypt behaviour),
search for "-perf-*" flags in man page.
Try luksOpen with -perf-same_cpu_crypt and/or --perf-submit_from_crypt_cpus
for luksOpen.

Also, you should use XTS mode, its should be faster here (at least for encryption).

Milan
