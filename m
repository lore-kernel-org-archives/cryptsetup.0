Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA653370F4
	for <cryptsetup@lists.linux.dev>; Thu,  2 Apr 2026 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144204; cv=none; b=sNp01AfQrkXwFybDxSvydwA5/jAFeBvYGkzIXoc6RONJEnfE72/CoBI+LthbTKGHSej7qI5A66PMCw/BTyQjzTZHUIDn7OY7ytAoBwzXMle3omYRymEY7Fcn1kn5aDB8boL/ILKeoX3wtRGqqr1VJncDgEQb3PHG/+QMe/ucTMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144204; c=relaxed/simple;
	bh=otiP3wef49sVSLDmImp3d8XGgfjz4pMeY5yE7zU6ZY0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=DeGjtDhZoyUZQMaqk/mAw/VG5Z1WFUgJ+n0eagKxOhGDbkfiXaZOiXgHLDDEGcOhuv1d97uHchroZgJXcSbthYQCwfR8qRvQPmxN1sXmFOvXtAWQxtQHCbCtutq+a/tVx0nQ2hyrYahYKK6wcFyNDTrh6l1maSO6NZbZOTf47xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MV4EGIsr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MV4EGIsr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48891776099so9759885e9.2
        for <cryptsetup@lists.linux.dev>; Thu, 02 Apr 2026 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775144202; x=1775749002; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otiP3wef49sVSLDmImp3d8XGgfjz4pMeY5yE7zU6ZY0=;
        b=MV4EGIsrpK63zFiix9lCVaxY9tZaFJlujMuZUG1T3GnvwTYWLj8IcK/DZdntaEXk20
         gN0Y/29KYyQcUm4rymd1lFTAPh0IEHhVlB/dGf5i2C2KPCaN4ysgGEFaVVkkFMWj6xM7
         TqS7RyL3WP2yLSIMfUPaEdumm16yaiJ48K+m5DpBSW2BNSRdqGP/o8hxFrNUGZm1823y
         md7TUit8nyPId+T+AIuhA6uJxMObRfOmBOYN9B40il6RWvc3y2DiN1ZduDs6Cfjn7aGD
         GSB549qyzXLNklcGu5m9egbEDRdKsz2ojyRFhHFkHd4VD70tr6CidxLjP4KSqCrPc5f1
         a2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775144202; x=1775749002;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otiP3wef49sVSLDmImp3d8XGgfjz4pMeY5yE7zU6ZY0=;
        b=BHfDKWqXLrFEiDFABFJne/HykwujcmI6g5Eqfy5IEsBKV/KFoDxS1jgZwPpKWBvnqh
         L1cJVSr8Cfx6GqVmnPrVr+wNbD4Z2wC7ii9F+OQK6DI0McBx12C+DrJAwR6LTsNYFw9b
         CrwFgirIoH80v6ESqXJsSIIOaKf7DpFwbGTPrwWIlO4BuAIIBNhJRjtqQenyU+GEAnFM
         DPnJaqjQfUDQhPCW8s8Nv1ImVE0t0m1TA66sCFf3V0rCvpJc0GdAz4jFi/ByVVvxD19l
         8eXwVrUQ7EsTycEZIXHU2iEoOuThMthJCt9vBJGRnSdgftgsSdV6j5729l1F0xjSUelv
         kJOg==
X-Gm-Message-State: AOJu0YxrqRIbBRr2N0uxtj1eCXt69Vq14u1D53hm23rVOYCtmzp8b6N2
	4aKTNO4qMiJrFVP+5DExIr+AFmH8kUl1M9UUi9Wy4AH1y5+tNFPZQpsO7bTbdvnk
X-Gm-Gg: ATEYQzxzc9u75eLoW7A9tMCA1dJlwGVoDOj3oVnhEdnReudu2Z3YzN75WHrg5cGNdMg
	d4NwYaOhsv2Y972GREwPJA0i0ZPj42VS3um6jlCTx4UVB+fK4kBG0+UUxdvwspsKdaOoYK+p9Gb
	CesRyZ70o4+gxumKigN/VMkQwa+hyyiaP7AzzT4ONOyntH49fb0azxTcL+bbpcJCb48BkgwHyOI
	EFqKcPfcs5c26a6eAtCzpPRalMXM+zN1WCsWQs9cpE5hV2WqCJUgTdH61nQa9Co6NvFCGJR/cJq
	gutUKKD6UDANw/ls8GPJI3IvFoFQZ62OS65/qaMmvmai/G33RRmXF6wHeXyCNDDFTSltgj86iwY
	xJFjHhT0HGmUM56aAVgxfGZWcJadgA22KlG/CzH6c+COb293SsvMjJ/bJNgeUunK7ucnF4hbUGJ
	Xw1VcbXgvHzaFPETCTUurKfYbBva2ngDlMbFIZKYyDO9OiAr5p
X-Received: by 2002:a05:600c:8706:b0:486:fe23:1707 with SMTP id 5b1f17b1804b1-4888b7862ebmr59879525e9.20.1775144201915;
        Thu, 02 Apr 2026 08:36:41 -0700 (PDT)
Received: from [192.168.2.14] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8b8e8asm66804345e9.25.2026.04.02.08.36.41
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 08:36:41 -0700 (PDT)
Message-ID: <99b1f968-a380-4aee-b1de-83703d01bc97@gmail.com>
Date: Thu, 2 Apr 2026 17:36:40 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCE] cryptsetup 2.8.5
From: Milan Broz <gmazyland@gmail.com>
To: cryptsetup development <cryptsetup@lists.linux.dev>
References: <8f22087e-bb41-4b15-8fe3-050383dc4c84@gmail.com>
Content-Language: en-US
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <8f22087e-bb41-4b15-8fe3-050383dc4c84@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/26 4:09 PM, Milan Broz wrote:
> The cryptsetup 2.8.5 stable release is available

Well, there was an unexpected Easter egg, temporary
file config is now broken. Please wait for 2.8.6.

Sorry for that, we apparently need better integration checks.

Milan

