Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B211E5729
	for <cryptsetup@lists.linux.dev>; Sat, 10 May 2025 16:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746893904; cv=none; b=Esg9XY9vTUpUY2OOx4DNVGWMgdeLcRgUsI+u02GbUJ9OBpMIFrigAlxu8OEklOeSkv/m1LIzhXrMbQsmUgUuy8IxhMG5xKU9yn4vwx+XCrAAAefxcinJy4djUAsVhSKArfrWhyBbVGgbz8xb9EB09leKKXVOSxPzNLdNpoCk+3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746893904; c=relaxed/simple;
	bh=VqzbC9zhwnHSZekHpoyWA2iSi7lFfT5niO2hwLRtgzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bnTORHNsAtKnpV+CBSHZBtCGJN4zsG4FyiOCGXFm5S/8qwD86pRR35quFbfqOMALzX8Unxlilwx9eJwP72Td1l+04IrcoxvZlnINL4WFpFUOyaJ6691fto/4cqpqzoXE0BdYrntS94UT5+S0oWvRjVi2VoHP7l3mkpyU1TjWD34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hC9Tj53r; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hC9Tj53r"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0ba0b6b76so2084885f8f.1
        for <cryptsetup@lists.linux.dev>; Sat, 10 May 2025 09:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746893901; x=1747498701; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cIDoJNd7p1xkEc+EZ4OlEXogbDgB4rcpAjjzG17LLSc=;
        b=hC9Tj53rEMM+dm+79j7FGnLbpyApB+nEgn5H4SqJjEHMq8aH4L4cmoF5yJK/g/unXu
         lDp5ZUGH7dhRysYzC6e2OuQnqpnUkdZ8Ce+UfUjxUimDHpxK91ms5u/MnodCf/cn8OgJ
         9bLpivkudZ6njTkCNKm8xnekJGObDiZRZ1ANQQwSyPyGUZX/yYyuDTA0UCLvVwPGUr17
         REW1xNYGwmxKmOg9QFlSLlrnOOEEl6veCPYs+l97QV4UHSDSj9PdJAwqyAO5iqfE8qrp
         xUihEcOQfMFVhqe7r2qIZ46X1v88FIybHrHUoZjh+Wy0tQ0VR3jiLs5HJVwEMVSIgU9D
         vTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746893901; x=1747498701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIDoJNd7p1xkEc+EZ4OlEXogbDgB4rcpAjjzG17LLSc=;
        b=VIMhZo59WPgLveNSX0+s8A+kH+bkx92E/P6dgbLtFazTnzHbZilwxPyrLHOUZF+7pT
         ZuN7Ef9ohROMLxHybIzdxWXgPgf+DRtleEy7ANSecfsxTsGd6QAi/ATaJ8JE57QYh8lE
         ihf5n5lbuPJqMuBmiK59d4d+n7FdO16HiyKQyttiHk1v0AkfA2wWAKxng5V3X/ZPBEEk
         qMDkNgyR6sbfglgIgy6nefwvHjvJN74MnKohw/7m7AGtrY2p0Jug8N3ufX4NMI6DbGRS
         QFgOoEW+Wem77gwS66/QhHQeVVjqFlIwvBbTNdFksvxYGoXtcmllzoagGcEbBTXXmgBY
         1VoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMPLWItmpj25e/Mc/ZSbC2L7/2BvRB4GQpP21Gz4rrQYyHBcVSH8x12gAZgtTII8wXDQvlUeIx7kZ8@lists.linux.dev
X-Gm-Message-State: AOJu0YxhYrMej//rxvAXZrxTB9z4KddCMS255WbjBZkAcXpE8g07NTyy
	+lOgpWvRh0S4+m7abqx7zSQ5upqtPbkWFHnfqStbxQBGnmhcJeZrG+/5yw==
X-Gm-Gg: ASbGncucfO5TxG1TS+twt9sOEXMmDyb/ZmMKnCOW99A964ecD1wjauZFzheg3dD6/ca
	1DoeiCjcM/ST/Yvn2sJRO92HIKGCEZMYP12s3ncjayfdp/b1j5g5Vqib5UkwpciteK2R8W+TL7S
	OPkgV0u3YpczS3ptJ81ESakn1Q0yckYSHU4noqWsREoTkaT1KC6heSdeiZco1Xx7T2pB8HxDLdF
	Eygpnz7mqTOAOtucgpULx56kEVACMwM2hSXLdWiybTdDWTS+dWFrPvtdxbrGM0dqThUhbq2F7hJ
	q4mB3gQe12PRrR2iM7vJwpBRcLGPTBs65hcS0sGkliOOe4R/tBA7eqc7JBI4EVd+hY/dc+wt/Sv
	xfQ46HbyezGo=
X-Google-Smtp-Source: AGHT+IGAL9x3Veg9oS+odsokKHgek23d0ArfiOgUDhsSYJ5G2WE9vT8pVEn/LmYyKG4Efn14VxozAw==
X-Received: by 2002:a05:6000:4313:b0:39e:e75b:5cc with SMTP id ffacd0b85a97d-3a1f6457687mr6005997f8f.16.1746893900910;
        Sat, 10 May 2025 09:18:20 -0700 (PDT)
Received: from [192.168.2.23] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d5cf5d6bsm72285755e9.1.2025.05.10.09.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 09:18:20 -0700 (PDT)
Message-ID: <f2c3da09-bd41-427d-8e96-61d3a4a80397@gmail.com>
Date: Sat, 10 May 2025 18:18:18 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Equivalent of --integrity-recalculate
To: Marc SCHAEFER <schaefer@alphanet.ch>, cryptsetup@lists.linux.dev
References: <aB919cDdLQfSsb0V@alphanet.ch>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <aB919cDdLQfSsb0V@alphanet.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/10/25 5:51 PM, Marc SCHAEFER wrote:
> Hello,
> 
> If you create a cryptsetup/luks device with integrity with:
> 
>     cryptsetup luksFormat -q --type luks2 --integrity hmac-sha256 $dev
> 
> and then open it:
> 
>     cryptsetup open $dev backup-copy
> 
> you then get, according to lsblk, two additional devices:
> 
>     - backup-copy (the transparently decrypted/encrypting volume)
> 
>     - backup-copy_dif (the integrity device)
> 
> (which is similar, AFAIK, as when you use dm-integrity with LVM)
> 
> If you create an integrity device separately, you get a
> 
>     integritysetup --integrity-recalculate open $dev integrity
> 
> command which allows to recalculate the integrity blocks.
> 
> I don't think cryptsetup has this option (*); is there a way to
> do it anyway?  Or maybe remove the backup-copy_dif and
> re-add it?

No, because such option is not implemented (and never will be) in dm-crypt.

Note, for integritysetup you use dm-integrity, for cryptsetup
dm-integrity only provides metadata space, AEAD encrypton
is performed in dm-crypt above.

Sometimes it is not even possible, AEAD just cannot take
data with wrong authentication tag and fix it.
This is only possible when the integrity is calculated separately.

Milan

