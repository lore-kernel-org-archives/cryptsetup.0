Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B093254BB
	for <cryptsetup@lists.linux.dev>; Fri, 19 Dec 2025 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766150104; cv=none; b=Uxmq5AK5Bcf+PJ/o441L9tT4xMkylUXDoRc+SwUd1YyP4UOU0dfrDrLu6igTNM/kJhXe2wR1K5APkIsn6NN8/fa4gMvSgVOihgBpj6ccItJ8Pea3HeJXVePa0LWIGszg48E4k/g1RPhzQWZJZU7eCePpvypKFw/5McO5yLyZv+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766150104; c=relaxed/simple;
	bh=qELQFghso/8MMN0L0EI8MlKItdCT1copNFpIj/PPhSE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=YG+eftUAc/F5DUEjdadE8QxkFpQRdtpFqEPk+FZFgjlwH94AS7UlzGbidF1eunb/fZpKHE5UpuTdACDsPtGmiCYT6m0TzhVOAsj0TyIMXPI+My++ESMmD4+N44ofJPW7Feu1zY00cLBQMY1JqlF13Jbmxz71BRPBxufFZwARx58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnBSC/tk; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnBSC/tk"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42e2e628f8aso749081f8f.1
        for <cryptsetup@lists.linux.dev>; Fri, 19 Dec 2025 05:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766150097; x=1766754897; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qELQFghso/8MMN0L0EI8MlKItdCT1copNFpIj/PPhSE=;
        b=RnBSC/tkE7Pdn8vRU+zMam+pwSxlS290JYgQ5x9F+96qvW2mDwT4a3eWyF5lnfZpN1
         G52153p2zfcq/ZPFYru2xBjcGCzrwBTUvV55W/YsNE48o6zd3WT4m9qWnd3PGVhEkorZ
         tUyXh3hKpWTNjA27nwmG+ldxYwj6qCel1aU8+DOYPHujtfTFK2cCo/hmPia2b+AargDX
         q2GpCXEkxm7kxc9kahdUkr5I5kLHaLb5XgKq/SUPrbBiEaBRDoY2aqSq6ITZcNrTrba8
         fwt/TTuamtpH0JqOiKFbpHX9VqqrzG0AWIJnpzd7VBvWqrrzM4y19Q+fIUO4S8rSmpe4
         DcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766150097; x=1766754897;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qELQFghso/8MMN0L0EI8MlKItdCT1copNFpIj/PPhSE=;
        b=jTnFkv2Tik4VmT+e+A60xo520gLCMK2vl1MWaGk4p6pxCeRzA/3c/M5csmOuXqQ1Sp
         ZihaQQHorNz8KC4/P5oAARLVtmyD1Ao2ElbBAoEnbB/tnB+4tL7F547bhpk0h3scrknT
         aZ5PRt68eb36KQyEVJd5EGi3nnTglT97YiRVV2gqB36F/iUjPZqpWFjzVaMhqZm+DqPL
         6n81mQYFj5MMaePHOkN07xpk7tMjvxDtlnz09DJENgMbh2REYlHn6bK0nubJOr0oG0xx
         h2cwVbP0Ri4RMomQfcrfbJVMZFPZqmvnCSSKT4vg7d+owqTJmLZ/Gc28T1oBu0yiyMpi
         c4Rw==
X-Gm-Message-State: AOJu0YzsBpcPSfD2/5ClCUgQvVyA+hW7TDBK/Lya4P7T9jsUcKy0ynz2
	UPvB9pB/BmDJTamztdshD8Hwr488VGh4Rsp5doyzcog3CCBzhmybw44d2vIjzQ==
X-Gm-Gg: AY/fxX7rp1FUqarMH0B6mFO9yZHc/VQYG4btAXRfFZw+twmRLKmzb5uFkUKJe7UCqil
	RBja1g14uQH/IckV9T7GQeec8tyd/+RLMdxLmw0bgFqYbBcNsvnGCcnzU1pbgdc50HwwwaaPNFN
	yu+0IMNQD7O9h4Wn48CMYOpRq8tnIEStFRlEt5JlhNmKly4PEY3EEIE+VBRKp4F8YIBW8uDSnZh
	ttBHpjRZk6V1v8/mHOb26StgVN8eEc5NWyjT+amQHF4Fv1NWxC1IeXs61FOloFJKBZh1nlCy2pa
	pKu4n5w3OZ3UIqbnpweTY9AeofSoGk+M7BDd0D7+9HEdUAZhTao4tR8xPyCk8UeO/aMYyOtCdcN
	IZKYgNPvjNvo47XmNZXXPtTA+X/vWDJtcSLtZmqAxn/L+2na43lrwEJwAEKL8EGN6XriYGp+ezi
	ry6tkip3I35senKvE=
X-Google-Smtp-Source: AGHT+IG8P+6+xQTPKXieksBGP/GXiu3hq3VDHmavAD3uNVBMQtiV7mQKZXk+EPKNl7DT6xjQnmZknA==
X-Received: by 2002:a5d:5f51:0:b0:429:ba48:4d8 with SMTP id ffacd0b85a97d-4324e4d27b3mr3418572f8f.25.1766150097374;
        Fri, 19 Dec 2025 05:14:57 -0800 (PST)
Received: from [192.168.1.27] ([176.74.141.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea2253csm5199873f8f.14.2025.12.19.05.14.56
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:14:56 -0800 (PST)
Message-ID: <1c04bfa4-9d9e-49c0-b68a-e8b70a0b9c82@gmail.com>
Date: Fri, 19 Dec 2025 14:14:56 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCE] cryptsetup 2.8.3
From: Milan Broz <gmazyland@gmail.com>
To: cryptsetup development <cryptsetup@lists.linux.dev>
References: <1203526c-c9a5-4930-bc49-67ebb9086368@gmail.com>
Content-Language: en-US
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <1203526c-c9a5-4930-bc49-67ebb9086368@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/19/25 2:09 PM, Milan Broz wrote:
> The cryptsetup 2.8.š stable release is ...

2.8.3 ;-)

Anyway, this is only fix for 2.8.2 where a stupid bug was found minutes after release.

Happy Xmas & 2026!
Milan

