Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B22B1C378A
	for <cryptsetup@lists.linux.dev>; Tue,  6 Aug 2024 11:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722943803; cv=none; b=FpF/vKWE8T16cmAaNuYQ1xwoiHyBnQR9wJJbsAqCikW4bhmR3RErcy+yVhAPs2Lby9IRiknMfEjbQHNz67wcvkUWrm0pPRD7usaz5Q3o6SQu/DLSDlY3ZaHCi691G2eyDxyJCyLIOdJb+wAGMu01mLz6wX+plGyQu+1hxmgw/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722943803; c=relaxed/simple;
	bh=emrYVq7r1iTn+1AT09DnE+Xxv4jYcksaxSODwrBXC2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=X4+aifaREyY8SVFvLUx9vOxAxoYw5jr8KY47g6V2uu7XVNNlkRxg0bN5LsYGXk4bL84qoKaDrM0TFFu7mHjqJHdh17PJ6Utbk9TUHRZtebbHF1WzMsif8YkO090tznoGOELMvg4f9qoLO/2EvTr5rIc/VxsYGT2Ue7VDoRqaRrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWeEU6Tv; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWeEU6Tv"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7de4364ca8so62056166b.2
        for <cryptsetup@lists.linux.dev>; Tue, 06 Aug 2024 04:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722943800; x=1723548600; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XK2mBfRjsKklOA4MIQc0PXoWq8hcGLlogQ086DEPar8=;
        b=XWeEU6TvEXRuh1E4Igw3Uk5qTw8fznnyadR7ZUt+70iHW7iwP7kN+ewRZUU3IW7bjV
         FEjwcRUWvNK+rqwEufash+SiYivE2D/8TVR3gpUs92QHKovQWrr3wrGwPif437cFKLKa
         SwDD53jdCHG1ggdAktDL0kdn7HG6fkqnqWgtCk1KSZu1zN5zXGf37sIMh4ScmRTnLE/K
         s7WA2bnvt8zWrwF49h5jCjSknytNxKDzna3TkA3DxHTvfFaOqfsFGXeg5ctv3ueMLTgz
         uCVDjfpHMj14m/SD9K2aznpNypGpzIfNMmvKpTrMlVPiy8nayNvglG9WqbD4SAfMF4PC
         1TZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722943800; x=1723548600;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XK2mBfRjsKklOA4MIQc0PXoWq8hcGLlogQ086DEPar8=;
        b=Rd0dIZOqTtYh62RSbKHmKr+OqL64BWrD1IjftngjIwL3hLqIwBaztEac+X+x9A43+M
         dvee44ChjsnG2pdynRGR5r57NOGPu6zP+X9keHypOND8Nzqc8QDnghUVDWZ66fiPTRGZ
         fuW6fzwZnvvNgcvPEvX3QK4Z2LBUr/BrO58c0AEYryNu4/qJBpW/u/K+6/HNcRdRjS6+
         tQMZSKDJYHQDQ8Eaa5teYPzHfxtgLRusu4u1J4CzmizAEQepUt1s2ldcCpyJSgjqNKjk
         hUoR4PHjSYeAMfeCNtzoZB02hYQ19vpVwZjTl2xUtUOKHNxUBsVrX4SDtDIf1Y66lPJj
         GM1A==
X-Forwarded-Encrypted: i=1; AJvYcCVieru019zXwhyqPkTNb271fZi8Zn87OmcLW3lz7nAcGnAphVHdL1dGXuqpmOTOMJZR+/M65P9/uAQ4@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4VJedan/YrJ2s+CfhXqmxnp5lWgdByp/2WiUJiqzI0g/sZnLD
	2Fpd3K7/9H5ixXyCsFtjn0apzZRo3BH9IDjqUubc10x27p0dBUMzhWARTA==
X-Google-Smtp-Source: AGHT+IEVMDIWztFknKC3MRGRr0dLo1BFvQAxRLi/pArlWW0hJ8ZGYjMb/GwlnOFIRjzf4MVXu5ADzg==
X-Received: by 2002:a17:907:804:b0:a7d:c148:ec85 with SMTP id a640c23a62f3a-a7dc510554cmr1100688366b.62.1722943799331;
        Tue, 06 Aug 2024 04:29:59 -0700 (PDT)
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c0b6casm538630866b.51.2024.08.06.04.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 04:29:58 -0700 (PDT)
Message-ID: <7c0b967d-1b88-47b4-9d87-bb93a9f90945@gmail.com>
Date: Tue, 6 Aug 2024 13:29:58 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Custom OpenSSL
To: Tomasz Kurzawa <tzkurzawa@gmail.com>, cryptsetup@lists.linux.dev
References: <CABYE94Hx36XOAzqtjpcKdT4S4YyBoCiXVdVXo2bCu02JguBgEA@mail.gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <CABYE94Hx36XOAzqtjpcKdT4S4YyBoCiXVdVXo2bCu02JguBgEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/6/24 7:02 PM, Tomasz Kurzawa wrote:
> Hi All,
> 
> I am currently working on building Cryptsetup with the --enable-fips
> option and integrating it with my custom OpenSSL build, rather than
> the default OpenSSL provided by the operating system. Despite my
> efforts, the debug messages indicate that the system’s OpenSSL version
> is still being used.

Cryptsetup does not do any magic here, it just use what it detects.

So, for compilation, change your pkgconfig to point to your devel version
(usually links in libcrypto.pc, not in openssl.pc that references it!).

After installation, is is only about your ldconfig path.

It is not so easy as link to one library, OpenSSL3 uses providers and these
need to be loaded from a specific location (see libcrypto.pc).

If it is for older OpenSSL2, then situation can slightly differ, but
the logic is the same.

> 
> Here is the command I used for the build (custom OpenSSL is installed
> in /usr/local):
> 
> LIBCRYPTO_LIBS="/usr/local/lib64" LDFLAGS="-Wl,-rpath,/usr/local/lib64
> -L/usr/local/lib64" CPPFLAGS="-I/usr/local/include" LIBS="-lcrypto
> -lssl" ./configure --enable-fips
> make

Do not use it this way, keep autoconf to detect LIBCRYPTO_LIBS
(set by pkgconfig).

Milan
