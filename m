Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2C840D598
	for <cryptsetup@lists.linux.dev>; Tue, 30 Jun 2026 05:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782798387; cv=none; b=hVTUWrlIYXFQz8ECKPp+PeGlGJ7kgxZJVI4OFsNAnHymEQpVW1BFHE9B85em02N6lDKmm+TPMNQxGVB+jrr+YZF+DRLSM482IpzQZT8d4jfxIpEvR8WaVM84QxVdlu/ogrm1+dl0blRwB8milYDO3O2GIMcVWBaa0ACWpQMhDxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782798387; c=relaxed/simple;
	bh=gO8YJxwS+yLXE3pEBHWtp6SltMP8ulAAU/FjSkNOXwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EJiM59qGTzC7ng2uCpbOrG4l0xBonDEfV0AVev1lIaDb3CBUi8EmmF+DWmNgu5VEVI1jozvnHziYQNfST6MFbQse8YO7fhuTUiSDfxL2+lTleGFwQsg4NSQV9nWRsCrWxDJNhARDDoDLk6pm6u24oA1IUx9Sps380Yuu41XUnfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZltssyZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZltssyZ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46ed4f66256so3239789f8f.3
        for <cryptsetup@lists.linux.dev>; Mon, 29 Jun 2026 22:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782798384; x=1783403184; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cxSfF7azPPb4Wuai/fdfIZanCWx4IQ7DDgXH9wYNEjI=;
        b=KZltssyZLp39dw3tpSrDZPSgbazeNp2K61dpfO8C46Y37BOEGrj7McVEkxaFE2/9BQ
         qpMcEmXbiGAJY8fEZj0eBDHOyicdevpyCbAHq7ASls5ZgwSXuxwdKVaqLHqyTpw8Cpax
         URrOA7XsS8X0isFAwtc4kQOwOuGYd7d8WDY+cvz+2apCVV8TbwM9yhjdllSPUlAw+fGM
         IJCIw+DcovSf3FIcVpVv2wd2NuJHXIDxwRhUigcYebXW1w+SQCL/MHYSTwYiuKoqAm1W
         0M3S1OZmf4LrQW2zLTcplhNwMVrgRgvjRKSvdXEJl2JNWSy0Sni362Ht/8p8sBXUOk0T
         Y6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782798384; x=1783403184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxSfF7azPPb4Wuai/fdfIZanCWx4IQ7DDgXH9wYNEjI=;
        b=Jms4bm7ejgfTcxVUKx5pFt7H8Soi1o2nFZC2hwkCYpuJJ1GetRvlhkS4iT7ZQ4dX42
         xMl/r9ywuT6KWPXtO1J4DQIpZRVJlad0ZpU0h4YjaaQkUxSmSoa1mfqdNaIKmDtidvPC
         mudV1BSWHyrbgmEcYHm1my2eYng0ckVVFXmW6Ny0Nuhlqe1Q1z97Cjn+a6XF+PZmaq8u
         mLWTJnZ5GdDQs0r9hXplLmmlveEHgcFzqE+xxtIajOJw1tg/xqbhgWH+F7HDNfuXS2Tz
         IUQw5E31U/uI/nI44jI5phVNDdyuu8dR9+osmP3vZ7DJDbWNaKGPK8YF7CSwghCAJFYd
         uM4g==
X-Forwarded-Encrypted: i=1; AHgh+RpZjG/aGMZz6z5RwML8SyftKq/sP3VlthAuF1dLQtjSi3BSKlTb5RiHYW/mM/ven5XsfPsoFk4FuO5y@lists.linux.dev
X-Gm-Message-State: AOJu0YzmG0ty6MDp9WTyZ9V8bpWwxWIvpUawbF13R8mv8pvCzbFm1bSV
	Si6qnCx5dPcavIfusUUYSBDOqPW26zLY5R/EMhGFP2Noq41VROT0VUvB9RvwrA==
