Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027C6847B
	for <cryptsetup@lists.linux.dev>; Thu,  2 Mar 2023 16:41:05 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id g3so14538907eda.1
        for <cryptsetup@lists.linux.dev>; Thu, 02 Mar 2023 08:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677775264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLfr0VDuEJU56Z+Cci350fqzwT80PI3c+h9+mju4oso=;
        b=AT6/DjCb0IfoSjkb0utv4OYIWQBfgUFEWhlTcYdstHlVP3NhLKsFJiEK6gYWIdr2To
         IVy+NtIi9bdCR1GmgWQlIV5MCgTzG24Kvse9LqQIEgb5uUYnIrirFAPjLhRPtW5le4CB
         7qHReUqjwAwLYqezrYudPx5GG3jfHXz+uxDzy2MEXCtwm1hNub4ApTBktAhL1/AnnCbr
         3VCbIOlqHjlHuaXdqvRwNaiCq0MAEbBm4O8U+S+V87uUf1bOtaFvQ1lGq+BiCS7ExVPJ
         eeutqCbP6s0EfKrzNAqyjDZsGpXTVXgiDomt5Y579aYrHLYN0tLIVvemLNbw1YUsI3Ye
         M48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677775264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLfr0VDuEJU56Z+Cci350fqzwT80PI3c+h9+mju4oso=;
        b=h3PIsCbvRa439ZGCNebevr7j+B6oSnkntO7Hop6BBrmRF55PqTIh5AhosfxyEVw43N
         MYFG+l7if+smnMDcXjfMSjjZpbnmWh0xz9LfrHlAQ8JJioPfIPd7y8RZANuhZNjXklGk
         zh9iKarxNO/27zAfCMW505x5+5cr6L6lLaCHcymgChT4nXX6+27nBjb3Kwz3lDd3Ix6E
         3iV0bPK7l6ld+tlY17lvf2RPfo8gz1RooCpiX4g487LUWBz8x2dsgBzPGDLJgUVWI+Fa
         /aOOQ/HRxjACjr33T11fV0623b7wgMhyp+4N04am4r8KDypecyCpKnOqKjsROiuYQsDZ
         z5sg==
X-Gm-Message-State: AO0yUKWdh7Y4vYkzY2VWzHxkSIXpm82G6X9MLeJDs3DXehnyGcnURHkC
	A8aZkdNdHe2V3XXD9MkjYs8=
X-Google-Smtp-Source: AK7set80REgc8UxStUxN8NUi2nGMMb7kKId/pSZ1nSdCmQ9DEzjYW2ig1YGXd+ToPLO8771nfBjHgw==
X-Received: by 2002:a05:6402:285:b0:4ac:c80c:9a11 with SMTP id l5-20020a056402028500b004acc80c9a11mr11787716edv.10.1677775263990;
        Thu, 02 Mar 2023 08:41:03 -0800 (PST)
Received: from [147.251.42.107] (nbbroz2.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id u20-20020a509514000000b004c0c5864cc5sm62485eda.25.2023.03.02.08.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 08:40:42 -0800 (PST)
Message-ID: <3b08eace-b038-bab1-4f65-f9c322dc90a4@gmail.com>
Date: Thu, 2 Mar 2023 17:40:19 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: cryptsetup - No key available with passphrase
Content-Language: en-US
To: Lars Francke <lars.francke@gmail.com>
Cc: cryptsetup@lists.linux.dev
References: <CAD-Ua_hj1hkymLbyEyT-eNyCj_naiqHqg7nr3nos8tp9XCERDg@mail.gmail.com>
 <64fc6294-ca5e-f7a9-302f-63b09d569586@gmail.com>
 <CAD-Ua_h2GDZexz=DC3YA88nO-OhXKyGp1v2D6rWvHHQVwtCgFw@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CAD-Ua_h2GDZexz=DC3YA88nO-OhXKyGp1v2D6rWvHHQVwtCgFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/2/23 17:23, Lars Francke wrote:
> Milan,
> 
> thank you for the quick reply. I did try that but unfortunately:
> 
> root@archiso ~ # echo 'a' | cryptsetup luksFormat /dev/nvme0n1p5
> WARNING: Device /dev/nvme0n1p5 already contains a 'crypto_LUKS'
> superblock signature.
> root@archiso ~ # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot
> No key available with this passphrase.
> 
> 
> I also just used the `echo` method to make it easier to replicate.
> The same happens when I just press "a" on my keyboard and hit enter.
> 
> What makes it even weirder is that it did work _once_:

Did you deactivate the device once it succeeded?

Anyway, it should work as I described. Maybe you should wipe the
signature before format with "wipefs -a /dev/nvme0n1p5" (but it should
overwrite it anyway or print error).

You can also use --test-passphrase to luksOpen to avoid activation.

Milan

> 
> # echo 'a' | cryptsetup luksFormat /dev/nvme0n1p5
> WARNING: Device /dev/nvme0n1p5 already contains a 'crypto_LUKS'
> superblock signature.
> # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot
> 
> I'm at a loss but will now read the section in the man page that you
> referred to.



> 
> Thanks again,
> Lars
> On Thu, Mar 2, 2023 at 4:01 PM Milan Broz <gmazyland@gmail.com> wrote:
>>
>> On 3/2/23 15:03, Lars Francke wrote:
>>> Hello,
>>>
>>> I am trying to setup LUKS (and I've done it like this in the past,
>>> like...two weeks ago and it just stopped working) and am running into
>>> the following issue:
>>>
>>> root@archiso ~ # echo 'a' | cryptsetup  luksFormat --batch-mode /dev/nvme0n1p5 -
>>> root@archiso ~ # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot -
>>> No key available with this passphrase.
>>
>> This is just a little bit confusing handling of end-of-line if used with "-"
>> (see section "Passphrase processing for LUKS" in man cryptsetup).
>>
>> The first command will create passphrase "a\n" (including \n !) while the second
>> command will process only "a" (you can to use --key-file=- there for luksOpen,
>> it has different syntax.)
>>
>> But just do not use "-" here, cryptsetup will do what needed automatically.
>> Also batch mode is implicit if it detects pipe input, so just use:
>>
>> # echo 'a' | cryptsetup luksFormat /dev/nvme0n1p5
>> # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot
>>
>> and it should work as expected (password will be "a").
>>
>> Milan
