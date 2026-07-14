Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC90A363C60
	for <cryptsetup@lists.linux.dev>; Tue, 14 Jul 2026 11:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027973; cv=none; b=UKwzwyAk/HUJgjM3d/vjg1dgg244psUi/Np3L6VoGC96SeBt7yBAaJeHqMjITVjhVukVJu1t6LNvTWSls6U6P6/CGSvH6NPIRGKSwGqGyR6qSC3JaN8hxQs1Co6HGZUD5rxIRiwo8rBbP9CpOtFyGgtvxqA8LajRkqhSmT0KgJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027973; c=relaxed/simple;
	bh=b77LobGzz3STgq6K5ug9HeFowLfUBEtareKeKR8LO8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgB7RDF3ZkhMSrlGmCDaqs6/lm8CpxBHC0Xn9C3bsPqd+CJmP4F89BM9VmsiDaNX+S8kN5R+GxlnR9gt+ixB9Chm3UWAEzHHfoZB9acUJMH8fsSnf6yXG6aj76daUjiWMovUJr/1T9U8GruNBqF/VaK33HqPK6tT3jC1HhOPeK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pi7qCf2I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pi7qCf2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784027970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rOa16IfBAa+W5v5c+R/+2vrBrIaNnow9ooYdf2Ohr4s=;
	b=Pi7qCf2I7QtL8h2MEpPHl/8KuN45tjqL45AMC4TraDwQVVXdgA/UyCFXuMJozkdDt+D3q4
	iFKhTLy0sahsPwhKIwty5r61YHfguljF3AL5WTjNr9ja9WTdNv6vDy23jc9aMidiujqc8F
	1Bjo/AZtuE7qXD3RwYVGfPYRSLSfo8Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-Bp5nrBDwN3a0xr1he-H2pA-1; Tue, 14 Jul 2026 07:19:29 -0400
X-MC-Unique: Bp5nrBDwN3a0xr1he-H2pA-1
X-Mimecast-MFC-AGG-ID: Bp5nrBDwN3a0xr1he-H2pA_1784027968
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-493c55d5ce5so22585555e9.0
        for <cryptsetup@lists.linux.dev>; Tue, 14 Jul 2026 04:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027968; x=1784632768;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOa16IfBAa+W5v5c+R/+2vrBrIaNnow9ooYdf2Ohr4s=;
        b=hk2mgQbmVBQ8d+OxqrCXLq310bllqCaDGju3aTj5BdQ/hHsqW2f4fQylSc3XsSLiTX
         IqgBEnt60FZgghiRbOsHRRGPkuNQpltAnmqpOc4DIgWkgOc6uqQUSmF5WVoqgzH57yH7
         g1QfOn2yW9uxZOcuw+9sSy0ZLVM0SzisHXB82anE78No8JcVpy2W0q0npEjTRRT0/cSC
         syxGn/ercWZQfnEZIK9kmSEH2SOlqOnxTMqYr5tpIPCU7L8YOcUSRDVNE9JSQAxfFzIu
         uaYkRsxTqxl+Nmd9b15kA6T9+oodTr+vexJ4pvxQl2oqzZSjkhrS6OXAyX5WEl+AZRMh
         rXVQ==
X-Gm-Message-State: AOJu0Yw0eXu3NBfO9zFGdVDUQOncjBQ5IE7CsgqZCWEJ06mMuiBSvCAx
	o01UmXUXGTTI+alZ2XXp26kaDe/ap18OL9Ho7cL5ffcnWZp5SXwtl44F6DmS1NlOxMGo8ustqt/
	wYWohQmci46Orr7csIpmAUDzT+DbifUr+I7D6kdl2jzNPTaZLEd8w+7r5KkmqGldKx30Mz/DKCp
	ZEVgs2Be2dciJPF01k8qMDhIBLaHTs5N6ythUXbPiWy7Pg
