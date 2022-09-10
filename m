Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9F57FE
	for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 05:25:55 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id b35so5437915edf.0
        for <cryptsetup@lists.linux.dev>; Fri, 09 Sep 2022 22:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1JvNLA9aVwQH5FJ3jTcL2dD3RCrPiJq7XvYfZmfjZhM=;
        b=CPxImBmm/Q6gxNygXTihS8bZgwkKpC605X89RpdZTO8eV1gsMdoI0efWsnRv17gWDb
         8f3D1nxO4QMjnr1IlT3FVF0yIoQOSswN0G+NgAc9FFKiP/PfFlC5ruKqo8RlpG7iW8l1
         dx4WDJAmeWPNlosnKpIVlJXfgaysMmKc1ZloPLALhNa0bKQVHbtvOyq/zCyMUxa2SKql
         +VymoIJrIzIjc/i6eaTkgzkqfCuMIHZUcwHK7iYOyrQXBSEheRwsttInoHVg3rKJ2ndd
         Yj3uP9PWWr2SQDe/zHWlpx3Tnjlx6b2hTEKUC4zAeGmMCm73hGXcsk60DyjPZ5d3pkSH
         cv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1JvNLA9aVwQH5FJ3jTcL2dD3RCrPiJq7XvYfZmfjZhM=;
        b=tksBHn3ulrrqtG5rsloCtzhIQULde9zW3xaNAkNpvbMtQndDW0HfJbxa1RggvbAkCT
         MtXnQtIxAJJnGOmFoC34BuwwZ7pCdXATh/VNbbPEaLw7RLD7B/M0vGiW+YaPIJ7FkEJA
         DrUiAxl+bm5PGptK4MeEbYG3FuldKHjmCh202kCqR1iwdWP/CqB4utk1ppEKhOnOHGqo
         pz1GBlz+SDCC229zPzBvCXcFYGf+46pjXcZZR+kr41AtjYGstlkNT7KCuh3a0XcqhCzS
         o8Ba0v3A47F5QtkdBCMX3kQtMR3vYWGk3LDw0TRpjrj539BxuAU5OQ9NhVJa3INOE7Ci
         sNCQ==
X-Gm-Message-State: ACgBeo2s7+z18/bU7sWfATm36J22LJAFOvl1+l47xNaPVhhzYU8b8BV5
	DCbSnWXFRQikMKHZLvTlchE=
X-Google-Smtp-Source: AA6agR5Ta2LtTGYan5mkRIn8KZJdjALExwfzUFHcR1bvuA9GGUUBDdFF0envu2bnycOFNmcAKKZKjA==
X-Received: by 2002:a05:6402:54b:b0:44e:ac69:c617 with SMTP id i11-20020a056402054b00b0044eac69c617mr14219348edx.64.1662787553500;
        Fri, 09 Sep 2022 22:25:53 -0700 (PDT)
Received: from [192.168.2.27] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id v17-20020aa7d9d1000000b0044f21c69608sm1528315eds.10.2022.09.09.22.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 22:25:52 -0700 (PDT)
Message-ID: <7f403984-bd0d-9b75-d0eb-0cacbb41810d@gmail.com>
Date: Sat, 10 Sep 2022 07:25:51 +0200
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
To: "doffloster@gmail.com" <doffloster@gmail.com>, cryptsetup@lists.linux.dev
References: <CACHosL-Nxs5dHJddw8RjqnK4d7OewzA2FT6G1ZQcAhw=PzLLpQ@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CACHosL-Nxs5dHJddw8RjqnK4d7OewzA2FT6G1ZQcAhw=PzLLpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2022 00:50, doffloster@gmail.com wrote:
> Dear cryptsetup/LUKS Team,
> 
> I was using sha512 in the luksFormat command.
> Later I used luksAddKey while thinking that it should be using the
> sha512 hash that I defined in luksFormat.
> But, when I did luksDump, then I noticed that the field "AF hash" for
> the second key (which was added via luksAddKey ; its keyslot is #1)
> contains the value "sha256".

The digest hash remains the same. it is changed only if the digest
is recalculated later (reencryption).

(In LUKS1 there was only one hash algorithm used for everything,
in LUKS2 you can have different algorihms per keyslots, digest and AF but
for digest and AF there is no API co change it later.)

BTW SHA512, specially for AF, is overkill, it will not help anything.
Why do you want to use it there? The whole idea for AF is just to
diffuse the key on a larger area - any hash algorithm here works ok.

For digest it has no security improvement either, as the input is
randomly generated key and if you want to run bruteforce on it, it is much
faster to try to decrypt some sector where you can detect correct plaintext
than to use slow digest PBKDF2 here.

m.
