Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632DF15B575
	for <cryptsetup@lists.linux.dev>; Wed, 29 May 2024 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717006552; cv=none; b=iXevEyIxD/YkfBy8rNtnDyR9XvElH5TQDNXMpeeyPY18wMNUzIFFsVLwh6iNvs8WS3JIN7l2s8vDMqBOMmHA4rPonnS2gu6w+VYZByw9ZmEnnjSl7Y/SFldYQ7W5284698f9G1lo5oGWStzo1oymmDC9r6u/qvFgq7Mm4P1IHKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717006552; c=relaxed/simple;
	bh=46+lv5NkFPBlz0WfTlUToBlQVVeHn5lCqobr8QBCwF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GB+MJQkVrfXKyUqgaOwfCf6M/a+XlPOGdz3s2TEXXmvsjKgQielv2hwUvczUWeO2cE+QLaObCKD5inJ/TQoy8yTxx75+6OYvFSIH9HkFPVVJs2NTvt1/l1lkXFNpujq8U2+FxNlOzzYZ3iSUEatc2OFxUzBYOJKlmnMQlUNUjYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U34/SrY6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U34/SrY6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-354dfe54738so1539597f8f.3
        for <cryptsetup@lists.linux.dev>; Wed, 29 May 2024 11:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717006549; x=1717611349; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2dIC3HOPe/Kprm/ySx8hwXwIVrNoMQtNLkTev1WJHRc=;
        b=U34/SrY6j/fO0dzODbqohRDMP367fpi+lRzWntbY/USpSq7csIXEMB7/ATLlqb/Jy6
         eVqXpGhQPuFmzPwE6A83gAn4WpqL5jq+3L4iaGzWs+uXD6onpZ/kyERVIU3tajcou9SE
         j5YGCniUgbk3uPvCmcL15rxLRovaxHacGhXZdQc9iObO86eom/LuvoQZaa5a2l7XgjCv
         MPZHA5+TZOMYTt/IffsFMLD5AhjIdyt4PxrmBh1RNacv1VSyk79nx39eIsFmmpht5uID
         WYSH2dOFBQW8+/LsyTZm+Y7cZGwDYQlA+ok5cSB+FBQP/HmdoVdAaa7Sxt4haaYJ2Db4
         mvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717006549; x=1717611349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dIC3HOPe/Kprm/ySx8hwXwIVrNoMQtNLkTev1WJHRc=;
        b=TGeJIL6xr9dtneBgG8iIxbwrSHetaEmJigyY8j9w2bbsHAtrB+Skpxtef7w+KnadIA
         7bH9mZAA5emvYM0zPOHxArg96m2pFb7AgjWhSh2pHCus4llrxam2rlR0YCnotVcl4aHJ
         +zFwhUtjeQvNSt3tK51LSwDsWN2ppsPbxGcimcKKPFz1VfdXVbn638gBKEeZpY6vWw+k
         ZOlJ8U2FAnhZJsSI7jDWvkIP96wHV1iQMrSGp4GdP9Uqcxjm9+gTPbNE4EbkmjlfKYYI
         c6SA5tP+ii7CRivKHcuHzFdl4OSsiV8FM+Axyc0xJ8GKzkPDFXy1v8wwJgszIfatsKYi
         TvZg==
X-Forwarded-Encrypted: i=1; AJvYcCVsyleaFbkUc7zCi2r3MVWCbYc2tRfBmZpA9Ktt2p/HWVePVIV2mdzrwONtcgGGskedP6SYkVUVpNrScRLbmBGNtBNMNj8QiGyE9g==
X-Gm-Message-State: AOJu0Yx1goxwizOGQWdRYboUmP6Lwrp25x5iyai89OFfifYCg0Byqhyb
	gta5UPAQNHq9Co1ggIpV0dGAjbs67s9GkIhWwdWA7ySyqryYIuycEwJ80w==
X-Google-Smtp-Source: AGHT+IEGMUKTu9HzcFic7EK1Q5wDvhtEamjjpgo8gTY2g9lBISwgJvjg0Z5VOPFHzlWUlLxcDiE8Uw==
X-Received: by 2002:a05:6000:364:b0:34c:9a04:466f with SMTP id ffacd0b85a97d-35dc00be96cmr988f8f.50.1717006548408;
        Wed, 29 May 2024 11:15:48 -0700 (PDT)
Received: from [192.168.2.30] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35da48c5fb4sm970786f8f.46.2024.05.29.11.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 11:15:47 -0700 (PDT)
Message-ID: <e862428e-fe9d-4b9c-a8f4-e12390688c05@gmail.com>
Date: Wed, 29 May 2024 20:15:46 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Behavior of in-place encryption with --reduce-device-size
To: "John A. Leuenhagen" <john@zlima12.com>, cryptsetup@lists.linux.dev
References: <zqmdlvho3du3b7uyldgj4qeqk5ix36o7rmwo44ia2hl6ngmdnl@72qguwtrdma4>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <zqmdlvho3du3b7uyldgj4qeqk5ix36o7rmwo44ia2hl6ngmdnl@72qguwtrdma4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 5/29/24 7:45 PM, John A. Leuenhagen wrote:
> I was looking at doing in-place encryption on a currently unencrypted
> volume, and found that this is supported through `cryptsetup reencrypt
> --encrypt ...`. This is great, but I was curious as to how it actually
> did this, and the details online were scarce for what could potentially
> be a destructive operation.
> 
> What is unclear to me is that the LUKS header must go at the beginning
> of the device, overwriting any data that might be there. The
> --reduce-device-size option suggests that space will be taken from the
> end of the device; does this mean that data will be shifted to the right
> as encryption takes place?

yes.

> If so, how does this process fare against an
> interruption (e.g. SIGINT)? The man page suggests this will be fine, but
> I was curious about the details here.

This depends on format. For LUKS1, there are external files that tracks
process (basically old and new LUKS header and log where progress is stored).
For not yet encrypted device the old header basically just empty header.

For LUKS2, the reencryption metadata is stored in the header area itself
and reencryption can run online (device can be used during reencryption).

In both cases, ctrl+c interruption is safe - it will store progress and
restarts from it (you just need to run reencryption command manually again
otherwise device will remain in the middle of reencryption).

For unexpected interrupt (power fail) LUKS1 reencryption could lost
some data. For LUKS2 it depends on used resilience mode (--resilience parameter) -
it should completely recover if journal is used (as it stores data twice for
active reencryption region).

For more info read cryptsetup-reencrypt man page and section "4.9 Online Reencryption"
in LUKS2 format definition (https://gitlab.com/cryptsetup/LUKS2-docs)

In short, use the most recent cryptsetup version and LUKS2 format and it should work :)

Milan
