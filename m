Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5F0374F7
	for <cryptsetup@lists.linux.dev>; Mon,  4 Mar 2024 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709549975; cv=none; b=eYnWDFV40T/S3efKsm+R/YFuCQO5DWzx8ZnlMevChHwY3Og6smY/538jTRsycvGU0sdUS5GupIn3Ln8Dwk77iNbhGCY3zJpHFAJE71yv4yOMd98DsCXuLd1OhsVroejh9GtdvsItWa9oOcfbOclWonoRUg5pA4BQVdFyn1k5YE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709549975; c=relaxed/simple;
	bh=g+ssZ5mVyoeHqrioRz1tyTmdTwJ9/grEFSAoJT4xWlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=EuiXzRrBXVQ5l1qZXDF+oGH7Ar6mZiIwy3EwQ3OPlypC0VuQlvjVQVhu+sIfqi28EXtQ8lVbmRjJ4mxzMhrtBQdPpJc0q3FKfdZ6oanPOd8iibfq1kCKgg5/JUKxsGmvF6pnIGkhHYznWCQJS9f88T5+NSCZIa6Ua19L38ldYyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pf/nBiFU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pf/nBiFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709549972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Zb8ld45Xj5ocMaRZ5CME5ga5GcvRsOoKkUaONVkez9I=;
	b=Pf/nBiFU1G+Zz/YAiB9qJsPqgn4iq2BZaPlYYcgRJuexoDzedc5In2MejRDlz6URNrvu01
	v4bxxmp1faX8WLXwsggSADmlnQa1SNQR8IYPCMaYIXAB5kyprtwo7M4tMHBtldP8q6a9R1
	A2x5g8EUBaXPdmhR8Ij3l/1yohShEcs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-y6dk7fobNuuKukPGyiY-sg-1; Mon, 04 Mar 2024 05:59:31 -0500
X-MC-Unique: y6dk7fobNuuKukPGyiY-sg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33d07c0825aso1429059f8f.2
        for <cryptsetup@lists.linux.dev>; Mon, 04 Mar 2024 02:59:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709549969; x=1710154769;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zb8ld45Xj5ocMaRZ5CME5ga5GcvRsOoKkUaONVkez9I=;
        b=AhxRA8NMscsyj5mevtpW7o1Nr+0d6DkCkNJnZqNxmE9WPlwtSlIGzAWBm+e5cIXiwy
         8ORve1k884PNs/1hjD7/gYh0YAh3VaFeX0r54yCudWmnHJL5WzyeKM+icBG3tpgaYFGU
         60Gx0+5TTrW9FspX8vnzfa1g/N4dDEdzmNzgdlRTe/QaxvxM6AM66TBIqUEw2QMV7Hmm
         tVyFMMqECbQp0yEknEoBnygTv7OtMagNUL67bp31cU2z/lRDyfH3NB8lo4CGpQVe5OCQ
         pPLlZ9w2pa0Ad+MwO7o0kNDjN72hKKffZRFDtGhwbnN1ON8xFW9zVeLCfy5SBlIfNLsr
         yHjg==
X-Gm-Message-State: AOJu0YxJo4g/LVP+A8DQu0V0Bnu0GIUuVLqMU2piwNSiQ04ECiDefKFB
	ed9BIXSrDSz2hZwvYJlZe/IiHU/KM/5uprp+5V6gdUGCIs5hNDnaOImFTLPbtXJaFC8/GiUtNdJ
	dELCopkOZ77x87h97kFomnRWNEbJh8cafiXlvRitaJ+EpK/80LHC1yh7e2VeFVEqCo22LP1vNfJ
	NPefBGm8RxRhIMV26Bs9fJrmkEX+dKw3gTsn/jujQD
X-Received: by 2002:adf:fecb:0:b0:33d:e6e:b5f6 with SMTP id q11-20020adffecb000000b0033d0e6eb5f6mr6064227wrs.27.1709549969555;
        Mon, 04 Mar 2024 02:59:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxJCjLT3ngfpckj9oJlQ02QI1xGMkubkPNJS9uOrI1zJl6RqhQdfE3YkupVNGy+VWjvw5CLg==
X-Received: by 2002:adf:fecb:0:b0:33d:e6e:b5f6 with SMTP id q11-20020adffecb000000b0033d0e6eb5f6mr6064215wrs.27.1709549969181;
        Mon, 04 Mar 2024 02:59:29 -0800 (PST)
Received: from [10.43.17.51] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id j12-20020adfea4c000000b0033e11bd9febsm11440502wrn.90.2024.03.04.02.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 02:59:28 -0800 (PST)
Message-ID: <80c0a6a8-b710-4483-8e57-56e1951fa213@redhat.com>
Date: Mon, 4 Mar 2024 11:59:28 +0100
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
Cc: xndr <xanda@gmx.co.uk>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
In-Reply-To: <3e4d1b13-7935-40b6-883a-68b2ef16545d@gmx.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/03/2024 14:12, xndr wrote:
> Thank you for the assist.
> 
> We've taken the advice to migrate the data to a backup and after
> reattempted using the command:-
> 
> cryptsetup reencrypt --decrypt
> --uuid=LUKS-aaecbfc4-459a-4cf9-9a34-fd4af43b8be0  /dev/sdd
> 
> This returns:-
> 
> Device /dev/sdd is not a valid LUKS device.

Ok, this is a bug (regression in fact) in cryptsetup v2.5.0 which is not 
yet fixed.

The most straightforward workaround would be to install cryptsetup 
v2.4.3 and run following command using legacy cryptsetup-reencrypt utility:

"cryptsetup-reencrypt --decrypt --uuid 
aaecbfc4-459a-4cf9-9a34-fd4af43b8be0  /dev/sdd"

(no need to add 'LUKS-' prefix in --uuid parameter).

I'll figure out a fix for it (feel free to open issue on 
https://gitlab.com/cryptsetup/cryptsetup if interested).

Thank you for the feedback!
Ondrej

