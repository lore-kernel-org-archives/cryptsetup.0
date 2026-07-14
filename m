Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC2736A02F
	for <cryptsetup@lists.linux.dev>; Tue, 14 Jul 2026 11:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027275; cv=none; b=JxUKemuUUaJSh2iRAsCJCkmhIWWlBLHJdXqwy6TwrQ5DEujgqXFd8qHnxTjQVsrkH/rmOiCFQcsjKongIfkQ142rOHBNoDBfoZh+K2vbsE3/bGv5vVRhFXooy3C9yfLhwKvHGP+Uw688lnPUIBUYj5KY6qorhZ+nlgzBjsMEWBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027275; c=relaxed/simple;
	bh=27RhxeNVvrLTB79PbiihIj6PW+s1LJ5/4b/grlosML0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Dt+VexdyMeuxV39TABjIuLKQLndLiGA2s+Cm+1FfjrH88XqEaHTXukq3SZHgoH6PsyqKzGVUq3oCt61BBTyFpUs2xfxLdLHfq98fyb9gdj+Dtd/9mpiAm+BHsJ4XLcwFHDbBVkwUzTyd17Ca25tR0xi1XcQluzkFGc1rfT6gJKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1WMZC1j; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1WMZC1j"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47df440fcd5so2302143f8f.3
        for <cryptsetup@lists.linux.dev>; Tue, 14 Jul 2026 04:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784027272; x=1784632072; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=27RhxeNVvrLTB79PbiihIj6PW+s1LJ5/4b/grlosML0=;
        b=A1WMZC1jowEwVGPV/cOOUPjB/V6Zw+UVag3ULHRFsipalvKhskOB4vrleEnz0laxu9
         MYgmL10te+FdCCs2zom6uQ4uFlQfPovjaEreLgf+TOrNcrVh25/f96AHRi4tXSrEZ9Gd
         ST8q6yp9TXnby6emSgEIs0IzMZFc60hkFxMGD1602ms6IJSx4cSDz1qHUzn8Sk0SqSfs
         PH2fkZApr/IJuqDrRGJZLuJMMx6B50me1oZBo2KVN8dk0a1QxLgKB2P/sNWoQsXRccRi
         6hQqmLSanL8e0eTOrxkhY7vrZF5NbA8oyJGHrG8Qs1b72mT3pxU6NnJ/bKWlRJKAT3Xq
         O2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027272; x=1784632072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27RhxeNVvrLTB79PbiihIj6PW+s1LJ5/4b/grlosML0=;
        b=pYPNNHV3CXQkfhMU2mG+K33x1RVxJA34s8IhAVlcy5COGJQhFbS5GAZUEFhefZBUGl
         sbY/0Y6HGpiCfq5x04Roq2p0GcmvQBS3Vuw302cDfj5XFT77d6mCdkSOsCavgsyP6lx6
         CFYtTtCFK94xs9xHnzs6t1fpcqyi9UwCxYmD3tGxuxRNRAzBye9snBe9ck2mKpkWd+V4
         vGp8PFDNoGYm9zOH9djAHkHYaeWQPa4Kw/ddDqQ3v9JnXnEDPBn7UXx1nbwEE1O8q7av
         Y79U//2vcWEWth5JctJneAwJd+4B4usQ7eIe2BH3bBQNhovtV0W5zBcKz4dP5NGB8T8k
         guWA==
X-Forwarded-Encrypted: i=1; AHgh+RrLCoJ+u+P8H8Dh+3+USNb7TPM18OVbHPKgQVnuD4YvejsvlRmDSjlt8eSXi7nCuJWGzU9wFGrJ/89O@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0h778nsMMtceJvyXrT/30Vge880QOutgP8xv30G3cczDWbmar
	0yTWtBfSnt2utwOKRtpXOvgtz7PfTLJOF2NQrmmWM87kRWDOT3aebvf0
X-Gm-Gg: AfdE7cl+o3ef70DP1zomPbQEsUW9+MtbB9rHim2RN0LaOZJcKoEOH7dGgFeD0cloOiC
	xqmY+oArVkUvSF47xAuoUWhcaSr0yAPV+iNwpG/LWa0VskC+EeZbyRfZEIfYc7Af6suYOjlGsDG
	SbgKrlBwpW1vEQmfmJp9m3zU79N95nb00ZoPluEyepqo1oH0zz9f3wODKDbPDI48xEvL+GSKPjJ
	/KC0G6yCYIQxxC6Z14emd6MGY3/WcFMQ36gCvSbA591VkreAG3GDBtPF6i7OfP1IEdVCyUhA+YU
	YG3blk+m87dMDTIgl2duysLJJg/T4lY/IZYH3pqRlSKFPGShDZivDTK6O2Aww+ac6ywIgOyK8R+
	+WmH0r9EYUEbU9kFCnNblsCXKFCqb6LStDDLyRQOIkT3Hnzv/zYpkAfP8gCIjLi/YBB7Un1/LGh
	havigxKdeECJ3UFlmxsQ==
X-Received: by 2002:a05:600c:3e0d:b0:493:e97b:3b9c with SMTP id 5b1f17b1804b1-493f88317d5mr132817695e9.29.1784027271715;
        Tue, 14 Jul 2026 04:07:51 -0700 (PDT)
Received: from [192.168.1.220] ([176.74.141.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2e98b0sm128319865e9.8.2026.07.14.04.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:07:51 -0700 (PDT)
Message-ID: <51d1a047-3f48-4447-bc44-59a16e650b94@gmail.com>
Date: Tue, 14 Jul 2026 13:07:50 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Derive encryption key from PIN
To: oSumAtrIX <johan.melkonyan1@web.de>, cryptsetup@lists.linux.dev
References: <CAK+fmzxEkGy+8X9BAwFKyU415Z4xm2uHfL+yaah-U1Rkw9YDYA@mail.gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CAK+fmzxEkGy+8X9BAwFKyU415Z4xm2uHfL+yaah-U1Rkw9YDYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/26 12:27 PM, oSumAtrIX wrote:
> I am reaching out because I noticed that the PIN used to unseal the
> decryption key from the TPM is not used to derive the decryption key.
> The PIN is merely used as a policy, when it can also function in a
> cryptographic context. The sealed key can further be encrypted with
> the PIN, so that even a full compromise of the TPM including the
> sealed key does not reveal the decryption key in cleartext. According
> to
> https://www.sstic.org/media/SSTIC2011/SSTIC-actes/bitlocker/SSTIC2011-Slides-bitlocker-bordes.pdf
> BitLocker implements a KDF from the TPM PIN, but it seems to be
> missing in LUKS.

Policies like FIPS strictly says that encryption key must be generated
from approved RNG. This is also LUKS logic (unless you specify
volume key explicitly).

What you probably mean is derived key to unlock keyslot (where volume key is stored).

And here it is up to token handling it, cryptsetup does not implement TPM unlocking,
it is systemd-cryptsetup/sysremd-cryptenroll configured token, so check policies there.

Anyway, Bitlocker TPM PIN is not used to derive encryption key either.
It can be used for TPMandPIN key protector (this is similar to LUKS keyslot).


Milan

