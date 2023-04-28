Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C0323A4
	for <cryptsetup@lists.linux.dev>; Fri, 28 Apr 2023 07:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682666898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c1UVPNfqJHdUf7d341cjb4fpRVFeXNfxjDwQpIgLAQQ=;
	b=dIC9A0sLkWTTrMVjX72H28ofPVWhDNhkQNBa8hTpSafftmg0QxN2ooh65ILn1mrjOIoqwA
	wHAg7tKYsxnEO/ziWYPRpShSi3p7FRg7nJZ8jSdDOMH+hTYUIsNb8C+5ElLvGUEk66knAa
	fQAzafX3+GOBvnPNSQ9+XMZgC677nqc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-K-dlgnuPNW2ZgagmKjRj6Q-1; Fri, 28 Apr 2023 03:28:17 -0400
X-MC-Unique: K-dlgnuPNW2ZgagmKjRj6Q-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f1754de18cso57781345e9.1
        for <cryptsetup@lists.linux.dev>; Fri, 28 Apr 2023 00:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682666896; x=1685258896;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1UVPNfqJHdUf7d341cjb4fpRVFeXNfxjDwQpIgLAQQ=;
        b=AbAXt55ZcCEd+1YpJiZBzx7bbFuoL0uobqzw3x0V5sCNlGK8EVZ0JJ5KA1e9+CMKPI
         xkVwmIwNWdufXRkKT5I/HEDgU9pJLxc7W0FWUJB69OKMqBIhro7sgjz+ysAm8zSo5z1i
         R7Zf24SGHyAM2kAwmzBj2uBgrDj9tTRLWpBBDrewZR6YS1IZ0v4sXHJUcu+GnLb5hhar
         jOYmQFtc7gyS0nKDHJWj38iByHNNmPrkeJeVz0RkMNTypGs2ErZ6dzeocl9K4bw0YJ/J
         kwDMxh5F4EMtQOUlR+XhOxLozq4jUMPW4lXJCBS73qFXyZ09mTld03D0XnLGFk06U7jf
         m+2w==
X-Gm-Message-State: AC+VfDykRPijAahDYdNk2csxapXbq18T1Zq8r8WQ7RWba7YWBglMNS/3
	BcKVu4b5TaHfxIt3+/qEi8e1W48Nn1gAggNUyto9LYbxQIjhs66m7BoZUFocebZQMPttiUGDQXu
	C6d+0nheHWC7rptL7TY0j
X-Received: by 2002:adf:fe4d:0:b0:2f8:1ed9:f0f8 with SMTP id m13-20020adffe4d000000b002f81ed9f0f8mr3176760wrs.61.1682666896310;
        Fri, 28 Apr 2023 00:28:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7j/68Bc3+qTKG0QV3zmd3eRSnbpVxF6jHV/stOX/eVKNvfKYXOM7XMsitiZ1k1RQv1po19Ag==
X-Received: by 2002:adf:fe4d:0:b0:2f8:1ed9:f0f8 with SMTP id m13-20020adffe4d000000b002f81ed9f0f8mr3176749wrs.61.1682666896036;
        Fri, 28 Apr 2023 00:28:16 -0700 (PDT)
Received: from [192.168.50.108] ([83.240.60.42])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d474c000000b002f4c2ea66absm20394859wrs.85.2023.04.28.00.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 00:28:15 -0700 (PDT)
Message-ID: <b08003f6-b01f-d419-c771-28237dd9590e@redhat.com>
Date: Fri, 28 Apr 2023 09:28:14 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Lodewyk van der Westhuizen <jl.westhuizen@gmail.com>,
 Milan Broz <gmazyland@gmail.com>, cryptsetup@lists.linux.dev
References: <CABOqr=M+uDDXC-xG_hnxGB-7MZnWUwONizC6c=r5NCYaCz6Pxg@mail.gmail.com>
 <eb371bc1-6210-95d7-ee63-d8dc243b7da6@gmail.com>
 <CABOqr=MqFcTn77WEg9XPHDPBx=Y7nD-fR+_=ujDzmRQq7LW67Q@mail.gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Subject: Re: Performance issue LUKS1 vs LUKS2
In-Reply-To: <CABOqr=MqFcTn77WEg9XPHDPBx=Y7nD-fR+_=ujDzmRQq7LW67Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27. 04. 23 18:08, Lodewyk van der Westhuizen wrote:
> Hello Milan,
> 
> Thank you for the response. I'll try to answer your questions as best I can.
> 
>> NOTE: LUKS1 is not cryptsetup version 1.x, it ia a metadata format.
>> All recent cryptsetup 2.x versions can use LUKS1 as well - just use "--type luks1"
>> in format (so you will compare the same formats on different kernels).
> OK let me rephrase, when using luks1 or luks2 the performance slowdown
> is still there. The only difference is the version of cryptsetup,
> dm-crypt and the kernel.
> 
>> You mean slowdown with access to encrypted data, not unlocking time, right?
> Correct, measuring the I/O (creating/deleting files)
> 
>> Which crypto modules are used? What architecture it is - do you use AES-NI
> acceleration on both systems?
> It's Red Hat for both machines (RHEL7 vs RHEL8).

Please open bug on https://bugzilla.redhat.com/ (product RHEL8). It may 
be system configuration issue unrelated to dm-crypt/cryptsetup. If it 
turns out to be issue in upstream code as well, I will open upstrem 
issue for it myself later.

Thank you
Ondrej

