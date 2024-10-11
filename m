Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FF920A5EE
	for <cryptsetup@lists.linux.dev>; Fri, 11 Oct 2024 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728633276; cv=none; b=m9XtOkEoQzqL8fUi9nG1WWEIonLccZs+BTdpl5SfN9PH2ASanl3b1faf6t8EgDp+3VdTDqoR4/dfqDPVBH8rIMcB/7AcqK7teRMzHT1TBVsG2LagSiXPWGUlVE37kp+uGveNMwUkTLXLhkfKBP+JfTf8KBJKJ+yrrKAKTDElqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728633276; c=relaxed/simple;
	bh=/bUrQ5DGA0r5K9M1JKOqD1FK/ADHlsrR4ioCEDB8NLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=J4jhNishDE9hj03zGWWkiZijnhODALUtroSEZgoeyFajllpJBin8yApVf/UdetfseErMklv4kun7UNX03p2Hr8XhAt68gKwopYU7cm+h9VR2LQqx3ay8wu8Nc+3Wf9phoyGPtC1eYxWka2pwEJsCjwKsSdHdAHmNGv96HzuQo0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T0PF7K9A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T0PF7K9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728633274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FjTFMiO5aNJinepvhtXObvtVQFRX8f7jXJ484UCT0D8=;
	b=T0PF7K9AXniP3LK6FcrO3ZLmvl2ckP53i/GS/wfLX4NayhP+DppcuYqIV4+wkIwFI5oL6W
	+ofnAggTRmNJlA6UAL3wn3+/P1zVwXWcSc4/EyGxzto1Y5+ZhZFz+HvR8G9rBeAelzB642
	25HcZClERcdYhhWiA9iE+k4AcblHez8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-4fs2PUbANKyhprujQkUpZQ-1; Fri, 11 Oct 2024 03:54:24 -0400
X-MC-Unique: 4fs2PUbANKyhprujQkUpZQ-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5398fabdfe3so1711491e87.1
        for <cryptsetup@lists.linux.dev>; Fri, 11 Oct 2024 00:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728633260; x=1729238060;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjTFMiO5aNJinepvhtXObvtVQFRX8f7jXJ484UCT0D8=;
        b=a5UVG4wRsf5N3nYu0c9Masyb98yUVThzTjdXWdmh6GkqCIbJ9R3He2Ra43VNgxfhNK
         MPgIAN2E/Pb2GpXwaS5JbYJGt2jMiGX8dqsiN96W5+aelCvdKxp8pCX0yXwQIfrvfTjL
         ZbI9tKMGNJ93FvGkSn759zlASUQzoTadmGk1kZ+LQwGdZmaieMA6HFeVNg+tFn4q6y0H
         jvK0OM1xhOJ1b9C9BOJRAUuMHKLAjZy2+8SWV6Jm1+xsuyaCFqfGqpLCbU5I1byDAd4l
         Qpv3+CR0IeTVH+KMh7dtVEXQA47kTgSE/Xzso5lpuuEZGSHoFKvhTLb/Zz+09euLNpTX
         Fd3w==
X-Gm-Message-State: AOJu0YwZfJFoqC/8Sn7oUC/8lH+Y3IQicDm7zvJIA0N7I08irQL4Nmo/
	l3F6JmnccWc70XM5DfdgDyBPsMRx66q6SbwMGXRSamEEu6xXeGjuCPAfJruJ8tKp2RTilwHJtYE
	Lx2sJT5IDtSEpVSvFYSTVtBRF320HY4TL9aLgd23JRzwZn68M9HWmVw9vKdugt1thMF/Qt6P0NZ
	hAiY4QtTiT5VLvhx98TCL1m7o6fVv5T7FqgSrfWyut
X-Received: by 2002:a05:6512:4028:b0:52c:e4bf:d55d with SMTP id 2adb3069b0e04-539da3b67cdmr877864e87.8.1728633259721;
        Fri, 11 Oct 2024 00:54:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi3FJlWubBikQL23Ch/fBjJ4sp6q/LkZyi5yAh+biYSEe+DSZRTWbye4m04o8pcT5OWV7gLw==
X-Received: by 2002:a05:6512:4028:b0:52c:e4bf:d55d with SMTP id 2adb3069b0e04-539da3b67cdmr877851e87.8.1728633259173;
        Fri, 11 Oct 2024 00:54:19 -0700 (PDT)
Received: from [10.43.17.94] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6cfc2asm3300685f8f.54.2024.10.11.00.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 00:54:17 -0700 (PDT)
Message-ID: <f6ed98e9-94c2-4fee-8fa2-ed8122fcb8c0@redhat.com>
Date: Fri, 11 Oct 2024 09:54:16 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issues with LUKS Password Management Options
To: cryptsetup@lists.linux.dev
References: <32be1215-bcab-425b-99cd-3adc26590b14@gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
Cc: =?UTF-8?Q?Kiss_Istv=C3=A1n?= <keraform@gmail.com>
In-Reply-To: <32be1215-bcab-425b-99cd-3adc26590b14@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/2024 09:08, Kiss István wrote:
> Dear Developers,
> 
> I would like to bring to your attention an issue regarding the password
> management of LUKS-encrypted volumes. Currently, the LUKS password
> prompt offers three options for remembering the password, with the
> default setting being to remember the password until logout. However, I
> rarely turn off my computer, and I often keep it in standby mode for
> weeks. As a result, the LUKS-encrypted volume remains unlocked for
> extended periods, which is not ideal from a security perspective.

There's no such feature in cryptsetup or libcryptsetup. I guess, you're 
referring to systemd options for caching passphrases in kernel keyring, 
or some other "feature" stacked on top of it, probably even distro specific?

cryptsetup does not cache any secret unless user explicitly asks for
it.

With regards
O. Kozina

> 
> Every time, I have to manually ensure that the password is only stored
> temporarily (forgotten immediately), which can be inconvenient and is
> easy to overlook. I believe it would be helpful if users had the option
> to set "forget the password immediately" as the default behavior,
> perhaps through a simple checkbox, avoiding unnecessary compromises
> between convenience and security.
> 
> I would like to ask if such a change is planned for the future or if you
> have any suggestions on how this can be more efficiently handled with
> the current system configuration.
> 
> Thank you for your attention, and I look forward to your response.
> 
> Best regards,
>       István Kiss
> 
> 

