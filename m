Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D283B42F6
	for <cryptsetup@lists.linux.dev>; Fri,  5 Jun 2026 18:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780684952; cv=none; b=YzTI5uhbT6juNUikQb899GMzZIT5ikFX/APi6qqSgoqSZ0fbdIh68t/6QIKbTHKc1oFZwZnj8i2pOEvtkqeY1XpRnJ5idt6A1L4hkSqchiwTT+AxPzdfIrNryBHsALutzfnuvOIbjDDXgEER1XiZNrOnhJ/gXJsMcl0XkBs4RPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780684952; c=relaxed/simple;
	bh=RpVxc2muq3mrgdG5d3Q6HBdu9XObOWy6Z29ksS1a+7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5I0D1txxRsTFXcXwIsATrVyovhWA5OUrOgVz/0oTZQlm47twZ3hwxzbawCo/4akSuuTb7y2PpHdrH2a0R1TEHGrNlGi1qrUmlPXd4ctWjk0n8CmqbFwDPvQnB8qTAKD1IAGuFlAr5euJvFTGTJYKTJEqfEokE2VuivRWxJGSeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqtkx8x7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqtkx8x7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so1547841f8f.0
        for <cryptsetup@lists.linux.dev>; Fri, 05 Jun 2026 11:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780684949; x=1781289749; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GTA2AVC3FssZEzOx8zoF2DkKPP1Hk/xwwowJVIPMLE0=;
        b=iqtkx8x7o4kuu7SwQb5C86lWvV5mP5B8EUjCbKY2y3gvO4GBaNyPoEZjW8SEqpEQsm
         cX8tV+Rmq6FoqDZKzh5bQGM5ZHLRHGHGtbQxa8Nws0MuJVgjgjqC9iOrL0lbVcyfuhcB
         w+4RagFfwdSANTTQiOzFVL0PAlsBTj21kgybqcoBaeYhrWTcNn/x7If6FKQnCgXyXXCr
         jiVNhcAu+Yo/c04t7O14Ukbl9UQk56QDNgB2N+g5H8EhGzjaJt7oSITSlzFEMD7rIBXd
         ubsQ/qqn013Os6b4x4Ky26r/dgRxV9hwKvSeM9VKCCrx614LX6rF+ghWla8DjiPrNs6j
         wpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780684949; x=1781289749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTA2AVC3FssZEzOx8zoF2DkKPP1Hk/xwwowJVIPMLE0=;
        b=YfPU86mXuJKkKnCqsPtdT4RuUxUZ0SzjFSBPgIjSbMd/CcwNIh1yf1rBkx26NIcuTi
         ZM3JPRlqZzheQV6ukr/SrAYw7ugMg7mbHFxYT1Q1ZgHgQj191F+JUrb34rk2p3kmv8eh
         Xra1nOzUX+C3oAzgbp+YxVg0iy17JC0sCgMHwOW87iZ+pmxjkwW/XNNsF73OR/7qGi0U
         ToxP/rv9hK2r930uKYE4Gi1pHrQrpcespC5jj5uz/F8YiI1JND00njAN+l6iSj38IYc7
         WNPAU4NgDKoqsegItZxK1gkGlTYkb+OrvyrBWBV8heH8nhQqp8r06w0xmwhQN/2ulbUH
         z8zA==
X-Gm-Message-State: AOJu0YybGWFNc3Zap5toPxC4cHiXuCCR2TryA/r9iRhHcCpYrBnYNw69
	r1E5Gj43mNmyHpswxIyyA+zTBTowX7kjRBBhgA1KyH6tCzOXTZN3bJ8mjajgSw==
X-Gm-Gg: Acq92OGk6Ex2QKM43Q1ydWJfjE2X9Q/iKoWJkdwvUjfRcDQvcTy16GFebLujMU6JquK
	0NWKVa60ziAK5aDkSIU/2cqVab+ai8QL6LwdeKlE6wQq0uO0eJlRWC4ewqU/6OhumLsyamvJ6IB
	JAnDAZXFpSoKHFzXfxtrMaglVvDFUXEYndzcpvvjGlRdq7QIfVIxkU4Qd/9k/5mAT6V5UUj0UhX
	2paOBuUdPu27SrOyNsJM0yiaZWaQwbzZk/c4kX/yxHMRO6suy5K0Ru5m+2r5B/yqwuN7ydNdbaB
	OQcYE0IDzAT2cWXpXURXoO3Vz9QBhkLHwqZMFZ1vCXcOhD+AtMFk0lvCNa76vbcQXRjr2rrS0VI
	SfqJcpCcKwj1a2mZIhy6o87rt3rWZlZ4V0YBtCjURKiKdXOd6KByjR89xbH9QsPic42y2CNTZ60
	5Adus3t6XIRq75rIv7v0iKGJC+Ew9sNMVbQ/YUEl0NwWRMJPU0iiW5lIiwiqXT
