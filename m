Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F1F36124
	for <cryptsetup@lists.linux.dev>; Mon,  8 Sep 2025 12:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757334942; cv=none; b=uKE0lz7DnVD8Iw8rSm8zB2F1Wg1LA84An7KYSL2hr9hLLF/MmNheWPub9WTGM5Ou79LHpvhd9WmWnrtanAUwKwVk4l5daQhJMUrP4h4nMtz4GiRvDwv47zQtuvcfH/ew6hpiSoiQoyiqn6T1N2ipEaU9ZAhYl7brpCoeU3VtEfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757334942; c=relaxed/simple;
	bh=yhYcGVwp4mF/+WyI9l5/XO+yC8/JMDEvb57NUddkF4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mbtq4VM4kpSdiwCDW6a5CS+xvAsgwBrxDLSmNpX+pZSB4i1Hr8+4OldzRqVhOpGZ++3hdhFBOlnnrC5q3db6VvhFFMXOtnGron/YZ0A1STawuQfmQ84uM4JngSjDn2DJZFE8yU18uJCdfvfhstlJNliRazZ981TNWsIxcqNYz1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8CYYCBk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8CYYCBk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45de1e6d76fso13823655e9.2
        for <cryptsetup@lists.linux.dev>; Mon, 08 Sep 2025 05:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757334939; x=1757939739; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yhYcGVwp4mF/+WyI9l5/XO+yC8/JMDEvb57NUddkF4U=;
        b=V8CYYCBk8Nrp6YksuqVwlAUXZOsKJkoqmZ4ic1FOAOAl1259Xn5GRoe27TtMqDIP7N
         myaMMI79Rg7ZR75ZOW+3FuUR7wb6oxcaG9ed5146pjFrsTAbEOV9LecKQIsGWrONo39z
         U7MEdsrde9lPezPzhybfJLDUC3gQkSeg/trocwclYj5+NTXYSUmq6PSwmptHR+lEhImt
         5V/TKyySLi6AIsti1VkC4IlZlSeJzME8WcxgMGvPGEXVMstLgwSbcK/Wh597g6LcGi2C
         e2kvC3wNM/W87xlOgn33FfbE56GUGFJxytrRHfA7IOBvWp7zVLUjGdEIToDRa/CAn6JA
         Ok2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757334939; x=1757939739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhYcGVwp4mF/+WyI9l5/XO+yC8/JMDEvb57NUddkF4U=;
        b=nQcH8a5FQBXnwbRDGfVvnr1DohbkbYMbwNJKUZKAxx3VD+77/CGtMTc5NFmIQltSV3
         ryf/LnKQYKqpSNuPqgHHol0eXNVByU1AjbzfwQDJ8wXuLtRendPoXb4/wBmmwDp+jLSB
         HsiOuH9XbghO//q/BHDpW+D1U/V+d9pJZJHldp9oPy9SVaXaegXg0eenGhj9EXR16Xr5
         royA2Yon+rF1naVc4T3y/aj9U9owQKflDVJ2cQ9DJRBsDFb/bJ5yWKvcFBLBdVDQon8P
         u/66AKuK/rTBBxrv7t96u9ZKB9xAs4pd3R8r4JAJlUNmdF5Ug0jUPKIG4FNdOkowuvi8
         QLCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqgl7lxi4Yrkh/L+cPIo89n8skeQCWWEiInHjXXqTw71xXR+EyfMZ4j1kspZpWU5I8CoZSWLB/zlUY@lists.linux.dev
X-Gm-Message-State: AOJu0YynABgLE3KEhoUgcDaJ4rX+tgTr3Q55zybLRskkg+sd7WD3GQ1t
	buyh9o/P5lGD0+/vuiFv2sixk+4UTNV4yhrtL9Ok9gXUMQO1z/mQdHOUYRRj8Q==
X-Gm-Gg: ASbGncuRLZCEGZiGoKMmboHofmRJ1uGiyjlbnlWHj73omyON/ARC57Sj4qpfO+FGCvn
	TPlhL+KAK4JGkHBNnnsYwE6SpFvd4w2TgmWj3Tx/4AzS9yGdYOJOm6ad2s6tLBP/98qGiTo+t30
	cjkArC53WxB5r2qGoA+58a20zFN9STJBaLXyXoba/KdREqIsUVaL8k18Cz+ZdaX227hnL7xJZM1
	m8fswp6f24pWG/GVSp9BnFzzphIjcNAveO1Ly0mBRPnzBKn1J3HgArl+CkOh2lpSDQOaRQREEm1
	wHlPldlBPnFVCJQSa40akqmheZDZW5ghV11e4ubVkNInqYeQD/Botyph157ncMvcEWrnktfhIc8
	kWDt93HDwZ06HNo/j08+64wRZ7LKZ
X-Google-Smtp-Source: AGHT+IFWcuKcFHo1BGjTWWrethlPkvnJLpk9Q9kNIYvxz/NcKxyUZ9fQULqTddrXXQwpHye/wlFlww==
X-Received: by 2002:a05:600c:45d4:b0:45b:9a76:ebea with SMTP id 5b1f17b1804b1-45dddeeee4cmr66064345e9.20.1757334938570;
        Mon, 08 Sep 2025 05:35:38 -0700 (PDT)
Received: from [192.168.1.236] ([176.74.141.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de24ab648sm75358665e9.5.2025.09.08.05.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 05:35:38 -0700 (PDT)
Message-ID: <adcf53e4-c9ac-49aa-86fd-76904a0bbe61@gmail.com>
Date: Mon, 8 Sep 2025 14:35:37 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: luksOpen with pkcs11 token error: The field is sensitive and
 cannot be revealed
To: mattwood2000@gmail.com, cryptsetup@lists.linux.dev
References: <CADjezmZ3BCvsOimijKjjkAsw5KRDtC1gFNpJi5PX4qGU-tkU7Q@mail.gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <CADjezmZ3BCvsOimijKjjkAsw5KRDtC1gFNpJi5PX4qGU-tkU7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/25 10:13 PM, mattwood2000@gmail.com wrote:
> # Trying to load /usr/lib/cryptsetup/libcryptsetup-token-systemd-pkcs11.so.

This is systemd plugin, we do not maintain it in our code.

Perhaps the best is to ask on systemd lists.

But I like to see that they use the plugin API :)

Milan

