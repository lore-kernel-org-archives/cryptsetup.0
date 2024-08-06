Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CE11C4611
	for <cryptsetup@lists.linux.dev>; Tue,  6 Aug 2024 12:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722946583; cv=none; b=aah2eyYgfNr7O+kI79u+HwbYNJQQGu/jFqiTK8sDAhbwsakXBJW6L3AZWL9dt3D52GWIuJndVR2EyFBZmZWDC3f8GgODHEYrSKBwEX3k86D1i0tAIJ+1peSrGv6oXqVCWwwaY2RemAtntxfABTiZ3RwbeTVdCmc+OO7JiLTaI7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722946583; c=relaxed/simple;
	bh=AiZnM5K5Sd7yGaUb3hQSwRDsgDb0NsT4xzMHgLfXU9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C1lQc9z/u8MfIwhT7ECVH/xlvhRWrEHL+dxMblkyvsQ3M4IP37aE62qk8HymACI9t91fapYqikzMkyfS9dhf69rNnM0WumdvnAvILU6HoXB0LaaCdXnz8nwOW+ZyYNpvh2EuZtNJgk5E5/9Xyrj2YQTFJgDQjrdUGwgWbimr6tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxJlSD7g; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxJlSD7g"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5b9d48d1456so1270957a12.1
        for <cryptsetup@lists.linux.dev>; Tue, 06 Aug 2024 05:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722946580; x=1723551380; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AiZnM5K5Sd7yGaUb3hQSwRDsgDb0NsT4xzMHgLfXU9Y=;
        b=GxJlSD7g+PGpB8NBYEOX7cMrD/vHhXVeQXMVxht0P7B0K18/a6FPesxR81XHZqJ22y
         hEgmPBDdh03HzmmAPOpZTW0wvTMKmcNnNK2ouwzpoC0kVHDFN8o997KbHXeZPhcNk1YD
         GE3Gnc1vtmXPrKwGJNxJYpxkxUkouxJy06HpW2DcW7l9zXvLOmEGAB/wOuVx4SbvPvUd
         BBWlXJvZFnA4B67pbQILkI3jedEOzM77a4pSTlXvXBZkWWYBnQczgjUjGQH1TIQhHsFJ
         UaAN1Ju4q0jiDsg9HLZo+saa9J2yR1nWBjKHA1dcNT6d/givAJNAUUKfhqPF+zwjBZmX
         oEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722946580; x=1723551380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiZnM5K5Sd7yGaUb3hQSwRDsgDb0NsT4xzMHgLfXU9Y=;
        b=EeTQzJTpP3Rt4uL3kG2tZpQKMnvvtLmj7HSNY4aiRmKmoiUnEcJL+uLpvgkw3erqex
         zMgU17dfCX4c2xYlC2FFeYpt+lHE+YahJib0VDuP3n0Qpasqp8BIauHC2t8elqNkV0UU
         F8vo9M6H1s4e5EEqibkcK/u45bkznKKdybf1xS8/zqejs+HymhVWFLa5L0iFAo57zBfT
         2Y7XimpDMZnLSw5sxAX95keFiDtueZ134Dsqih2T3Fj67xbjuG7sPBnnqb/IjHVEXj12
         kjKpMzq8/n6tSVXwcsfammWY5piuldVjlS2UVyNqdzDfFKjbVaXYBnigzYrCCeqlK0zO
         mfIA==
X-Gm-Message-State: AOJu0YxiMIS06ZZLYTotPHBvZWX/g1Lfud594m/ySCoPveZTTI1y/gOH
	gtAtyUAHWFL/ECR0cnnJ3jOiP72NVWuZGEeoZ6Fj5Ue0ZAhqkQkeXd4bWg==
X-Google-Smtp-Source: AGHT+IFXs6ne0Ap/X8O6kPDy95d2rExIm9j2C5ShLzEsjtU1UoRtWfMfId6cIxLvetQDsZkEuMk3eg==
X-Received: by 2002:a05:6402:1e95:b0:585:5697:b882 with SMTP id 4fb4d7f45d1cf-5b77bbb138bmr14075633a12.3.1722946579297;
        Tue, 06 Aug 2024 05:16:19 -0700 (PDT)
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839708c56sm5936051a12.2.2024.08.06.05.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 05:16:18 -0700 (PDT)
Message-ID: <3e6924a1-b47a-475f-881d-74c484ddd023@gmail.com>
Date: Tue, 6 Aug 2024 14:16:18 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Custom OpenSSL
To: Tomasz Kurzawa <tzkurzawa@gmail.com>
Cc: cryptsetup@lists.linux.dev
References: <CABYE94Hx36XOAzqtjpcKdT4S4YyBoCiXVdVXo2bCu02JguBgEA@mail.gmail.com>
 <7c0b967d-1b88-47b4-9d87-bb93a9f90945@gmail.com>
 <CABYE94EyAoO3XvSvQtPoQna_5ZbHLtQb=WD9wEsG_vxkJKGG4w@mail.gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <CABYE94EyAoO3XvSvQtPoQna_5ZbHLtQb=WD9wEsG_vxkJKGG4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/6/24 7:55 PM, Tomasz Kurzawa wrote:
> So, just to clarify, there’s no straightforward method to specify the
> OpenSSL version for cryptsetup using an environment variable or
> configuration file? I’m trying to use a particular OpenSSL version
> exclusively for cryptsetup without altering anything in pkgconfig.

Nothing officially supported, as I think it is not needed as you can
use chroot or modification of that pkgconfig.
I think you can set path to pkgconfig so it would work automagically.

(As mentioned, OpenSSL lib has providers - separate ld libraries - so
it is not so simple. Specifically for FIPS provider you will probably
need to also setup OpenSSL config file.)

Note that cryptsetup supports several crypto backends, it would be pain
to maintain all variants.

Anyway, if there is some simple change that could help, report it
on project page or create a merge request.

Thanks,
Milan