X-Received: by 2002:a05:6000:25c4:b0:454:35b9:803 with SMTP id ffacd0b85a97d-4603061fcfemr8372258f8f.30.1780684948881;
        Fri, 05 Jun 2026 11:42:28 -0700 (PDT)
Received: from [192.168.8.101] (37-48-0-73.nat.epc.tmcz.cz. [37.48.0.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm28840761f8f.4.2026.06.05.11.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 11:42:28 -0700 (PDT)
Message-ID: <15f67003-4f1b-4b24-9b83-726e305907da@gmail.com>
Date: Fri, 5 Jun 2026 20:42:27 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add mbedtls to PKGMODULES
To: Anton Lundin <glance@ac2.se>
Cc: cryptsetup development <cryptsetup@lists.linux.dev>
References: <20260601203701.1740656-1-glance@ac2.se>
 <6251d03b-d923-4d64-87a3-1e5aa13c5e94@gmail.com> <aiMDN4xWore5ymZo@accum.se>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 xsFNBE94p38BEADZRET8y1gVxlfDk44/XwBbFjC7eM6EanyCuivUPMmPwYDo9qRey0JdOGhW
 hAZeutGGxsKliozmeTL25Z6wWICu2oeY+ZfbgJQYHFeQ01NVwoYy57hhytZw/6IMLFRcIaWS
 Hd7oNdneQg6mVJcGdA/BOX68uo3RKSHj6Q8GoQ54F/NpCotzVcP1ORpVJ5ptyG0x6OZm5Esn
 61pKE979wcHsz7EzcDYl+3MS63gZm+O3D1u80bUMmBUlxyEiC5jo5ksTFheA8m/5CAPQtxzY
 vgezYlLLS3nkxaq2ERK5DhvMv0NktXSutfWQsOI5WLjG7UWStwAnO2W+CVZLcnZV0K6OKDaF
 bCj4ovg5HV0FyQZknN2O5QbxesNlNWkMOJAnnX6c/zowO7jq8GCpa3oJl3xxmwFbCZtH4z3f
 EVw0wAFc2JlnufR4dhaax9fhNoUJ4OSVTi9zqstxhEyywkazakEvAYwOlC5+1FKoc9UIvApA
 GvgcTJGTOp7MuHptHGwWvGZEaJqcsqoy7rsYPxtDQ7bJuJJblzGIUxWAl8qsUsF8M4ISxBkf
 fcUYiR0wh1luUhXFo2rRTKT+Ic/nJDE66Ee4Ecn9+BPlNODhlEG1vk62rhiYSnyzy5MAUhUl
 stDxuEjYK+NGd2aYH0VANZalqlUZFTEdOdA6NYROxkYZVsVtXQARAQABzSBNaWxhbiBCcm96
 IDxnbWF6eWxhbmRAZ21haWwuY29tPsLBlQQTAQgAPwIbAwYLCQgHAwIGFQgCCQoLBBYCAwEC
 HgECF4AWIQQqKRgkP95GZI0GhvnZsFd72T6Y/AUCYaUUZgUJJPhv5wAKCRDZsFd72T6Y/D5N
 D/438pkYd5NyycQ2Gu8YAjF57Od2GfeiftCDBOMXzh1XxIx7gLosLHvzCZ0SaRYPVF/Nr/X9
 sreJVrMkwd1ILNdCQB1rLBhhKzwYFztmOYvdCG9LRrBVJPgtaYqO/0493CzXwQ7FfkEc4OVB
 uhBs4YwFu+kmhh0NngcP4jaaaIziHw/rQ9vLiAi28p1WeVTzOjtBt8QisTidS2VkZ+/iAgqB
 9zz2UPkE1UXBAPU4iEsGCVXGWRz99IULsTNjP4K3p8ZpdZ6ovy7X6EN3lYhbpmXYLzZ3RXst
 PEojSvqpkSQsjUksR5VBE0GnaY4B8ZlM3Ng2o7vcxbToQOsOkbVGn+59rpBKgiRadRFuT+2D
 x80VrwWBccaph+VOfll9/4FVv+SBQ1wSPOUHl11TWVpdMFKtQgA5/HHldVqrcEssWJb9/tew
 9pqxTDn6RHV/pfzKCspiiLVkI66BF802cpyboLBBSvcDuLHbOBHrpC+IXCZ7mgkCrgMlZMql
 wFWBjAu8Zlc5tQJPgE9eeQAQrfZRcLgux88PtxhVihA1OsMNoqYapgMzMTubLUMYCCsjrHZe
 nzw5uTcjig0RHz9ilMJlvVbhwVVLmmmf4p/R37QYaqm1RycLpvkUZUzSz2NCyTcZp9nM6ooR
 GhpDQWmUdH1Jz9T6E9//KIhI6xt4//P15ZfiIs7BTQRPeKd/ARAA3oR1fJ/D3GvnoInVqydD
 U9LGnMQaVSwQe+fjBy5/ILwo3pUZSVHdaKeVoa84gLO9g6JLToTo+ooMSBtsCkGHb//oiGTU
 7KdLTLiFh6kmL6my11eiK53o1BI1CVwWMJ8jxbMBPet6exUubBzceBFbmqq3lVz4RZ2D1zKV
 njxB0/KjdbI53anIv7Ko1k+MwaKMTzO/O6vBmI71oGQkKO6WpcyzVjLIip9PEpDUYJRCrhKg
 hBeMPwe+AntP9Om4N/3AWF6icarGImnFvTYswR2Q+C6AoiAbqI4WmXOuzJLKiImwZrSYnSfQ
 7qtdDGXWYr/N1+C+bgI8O6NuAg2cjFHE96xwJVhyaMzyROUZgm4qngaBvBvCQIhKzit61oBe
 I/drZ/d5JolzlKdZZrcmofmiCQRa+57OM3Fbl8ykFazN1ASyCex2UrftX5oHmhaeeRlGVaTV
 iEbAvU4PP4RnNKwaWQivsFhqQrfFFhvFV9CRSvsR6qu5eiFI6c8CjB49gBcKKAJ9a8gkyWs8
 sg4PYY7L15XdRn8kOf/tg98UCM1vSBV2moEJA0f98/Z48LQXNb7dgvVRtH6owARspsV6nJyD
 vktsLTyMW5BW9q4NC1rgQC8GQXjrQ+iyQLNwy5ESe2MzGKkHogxKg4Pvi1wZh9Snr+RyB0Rq
 rIrzbXhyi47+7wcAEQEAAcLBfAQYAQgAJgIbDBYhBCopGCQ/3kZkjQaG+dmwV3vZPpj8BQJh
 pRSXBQkk+HAYAAoJENmwV3vZPpj8BPMP/iZV+XROOhs/MsKd7ngQeFgETkmt8YVhb2Rg3Vgp
 AQe9cn6aw9jk3CnB0ecNBdoyyt33t3vGNau6iCwlRfaTdXg9qtIyctuCQSewY2YMk5AS8Mmb
 XoGvjH1Z/irrVsoSz+N7HFPKIlAy8D/aRwS1CHm9saPQiGoeR/zThciVYncRG/U9J6sV8XH9
 OEPnQQR4w/V1bYI9Sk+suGcSFN7pMRMsSslOma429A3bEbZ7Ikt9WTJnUY9XfL5ZqQnjLeRl
 8243OTfuHSth26upjZIQ2esccZMYpQg0/MOlHvuFuFu6MFL/gZDNzH8jAcBrNd/6ABKsecYT
 nBInKH2TONc0kC65oAhrSSBNLudTuPHce/YBCsUCAEMwgJTybdpMQh9NkS68WxQtXxU6neoQ
 U7kEJGGFsc7/yXiQXuVvJUkK/Xs04X6j0l1f/6KLoNQ9ep/2In596B0BcvvaKv7gdDt1Trgg
 vlB+GpT+iFRLvhCBe5kAERREfRfmWJq1bHod/ulrp/VLGAaZlOBTgsCzufWF5SOLbZkmV2b5
 xy2F/AU3oQUZncCvFMTWpBC+gO/o3kZCyyGCaQdQe4jS/FUJqR1suVwNMzcOJOP/LMQwujE/
 Ch7XLM35VICo9qqhih4OvLHUAWzC5dNSipL+rSGHvWBdfXDhbezJIl6sp7/1rJfS8qPs
In-Reply-To: <aiMDN4xWore5ymZo@accum.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/5/26 7:11 PM, Anton Lundin wrote:
> On 02 juni, 2026 - Milan Broz wrote:
> 
>> Hi,
>>
>> I added the patch to MR for review
>> https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/931
>>
> 
> I was trying to figure out what the projects workflow was, and it looked
> like there were both patches on the mailing list and MR's on gitlab, and
> due to me not having a gitlab account since earlier it was just easier
> to send it to the ML.

Just for info (but I guess you already read that), workflow is documented here

https://gitlab.com/cryptsetup/cryptsetup/-/blob/main/CONTRIBUTING.md

Milan


