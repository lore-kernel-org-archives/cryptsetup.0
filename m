Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F3605BA
	for <cryptsetup@lists.linux.dev>; Tue,  2 Apr 2024 10:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712055152; cv=none; b=uTlvylaNE7vHdoA/2DQhycu2Ac964W05oRcidItG4VrUFKj/lm8uZvPSHidim+t+ZNCOPm4j8r5RjeZAQGi2v/098fh4PAXwgJQ0D5Y5cQ0DBxGpDR/BoBa1j5nhgDb6y8DrY9VFjG08k1vaQxQP6tS9I8UB9gy9AGr+EuqJ2is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712055152; c=relaxed/simple;
	bh=EH/2EjJP4bRF6tdBuh1vDR1ta+Rp1FHa+XuA87j6fkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SMYvmFbRTURB28fGJtdkWxoUZ+Sy/5DvVB77VGLGR4zDSdZvpKgrwAS74800ZjncYwV8xWvc3ZkY7OmoAE7fRqwWkxcoF/yrlZhqYg7SBUGF7qSrEOAMm1KavgaCxZwEoLrW5bMvsftD/OsCrz1MpWSUjLMJBJZa93oD40wWnHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krMDQJLP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krMDQJLP"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513da1c1f26so6000782e87.3
        for <cryptsetup@lists.linux.dev>; Tue, 02 Apr 2024 03:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712055148; x=1712659948; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5AzLH7vYlbP66hJK/XBcG+YeAvS1gdAzGrgZDj8B3/U=;
        b=krMDQJLPh0M5/6GoUdQKvd8jCK4vrrzg2GYv9tSs1cg/FPxaMTpDtpQPPObzFINx91
         RSGZk6739yMNix8kCiRMG398fwOq2xXiNWT4odTif8ZGiseBROYxW9mFI0vMF07tNJYC
         B0firkh5lpi3dMj3H6lXSv9gczarNkANcEVuVy81JRIhqe+vvyOdxDDb25fL8ziF+mmc
         iA0HZ4lWR4mh9gB4E0dh6xAGKdqQDY2COJoHzbxf9o2goaRnvs5wiGHSCNL90M4sGspA
         +qaoXnjzjlM3d+fsKJ8BoGRdu3WlcqRM2QYdP+3N7kqKWSmhaUTKuvS1ZoR8reTMhhUc
         23tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712055148; x=1712659948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AzLH7vYlbP66hJK/XBcG+YeAvS1gdAzGrgZDj8B3/U=;
        b=oWKrf5ex7u/liGJulrZl+bCLd/LjCML0goThhIbzlEwhKxv0w/2LgBaOwWqMuFrm83
         bcmNfuKGC912RZAdxdsz5EpIep5gpwIDCsER6RtBMvwHL0dht5KzMpH2AoRmYD87f3eD
         wXEh4rjvce0eZFgQT2UTzx2Qg1G8L0rn4z8Zrdn9PolNCVHc9+vFDNhA0VWFD3n0cWOs
         hM2cQfxnDpB5N0tofJz9rUPHzy70H7mund56IxbpKKfqaEC3hce9e+xHXAkydzWHD0PT
         TZ21/0S0+llLSB/C6IrjXPjZmEThkN/mkozq5l/Y7T4i7lyXjAxmDVvmiqdaoNSGLjCM
         8R+g==
X-Forwarded-Encrypted: i=1; AJvYcCX3DGHMTbi32CfB+4Y17O3ma9++Iu12O/KuuJKfASE4MrPim8EQLmBCPIehuN0Pu2t/h1pWTTQ3bYUaVuhykWJ1xIwhRSUHQcJTtw==
X-Gm-Message-State: AOJu0YztqWT3uG4JBjwHAJ4an0ZT08mfXCZB674b6fXxgNjzyP1w4Eiu
	K3JxAxhSdeqtq9XRqSdEv1evh9Prp7E6tCb7TgTB43JH8G/f4k2uDFQoQW4d
X-Google-Smtp-Source: AGHT+IGZhHgi5pXtRAEcjwHZofWp39FL9Db6qZasjqQOiJde6uISIQPLueLq4ipKLuYzKwCgQkG3UA==
X-Received: by 2002:a05:6512:3133:b0:515:cc64:973c with SMTP id p19-20020a056512313300b00515cc64973cmr7592092lfd.23.1712055147978;
        Tue, 02 Apr 2024 03:52:27 -0700 (PDT)
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id ij15-20020a056402158f00b0056ddd9427d2sm1466687edb.58.2024.04.02.03.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 03:52:27 -0700 (PDT)
Message-ID: <cc8e19fe-339d-418c-ac9a-846d22a369bb@gmail.com>
Date: Tue, 2 Apr 2024 12:52:26 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Authenticated Encryption with external Data Integrity Fields
To: Alex Lieflander <public@atlief.com>, cryptsetup@lists.linux.dev
References: <22FA1250-CE63-4289-90F3-D2256762E5D0@atlief.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <22FA1250-CE63-4289-90F3-D2256762E5D0@atlief.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 4/2/24 4:15 AM, Alex Lieflander wrote:
> Hello,
> 
> I’m trying to add authenticated encryption to my setup, but I’m
> having trouble to configure some of the parameters. I know that
> `cryptsetup` with --integrity only supports some of the options that
> `integritysetup` does, so I’m wondering if I could instead create the
> integrity layer myself and tell `cryptsetup` to pass down its
> integrity tags (like it does with the --integrity option).

No, you cannot do that. Authenticated encryption through dm-crypt
(with dm-integrity proividend only additional per-sector space) can
be configured only with LUKS2 and cryptsetup.

But the AEAD algorithm configuration for LUKS2 will need some update.
What is missing for your config?

  
> If that isn’t currently possible, are there any plans to add that
> feature in the future?

No, this is not planned. But see below.


> It could also be used to take advantage of physical hardware with T10/DIF support.

Existing hw formats usually only supports 512 + 8 bytes sector, this is not enough for AEAD.

But NVMe drives can be configured to actually support other per-sector additional space.
IMO this feature is currently available only to "enterprise" storage I do not have access to.

But once such configuration is reliable and available on some generic NVMe drives, I definitely
want to add support for it (IOW replace dm-integrity by this hw-only solution - this was actually
long-term plan; dm-integrity was originally only proof-of-concept.)

> Alternatively, are there any
> future plans to support using a separate device for the integrity
> tags like `integritysetup` can with --data-device?

No. We already support detached LUKS2 header, with separate device for integrity
tags this means maintaining 3 separate devices, this would create too complex scenario.

The long-term plan should head to hw backed support mentioned above, that would also
increase performance as it removes the need for dm-integrity journal.

Milan
