Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065C317FC
	for <cryptsetup@lists.linux.dev>; Fri, 25 Aug 2023 07:51:07 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-52a1ce52ef4so878314a12.2
        for <cryptsetup@lists.linux.dev>; Fri, 25 Aug 2023 00:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692949866; x=1693554666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=946GD3InrtNR1JvtPKXDvrApUsWFwJ73hr3jy2GixXk=;
        b=g2EKbcYirJ/YRax8tzAiaaRxWyOp4k+A269zCKZmYvR374SlH+bKqqf5lzuaBFyiKJ
         tk4sjr8SF93/nJlkJy/9LFxDCURhhUHfqTszvIDPUOMmaLOftzsE+t717VsqAQYk/uGI
         SnAieIPJW7Q36oweHC0nxmyJXwAnNssjEiOCS+PXNb/Es4Pv2K+f6ZJ8npN6GXFsUDhJ
         Ju5L9bNs8uU8n5rJL3rT7h1kn0BZokTrdctF0IIzeDTk5wiSV5WY5wMI1FPRv5YWD8FC
         pnPuXFXzRVyp6i+9HmOCudwM0p7moHbsfSn1Bnx8yjTRTNkB4HhDwtEsDIf6raGXJPpw
         pJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692949866; x=1693554666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=946GD3InrtNR1JvtPKXDvrApUsWFwJ73hr3jy2GixXk=;
        b=dA9jcMMlcbJBnwNQ7Vwig6hzsYqGXHzH26iicysnZwjreJ4FKSnL0hbUSgdfwJD0n2
         3/lvDlgOfMOR40S/VRc0zRqAKqHsYqJ40omYvn2sRppQD2LYfv/jYtn9IVH2QWT0SAMd
         W+BH2I44i2w8Y2si8nJbZYjpqBFeWI7Yr86C4c2nqemo/lSg2gasy6SPVl8X0b+USwsd
         DuG5bWS96XgxSM+Wvp0rffbDKKVYPFNueqGXoRcMDAy2zhMipySaBfiQshZ4O1xBcRUs
         eJJarz2yU1BUBdgwv4IeQPNF0+QGtTb+Vn4cHWqJ4neqX5XlUPxVGUksZDRs4s+ItJbq
         8Aeg==
X-Gm-Message-State: AOJu0YyzoTCgLSSuNCX81aG2/yruzpWIqn7pMA1gJC5tW2cGqv5oKGtn
	YWIM9wY3+qp4g7LORndiegXKzziv2tc=
X-Google-Smtp-Source: AGHT+IEApflbBY75BH67nCqfLbHIKjbnyL9orwhSuAnRIkhRaRrrsfNkE2qyANZv93AXxyeyD4fqgQ==
X-Received: by 2002:aa7:dcc4:0:b0:524:5e4c:2fa4 with SMTP id w4-20020aa7dcc4000000b005245e4c2fa4mr12418387edu.14.1692949865866;
        Fri, 25 Aug 2023 00:51:05 -0700 (PDT)
Received: from [192.168.8.100] (37-48-8-135.nat.epc.tmcz.cz. [37.48.8.135])
        by smtp.gmail.com with ESMTPSA id ay25-20020a056402203900b0052576969ef8sm717115edb.14.2023.08.25.00.51.05
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:51:05 -0700 (PDT)
Message-ID: <c4fac573-49a5-4bed-a7d7-a146af05cfd8@gmail.com>
Date: Fri, 25 Aug 2023 09:51:04 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can AddKey not use stdin for the new key?
Content-Language: en-US
To: cryptsetup@lists.linux.dev
References: <ZOcoDVa4p+vJfAm9@xed.ch> <20230824105155.GA24581@tansi.org>
 <ZOdx+Z5dq9wjD54E@xed.ch> <20230824152350.GA29323@tansi.org>
 <ZOd9KJ6uLqlZFoLi@xed.ch> <20230824191615.GA904@tansi.org>
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
In-Reply-To: <20230824191615.GA904@tansi.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/23 21:16, Arno Wagner wrote:
> Ah, luksAddKey has two key arguments and you can only read
> one from stdin. Somwetimes the most obvious mistakes are
> hard to spot ;-)
> 
> You need:
> 1. The existing passprase from --key-file or interactively
> 2. The new passprase from positional argument or interactively

Yes, the terminal input is tricky because it support
all compatible option since cryptsetup 1.x :)
(If you check tests in sourcecode, you will see various tricky options
we run in CI.)

For the second item there is also --new-keyfile option.

Initially, I thought you just need

cryptsetup luksAddKey <dev> --key-file /key [-q]

- that will ask for the new passphrase only.

You can also send both passphrases from pipe
(but note, this cannot be done for binary input as it rely on
processing \n - do not use "-" as keyfile spec as it switch
to binary processing!):

echo -e "$PWD1\n$PWD2" | cryptsetup luksAddKey <dev>

For LUKS2 you can also add token that will try to read it
from kernel keyring.

Milan
