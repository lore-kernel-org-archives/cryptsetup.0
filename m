Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF463A8F7
	for <cryptsetup@lists.linux.dev>; Mon,  4 May 2026 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777874894; cv=none; b=oP+MHizMgrlMUAfzx9s/VM8C13uMDjroJxI9/3x2Bw1cAMRYCp6d9ux7JNb90FQJjWuG+anr+yVHJ+SGonH6DjVUvJ/2fzew9nwyl39cjh+Dc3Fbc65wOKY8CtCqze8uh/nvJyzgtjb9J7bK+PZOHII1jeLKt9ddDyUpE7/rJW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777874894; c=relaxed/simple;
	bh=TOca50pS01td/jUU/FwvS94h/ZEqq56G62bJ29EsyTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERbGLbNHeZxwZXxL4nW/rpCH4tW2/6hXN8dFMp1Od0OXineF1G6re+KvUbR0fmX84v0z5Erl8Kgoxx0GwwGnY5tMJVCgG1/mBCVkc/tb4Cm5VjdgZaKR8Mdw8VU5Jbiy+W1LNt3NOYuhsOe6EPuXeGWpmqr4xEfEW8WcBBiViyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTs82dsu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTs82dsu"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2118426f8f.2
        for <cryptsetup@lists.linux.dev>; Sun, 03 May 2026 23:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777874892; x=1778479692; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FaZbHH/IOIhjmW6XYALmsYnEPoCz+hdT8OiAn2Buu0Q=;
        b=sTs82dsu2m1vl/5Uus3jogLMN4oZhkHDDlryT7uZLnF9VW/KGNkyNnSU/lbaAshE+a
         6DOoxZoWgiMAgvA/rbm+LJD6tTgtsal0I99aBR9237kkrc0LMgk9TQae/wriyRbl26xL
         4Wu0OhgevsXLe7wLg6Nd1/Oapez9EK4ODineIcaqtUtKnYXTinoX4mq6/ITaPDrGtRtI
         3jM5j44c4mvvk1HQfW2jxVEnHeUFm52I+F3liRZnEZnpq/MeGHSZ9O3EbhPqn9m0XBMJ
         ictv4O4TOfkgPXfHxjaT4Df8p6XAKDNVPszuUyXqmcTYpG6ryfb2ZDr3QNJOMQhYmCaf
         OJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777874892; x=1778479692;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaZbHH/IOIhjmW6XYALmsYnEPoCz+hdT8OiAn2Buu0Q=;
        b=imHgzdxbkPs1re9O7faRf/Z2xHV1rBGY0vPv8lVy20D13UoLW0/QomO0bGl1HVdqew
         8xKucu0ZXH2SMPie64HAQJfGPJyzOZD066IWyWZ6uTjn0OezUyhbi0HDTwOplGCKeC9Q
         72fbVr2Ats57uNhOCmRgmB427jDlVDlUHyyRPwBD+K4dte1I7ZkcEW2eMPt0FYSg4MB8
         HNaipHRCVdiIcUgW4Rcvvnx9X2C0szLJwFNZmu28yPlaTAah9lBj3VyxmI8gAifPAthb
         6z0LHPHKB/d2d1CosEB6LUSSAi0+/8fzsJkc2JNkWEnLobC5gsZX1MOWMBb9LLZQRtEp
         brCw==
X-Forwarded-Encrypted: i=1; AFNElJ/NZItouTmMEyrvZJWJCzV2FO1NB7RkAeFsMbv9WMNDRIhdO5KP02qgfZRslIJCtRLGDBTBCUAHaKye@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1yxn41ooSH68zf27uczB4dlPIa2O0LRBfLB3tFrQQHPpBNS+u
	L3W1zlCYZscPfC8xLgBhuwRKX1djMDQGwBEM5s39wngNKt/eZwThr7KL
X-Gm-Gg: AeBDietK6caTtMahpKZDPIbh+CdP9C3E1J9IrLw7RajfdkTynTIvOb5vhHlVVZfeHap
	/YFmOGNUR+imQKzhM2QPwLlwFgOVjX29GbDyv6qkckKdIVLo0yrURik3Ma071vy3L4s7BU64Nvn
	He9jQjcD3GGV+lD96OdHrIgPBWCYCUFKzxydumpYcuY/tWYsZxjEyG+zIHhRJG7AIhVIL03F8Ua
	y8G90JDy/Bv2vHHbJiHValijBZu98HgRZMVoopy22kOOWvSuJ4ErJ91CXjgdR0R12H87VvbEBeh
	0yW0B7o9Rh3LGgy8jGa0TsFV5VnF0VSkJHUnfQYZ8SNL/cDzV9mvy1bCaWFJJVRuI6Vb1vLaona
	4u7W5P8ZahN+fQwn4ykz4/iOSS7iNFkvsbHosrROA11TULwhg6peieB4YQe6545ZXJ/iMvHOAAx
	Inmvgbd/BmXZWPsdA7Vua8AQRA+SBtXhm0wHntukcOzc46B0YYRYY283eBD0k=
X-Received: by 2002:a05:6000:2407:b0:43c:fb48:6856 with SMTP id ffacd0b85a97d-44bb34e71cdmr13957607f8f.13.1777874891529;
        Sun, 03 May 2026 23:08:11 -0700 (PDT)
Received: from [192.168.2.14] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ea7cf97sm27118213f8f.6.2026.05.03.23.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 23:08:11 -0700 (PDT)
Message-ID: <5dd3be22-13fb-41fb-b469-1ae6472200b1@gmail.com>
Date: Mon, 4 May 2026 08:08:10 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AF_ALG algorithms required by cryptsetup
To: Eric Biggers <ebiggers@kernel.org>,
 cryptsetup development <cryptsetup@lists.linux.dev>
Cc: linux-crypto@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, Demi Marie Obenour <demiobenour@gmail.com>
References: <20260504052400.GB2289@sol>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <20260504052400.GB2289@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/4/26 7:24 AM, Eric Biggers wrote:
> Hi Milan,
> 
> AF_ALG is going to have to go away eventually, due to its frequent
> vulnerabilities which vastly outweigh its benefits.  Userspace crypto
> code can be, should be, and generally already is used instead.

Heh, I just send reply to the thread on security list. I know about this.
(It is probably waiting for moderation, cannot find link to paste here yet.)

In general, it is more complicated and need some time, but it can be done.

> Is a reasonably definitive list of the algorithms cryptsetup needs from
> AF_ALG available anywhere, so that an allowlist can be implemented on
> the kernel side?

For Veracrypt support, it would be easy to create list.
But maybe we can do it differently completely without AF_ALG.

> (It would need to be unioned with what iwd uses as well.)
> 
> Also, what are the biggest blockers to removing the AF_ALG dependency
> from cryptsetup, in your view?
> 
> Finally, how well would a CAP_SYS_ADMIN or CAP_NET_ADMIN restriction
> work for cryptsetup?  IIUC, volume formatting and opening require root
> anyway, and all the device-mapper ioctls already require CAP_SYS_ADMIN.
> I know 'cryptsetup benchmark' would be affected, but that tends to be a
> one-off manually-run thing, which people could add 'sudo' to.

Formatting does not require root, basically only device-mapper interaction
requires it now.

LUKS should be completely OK without AF_ALG (it calls userspace backend),
it is about other formats.

I'll reply later.

Milan

