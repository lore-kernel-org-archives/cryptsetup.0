Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE46381D8
	for <cryptsetup@lists.linux.dev>; Tue, 17 Oct 2023 09:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FYPf5/nM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697533437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FgVqznAhC3mpxrvXSY654zcVpRhkgr01EbysHD3uOr8=;
	b=FYPf5/nM+1YF3KEDTCZM6JoQvMFyW8HhqxNDxMi6jyKbt6hD+AF2Avcyvu1e/wdgcru9yW
	DbGHqyMhiv/nXUB9lCPMkRqN+wH6DdMbllcsmFtzam6Wc/VplU0Q/UHv0ywIh42xGIH3HP
	ewOZXsZX9LBBrRiK8jFmfKJRwopCvcg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-ZAp2itlSPre5Jjg4HmUGYw-1; Tue, 17 Oct 2023 05:03:56 -0400
X-MC-Unique: ZAp2itlSPre5Jjg4HmUGYw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-668f04867deso66328206d6.2
        for <cryptsetup@lists.linux.dev>; Tue, 17 Oct 2023 02:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697533435; x=1698138235;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgVqznAhC3mpxrvXSY654zcVpRhkgr01EbysHD3uOr8=;
        b=SnSpBKShRqavhRLqVv3qZhmFoc4eHubCpUcoajZypP3rBC9IDikSLinD0kzKUaeANV
         S5Ctj+hKE9vEonk6aLlQolOF8nUdpeFPra6reyywSvpmJ2AOv0qCsuSCVGLNJXXilJBj
         hrBlaDZjjoWlLiJeEGbJlhoOpJHMdYiehr+iEVxkOvafsjP9VgtgQEZxMmPbSgDPiWRV
         nQEBFVFKn8KhZpASMXMYOH6wdUMA4lGkU0EyQ5NAhtR8KXP9gzKoVZIWOBhVbwf6/SuU
         XDwkPGF4P4TvIzdhcYdyQbfefCz4s8rXkghPlRNWE2tmymaeT/Z3bLD3GGtBww7//8SC
         HiBw==
X-Gm-Message-State: AOJu0YwM0NfaolEIEWASqFfkavTK3FHLPSW4+IW3JT/RJqQxfMRbRT47
	QTeyVru8fCF3tROby31e18X2x4XW1F2O3h63k2iQHMRzloyHdhlOjyNP5pq3JrsAOWPa/nCu2lv
	hs1Lawv6oaXLncIOcWPlWXYAYNBbVoIZn46CbDdQ/b3Me8jlbpduLIjpNj6xBxxgHZxNRgd6d5X
	yJPS4=
X-Received: by 2002:a05:6214:2a8a:b0:65b:216f:2d65 with SMTP id jr10-20020a0562142a8a00b0065b216f2d65mr2149138qvb.5.1697533434831;
        Tue, 17 Oct 2023 02:03:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEanWlmkgPubfsAIEHWsZV8+3aqOXt9h87TrYJvg8qIsSOJXHqyIzci+4noCBV5bQDggZBubg==
X-Received: by 2002:a05:6214:2a8a:b0:65b:216f:2d65 with SMTP id jr10-20020a0562142a8a00b0065b216f2d65mr2149126qvb.5.1697533434518;
        Tue, 17 Oct 2023 02:03:54 -0700 (PDT)
Received: from [10.43.17.25] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id mm9-20020a0562145e8900b00668eb252523sm385852qvb.63.2023.10.17.02.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 02:03:53 -0700 (PDT)
Message-ID: <206b7fbf-fed4-4c54-86ec-8e8bcfdeafc0@redhat.com>
Date: Tue, 17 Oct 2023 11:03:52 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: online encryption progress
To: cryptsetup@lists.linux.dev
References: <633010a561869f927fc1f208f5cf4ae6a2c9587f.camel@interlinx.bc.ca>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
Cc: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <633010a561869f927fc1f208f5cf4ae6a2c9587f.camel@interlinx.bc.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 19:57, Brian J. Murrell wrote:
> Hi.
> 
> I used:
> 
> # cryptsetup reencrypt --encrypt --init-only --reduce-device-size 32M /dev/md0 md0_encrypted
> # cryptsetup reencrypt --resume-only /dev/md0

This command, unless called with --quiet option, should print progress 
regularly, including percentage already completed.

> 
> to encrypt a device online.
> 
> I can see that it's encrypting:
> 
> # cryptsetup status md0_encrypted
> /dev/mapper/md0_encrypted is active.
>    type:    LUKS2
>    reencryption:  in-progress
>    cipher:  aes-xts-plain64
>    keysize: 512 bits
>    key location: dm-crypt
>    device:  /dev/md0
>    sector size:  512
>    offset:  32768 sectors
>    size:    7813643952 sectors
>    mode:    read/write
> 
> Is there any way to know how far from complete it is?  I.e. percent
> done, etc.?

See above. Status command (in current code) can not output reencryption 
progress data. The information necessary for it to be correct are stored 
in LUKS2 metadata (on disk). We'd have to construct new reencryption 
context which is protected by lock held by current reencryption process 
(cryptsetup reencrypt --resume-only /dev/md0 process).

Kind regards
O.

