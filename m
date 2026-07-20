Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953002D8796
	for <cryptsetup@lists.linux.dev>; Mon, 20 Jul 2026 21:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581413; cv=none; b=Fw6XHD810cG00ywpUsSbmdaYGAuv2F30S9DNgZUMKivf0SfCiEUGqCqMz0SefpweoTl9aj2AinYlY4qIbFpWIDVoux9LsJypeAngfNonkNS+BtxHVSYNRrRVr2Sih5fVXcfD4oetOLn3LEX6klwv+tDYn6FuLamqKXhjjc5RvRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581413; c=relaxed/simple;
	bh=sR3z0HjUJsNKj+ab8ZLBuMRMGb/O8aL1WeodYgSNGpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=up2B5M/aJ6Glw3nMDa1zHJgu//oosLfYvJ2LF3VZGPLExSXxvRfXjuwXTB/dgEa6pMXfehS/lS6B/krkYQT6S2rmOWQ3enMKf8Y/Fevl2g64nE/57WmULuB30RlxdHecPWA9gMFpXWq9bUUWrOCwCRpjJMktihT/e6mBmrxbiUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkKbyznL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkKbyznL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954df200ddso19125325e9.0
        for <cryptsetup@lists.linux.dev>; Mon, 20 Jul 2026 14:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784581410; x=1785186210; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRuBTCh4yiqUzlP+SSVbuIqm8Lq3hwIwTf7cJp12DKA=;
        b=AkKbyznLU8NJ4bqk9Rd7TevgAtxLVHmWFQiVKTyx5ajKSaFnR32FmfnLIkT1SjqB+x
         7EAiEAJMpK45TNfdKWe5PgTanTVF3oF7Q33cjJTENWPZgle6kuFOkNq//42ST6fygT1B
         NV84aR2vq8w127xnLA4gH7OMBeczGXXLva07/gZAbJKmEqL7LtYKtIzZmUZJxPxuy0JU
         i01nAZZXYdWSSUCBFbV5ZT+hvCFcPjyZwPTQ+dFAs5EFcfHqGctDJsML+WCOtd+y5/d3
         ajqDsuezvXv30Jz+Cct53VetTLMA5IBKhg+lqUVBAs0OUARA3NLFTCJyi2T2SKhAuIV+
         9HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784581410; x=1785186210;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRuBTCh4yiqUzlP+SSVbuIqm8Lq3hwIwTf7cJp12DKA=;
        b=lk7Vj1Qnr9ED7NuNcM3Op7pVwqLp2Wqrzv3oW9jUm95XcsflrJqzUWHPaHGQj0CIbL
         VPAeixRsCuch/nEWU8Bw6uTN2rRlbiGEmgnzg6pDzzzkZrJXjB4Ne5zHZw32oQZJip7j
         6KyP0nDqpVIMbju54/rBTMy45iM1Zovlb8WC1WEPA4/DYgGT6T7K//yzsluAPxul7bXy
         c0aHC0Nl9TaTCuuHTlCxurlUKK1PBaV6ZgCqJZel/J/K5mslk7FNAaixNK8nqbZ1U8Nw
         Fkib95W1BTWn6Z7umg8Piq+X1zK/eZ603uEVKYpiADZQHXY+lYwxjSeG0K42C02GWTqW
         E0tQ==
X-Gm-Message-State: AOJu0YxEfeYYmu38fOHX8OKWnBjjQHXV0xZI1kYxsMR0rZ2BWiXngTVj
	NcoWEDDCrWfqg3iLs9ni9Y6rDvrqBZGrGOE2MrUm3Plcv8lDCZA3PDK2oMbnbA==
X-Gm-Gg: AfdE7cnTvrZ/VwOA/JU2GdU8UtE7V227zNfK4HHH5J/T1ZDiJSyEJU0Y/fmRTukvLwL
	daPKAt4rE8SbzZhu0qOAjs3J38Ajuc3AWQ+yUD5ugkhXJQqTSZadMcdnwSSRycNeGm8blBb3uUU
	U4diWzD0tfK+GRkCzFktQQ8LhBRBUIdarzRZqjGPDibDBe8bHxQFdj039/qTDM5a/Jgb8QKetVF
	Wx4p50blO9kk2NiomjrB8BWdOVJ0rIyZPEuaET3Rbzadu/8uBrHCEVmSGhl8qNysSQkUUKj4kPy
	3D4xu8hgCmQ5XGV3Nxx0/LsP5RtKSsVk5toYddcLUmvwWkCML9UUV5qmZZc0uskqbj0TuULd5bC
	RwcEo2zAaeQ5+pUC1Zp+7D0IksTIryIh4le+iWji4RhQZfPEX5Vz+uhYlxxvHeIFqrPLk3eWUmE
	fJd9W+KHFg1+HPGaLOfnIrRkRTW+s=
X-Received: by 2002:a05:600c:3114:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4954a3ec720mr176550255e9.7.1784581409502;
        Mon, 20 Jul 2026 14:03:29 -0700 (PDT)
Received: from [192.168.2.14] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565dbc288sm3796245e9.4.2026.07.20.14.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 14:03:28 -0700 (PDT)
Message-ID: <f69052dc-a990-4d16-8fee-2821a2c6c44e@gmail.com>
Date: Mon, 20 Jul 2026 23:03:27 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: luks2 + integrity + discard
To: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
Cc: cryptsetup@lists.linux.dev
References: <al4RjyA894rnZxAK@lazy.lzy>
 <1ddcf551-ae22-4677-9910-37aee6895422@gmail.com> <al6GuqYni-QF3aEV@lazy.lzy>
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
In-Reply-To: <al6GuqYni-QF3aEV@lazy.lzy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 10:36 PM, Piergiorgio Sartor wrote:
>> Discard (TRIM) is supported for dm-integrity
>> standalone mode. It is also supported for dm-crypt
>> standalone.
>>
>> It is not supported for stacked dm-crypt over dm-integrity
>> (In authenticated encryption mode where dm-integrity only provides
>> interleaved metadata sectors for dm-crypt.)
> 
> Thanks for the answer.
> 
> I was curious about the technical reason
> for this.
> Why the stacked mode should not made
> possible the discard.
> Is this because they're "interleaved"?
> Could explain or point out to some
> explanation of what is intended with
> "interleaved"?

That is the main reason, you basically cannot trim a continuous region
as sectors are interleaved.

The second reason security - discard in dm-integrity standalone
mode is not secure (you can trim a region to remove real data
and it will not report integrity errors).

The dm-integrity idea (as I initially planned) was to implement
temporary solution to emulate sector+metadata to allow authenticated
encryption.

Once hardware itself can provide such configuration, discard will
work natively (see inline mode).

Unfortunately, only a very few enterprise drives support it
(even if it is basically only about proper SSD firmware).

...
> I mean, SSD are more and more common,
> giving up discard seems a bit of a problem.

Then do not use authenticated encryption using dm-integrity.
Security is not for free.

Milan