X-Gm-Gg: AfdE7cl4NnTOr5YbZKFL4Pb27F586RQXyoJseougv4DzXRTJGRR4F3dQ380t3mvC73L
	oJYCWl8YtCx2AcpRCxft9yjwhPzBSU+b6mT/R0jS7/xbQ8lMF4qTju1tMXF3H+UDGVqfBoIUuGT
	7AE2PxblJ05XAwG0rP5o21MOXndFKoMwmIqiUWbWxAPvh0tQazpmuFW0v3bohegYJcd6uuyrmmy
	13xGgltrj9md9/DOBXP5c+9OatkI4Cx6R86k1nvTx9zx2txdDYCqN2b1WgAP7e3Ayzmc40MDKHn
	aFgeVMyB4mSZ4Lib+AkhMoMOFw2ry6PKr0pKYSi9Z6NszcyCNKdUSLwPcFBY5976FSBgFsG6ev8
	g
X-Received: by 2002:a05:600c:8284:b0:493:a5f9:d33d with SMTP id 5b1f17b1804b1-493f8824395mr136593735e9.18.1784027968102;
        Tue, 14 Jul 2026 04:19:28 -0700 (PDT)
X-Received: by 2002:a05:600c:8284:b0:493:a5f9:d33d with SMTP id 5b1f17b1804b1-493f8824395mr136593525e9.18.1784027967678;
        Tue, 14 Jul 2026 04:19:27 -0700 (PDT)
Received: from [10.43.17.192] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32b9f3sm79972215e9.13.2026.07.14.04.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:19:27 -0700 (PDT)
Message-ID: <e70a671d-c181-4178-8900-bf7fc1f7686f@redhat.com>
Date: Tue, 14 Jul 2026 13:19:26 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Derive encryption key from PIN
To: cryptsetup@lists.linux.dev
Cc: oSumAtrIX <johan.melkonyan1@web.de>
References: <CAK+fmzxEkGy+8X9BAwFKyU415Z4xm2uHfL+yaah-U1Rkw9YDYA@mail.gmail.com>
 <96c530a1-d27a-4c27-86c0-04ac3abfef22@redhat.com>
 <CAK+fmzxwSgHcYw5FL-8RV4SBUyb6stzsdm_DaWURvOsfRnv3Dw@mail.gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
In-Reply-To: <CAK+fmzxwSgHcYw5FL-8RV4SBUyb6stzsdm_DaWURvOsfRnv3Dw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7rYT9F88ljPdi99SMnZ2TGhhPJI8-B3jLMvba1RcbFA_1784027968
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/07/2026 13:10, oSumAtrIX wrote:
> Hi,
> 
>> What do we talk about? systemd-tpm2 cryptsetup plugin? IIUCT it uses
>> secret stored in TPM2 to get LUKS2 keyslot passphrase or KEK. The KEK
>> later enter KDF to derive keyslot encryption key. And the keyslot
>> contains encrypted volume key (MEK).
>>
>> Or, there's some other plugin or application that seals the actual
>> volume key?!
>>
>> If there's something that could be improved in systemd-tmp2 plugin,
>> please open RFE on systemd. They maintain the plugins for cryptsetup.
>>
>> Best regards
>> O.
> 
> Please note that I have limited knowledge regarding the infrastructure
> of LUKS or cryptsetup. Therefore, I would appreciate guidance on the
> appropriate contact for my issue.

 From your description, I think it's related to systemd-tpm2 plugin. In 
that case you can contact systemd people via systemd-devel list[1] or 
take a look at systemd-tpm2 plugin sources[2].

I have ported systemd plugins into native libcryptsetup plugins some 
time ago (hosted in systemd repository), but there were many changes to 
those plugins over the time so the best approach would be to take a look 
and open RFE or Issue with issue description if there are concerns about it.

[1] https://lists.freedesktop.org/mailman/listinfo/systemd-devel
[2] https://github.com/systemd/systemd/

Best regards
O.

