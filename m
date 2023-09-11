Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C02BE55
	for <cryptsetup@lists.linux.dev>; Mon, 11 Sep 2023 10:12:59 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bdcade7fbso531829666b.1
        for <cryptsetup@lists.linux.dev>; Mon, 11 Sep 2023 03:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694427177; x=1695031977; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DyMYYjPqJALRi2xuDpSEsrBzGZV9zIpcDPLAUpoAw2E=;
        b=GT1TbKwkXGkL/lSaYFUwciwX3uLZwIflSxHMUXy96z+uz+4sl/ZJoqOSziaRlTQRI2
         nnzh16L9vE5zEIf09aNQC5xhgQVCwqQ4xDu7NE6I4z+J244lgFF6NF3hyLVQQr1rzkNK
         IXybK8XhFNXkjKEyq9Mb6nzYOCLTfkQ4b6V2/u868V2Ty0pB+d+SDJ6MJiFte/4qJUqF
         LxdNLGVJd4+bn5N+u5fp8Aojni2OPCuukXwddfyOb3mGwhQN5OnHKMCug28IvfAVfu7s
         5ATu9oGtHAxdwlom/jTOCl6DZa8e8eCxKj6WwwdYo9W6pRfSpD/crcwvm8Bowpn6kkA7
         6oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694427177; x=1695031977;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DyMYYjPqJALRi2xuDpSEsrBzGZV9zIpcDPLAUpoAw2E=;
        b=LRE5e9QVaWWYibKTEVV5iogSuqNBIOL+KXJJE7mjwZrMA/7zFnfBjaaH0T5wOL4rUf
         HsW1LQ9Q5VTZKmX/MhYCEJgK/N1QGWyNVOsD2f/lfWf1UZeiCwJwOJaxi2beeUWM9xUf
         IfaCQe1F5S6nIr95TEpijdLfWjxGcfd4vTg6a/TBjHv+aB+02LPUd4X9u7RUCwZ1rnpr
         NwF+TpMFbw96KwDmiufVy05oBDeNRlhI1VylewnwrCIe/ZBbrxQuK4fNZ1UYiD9xZrXG
         3i0HHLAbp9hFoygdeOPDo9Dd5+X0XnkmHLF1+WCDMbcYIywS2Op2DdEPUmL7njnaeg1G
         kgwA==
X-Gm-Message-State: AOJu0YxvAEl4c/UPy2K17RWHeepeBoMwiqHkGG0dfQQTReL+H6nhDkWy
	wxq6uCpW6Hq6baETvFTO+79XIp072bg=
X-Google-Smtp-Source: AGHT+IG+LWYKiPd6MWxQaDgI1LXgaHPL7SXlG0adoQ3FnDmoJqf4Izyh8U/HA4ii4ICgczMKFmzTFw==
X-Received: by 2002:a17:906:315a:b0:9a2:1b05:24c6 with SMTP id e26-20020a170906315a00b009a21b0524c6mr7300528eje.22.1694427177340;
        Mon, 11 Sep 2023 03:12:57 -0700 (PDT)
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id kt8-20020a170906aac800b0099df2ddfc37sm5070120ejb.165.2023.09.11.03.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 03:12:56 -0700 (PDT)
Message-ID: <cab2b838-8482-4cbf-b441-f63999b24221@gmail.com>
Date: Mon, 11 Sep 2023 12:12:55 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Is it possible to set the amount of CRC32C hashes per a data
 sector in integritysetup?
Content-Language: en-US
To: Arno Wagner <arno@wagner.name>, cryptsetup@lists.linux.dev
References: <4685725c-4b76-47c2-86b8-377b4e1fc7fd@gmail.com>
 <207ef66a-7797-480e-8ffd-75fd8c5c1d97@home.arpa>
 <20230910220513.GA30714@tansi.org>
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <20230910220513.GA30714@tansi.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/11/23 00:05, Arno Wagner wrote:
> On Sun, Sep 10, 2023 at 18:53:04 CEST, Michael Kjörling wrote:
>> On 10 Sep 2023 18:12 +0300, from bodqhrohro@gmail.com (Горбешко Богдан):
>>> AFAIU, the primary goal of dm-integrity is checking if the data are not
>>> corrupted and throwing read errors otherwise. Though it still supports
>>> checksums besides of hashes. Can they be used for recovering the data
>>> on-the-fly?
>>
>> _My understanding_ (which may be wrong) is that this is not what
>> dm-integrity is intended for; nor does it look like it supports it.
>   
> It is not. What this needs is things like RAID 1/5/6 (which can
> be done in files) and some specialized tools.
> 
> Incidentally, "checksums" do never support recovery from
> errors. What you need for that is error correcting codes.

Yes, this fully applies to dm-integrity (read-write integrity protected device).


That said, dm-verity (that is read-only target and uses Merkle tree
protection for the whole device) can be combined with forward
error correction codes (FEC, here Reed-Salomon) and can fix
a lot of corrupted data (and veritysetup fully supports FEC options).

(If used with smartphones, it apparently extends lifetime by
continuously repairing failing flash storage that internal correction
no longer handles - but I have never seen real data that it actually works
for real phones in the wild...
But I think that was motivation for Google to implement FEC for dm-verity.).


I had an idea how to combine FEC with dm-integrity, but it never
happened and probably never happen, as nobody will pay the time
for development. (And obviously it will be very slow.)

> Transparently, RAID is probably the easiest option in Linux
> and the one the works on sector-level. Given that modern drives
> (HDD and SSDs) already do extensive error-correction, you probably
> need to deal with whole-sector loss (or worse) to get any
> additional effect.

Reed-Solomon (and some new algorithms) are very good in repairing such
situations. (It is all about erasure coding.)

But I think many people just use RAID with dm-integrity now (despite it is slow).

Milan
