Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762973D3BF
	for <cryptsetup@lists.linux.dev>; Mon, 15 Apr 2024 09:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713174274; cv=none; b=cGPIE+XE8NEk/WfbqdSHkTBJNIDA46DsPBSk5dYT31kWA8Bb3gZfueVeyKsy2Xmv6fXtYAdMX6mlyaaS28cNp0+D1+EzNoDHqIdW0nXjzrUebi5+vB8Xsxb2XHHBce75YnYMlh6IvPyBYn9cv8yOtP1Znlh3T3ZBb3LmvHdhfss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713174274; c=relaxed/simple;
	bh=VTbgZPykgfuKa6zAIu/MBOHVn0DD0p/hSnhVjPjLzN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eb/a4rS8Nc9JcnEVTBc5vQ8bYYlZQnPg1AVyG2ybDp+U4a+wkX9d0lgIvRsC1FwmT7eJPMQWvtt8bDxqJ6Zq46P5N2qUQtVXmVZrLXzA96rdOAhhCbscNrCC2pmc95P5M8SzdlP4eK61mF1hIi93XHxUcBKQdmV10vg5ImO2+l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN7Mumdy; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN7Mumdy"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-518a3e0d2ecso2966905e87.3
        for <cryptsetup@lists.linux.dev>; Mon, 15 Apr 2024 02:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713174270; x=1713779070; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2bRY6bIFd8CJBEHmiL7h+DyLYyK8fLHgtKa5Uf3KI6w=;
        b=gN7Mumdy5JO7Xc5cut6NT6xIJebPwJxtfBMd3zJ3OOFdXZJE03cCHbm/E9X7qvIgaE
         SI/IEZg9PKarDamyDGYO4ZJHphksakJK74jDbPLoxevdRVYSdIp2MhV3OAmhuMH412VR
         3cbgau8Raqeoldjl6tJRyQdFnYoVuU0wbIlvFjcsiHZUSzS5PMPDwXF96XEcR5zf79IF
         e9On/1OOHlNdA2Rf3Im/MwNnGLKcezamcmVj1YxpfpTDbBK66wLqs3/94ulIi41iyLiY
         Nh5+8hwSBzZXnXdSh9p4SlU9J2+q3bkWHsKaZzsVNk4nJxG5vhshqAvQzKbVmytGbyFJ
         N2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713174270; x=1713779070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bRY6bIFd8CJBEHmiL7h+DyLYyK8fLHgtKa5Uf3KI6w=;
        b=OIe5AvtPWyR2IV5nscl7zkHgDb//Y/PDpdTkQhCVeLNp2yfjOGGrkji/AwP8Yo1rGy
         6+Cp3HSCnwGu9oMs+SvdImjAIHjgJgHHtAxLWudc0pznB57fHLHQZgwHNOT0zc63ZEF9
         HjnH1HvXX4J/B9fDK/I3xfELxLNvf9C8g7FDt0HWdLS50Ux4/tz/q79/HOvxkkUSm2KV
         Yy/1qHzc3zT0KfJa8T/F0hLCjfa6NnP4aZdkmnV71T7BO35HBl16KbIwHC97oXxJWuQX
         Gt5eYaRvwyFKbRX048+1xkvWs0eIv1kAU8xcVxSpj2EIOAwVaT8CKTzfvvSUUc87GPn+
         5eVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2rFzI60M2tqLpx9o3D/2afvXSP4QG3cIAxxk8pWeMBraFwNT7pQ2lug/9n4XxWPzgLc57VBrDi+NxKuGdvIJqksqqSRhLT2lPCg==
X-Gm-Message-State: AOJu0YyRP3yU4PSvJ8VdyABLgFGSquQLPlCcMow1CBwRZmfYWcC4nD9G
	la0QpdsD36d7bSuRi/xImEpXKr/oOK7tv+gljOsUokRF1Adp4yj4
X-Google-Smtp-Source: AGHT+IHFYu4wCGL+1eKj8RswBnGTnWiDVgLDwd5hZtKRnWzso+gY+NsOvkWZiepC3URXOes1+5NdJw==
X-Received: by 2002:ac2:41d3:0:b0:516:d3de:88e with SMTP id d19-20020ac241d3000000b00516d3de088emr6111511lfi.49.1713174270092;
        Mon, 15 Apr 2024 02:44:30 -0700 (PDT)
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id og42-20020a1709071dea00b00a47152e6d10sm5261259ejc.134.2024.04.15.02.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 02:44:29 -0700 (PDT)
Message-ID: <df0db981-48df-4c7a-99ea-f8178c1180f2@gmail.com>
Date: Mon, 15 Apr 2024 11:44:29 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Decrypting only uses 2 threads.
To: dE <de.techno@gmail.com>, cryptsetup@lists.linux.dev
References: <CADofXPDMsOh_wWDM52bVxC4-eU6VgBSoHNF=jSF1h05njUT5Mg@mail.gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <CADofXPDMsOh_wWDM52bVxC4-eU6VgBSoHNF=jSF1h05njUT5Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/24 10:49 AM, dE wrote:
> Hi.
>      I'm trying to encrypt some block devices and trying to use a
> cipher and mode which is multithreaded. I'm trying out
> aes-ctr-essiv:sha256 to test multithreading, but have also tried
> aes-xts-essiv:sha256 with the same result.
> 
> The encryption is definitely multithread (massively), but while
> reading from the encrypted block device, I see that only 2 threads are
> being used. As a result when the CPU is throttled (deliberately), I
> see a drop in throughput while increased CPU utilization only in 2
> cores.

I think dm-crypt will not switch decryption from different core when coming
from block layer here (if you have multiple threads/processes reading
from dm-crypt device, I think it will be parallelized as expected).
Maybe setting different scheduler helps.

Anyway, this is question for kernel, better ask on dm-devel list and
always mention kernel version here.

> The following commands were used to setup the encryption --
> 
> cryptsetup -y -d - -c aes-ctr-essiv:sha256 --key-size 256 create disk1 /dev/sda

Never use CTR mode for FDE this way, it is insecure as the only tweak is fixed
(CTR requires nonce while sector number is reused).

Milan
