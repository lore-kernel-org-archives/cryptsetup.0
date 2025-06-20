Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ADD29B23D
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424981; cv=none; b=Q6s2AuzdSmfWKrlG34NdcgGecskkS7KYlMvnvJeMFd54kNaCgVRnuVgv8SY7WGQtTW1+RwgrqeZv6Tu1VdJqCt1n2ssRXMiHm0716tvZ+jrDjhYbpD08IImQTZ3jCG+l/bp53zjcbZPwkghXVRfR5cHoEEgcf8QSQoP3UnqbwS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424981; c=relaxed/simple;
	bh=YMgW1IM7XZZZlyFBjMS0ANC5GvjqP6IaFVqMuHj8ZaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kRLTe09UHycFQpijP/Lejjnf3JChXP8vPirYxZKnYdqAiRy9vqOKejOJcfvfBwJK02K3NRsNBvBk9lM1gNM/jJMQVJdDIRjwZlAG/v6MnUBbtyRoez5qcGb9yBtG8qXuvgQ7o7rvlHHScz+/6WreJMxFevbMSVDhHz7hO7xXW0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgezNqJP; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgezNqJP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-addda47ebeaso383304066b.1
        for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 06:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750424977; x=1751029777; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N0IXhNWwJqrYArCxdM5jiz4v3jfiizEXbm5dnpoxJ5g=;
        b=PgezNqJPHbb6b8ZhO+SsCj+K7Ldd5HlfllPNaBBG5fWwO6jKcsIpoGl0oXT4YV8Ild
         k47w5IT4oEWKOAm3v5KtulySb8Epd4WdSV8yOeS4mJ0crntD70lduGvzgySQGVSeFJK8
         dJi8P0k/I3n4kC+fA8FkPQFb6qwMRn5ZrFa5Nhx3sHO8cu2f7QABNCwqNGAzDgBq+Iy+
         RektAHD+0e0+dl1CIw9jXec7ThabeVBv3jM9SgEcr7mbjmV/fWQdxaeyjlc/TNSTsJQS
         EpycD6aDecQ0/p5c8E8euLVaHAl5voMARJeTHsPaUxNtuWx/Px6zoh7liAs50wLDCHTJ
         WGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424977; x=1751029777;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0IXhNWwJqrYArCxdM5jiz4v3jfiizEXbm5dnpoxJ5g=;
        b=F3qT05idNe5oKNMahD5RtHGW1I7vve/bfayKPQ2rB5yAL7oi8kkAuHiBA6l7eoAZ2n
         TMj38oZWjZ5N/QnenvYlxHdbxPBIdnP9KhfLd3H/HGL5fh7sPmn6uPjAYNJqvtj6gGW9
         KN0GEsfnzjVYZWSkfh0/9aYnz+hzbv4lsoqwoCbIRabzu4av/S7T4fPQ4mxZHNpzc7CD
         R2adzgW1A+tQmfWJesgdAQsRUO49V5k4nOSrKtcsQddu9TwN6htPVq7KoGyqm+JXzQZt
         8/1jVJYXLy00Xk9e9oBGdUJCr1Fvyk7JBC/oY05hGOwQtandgsSOwO4V9uvz1+rc342P
         M32g==
X-Forwarded-Encrypted: i=1; AJvYcCU/ATa37pn0A3a3++NwroYqn0qvCnV0t2g3J06LUVzWLZl04sWt7FYq/mXIbrTyvQbmYabqFyfuUxwV@lists.linux.dev
X-Gm-Message-State: AOJu0Yxjqz3wVo0OjYxBaZUfpamPJI0F2Aod8/CHqlGZe6uWdjrM84y5
	SCuyv6Loslpv1ShmKwI/ReLmW/J4shuC2mFrmzZuby+9fgsBWg3jJqTF5whaIg==
X-Gm-Gg: ASbGncsAcneOPyxKKlBz0DqBonAevsHyKwHaCpaYQZSIJUxkJ+TnMJ2y2w2JCE1Krf5
	wdI+VBkJ9hAzdZLFLJ+cr5Hfw+dLWin94yWZRqr46JuQ5VApJRTYbHmd8IuBtWt3KtC+Ylsktle
	A+nDRHHBaE1uaKC3j+xhdvN0bY4x4y6TTC6fLAGOixNIc0iX8JdFJUepyni68JaNt24uD8ukvQK
	H3i4QMEuwN8HjxMERJpDWnagOlCfYy8pSVz69iOtAk1oMAgn9fJGUDzuF4z4G3MLFFSFXZ17bLH
	upp5IybRO5P+TX8XhB4MHyCHMnDBgHFp5z414NssROl6yUiXswHYS3U0I1Ap4C1vDzguSzvXl51
	HdDuZpHKmzgEC8l6MGR4w
X-Google-Smtp-Source: AGHT+IFPjWoh9IsbDG/9fB48RhqfXcr41qxWXhsQSyellwl6q00r2IVfDbZ/Z+o49ekX9ScjSVwMJA==
X-Received: by 2002:a17:907:9412:b0:ade:40cb:2517 with SMTP id a640c23a62f3a-ae057b3c0a9mr232573266b.30.1750424976968;
        Fri, 20 Jun 2025 06:09:36 -0700 (PDT)
Received: from [192.168.8.101] (78-80-16-228.customers.tmcz.cz. [78.80.16.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e80a01sm162986966b.12.2025.06.20.06.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 06:09:36 -0700 (PDT)
Message-ID: <758b021e-bf8a-4785-a29e-cbec16fbdb34@gmail.com>
Date: Fri, 20 Jun 2025 15:09:35 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Using Windows and bitlocker
To: Mark Foley <mfoley@novatec-inc.com>, cryptsetup@lists.linux.dev
References: <202506191557.55JFvYQZ004708@server.novatec-inc.com>
 <70be44da-a130-407e-b529-d6e7ee820b1e@home.arpa>
 <202506192255.55JMt0n4027293@server.novatec-inc.com>
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
In-Reply-To: <202506192255.55JMt0n4027293@server.novatec-inc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/20/25 12:55 AM, Mark Foley wrote:
> On Thu, 19 Jun 2025 21:45:30 Michael Kjörling <152cc69a347e@ewoof.net>wrote:
>>
>> On 19 Jun 2025 11:57 -0400, from mfoley@novatec-inc.com (Mark Foley):
>>> [...] I've downloaded and installed cryptsetup 2.7.5. [...]
>>
>> Most Linux distributions include cryptsetup in their repositories; you
>> should not need to download and install it manually through
>> out-of-band means. Using the distribution's packaged version is
>> generally better unless you are working on the cryptsetup code; you
>> get updates through the distribution's normal update process, and you
>> don't risk unknowingly introducing incompatibilities between for
>> example the kernel, libcryptsetup, and cryptsetup.
> 
> Michael, thanks for your prompt response. My distro (Slackware) does not ship
> with cryptsetup

AFAIK Slackware packages cryptsetup, at least in recent versions.
While it is one of the oldest distros I know, it is not so generic :)

Milan

