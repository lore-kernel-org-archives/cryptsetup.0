Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5D7236420
	for <cryptsetup@lists.linux.dev>; Thu,  6 Feb 2025 15:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738854511; cv=none; b=FyFK0B60MQ67NkhCqrnpKK6MjtGPYN6XLzwd6j5onb2ZS2nQ/WacAIxMsIQnsU7awfmBew/LQqpnFqU5kXbiHOtK88mw+x8jWcqVF5yNJmGYPeTDDZTQC8uxQGp5CWowWPXiYo63ck0Zojlbz3aNFUDELAwfhyZQC2ZYJb5lXWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738854511; c=relaxed/simple;
	bh=fDFCsKyFVPpNJvlPhFNAQi5kh5qjjQ2FfFQXHhTZZI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hkh8Qjo4xoWh68+2JvZDPPYTU4h/gF9jlpSPDks9aQh8Vl5BXl6PmOH+uaVtqbZ7cUcHY6S0AuIJkFMBlOFts1E0V5heyrokCLWxTIJfTakXnLt8+B2VsHw49oOIxCZv68hH5gHSo7s4Y1gXaKepIEP2xYzemPHWUR6i9w47YPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbwfGp5V; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbwfGp5V"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401e6efffcso1042707e87.3
        for <cryptsetup@lists.linux.dev>; Thu, 06 Feb 2025 07:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738854507; x=1739459307; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r59UJje79M/qm28ZAMgsmuAYbEsKHXVf5LwwpC38400=;
        b=LbwfGp5VEdNpPPHhYNwJzkdi8x1yRiniGpW3bWvE83gCUYAKaxzxYLD+8Npmz0Ssi3
         x6ysdml0KrNFk+gRl88Cj6pRaDYgYQ4mZQZYgH6c1SmDrkD7FYNEJCxPkAZvyslzmUwJ
         kMmhQoYwINgNqEyVMRX3qNYo+WMGJXKeN2m9ChOdoVtr5CZH8a+lDG5gum8pYs7hNrFJ
         GKwqYaNr61pRsxf+JI58PKYsEoTZ7aadcQ3s20+BRnip7ostKwXFLUu792NLRSD3YAIZ
         rQpZVip2BTfosWKL3sd6cWstDnBrL+bMbZi1Sk2P5Ir+Ug/wqK2AJ0opFt+DAV0H6BFh
         oHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854507; x=1739459307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r59UJje79M/qm28ZAMgsmuAYbEsKHXVf5LwwpC38400=;
        b=w/jn4BsDUb+8piz6M9DyKr/1hY/hFhDelmAiIq97kfS5iVYIDoWc9EkNpznqYH9KlT
         jjf6I8mPGJ5E3auv97gWmD5/OKSaOUlAgqrAk3U2xyz55qpiZSPeSw/UqX3OF8FGFHN8
         SdabzLXmch4fxhbAQJqN5rmgHnm4kSkwJOynIB2naSN3OKv4sszC/T2Tr5wDfLIE6L2c
         sd1qxPN0TF6uNp4ffLoakGI1trnRRsm8NTcZbKkh85IjoqNyOMCqQRQ3fwfCIcfKyIw0
         zPnowZax1xeFCJexb3ATKcHHQq6u7j15GZD8la4d02fEqasxpE/WbJc6V/g4AeVLcX0C
         lLrw==
X-Forwarded-Encrypted: i=1; AJvYcCV5y9ZWT+cKmlhXtTVXilZKooq7MNjas2QTO58O1+bgYnMg/FQZ9MoTjdwgXA5OuHnGfoIdQFaLpq0j@lists.linux.dev
X-Gm-Message-State: AOJu0Yym8EU5Phxdjb3nSEjoJgG5uGfQo/E5/fIaZ3ZGbK3KcZajZktH
	+iwlpAJU7MsMnsEB3SMg0RrCs4w2rEH8GMYvQppA6HEx1fMQ49891Mi2nQ==
X-Gm-Gg: ASbGncshGCTkvLnozdMuHx6bQtUNMRdFzS/Lx7RU8jgzUE1sfsv1LVzNx83TCx1VKYm
	jrfUFAuoBmB04A9NHsu6+k0YY7j4OofEjchDUwLhkee7j2R8WtqpInWNRMoKhGw5wvT/7dknBzq
	8O8f42+UMbUzhTLpCq7sKj0fsPo+fEJQ14y1a43t5BRDrrvLMPor2rLvEIW2R/r6p7kShvrUuNB
	8EUjE+sAvUJVdsrTGueaGc4+Zd8Gmg/WupmJ/D0zUsX7q67bnjlY+6LK+4oaYCYMgKKvb7ilGDY
	zSpc18rzFitgfZxF8BhfuSnGdYbd9+Tu+wt4FOs=
X-Google-Smtp-Source: AGHT+IFIYG0uVSKcPlDc3i8yj+YIVBIh6v74CpeOVCQb3w09UqpUnAaVwE9OJ2gsCvnSjFtfOQGTWQ==
X-Received: by 2002:a05:6512:3585:b0:542:232a:7b2c with SMTP id 2adb3069b0e04-54405a2e224mr1820128e87.29.1738854506486;
        Thu, 06 Feb 2025 07:08:26 -0800 (PST)
Received: from [147.251.42.106] (fosforos.fi.muni.cz. [147.251.42.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77364444csm110812966b.164.2025.02.06.07.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 07:08:25 -0800 (PST)
Message-ID: <2ae83c1d-4d1a-4fb6-a46c-0aaa1e024269@gmail.com>
Date: Thu, 6 Feb 2025 16:08:25 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cryptsetup FAQ - clarification of loop device security guarantees
To: forbytten <emlister@proton.me>,
 "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
References: <ECuOkqnIQPivTNgsB2kV-djutsXXEdcFpuE3OKiwaP2ypwzAyrp9kYt_jGMSYZ6jdEkhmIRvX6sSCLMaITA8IHEpDyA2U9K8HCNdEpCoQ0M=@proton.me>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <ECuOkqnIQPivTNgsB2kV-djutsXXEdcFpuE3OKiwaP2ypwzAyrp9kYt_jGMSYZ6jdEkhmIRvX6sSCLMaITA8IHEpDyA2U9K8HCNdEpCoQ0M=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/25 10:04 AM, forbytten wrote:
> Hi,
> 
> In the cryptsetup FAQ, under "2.6 How do I use LUKS with a loop-device?" it states "This can be very handy for experiments". I am seeking clarification of whether the security "guarantees" of such use would still be suitable for production use. I hypothesize they would be, due to:

Loop devices just remap IOs, they are routinely allocated by cryptsetup itself once you use an image (in file) instead of block device.
  
> 2. I would expect the threat model of LUKS2/dm-crypt/aes-xts to include the ability of a threat actor to take a block level image of a physical device and attack it offline, which would be equivalent to having a loop device backing file?

This is irrelevant to loop devices, you can always create an image and analyze/attack it even without allocation of a loop device.

Loop device is just a tool that maps a file to virtual block device, nothing more.
  
> 3. I would expect a loop device to behave identically to a block device as far as LUKS2/dm-crypt are concerned.

yes.

Milan

