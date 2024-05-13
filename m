Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F5B148309
	for <cryptsetup@lists.linux.dev>; Mon, 13 May 2024 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715590571; cv=none; b=rMlpPnnjeIF6mdsfaTRR+vAoCxrUsqcEJInbpuKZfZ61k0pjprGWIm2nR1LclZ6mlReMbS+9rxfDpwl4kFh1qo3Qcc6CiXqvPy22FdlPUfzzzrxET8/eGkb3I3ASxYaNvxRjc0tU1uWkFhLzs65//14s5psAEsqb0H/7MYcKhz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715590571; c=relaxed/simple;
	bh=3EhUWkUycI04tyjhG1A9+a6t/sqh4JB+fZrhvVFd/V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CeQ9mL5jvoyYdNtCJ1xQUSjCi/Qw+w53cP/Os0XJqxKceBRbyBNKUDFnQxl/Hg8a9Lsxj+F1GkrsGJB/wICOZ553gEGR2V9AaEaU//v5eE1790S1vN90xjT4p2zQEw7BpLTSt3OXuBSR9JiV9ZLNjNMdMaiPmF2LIBvDGiy6yyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhB7eL8E; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhB7eL8E"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59a0168c75so1047677866b.1
        for <cryptsetup@lists.linux.dev>; Mon, 13 May 2024 01:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715590568; x=1716195368; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3EhUWkUycI04tyjhG1A9+a6t/sqh4JB+fZrhvVFd/V8=;
        b=GhB7eL8EW3no2MznFipxpTX16//Dn5qf32FEA8dRAcg/4Jzm7CPb9VktjzuOgJYIlk
         LGStKoLzTJm0Yywg+gBR1Ilm6szyvZe/CJts5fDZqao12Ku0/HIzULacReBe9Zj18Wgs
         nbyap1Vuh+HR6A70nJqoQYV1Hs9uAp5lioam3jA7rHmyrcBDwOOErQPOvF5ldCjHJZ2b
         7SoWuE/b5JS5FC1wm6ihDQiE2HseuK6hxy3aZ8/gE7jw/8H4l+WKvvSuwiaTnfoNaRfe
         fsAHl069jL5WU19hSdCb6kifAQkhrlO77ebknoqIs1gZFYvmCz4TqWS/jx18e0eMw23E
         jCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715590568; x=1716195368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EhUWkUycI04tyjhG1A9+a6t/sqh4JB+fZrhvVFd/V8=;
        b=Ts41EyvFwa78Et3EpAhkhELG4PuoEderqVP31c/bt/Snz/ldO6zTOOCIqrdGXsJF5N
         sjH/tFRXMhM5rw4zxiuBJL27JFQZIWc6UVlCKg6jPieq/+UUCjmCdJ+ogvT2pX05DZeo
         b4nkN8L8hcT4c097vXEdoF58KGH+GMZRIZgxDiw1MQTR2egwz6yUIMZKrr/UAmYtJdwG
         NMxmIFKJ80rBrZQxztIkWexN6nkM1Dps0VavC0DqHLYnRPYCksxG+qZxksQemEp3PkeS
         YUAPQIrs1OcNRkBJN+zGO+AqbsI8yN/2L2FDc0+4tzyAO6qASySWYrTm0gv20319J8BO
         nijA==
X-Forwarded-Encrypted: i=1; AJvYcCV9SIBkP43p8/IHVFopLCoz/Iaxk79gORvo778hy5hjR/0msWq5zhgbAKPCJI+lKv5Q6Ylrd3XzRlIxgKVVjra/ClyclkgRuMksMQ==
X-Gm-Message-State: AOJu0Yx/PpumxbgCF96Jqa+T0ODHiZDpcDy9QUoov1ZPVOs8qhY8Isj/
	WaiqCJorNWVxA91GpS2jxOH7+Nd4uDnDaGXTGSZoFpHwkgxa6ZXmHt9sSg==
X-Google-Smtp-Source: AGHT+IFkLovV1fK1EJiG65xHiVFR6Xozjab5lalxG+/swhmx+kZXuWXlP76eZtk0neQUVHkfzmx1OA==
X-Received: by 2002:a17:906:3a8d:b0:a59:be8a:bd6f with SMTP id a640c23a62f3a-a5a2d65f272mr569146266b.61.1715590547334;
        Mon, 13 May 2024 01:55:47 -0700 (PDT)
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d5f9sm578309266b.17.2024.05.13.01.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 01:55:46 -0700 (PDT)
Message-ID: <111e4bce-0456-47bd-a573-f22ba501d532@gmail.com>
Date: Mon, 13 May 2024 10:55:46 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: LUKS disk encryption
To: vfritz <v_fritz@t-online.de>, cryptsetup@lists.linux.dev
References: <44641f736efa92219f10a342444efd65d93555cf.camel@t-online.de>
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
In-Reply-To: <44641f736efa92219f10a342444efd65d93555cf.camel@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/24 10:25 AM, vfritz wrote:
> I found out a very very simple way to crack a LUKS / dm-crypt encrypted
> external SSD drive.

Please stop spreading FUD.

If you have a security issue, there is very well defined process how to report
that. Just follow instructions in SECURITY.md file in cryptsetup project git.

Milan
