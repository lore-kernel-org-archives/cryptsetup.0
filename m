Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC9F1DF254
	for <cryptsetup@lists.linux.dev>; Sun,  7 Jun 2026 13:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780837726; cv=none; b=uQC3m0Q4bfZrjHdwvK6sHt1dj4OERsuCSO31ulsIEAwf9EOwgva7rlcOgJB0JLItUbd0RPaFWHBxOa2qVcR0wPpP0DP+CbsZMNWR1IwEBrHilmIULApyXG6MWFmHuxy10f0wpl+aD8IlZIKKs9m4vCoJr1sJAx7y23Q8/lu4+SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780837726; c=relaxed/simple;
	bh=vlGobOtkqLrQPkGvAwkTF5MuwRXLyQqo8Ko3p3o8P5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=cFwh0LmqemnOOzZgCye5OiI3BrBHj3tuLvqTYHmVczQnkr24NpVxNSepLtc5WnfkVG8nBIVjCTONTyZ7VfQGj9OSSso2lMP36IeQwIFNWk39MTmUyH0ohH5yBft7kqEV85oyCpe2f7JcGSz/bj2lCIYVIggOMybyxdkRvx7R0uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VE+pA8xI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VE+pA8xI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ac10e337so30491505e9.3
        for <cryptsetup@lists.linux.dev>; Sun, 07 Jun 2026 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780837723; x=1781442523; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9UdTfUrmfp1HOyLdRC9A1DxbH6gT45G9QiDAhxEwm2k=;
        b=VE+pA8xIhZytEcUYWlbQoP16H0p/xPFPrXqsa5VXlJaOGh+GObIshNLTuOdZuLphKe
         6PEHkVZF0SDvIvcD/PIR4oJXNhrE8nFTgHgPR4aKfRTCIl/pvZYzyfGPRO1Ok+iPL62t
         KtwAAuh42mA15TzfFtlg42ufxSLORWAjR3LDi2K3u+OrP9+AWsKJAXiGxosQg4Vlh0iz
         F46CcrZguaFk6mZPiaTzUhgIc1BYJ8s7ory35IhWoYQCeOD8N9koKdE4Hcp36+kw86BM
         JFHHwRsyx9pOAhQGJXk11L7VtBMsWPUJlAZn/4GF5kYJweEDOqV8jbcL7Ver/EPmQ1sP
         HjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780837723; x=1781442523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UdTfUrmfp1HOyLdRC9A1DxbH6gT45G9QiDAhxEwm2k=;
        b=QVW+hMCKoaj1MgZs5GHBxF9kYiQaI364S1FydKbzSPdbHFoTAdajisJnKQzNKLNLj0
         b6Vr8oFdVmkCv9mJXw6YbhSSWOxzkvQiUyTE1q3mgWLBB3XrHs1mnMloSIWhRKF/05kJ
         sgFh592ylzI5nmUkr7CtVKjvkK4Eee68Hm6Ett+Ol3Vpd5QmLt9zjfIP98Ny+j2j9eIv
         VBC9UrCWDcdcY6lBzLMRWCPteIg0UZPXxtgr2DWwGIrvSJMSwlgqoULqkmdEGIukWrz5
         NFs1cUPEj9IK/5c6K9TW0vxpUDQ4L2AqdvEa6vDbNP0e6A7qajwB12E6NBCthbbmdx9u
         MeEw==
X-Forwarded-Encrypted: i=1; AFNElJ9iBYoh18vtwFJfKxUcmcBLojhRnO/slRMIhXnQbLr83+rzVt6JyzZKTrQ4GKjNUB8JGFq0yz8yWLGp@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/L4yeJA4S9JU3BS58Mr4IXeJZuyusZQh5RvlwizoGVilOKWsQ
	rAjfttM6yGtPlfZi4pzsC4sMSamUoZOjsAGXks74Yxr9YNPWkjCkWoao
X-Gm-Gg: Acq92OE/K//GAmCBq+XENv4YOan48ujmH8k4Ua3D7mFVqKjYShY6mGXCcI30bLuZ18b
	zCPBGWDRbpn7JzafRgYj4YRvKyMauS/odpgK6q1YodhYlzoSNta2goFpIgvtp/zweLF8b4icggR
	XPKPoD15Iz81fo3IVgcuEISJL4U1X9QsgxU4zySPEqLyCLIyGLyNN5AkI3A/m1pXl44JNhmQnfk
	AeeFslyLB1NYoIxFipKPCZc/+McfZF161T8JzdrC8Jy/DkS/k4i7uwIgppazGVsS+z3VZC2MZKy
	B27X6TS7nRUgdsYPN/3j9gEl9nZJinUa4HE878w/65Q5AYmypclpxhKIgpMltAfiFIaMpACpvFp
	knysGvdCHBNkoUrji+OpiZ/kay7kae6dTf3q4syQU8pvzEpvVaEVG2EgmAjP/ewZ/kLDoqUBzLj
	Ddg3EimOc5GnEzps63CYcggyZxWWNuFabRcWBw7AjV3J58ShgEJ2NpGZ5zZgNV
X-Received: by 2002:a05:600c:1387:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-490c2619945mr190672775e9.29.1780837722698;
        Sun, 07 Jun 2026 06:08:42 -0700 (PDT)
Received: from [192.168.8.101] (37-48-0-73.nat.epc.tmcz.cz. [37.48.0.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bda4fd52sm292622755e9.0.2026.06.07.06.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 06:08:42 -0700 (PDT)
Message-ID: <20e7ea6e-1583-4274-a243-05e52f206a18@gmail.com>
Date: Sun, 7 Jun 2026 15:08:41 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dm-integrity: estimate the size needed for separate integrity
 device
To: Max Gautier <mg@max.gautier.name>, cryptsetup@lists.linux.dev
References: <ah05u91w9wfghC8_@framework>
Content-Language: en-US
Cc: Mikulas Patocka <mpatocka@redhat.com>
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <ah05u91w9wfghC8_@framework>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 6/1/26 9:50 AM, Max Gautier wrote:
> I'm building a media server where I intend to use RAID10 on top of
> dm-integrity (and cryptsetup on top of that, but that's not really
> relevant, AFAIK). I plan to put the integrity tags of dm-integrity on my
> NVME, to avoid some of the performance penalty.
> 
> But I'm not sure what size each "integrity tags" partition should be,
> depending on the data device.

Interesting, while we can print information about data size,
there is actually no calculation of size in the case of an independent
data device. (And even this is post-format, we cannot calculate it
in userspace in advance.)

The only place for this is actually kernel dm-integrity,
but the code is tricky.

CC to Mikulas - is there a simple way to calculate this size?

Or at least provide userspace with information about the existing
meta device size (we send only the meta_device option as part
of the mapping table).
Actually, integritysetup should check device size before activation...

(We have such a calculation for dm-verity for hash and FEC device,
but not for dm-integrity.)

Milan


> 
> I'm using this blog [1] as the base for the calculation, but I couldn't
> find a reference for the calculation in the dm-integrity kernel
> documentation, in cryptsetup wiki or in the integritysetup man page.
> 
> Is there a reference for calculating that size ? I'm fine looking at
> some code, and it looks like the dm-integrity source[2] has some functions names
> which could be helpful, but any pointers would help :)
> 
> Thanks !
> 
> [1]: https://blog.tty8.org/posts/2025-04-02-moving-dm-integrity-tags-off-the-hdd-to-speed-up-raid.html
> [2]: https://codebrowser.dev/linux/linux/drivers/md/dm-integrity.c.html
> 

