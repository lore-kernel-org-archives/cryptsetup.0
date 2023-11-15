Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C7833CD8
	for <cryptsetup@lists.linux.dev>; Wed, 15 Nov 2023 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="be5UtEq0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40836ea8cbaso51424435e9.0
        for <cryptsetup@lists.linux.dev>; Wed, 15 Nov 2023 07:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700060695; x=1700665495; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F2g74h6RdfjjTshX6NGYDFVYSM6CTaWNkmsroLTKV/M=;
        b=be5UtEq0d2ZnEYelFehCJf5fbicUgzrHBvkbpKU4/KCW1jztmzl6T5c64stxnfbEjq
         RrT8TeanjlnW4HnkQ4ba+OwfUDPw1tYEsnLtQAdKvA8ZQ1YEzH+wcJ6jEiHwV3EahX2Q
         WkU7wU8xDXWCSTGP9kgfbYxj6MKOZ0o6kNlsq05+iQNtpjccIdnUUJwZ5GGUmHay+EKX
         u2JveZkHuTZWhLRoI/r5CIr71fWvLKOTL01ybACmlAaiatqb5uqzRVAlvuR7Om0ArDh5
         t0dVzEz9NqLKK0YWlaI/6dKYADIpgqEXzrTCbPJ1Rixg6NoSYwtpClYB2xxg9u5lDPJz
         ajzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700060695; x=1700665495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2g74h6RdfjjTshX6NGYDFVYSM6CTaWNkmsroLTKV/M=;
        b=E5krKrOcSy3ChOkj24sNdnnj82g8P2BeiTwb24QGdETDT6EtoRPgBW+y4e307wxXwT
         3F3i7NwaYQIwoNmPLEBeGRHL177ByZ1Gh/LjPCaJzukgJk78NlDih+QcUvVuYEj4mhmR
         f6M6D1BNfyHLO9p8GH6lQEOKnKxXQ4ZQFpZbopPTI9r0J3s9XixAc7o1ydLNYMRhMpE7
         upTvsfAOpGUz522S0sVgVq+OEpRd4Uc9i/JptkCy5E3lueYVGcC/U7fDL5coPjoXzLVa
         aBj6jJvty4L72cQWJxSX9IMwA+HeI3U09yalsz6kGoJJEQMYB0jDRpNVVhgkukfqh2VP
         QhCA==
X-Gm-Message-State: AOJu0YwV71nr+L++KpjtVW2vFAaxAlZLgz0bebTMWJDxbESYPpQ5eN5L
	4sYsjcpDBLvMNj0TXKGolkL+uT6c+9s=
X-Google-Smtp-Source: AGHT+IEGesE0tsWJoVIEvCZFctX89x/LxgHQxfLEeYbELZKuDmKzjDmWcwuuzEmSz4BtsgsMbQqWGw==
X-Received: by 2002:a05:600c:1c1a:b0:405:4776:735a with SMTP id j26-20020a05600c1c1a00b004054776735amr10642075wms.2.1700060695183;
        Wed, 15 Nov 2023 07:04:55 -0800 (PST)
Received: from [192.168.2.30] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c22c800b0040303a9965asm20830112wmg.40.2023.11.15.07.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 07:04:54 -0800 (PST)
Message-ID: <979f56ca-14f3-46fd-9935-6365223ab3b8@gmail.com>
Date: Wed, 15 Nov 2023 16:04:53 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problem after converting to LUKS2
Content-Language: en-US
To: Anton Avramov <lukav@lukav.com>, cryptsetup@lists.linux.dev
References: <72f6c041-14d4-473e-bcba-7bf3b9fd47aa@lukav.com>
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <72f6c041-14d4-473e-bcba-7bf3b9fd47aa@lukav.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/23 15:47, Anton Avramov wrote:
> Hi,
> 
> I have 3 partitions encrypted years ago with LUKS1.
> I've decided to migrate them to LUKS2 and the first 2 there was no
> problem, but the last I can open it anymore after the conversion.
> 
> I've been using key-files for all of them, so there is no wrong password
> input issue.
> 
> The bad think is I don't have a header backup before the conversion (Yes
> I know! Lessen learned!)

Users either do not read warnings or just ignore them... :-)

> I've tried different things like converting back to luks1 and header
> repair but to no avail.

And you tried this without backup too, I guess...

Which cryptsetup version was used for conversion?

> As a last resort I'm writing here for help. Is there anything I can try
> to at least read the partition?

Please post log from failing command (luksOpen?) with --debug option, so we can see what
is failing and what exact version (toolss, kernel) you are using.

It can be trivial issue, but also something that cannot be recovered - without
logs nobody can say what's the problem.

If some devices were converted correctly - what is the difference from the failing one?

Milan
