Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2C05DF10
	for <cryptsetup@lists.linux.dev>; Sat,  3 Feb 2024 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706970210; cv=none; b=LwPBL8tSSHSQDes9VB0tqiVFMytkU2u1wK3g00a+NOpwfhH8vKUVgCmV6BHrqUlr4oQa5GBHgZE1tjxSbshZBb9uTnNr8fqZAnG/Y7w27WrxTOfUYsYrdH/E17gVQj9zH1vSY4QvHmaCQFIhFLrnbW6uRuXZZALefr2NojqABhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706970210; c=relaxed/simple;
	bh=o5EwUQ26qiT0mwcvNWnIEHvx90FyEsiLBeikPZJC4SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N0HtqdXtGRiVzO3nIXe7+4f+8QnQWzZcV7RDpJ8qqjGPSHI5Qm75HkraOank4hmMbNp+F39KJRKje4RKmnpLaeFWosdVNK55415B/h0orkAwfLfzZ+WezwUDDpDT2aaSYCMS1LHG1SM0xnGN0FX/GxipPRGUf5Szh97CF8FZP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nf2/mfmT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nf2/mfmT"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3756bae1daso39433966b.1
        for <cryptsetup@lists.linux.dev>; Sat, 03 Feb 2024 06:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706970207; x=1707575007; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R6rlOyra0VxgZmJC5e5tSsZhXtEz6XLeIF4Tz2VFcnw=;
        b=Nf2/mfmTf1RhuQPEFh7GWwQEiZF9KDLL/kisDNMkvvtEHSY3GVioTrKNpYqF9vm6Kd
         5Vhz7PAAevtJS+R34jKl4C343iAEil43+sqCNXKebNS8h5K+6JjKuR2xxng+TuXn6E3d
         J70PXoxxEX+t7pz+o2fkhUbWNnjbNHX8uNePdoLQeb/AaGlG4YakzIOpnMVxdnsceYxr
         BWqsjiJIPFYEqxI2ORED9MbA9iVNFMhFPq8uQhIqWPy7/Su6S6XYWhYWZy3FmPhKOzUD
         PjIV1aMBsgQPwK0DGYmz5t0VI6n8W/soWc8nWcidTZ0IDXkocGLScDpgWbvMrMWk3A4/
         aq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706970207; x=1707575007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6rlOyra0VxgZmJC5e5tSsZhXtEz6XLeIF4Tz2VFcnw=;
        b=w8bFKfnAOJXfrAY29WP3Ya1RyP/kj23OKp+ll3Ti6wMj6R9OpAZdaHynnhAjZKWQ2F
         C/jMvOP4GH2wSJtbAvSZpphuJLVcbgKIVkrvCMlLexEihB7qI8D/Qc+Gu5Eaeck8bnh2
         RrNBan07ctTorZoLshOs2584akKzmsnbnltsp16B3s6K9NFgICF0wl964LCT+YIHId43
         s1v15opgi+zcivhEAK9y5IIlk5yx4f8w0EDr5i84S2YIAM9a+4sFwBIb+sPjzOcGCYna
         WM2GNc4dRHID0ACkbu/fXe6EuS/oo7sUW4fZDVKdTTTk7dduwQuN4OPwNfRX1pKwDcdP
         Ml6Q==
X-Gm-Message-State: AOJu0YznHicuonCe7TmDXJsvxjyALoQScO/n2fUFzfX8+PoxTG+vkiSV
	3RxpLEYpHZVgzQba5iz/RD2qTdvbWIOfdH0WcF9PCCW4IVGgOazT2C1JQ9QA
X-Google-Smtp-Source: AGHT+IGTi8fJzFOVCKQsAWpXt2GHVaQbUTZh82/C1vqo8gRUuGEB0TunIwI5tpnH9Wypmg3xOApSKA==
X-Received: by 2002:a17:906:b754:b0:a35:fd93:8be3 with SMTP id fx20-20020a170906b75400b00a35fd938be3mr5277006ejb.2.1706970206894;
        Sat, 03 Feb 2024 06:23:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXDR1nXiW/POVBAN1/D+vrXXMjZ8sHTKvkq9RxODReqO/WDE3lf9VkCXkRQCPYf/aq1/cpSYS/ODEiR/w/rZZpOUPcXqLyMIix6Ww==
Received: from [147.251.47.156] (eduroam47-156.fi.muni.cz. [147.251.47.156])
        by smtp.gmail.com with ESMTPSA id oz35-20020a1709077da300b00a361c1375absm2009772ejc.133.2024.02.03.06.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 06:23:26 -0800 (PST)
Message-ID: <d208bb24-84ea-45f2-8e38-b66f0c56bbe2@gmail.com>
Date: Sat, 3 Feb 2024 15:23:25 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Beheaded LUKS volume pathology
To: Mistave <mistave@countermail.com>, cryptsetup@lists.linux.dev
References: <2f1b3b93-2bec-4867-9d78-bd9474a4d31a@countermail.com>
 <07188020-fa6e-41a4-a8b6-ed8a493d5574@gmail.com>
 <ed5843de-eb16-437f-9fc2-7719aafe968d@countermail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <ed5843de-eb16-437f-9fc2-7719aafe968d@countermail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/24 13:52, Mistave wrote:
> On 2/2/24 11:16, Milan Broz wrote:
> 
>> So if the user does not deliberately write some information elsewhere
>> (like pair detached header and data device using storage UUID
>> in /etc/crypttab), there should be no information that logically connects
>> the detached LUKS header and data device (for default config).
>>
> 
> Hello,
> 
> So, just to confirm, there is no metadata present in the LUKS header
> that would allow an adversary to perform guesswork (such as the size of
> the encrypted volume)?

For LUKS1, there is no attribute to store device size in the header.

For LUKS2, we can store a fixed size, but the default format
set it to "dynamic", the size is determined according to data device size.

See luksDump, for dynamic size you should see

Data segments:
   0: crypt
...
         length: (whole device)

Milan

  
> For example, if I have a bunch of encrypted disks with detached headers,
> and only one of them is 10TB, but the rest are 1TB. You're saying
> there's no way that a particular header can be singled out based on
> guesswork because it's the only header that has a bigger encrypted
> volume body?
> 
> How does an encrypted volume know what size it's supposed to be? Does it
> always span across the entire partition or block device?
> 
> 
> Kind regards!
> M.
> 
