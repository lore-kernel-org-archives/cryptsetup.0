Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E227547DF80
	for <cryptsetup@lists.linux.dev>; Tue, 22 Sep 2026 12:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078837; cv=none; b=WR3lKJCrI9zLz5KgCCxItb98Lho4P3WQQObQ1/KKoTt7ZF4o1VPMal/IInEiT//0dz/BlBa678ozt7z4NrDFj9Teyhps8VYbzcIZpuZLoEkmmow0LbqrB/c6wl/aF5CIgsdDp2a6CSQcXUhN/9gq98hTeKJudLJI9WEn80MKRGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078837; c=relaxed/simple;
	bh=W2iIFDSZ6eeEpPCf8gNg5AAWvNzFNZ3clTb4mw2whXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=gtKhfw5wxbEv9VV8SmpQWG2bxU9jbNLhF02KZWO2hONggL9fvhURRAgGvIDcHM0txzGlhqh/w84gwm23iMvCSHLVzILNBV8OQuoXgb6qkGwmdDY6py3NPkqU5j9zMcfgqElCqppPnzB1vy5gMEsSlXiiWKEGGxlwrH6GbWVRjGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YGcPuuuC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YGcPuuuC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790078830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NjYlLkXPetdxQggtr8YG5/B57aoar3ED4V6ZfMDM/l8=;
	b=YGcPuuuC6X2okgktov0lehH1P8DYI62mjcVxCyFYQwQJ+kDV6dXXgCxQ3ck1bECh+SKDLL
	jQ0dJb1gmAYvhrz+PcKRgX62120OWJ53BIFALp4EMRyEXtuZFORwxfh1xHP9p0xX6EbnvF
	UZs52jXZhvChYHtMJC7BHoH/JO+ELiA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-_Do1CdrAMxejnmSFBSkcMw-1; Tue, 22 Sep 2026 08:07:09 -0400
X-MC-Unique: _Do1CdrAMxejnmSFBSkcMw-1
X-Mimecast-MFC-AGG-ID: _Do1CdrAMxejnmSFBSkcMw_1790078828
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4871575eebbso3560121f8f.2
        for <cryptsetup@lists.linux.dev>; Tue, 22 Sep 2026 05:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078828; x=1790683628;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjYlLkXPetdxQggtr8YG5/B57aoar3ED4V6ZfMDM/l8=;
        b=Fcf0RllzWYb2iNbD40YzESEo3ti8n0bcncxG3WaC5vKqFLDwO8dSOlobv1rre+6oFr
         ylvxQGQ5Rnu3UFBMZDZPGAHuCpx+Dgt8rQBEmIKrK7I5/5WzTYwNQ0hlrPUKyMa37Y81
         EoISLuqhwAv+rlWOQVs08bSlKHYO/jkWmlwo4E4Af7H6Ta/44d8tqxRRaNG6hfbRDbOz
         pQl4QAb1cZZ7pqr4To2pwdxKa2024DY1O1aglZoQsoAYa9UxM0de2f7cT8nPuUz3tGGN
         gQgn0+L0KxxvwMlYM30SN5uTw+0xrjnQRFFrvRiIM1Vr/wZbIK2KDd07VzcQ24c4H/qh
         jIPg==
X-Gm-Message-State: AFuF++k1NPPXSx8w9upnMYEviX9WetyprbTowr5QAb4g72wtfSaC3Ot+
	YQOI/uq5T6jfiH/pYq31xBo1pfS1pZwK4nAgOBFaDd530hMBIP+uhBBifsIqj4etr9it9Wx14as
	nUYG3bFJ3T2LRUHxnNgAsgwmr39WAxVj+SxhZcOyXf+yl8EmWLZbGggjZim8SnxKb2sDUDoxvKq
	ZU9n9XQa+C+bFw3urA94sfRc2ds8Ax3qgLye3HJyeqJdqF
X-Gm-Gg: AYBFou3RXKIMPxPqEZ67Zac6SlP8JxydMAE4kaaAwUZvO/XrUfAYOpNOLQrYm2M/RoE
	Mkecp/oPSZTecdFFz/NuD0ybaGY4SvR3zwxmqS1EJeBpwxT6NhFiNQn2UHMai+9PyfbdqnUMX+f
	ko2MtLH6feHDQL/EESsE1XmuWPLL3/X8bzXXx4y9LTN1dZaILWCFPq0J4/m96mI9OJYYbpzcRio
	210x4ppr6Ho7RxsIacJLuVbhbyD7wPgCQgSWVA7VrowueLZCYA95esOcyCe1RDEKWED2ihUbJ8Y
	c6zPSf/oUjp5qdTveZ/hMDkELnwcSHtaCy3R2gvjQM1MLac6Ih3SzXoTjfh1g1wLmUMtHs9C8Od
	y5A==
X-Received: by 2002:a05:6000:4809:b0:487:360:58d8 with SMTP id ffacd0b85a97d-4871e36fcf0mr20310625f8f.46.1790078827790;
        Tue, 22 Sep 2026 05:07:07 -0700 (PDT)
X-Received: by 2002:a05:6000:4809:b0:487:360:58d8 with SMTP id ffacd0b85a97d-4871e36fcf0mr20310568f8f.46.1790078827361;
        Tue, 22 Sep 2026 05:07:07 -0700 (PDT)
Received: from [10.202.148.237] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862795215sm4312376f8f.37.2026.09.22.05.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:07:06 -0700 (PDT)
Message-ID: <d3823e0b-3387-4b3a-b5e8-a3d5f266308a@redhat.com>
Date: Tue, 22 Sep 2026 14:07:06 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Reject LUKS2 header with out-of-range encryption sector
 size.
To: cryptsetup@lists.linux.dev
References: <20260922100554.28692-1-itai.handler@gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Cc: Itai Handler <itai.handler@gmail.com>
In-Reply-To: <20260922100554.28692-1-itai.handler@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MN_QBXGwXCNRLjzJxeaNyC5uaKzeUlx4Ku6ry_dAS70_1790078828
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I don't think this patch is necessary. We do not check the upper bound 
value for sector_size in LUKS2 metadata validation code, but I believe 
it's on purpose.

There may be support for larger sectors in future dm-crypt. If it 
happens, older cryptsetup would refuse to unlock the device. Worse, it 
would refuse to produce even luksDump and print out information about 
the LUKS2 device.

Since dm-crypt contructor currently stops you from activating such 
device (w/ sector_size > 4096), it's ok. Metadata corruption (accidental 
overwrite, bitrot corruption) is detected on crypt_load due to 
checksums. Only deliberate change is possible and LUKS2 metadata does 
not protect against harmful changes. For example changing the value from 
512 to 4096 bytes would make the device unusable as well.

With regards
O.

