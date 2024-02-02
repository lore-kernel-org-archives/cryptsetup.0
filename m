Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E9878B76
	for <cryptsetup@lists.linux.dev>; Fri,  2 Feb 2024 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706868989; cv=none; b=TKSjtwgHJZNcLZxAa9DQjEo4jANU0ofG24uCAFbLmlPN2bncumrVDZP4UBoRFbq2dcoO5JkuS3zZf8WmgwB7o3GgsZ+7xKGHrWzSJJ9sKJAEnfrDyUQr0OofGlkwsSgLJ3v7FaaJ+e5YKYQErjbeqNxiju8Cr85pJY90315QihA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706868989; c=relaxed/simple;
	bh=GNm27imXBbZ6KUpAOTOmYaHJVj/hRWmeoWbSKC2Iyv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aEiVicf6/s45AfoWO/ofN8GAo5K9hr/K2GyFxTHG2/MPwYoW8IAJEAyDgXy3w0BZfk1K8OCPbe5lYi+isckEKLS4X0zsM405TkJMmu+4s5Dw17zD933mkDhj7Th6HaPrb1xSGHbdFxMJq7Hzd+daijkMmIv++xLF8mMsrAXQAyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7wLC68u; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7wLC68u"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a28a6cef709so269745366b.1
        for <cryptsetup@lists.linux.dev>; Fri, 02 Feb 2024 02:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706868986; x=1707473786; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yy9cWt8yltlt7qDP/bOgMKCJuSWMzZlKLEaXFs6o3oM=;
        b=b7wLC68ucxKDEMQdGOYpTQ6YWWiN5Fr1FV4b3i4iRfxwdKrqBvsAHKVDUWpDyQ+/UO
         MZc3+a/xCKKJ3bcxrSOCXtKa9C64XEuQgQwELJYQJUjzTsYxdOcENhZ/q2JlL+KYTX4B
         puzudkg7bGphxF1gOhg5gQ3LhTiN9Ww1sROMCEVPFgDP59eYoEHFFKd5KH594EDXQCjg
         DyYFAQfSxQhxzOOtIVSqQavQDHtvaFwAam7lDxRfwBfmPkRHoGtCxChx2TeLljkZd3Bf
         rkWEsc8Cv717SmmbeJ8hEMwmc/D5mr7wOQM+pCYZGqbtb8OfI3UzyD1gCiL7rao2wO8s
         c6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706868986; x=1707473786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy9cWt8yltlt7qDP/bOgMKCJuSWMzZlKLEaXFs6o3oM=;
        b=OsJbIiNcYTon3rhmfYbmkHxkF9+Ux0VRLqHaqzDIiA+jZME19Xa25E8TYyPv8+lJzO
         8vDDMPhtQcw3JB2NYquLpmZlsCZIWgYXOgIQ+zJ0FUabGjG8T7vZ41z1MvjJ5+PI8yxl
         E2ZupehdVJQ5jSs77LPcAQBVq+9MVeL6c+dR43rWJrqclTwl23ohfXlQ/cO/81D9bI5Y
         3IJ0JjRCMp/2oVTQT0zIf/xlg3O5WwqAMgOiJrFeTCUmYzObjZ+XsroYNgefmqJXjncl
         rX3c686epn1Yx//nkOzgbDfjcHI7/XP+hhaGclu8aYsc1FJ6tT7d2iHRvI81T//GMPpR
         ydfA==
X-Gm-Message-State: AOJu0Yz4Sf10HuoJ1qRJQKckkbLJFf3w0f1r2+bgkwLq/+gC8ltSWyAX
	F62ZJShkmXnWId6p+uP3hei9Oq3SAEFkj/6ottQv+zEWy2Bm1tFx
X-Google-Smtp-Source: AGHT+IGlfIiATE14WTzcgcRJ26zNcum1BY3ZAaSPuLep5heS7pXklabbOCfLXIsrVYJKuef8jS2BUw==
X-Received: by 2002:a17:906:12db:b0:a35:8664:f860 with SMTP id l27-20020a17090612db00b00a358664f860mr1187544ejb.19.1706868986143;
        Fri, 02 Feb 2024 02:16:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX2ppXhxt325zBm3H7d2thdN+EhG1ba27bjZaq3Z/0yw80O5d9MTvId2BAuo9zjcdnjGRbxN4SkYDCUzcjaLLglN3dwpF0KmG5cvA==
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id ty5-20020a170907c70500b00a3628e91119sm717971ejc.180.2024.02.02.02.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 02:16:25 -0800 (PST)
Message-ID: <07188020-fa6e-41a4-a8b6-ed8a493d5574@gmail.com>
Date: Fri, 2 Feb 2024 11:16:24 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Beheaded LUKS volume pathology
Content-Language: en-US
To: Mistave <mistave@countermail.com>, cryptsetup@lists.linux.dev
References: <2f1b3b93-2bec-4867-9d78-bd9474a4d31a@countermail.com>
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <2f1b3b93-2bec-4867-9d78-bd9474a4d31a@countermail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2/2/24 09:12, Mistave wrote:
> Hello, hypothetical question.
> 
> Suppose there is an empty and functional hard drive that has been
> overwritten with random data. Then, an encrypted LUKS/2 volume with
> detached header is created on the entire device by using cryptsetup with
> a strong passphrase (defaults to LUKS2 header on newer distros, but the
> question is valid for both LUKS versions). The /dev/sdb is the HDD, and
> the luksheader.bin file will be later put on a small USB flash drive.
> 
> # cryptsetup -h sha512 -s 512 --use-random -y --header
> /root/luksheader.bin luksFormat /dev/sdb
> 
> Provided, that an adversary obtains physical access to both devices (the
> HDD and the USB flash drive), how difficult is it for them to
> forensically link the two pieces together?

LUKS format operation does not depend on data outside the header area.

It needs only to determine if the data device supports the requested
block size, data alignment, etc.

You can even create a detached LUKS header without the presence
of a data device (then it is up to you to set proper parameters).

So if the user does not deliberately write some information elsewhere
(like pair detached header and data device using storage UUID
in /etc/crypttab), there should be no information that logically connects
the detached LUKS header and data device (for default config).
  
> How easy is it to figure out that *this* particular detached LUKS header
> belongs to *that* particular hard drive (assuming there are other HDD's
> present with "random data" on them, and the USB flash drive has multiple
> detached LUKS/2 headers on it that may belong to different devices)?

It should be impossible for a default configuration.

But this applies to LUKS partition that does not use authenticated
encryption and it is not in reencryption state.
(In this case, it is more complicated, but I think it is outside of the scope
of your question.)

> Does the LUKS/2 header contain any identifiable or relatable metadata to
> the volume body it belongs to?

As said above, not by default. The detached header was designed exactly
for this situation.

Milan
