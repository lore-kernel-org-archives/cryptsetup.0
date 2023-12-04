Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ADAFBF5
	for <cryptsetup@lists.linux.dev>; Mon,  4 Dec 2023 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YagB/NZf"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-54c967010b2so2558906a12.0
        for <cryptsetup@lists.linux.dev>; Mon, 04 Dec 2023 00:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701678731; x=1702283531; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr3AwSQS6TU6Zk+gQwUVoAP/tV1NxWjC+rI6s3uWwrk=;
        b=YagB/NZfbi//vOXdZLgqzuQ06xtZLJzptc26OtybArTQTnXYHlK1lymWQ4AeRkVU+P
         sTcPVcWfW3UIiVpgTCh+WReqzToAzVMuN3HPAjimLidtcPWnIAsMiDWCwbrD+U3SQLI7
         hv3yoihjOToPlmHFU7mnmVERynj0JWZv0ru2EgkMN0c8WTv4q7Vwn3rd3b9UcLrOg7Zx
         HWZQsqIFVMadsMPN9BPhm0b8VZ7KfJ0kbs8XRx3Ro569/7TkXwwwjFUhhvWhKc91FPuY
         lMNhIxQyBOnEzKyY6iKzFTsKNHZPrs9FXZZIlnGt39ou5Oh9od4gXzo9fV85avM5f9gT
         GtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701678731; x=1702283531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jr3AwSQS6TU6Zk+gQwUVoAP/tV1NxWjC+rI6s3uWwrk=;
        b=ZUMTZl8Fwv7kej+ylmzVE43e5h2PxrEuRArsR87n1P6OErLJAZgPH74Lus7OAVlKVw
         4dGipMptsxSzeC8X17Q63ZhdyQKcgqxj8j5VGTgXJOXO4LqSD8AVHPDsWGRSJHD2PprY
         /H47LQpaeNPhzFhbBZY6YXCFbU10RkXL65bW3VMW1Kwyr7ftfrhfA+sTXv9/vvQgsPLv
         PhmwQ6dpkyE8L3KRyFvAQnBA11Ofwdrc2eBM538JKvI0fBHBlsELuqAW0WSC/xTgdeBR
         APGLzS8fq+9fVt70uhHK3l5mIh20+Lhn/D8ASrQoDh/y1vzQI5Jyr25/ZURtMCgJo4nN
         ba+w==
X-Gm-Message-State: AOJu0YzgXSSu47TB+IbGvWm+B/WbP6XvTJKW8GK+xy3was4PKx6MOLsX
	ndqnbWCaVWfymml7ZrrEIi8=
X-Google-Smtp-Source: AGHT+IGBkEjHCih0XqIlwyNL8FFnCCxKd4GMnsWTCNdFE4Yx0TH1MyoyNr5gUaotzbZdqu47i+g+6w==
X-Received: by 2002:aa7:d883:0:b0:54b:523:b062 with SMTP id u3-20020aa7d883000000b0054b0523b062mr6299711edq.12.1701678730989;
        Mon, 04 Dec 2023 00:32:10 -0800 (PST)
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id eh4-20020a0564020f8400b0054c9b0bd576sm2099200edb.26.2023.12.04.00.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 00:32:10 -0800 (PST)
Message-ID: <198c30e7-0ae3-4e9a-9df7-ea122af4be1f@gmail.com>
Date: Mon, 4 Dec 2023 09:32:09 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question about journal integrity / encryption
To: LRS <vianellov@gmail.com>, cryptsetup@lists.linux.dev
References: <CAFKOM5mU9M2qdfyU4sOYgfJe4anQ+uB80Wcs3GYRbD7L0=av4w@mail.gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <CAFKOM5mU9M2qdfyU4sOYgfJe4anQ+uB80Wcs3GYRbD7L0=av4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/23 15:31, LRS wrote:
> I tried to create a volume with the following command:
> 
> cryptsetup luksFormat --type luks2 /dev/sdb --cipher aes-xts-plain64
> --integrity hmac-sha256
> 
> 
> If I see the json header of Luks2 i see the following part:
> 
> "integrity": {
>          "type": "hmac(sha256)",
>          "journal_encryption": "none",
>          "journal_integrity": "none"
>        }
>      }
> 
> in which I understand that the journal is not encrypted, isn't this a
> security issue? Is it possible to encrypt it somehow?

Yes, for LUKS2 journal metadata are not encrypted.
You cannot currently use encrypted dm-integrity journal with LUKS2 (only
for standalone dm-integrity).
I planned to add it one day, but it need to define how derive key for
the integrity journal.

Data are stored in journal are encrypted (only journal metadata are not encrypted),
so what attacker can do is to reply old encrypted data (or wrong data - but that
will be detected later on read).
All of this can be done with the physical access to media anyway.

Milan
