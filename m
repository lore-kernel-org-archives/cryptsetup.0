Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0109265284
	for <cryptsetup@lists.linux.dev>; Wed, 25 Jun 2025 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861000; cv=none; b=ANGLVHwgr8JHvAiupIFV+CF/eLtt0Er+0HNp9V+AwIprjeG0dQA/Q+FxWzY4O/h3+s2AFOG9F7oirAc48pFXjnEyYHHPS2B+8IjnroGQff21S3CwNdWdMwUxi6FzU1kDLh4QVQhhhXz5eqkX1lvB0nB/YdsCki2ztG/mp3NRYl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861000; c=relaxed/simple;
	bh=1GOANFsHhgW7E8/AOjt4klfWDopt46HC1I6MuaZqcZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dmcUtlZ4M2ig6p6yRM9Ui9y8DVZZLvoUlBY0+wIMd02yhE+wwGQ9EO7UV+n2E6dMcjrBIsfFXthvTYf62Fpf25rhN2ARIxUQwGP2tyRD3ATRBaMlAQemQ9sHJB4KnIgfio+gNhs1vjZpSbbsOh1mqQVMj3xROlgh/Xhd+eH3XeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNJZkJd+; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNJZkJd+"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0a420431bso401015766b.2
        for <cryptsetup@lists.linux.dev>; Wed, 25 Jun 2025 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750860996; x=1751465796; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1GOANFsHhgW7E8/AOjt4klfWDopt46HC1I6MuaZqcZI=;
        b=DNJZkJd+24GJ9TXsM8+K8IS8u/HKpz+saWaOoLMEOuI52fe3KZbFjrDgwKLinxVFpP
         h7Shzo+hErrY/hwoCEWXBxAp8fphh+D/0u3A/T4jdoBmdJr1kUx6QZTScmfaV27jPxiV
         78FDrSrfXELFFXtQl7IynNkKnLS2BKBLkoO+oA0uXaf5TdHYLmSG53blf44xnQ6FqOLf
         zU2HtJMdguZ30lwZeROj4rT9AICKU1Hiv9f9ujq3wn/p7yDm45PZElP3S9ICLIRAWgWu
         ocgEsLVg6zYbNegZS2++WUnFVqQj1pOf7MFkkE6NqMYCx96G4XQHxdmfVFwOeCCS9gZ5
         YM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860996; x=1751465796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GOANFsHhgW7E8/AOjt4klfWDopt46HC1I6MuaZqcZI=;
        b=NPKCko1nangLNejKqwLbfceQ9VG3k+XGSf8vVYG5XQ/egsX4amwmQZ7kOimE7xfuk6
         EGDA+aKLSvReLugzReC2rYdhqgGuTw4QMtLyyTgtycmb7sYJWd5H44UuKS1zLNRbe4Vc
         vetkM5xpivskt8e7b7E6zTkydVu2wFQy22JTMNms0QGkabARCeLrkLZzbGSOWnFdsVbx
         SdTKiq9n+wwVCm9FD0CBMY48PDgTmCvpSf2QQcFZPK8uvFCedWK9DlwbBXUIYqqXtBEa
         sEyGXSHI9A0SSFJllPSOuhLc0YHr+nL43o1E8WaT/9LmMUa31v47DuqkLusHGiUkMlwO
         5oCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAV7lzWGS9uN9tcGHtLskMy4zs5Q1fVVA78sm8BEENB2IFLrpRSdTW15CSoJAfNTPSEcOl1zw9/8Qj@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt/HxQ6BG9vGHIJIhFrgAvtCkkOnqr6DSp19lBlZpXgu+1mVMO
	fqeXK7wPOV6zbJi7R/gT1oRYEhCBQD6rgp7piAF6JiIU0B4f/O+D/Dzm
X-Gm-Gg: ASbGncuYyTVFzsRid8rl5xnlM74MC4PniRiykZAhubV+9K7heMO1W1pDm0n1R+YVFWd
	JHD/aqhWAjox7EXGHGeGyyNUTJHd7RtlE1GjIrgMJEVPWlWXEtJHNgv5cRv1FBgsiaNOtCe5IY5
	W+lXUCwOf/PA7by9n/ZE+ZzibLFFPyNDGJ6W5jmX6Q2U0/pWGebOa9Lr70IS3EmHzSTU4eG4iWH
	ZIHTNEHUz3Wb3WmlFEKO9De8iZ5eWUkBjrp4vqGg0X5GsYewD+zEmb8V9uXfNS1shiNG5NNdfYw
	Km10rFw4NjDi9GWOl6AQN94TJYnC7G68kEsGrrW4dx8iyG/6NL/+fJbZTcMNe5jQmxtl0LrClx7
	7XYy/4l0ZQQ==
X-Google-Smtp-Source: AGHT+IFN1MiWmMWrt1vPsZjxluY070WvCJL6DcJpEeUH3u1QINZduWv+Kg73n/7bWQ5LrrQk5iiNBw==
X-Received: by 2002:a17:907:972a:b0:adb:449c:7621 with SMTP id a640c23a62f3a-ae0beebec27mr362346666b.29.1750860995520;
        Wed, 25 Jun 2025 07:16:35 -0700 (PDT)
Received: from [147.251.42.106] (fosforos.fi.muni.cz. [147.251.42.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e7f534sm1047849866b.9.2025.06.25.07.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:16:35 -0700 (PDT)
Message-ID: <69544922-d77f-40c6-a9f8-2798a6ad59a8@gmail.com>
Date: Wed, 25 Jun 2025 16:16:34 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: label written on top of the header
To: Dominik Rak <dominik@prograk.pl>, cryptsetup <cryptsetup@lists.linux.dev>
References: <438242573.9620.1750860359542.JavaMail.zimbra@prograk.pl>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <438242573.9620.1750860359542.JavaMail.zimbra@prograk.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/25 4:05 PM, Dominik Rak wrote:
> hello
> i have overwritten a part of the luks2 header with an mbr label but the 2nd binary header and 2nd json area and everything after it is fully intact

If it is LUKS2, then crypsetup repair <device> should fix it automatically.

Always create a backup (dd first 16 MB if header is corrupted and you cannot use luksHederBackup command).

...

> also after creating a few sample volumes i have noticed that the area where the 1st binary header and 1st json area are compared to the area where the 2nd binary header and 2nd json area are is not identical because there is some undocumented something, unspecified in the https://gitlab.com/cryptsetup/LUKS2-docs/blob/main/luks2_doc_wip.pdf , if its not random then it was overwritten by the label

What exactly is not documented? There is some random data, the reason is explained in spec (to avoid deduplication).

> and the last thing i can think of, does the uuid of the device matter in decryption?

No, but you have to calculate correct checksum of the binary and JSON area.


Milan

