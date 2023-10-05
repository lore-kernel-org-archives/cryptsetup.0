Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F13125CE
	for <cryptsetup@lists.linux.dev>; Thu,  5 Oct 2023 11:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcvVLORp"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9936b3d0286so160765166b.0
        for <cryptsetup@lists.linux.dev>; Thu, 05 Oct 2023 04:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696504747; x=1697109547; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPCFo7r6KpKGeXwsxg6IKAJOGQsf6pXe2JimheezSnU=;
        b=ZcvVLORpvq+a4qvSmVxxMZ58HwuzLjGtKRlk/g3CfcGWHthhnxIUDC01r1Z4pLpHw5
         oVtar2LBOkecyKv7sHdGu9GS6OMAAPKP9ogkj+lxThZsIiQVX2G87k9JKxV/zqLKcMXx
         opOliPXpDa/UZ/cFgd3CsDFQA0Vw4KbwgjH8y9jxEP4w9y3jDxtzsppnUcxQegKuwCdl
         AtSeRT2b8/fi8x6Po0em5gxoa1WQoQKhxpklN8GHrKx5o2hPtVXv5vwNhZ3t9l6OfVwP
         tTsMczusgVC+p3yfJl/DCZD1HmuX/XN9GbHZy5e/6Ihus0nF6bJOPL8q6WOCyeTfVDki
         23tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696504747; x=1697109547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPCFo7r6KpKGeXwsxg6IKAJOGQsf6pXe2JimheezSnU=;
        b=pJBAxTf81LcC35mM3Z5bA9XlsPC9SXALe3lpztU6YQRy2QM4nim7ewyKaESurZW6nT
         75CxlirngALh7LA9iWFMGjJpkxBrtVUz6h+rK2dY/CZhUCPfSNXNMcsYuR0OTCDA5OcY
         sPFA6PTIM6ZYvBfYmwlEHWNUZfRPv1PMj78woehhMYkWjTAlISzsfV4GykGhIlLud756
         bTv9er84/2HqJnPbYJOpbwHMalBfMgjsu/b9FxDwRyg+Cs4QSdB4cxUI03PGoJduol2Q
         l0iQrTdwIU3Lipd/C18ypMZkiqm4HNdmQJqpH8vJ/nPYhsb6wuIuvK2Z/SZ01KR5fBDX
         BwtQ==
X-Gm-Message-State: AOJu0Yx7GztDUgK84OyvbDCWZLy9jcn9h433zzEe7ihAdw4sv/8kPJ5g
	okCxnz5JcHmoCSPTX0ypBpc=
X-Google-Smtp-Source: AGHT+IGkXvJsll1Iu3c8zTpHuqgQVCuZS839YG3p/3plA3D13R0XE0p530uNR88xYead+RUVAsrGnQ==
X-Received: by 2002:a17:906:191:b0:9b2:b7f2:bc7a with SMTP id 17-20020a170906019100b009b2b7f2bc7amr5188275ejb.34.1696504746970;
        Thu, 05 Oct 2023 04:19:06 -0700 (PDT)
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id ss7-20020a170907038700b009a9fbeb15f5sm1014048ejb.46.2023.10.05.04.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 04:19:06 -0700 (PDT)
Message-ID: <7a3f894e-8d86-4370-a1a9-768a41dda55d@gmail.com>
Date: Thu, 5 Oct 2023 13:19:05 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Feature Request: "Fake Trim"
Content-Language: en-US
To: charlesfdotz@tutanota.com,
 cryptsetup development <cryptsetup@lists.linux.dev>
References: <Nfx_Hmi--3-9@tutanota.com>
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <Nfx_Hmi--3-9@tutanota.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/23 04:05, charlesfdotz@tutanota.com wrote:
> Hello,
> 
> I would like to request a feature regarding luks volumes. I had
> wanted to post this to your gitlab but they want a credit card and
> phone number (?!) to sign up. I hope doing this via the mailing list
> is OK.

I am owner of cryptsetup project on GitLab and I never entered credit
card number (and we have GitLab for OpenSource Ultimate license there).
Email should be ok for registration, and many other people have account
- are you sure it really needs these data? If so, ask Gitlab why.
We do not need anything like that.

(Anyway, issue for cryptsetup is not the proper place anyway, dm-crypt
is kernel part, perhaps dm-devel@redhat.com list is better for kernel
feature discussion.)

> I would like to request that a new mount option be added for luks
> volumes that when enabled would allow the luks volume to accept trim
> requests regardless of the underlying hardware and then to simply
> write zeros to the sectors that are trimmed. This might seem like an
> odd request but there are a few situations where I think it would be
> useful.

IMO block layer is the proper place to emulate TRIM (so any block device
can do that). I do not think device-mapper should implement own
emulation. Not sure if it is a good idea, but if so, I would expect any block
device should be emulate TRIM (then LUKS can support it just by enabling
discard options).

Anyway, I think you are trying to fix hw problem in sw here...

> The first is that currently it is just not feasible using luks on top
> of an SMR drive if it doesn't support trim. Currently an SMR drive if
> left untrimmed while using an encrypted volume will have performance

So SMR drives should support TRIM if they really on it...

I am not going add any support for SMR "optimizations" to cryptsetup.
These crappy drives just should not exist :)

But seriously, if the drive has some special use (like long-time recording
- writing continuously stream of data) and you want to use it with
random write (and encrypted) access (data deduplication cannot be done
internally) you are screwed anyway. It will never work properly.

> falls off a cliff permanently after enough data is written to it. For
> drives with trim support this obviously isn't an issue but at first
> glance drives that do not support trim would seem to be worthless.
> Fortunately most drives that don't support trim are smart enough to
> "time" a sector if it gets filled with zeros (you can find several
> accounts of people "refreshing" their drives by simply dd'ing them
> from /dev/zero). Obviously you can't do that if there's a luks volume
> on the drive because it won't actually write zeros to the disk but if
> my "fake trim" request were implemented it would solve the issue.
> This would make proper encryption possible on a large subset of
> previously unusable drives.
> 
> The second situation is using a luks volume on a virtual machine
> disk. Often time the VM disk will either be compressed or a sparse
> file but if encrypted with luks once all the space has been written
> there is no way to reclaim space. I'm aware some virtual disks
> support "normal" trim but I believe this would still be useful in
> some cases.

I do not understand what is missing in the second case.

You can use thin provisioning, it uses TRIM exactly as you mentioned.

But loopback (/dev/loop) should support TRIM too, so reclaiming unused space
in file image is just to allow discards for LUKS device and issue fstrim
(or blkdiscard for the whole block device). This works for years.

Loopback is allocated automatically by cryptsetup, so all you need
is to add --allow-discards on open of file image.

Milan