X-Gm-Gg: AfdE7ckdWzPjBbiKrkHeD+dfaUPNm7P7bWNOdnBeJP6SX6m9soqzhDKNF7Yg1F349PO
	zJEmE7CPgJ58zXfZ79bVOyl4uv/z1AwOyxWh47hm9ikUwyCXzS7OFpKqywIuCaz3oi2xm2wTTpv
	R+Pks4gdgWFbjIjfsOg2x+1wGqYzFV6eefSuwbVJ7FnbhEgLAtbpd2th9Q25xpJvB3HbcaKWbHE
	/ahDGdVtmq+FA4TjKdGLEIvjrSJMuNiRhQqu7YwVZ4Kd61SnUo3N6Xc7rpvWdkHQ/2SziJrlfVW
	/pupugqi/12yqNM4nY6Lp1h6H53/swkBJ3+j+r78Q2lr3wF7AD5Jt+FSz3YLykxvieOUBpOpegM
	AZ9x8v1A9ptnQWCCIcwoHpP2Gclu6CpHwdcYUFvFdFYEa2b+A5mZsAXYYbKqCxD9RnVN+QqnqFs
	QO5GCHcMHqejaGeYfTmjpRGvnLjhUHka8Fv3EDCQ==
X-Received: by 2002:a05:6000:460d:b0:473:8f65:c978 with SMTP id ffacd0b85a97d-47551179a9dmr2288604f8f.1.1782798384202;
        Mon, 29 Jun 2026 22:46:24 -0700 (PDT)
Received: from [192.168.2.14] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475641e4659sm4729250f8f.12.2026.06.29.22.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 22:46:23 -0700 (PDT)
Message-ID: <dac6de42-1409-477b-ae57-5766c28b5c22@gmail.com>
Date: Tue, 30 Jun 2026 07:46:22 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cryptsetup 2.8.7-rc1
To: Christoph Anton Mitterer <calestyo@scientia.org>,
 cryptsetup development <cryptsetup@lists.linux.dev>
References: <5551ed2a-be50-49fe-af21-a78f8abe0315@gmail.com>
 <7989d6080792b67d7fac3ac9db863e280376a9e5.camel@scientia.org>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <7989d6080792b67d7fac3ac9db863e280376a9e5.camel@scientia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/29/26 11:43 PM, Christoph Anton Mitterer wrote:
> Hey.
> 
> On Mon, 2026-06-29 at 22:32 +0200, Milan Broz wrote:
>>   Also, ciphers like Serpent or
>>     Twofish (in XTS mode) are missing from several userspace
>> libraries.
> 
> Uff... bummer. I use both in some special cases.
> 
> 
> Uhm, can I somehow verify this in advance (ideally by actually
> testing)?

You can try to disable kernel af_alg module.

There is an ongoing effort to provide "crippled" af_alg, but I do no think
it is a quite sensible approach. But if it lands in kernel, we adapt to it.

The interface cannot be completely removed (I hope the promise to not
break userspace still holds). Anyway, AF_ALG s is already marked as deprecated.
I am sure kernel people underestimated how many people using it.
Anyway, I gave up discussions in kernel lists, it is still a very toxic environment.

The whole point of this exercise was to prepare for people disabling AF_ALG themselves.
We had already fallback, so it is used for everything now.

> I'm using Debian's cryptsetup packages, which (AFAICS) use OpenSSL as
> backend, which (AFAICS) supports neither serpent, nor twofish.

> Are there any alternatives to keep those running?

Depend how you use it, but if it is for LUKS, we can now fallback to old
temporary dm-crypt mapping even for LUKS2, you just need to be root.

For OpenSSL, it can be extended by providers and it should not be too complicated
to write provider for Twofish and Serpent.
Even Camellia does not support XTS, but that should be fixed inside OpenSSL.

Libgcrypt backend should support all of these, but definitely we do not want to switch
to it by default.

Milan

