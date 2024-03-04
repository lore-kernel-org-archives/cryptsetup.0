Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DCC481AA
	for <cryptsetup@lists.linux.dev>; Mon,  4 Mar 2024 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709567130; cv=none; b=LC7sKz3QeQiiO/1q3xIaKCEApRNmDV3e8dRIWcvLc79SreP7ULGgjKa+vN9HvwAtBCmpoLKr6t1cZdtWLkNs2WV7qpjTzO2eqz5VuVkSzjQRKZruTltMVL1D5m5erx+C7q/GnEvn/14OnvyX3zwjAxtQI4uQBDpWHvwd4Pbj1pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709567130; c=relaxed/simple;
	bh=TmXxAWtwaGvNX5Jp5g3pbmomduILAwYMKwTetDZ6YKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=XCtn6aflkppAbBNU8roQ/pO+ZbHIrwnZV96PKKcn7w9mQnIregwBdheRfi8i0yA/fh/j+rc5Y3CA7pYemuGQG4ghidgaA9z+sPqXyE5Agp+H92pGvBx4YRkkZPDpOQG8ZPIUxvNcQP1m1WHk4xmpnVANXNJZQmUwK7isHBni9qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aW/q9+OK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aW/q9+OK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709567127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xNPaY6iwS/u74XolFkRuhrIMNmu8f+773RVjUSFZ0IA=;
	b=aW/q9+OK34oF22BpJ7QsrptQDbzHYBVY5MKpTtfegVuLoeNvt/xp0BBjG7az0DYS00vAAx
	++uVQ3ShlKBrzqLnWGaVAaguw2ymPC/bekTCADI5vuT9ciR2q4YngQ/F/VLIZafYOzYlOr
	ZBAVUd7F22A3lyfzOaifDbEgJekmafQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-a3j_iJEIMEmAP09TFqclcA-1; Mon, 04 Mar 2024 10:45:25 -0500
X-MC-Unique: a3j_iJEIMEmAP09TFqclcA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-412dd54cc17so9565395e9.1
        for <cryptsetup@lists.linux.dev>; Mon, 04 Mar 2024 07:45:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709567123; x=1710171923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNPaY6iwS/u74XolFkRuhrIMNmu8f+773RVjUSFZ0IA=;
        b=XG342AiqlHadoafXlbFR8Cn4k4/kJaeGF0Dixl/LR1xyD9Qr1r0/a181OqCiw0NXgF
         ABAE7uQ79lmB5VIJEWRuIS6YyqAlu4lvKKx8U7drU+PA0UMPI7tUmfgnXIUj0VlivlMu
         C79e0gnXtXi06Sgcm0xUJ7t80gPS2kF0D2E7kIEvCdqSgOhxRJ+8Vr4/ARep4vY7xgPL
         qcTybC/QSqOYEB8j3/sKg1Ysy3eGkss6+mvvk73MnDDnAK1patFNg3zONtShO/pHR+oz
         DeDJWGKHnI4hXPP74SU6VJsjH8gj99xFriR9DoH1wgas5jXzeJPVtO9gA2laQ/+rJKTY
         cW8g==
X-Gm-Message-State: AOJu0YzvraChJFwd9/W42E058yvqnoQ7eE6T7lo7exk7SeMXn+FMAef1
	XRPiqi///7MMy6fK++M6u5DnOqCUc8hax/T+aGDlNExyqx+luDEhv7o/FA+hbkxKMuD2LK0e+/c
	bRZJLfMYk6wMsjD1jpsjqQmK2UdMy7G9ZO97XuGxNbQ1cx18l0xKFaI41b6mRy1K5Kl8Am+7p0p
	z79gSejH6r4rHIfVFiYm5wvA2ytN/RnllKywicISCS
X-Received: by 2002:a05:600c:46ce:b0:412:9017:c716 with SMTP id q14-20020a05600c46ce00b004129017c716mr6451372wmo.17.1709567122981;
        Mon, 04 Mar 2024 07:45:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHruFU3S2lO+m5JR6pnOWh1YXniFx78CJ9ZnAn0xOz3gZcxHorqmPoVfQ3qgurNGPzrduvQw==
X-Received: by 2002:a05:600c:46ce:b0:412:9017:c716 with SMTP id q14-20020a05600c46ce00b004129017c716mr6451351wmo.17.1709567122610;
        Mon, 04 Mar 2024 07:45:22 -0800 (PST)
Received: from [10.43.17.51] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b00412de55135dsm5097849wmq.41.2024.03.04.07.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 07:45:22 -0800 (PST)
Message-ID: <6caca783-5a30-434c-b9f1-234a1bff9310@redhat.com>
Date: Mon, 4 Mar 2024 16:45:21 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to resume decryption on LUKS1 in-place
To: cryptsetup@lists.linux.dev
References: <cd29a952-c9ce-4aa0-8903-a79c325824f0@gmx.co.uk>
 <764b4743-a61f-4e95-af07-d53c1e842e64@redhat.com>
 <3e4d1b13-7935-40b6-883a-68b2ef16545d@gmx.co.uk>
 <80c0a6a8-b710-4483-8e57-56e1951fa213@redhat.com>
 <76ca5ef4-5298-4c03-bdc1-8b1ce012c7b4@gmx.co.uk>
Cc: xndr <xanda@gmx.co.uk>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
In-Reply-To: <76ca5ef4-5298-4c03-bdc1-8b1ce012c7b4@gmx.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/03/2024 15:51, xndr wrote:
> For the record:-
> 
>       $: cryptsetup -V
>       cryptsetup 2.6.1 flags: UDEV BLKID KEYRING KERNEL_CAPI
> 
>       $: apt show cryptsetup
>       Package: cryptsetup
>       Version: 2:2.6.1-4~deb12u2
> 
> We see the latest stable version on GitLab is now 2.7.0; is it still
> recommended to rollback to 2.4.3?

In general? No I don't recommend to downgrade to 2.4.3 for normal 
operation. It's just currently the best option to workaround the bug 
introduced in 2.5.0 regarding resuming LUKS1 decryption operation.

You'd need the old version only for this particular case. Nothing else.

Anyway, I'll send patch to upstream soon so there will be a proper fix 
for 2.7.0 and later releases.

Kind regards
O.

