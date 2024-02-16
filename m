Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A661BDD5
	for <cryptsetup@lists.linux.dev>; Fri, 16 Feb 2024 08:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708071894; cv=none; b=Ww87GPsSDJwacU1KDy7tnK18WYFChkLuhpGgwH+8lfMg8hC3tS3EOHsWDlQ1dY7le4Bqs4rvr2ytYrBGdyedJ/sePIvVBgurvcqzVcTCrzzUzyMAWOKgGOfAAqJXwKnvwU8/ShNW3IwjpxzsAZR0NDn+R7GSdu177VoEmpGrTmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708071894; c=relaxed/simple;
	bh=b6CTOYkhADx0gXGb2b1jVPsWdn/hhcwuCi23C2ZJoIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=I7HkDRjPnbJvftFS0ZJfVeu//YZ753JKrW7Eg8FYySaSeU/3c1toOf4+rC+j7Ue/7dU/zRGxdCYVzrXnt/sGmSpqtKZf4g4O9ASWfhC1kdajxix4uB3fhXVr7uVNCdVWLPAzBrqEqw3jubjw8VWdkpjzNFZUktFp3l68/9hiRH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LbH1eYcj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LbH1eYcj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708071891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=p0iSprQ6NnrlExJ7T4ivEXF2xoXeRkA4Z1/bBFYIJ6Q=;
	b=LbH1eYcjodKxe4fCeWq6B8lQlOb49WOXXAGJlgpIuCG4B4lR01MKkqSPPNfkvuHpaY8E/v
	dlRkfjJYyJK623uMdfjA21FAzzBHfSwtqXhBAl83vzSDJn0aS8J/oVEVWqckzYZB8znM+H
	gAZa7VolNEiGygg0JKQjp3DZxjXmL/4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-aDg0WH34NGa_IdmrYK1IBw-1; Fri, 16 Feb 2024 03:24:48 -0500
X-MC-Unique: aDg0WH34NGa_IdmrYK1IBw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40fb486573fso2593625e9.1
        for <cryptsetup@lists.linux.dev>; Fri, 16 Feb 2024 00:24:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708071886; x=1708676686;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0iSprQ6NnrlExJ7T4ivEXF2xoXeRkA4Z1/bBFYIJ6Q=;
        b=IeImo6l4DE1LgIhmiZ/zTfxtSmwPu+4P3MaGy0SpxRmDs7cZ+Zm4Ohd36s+zdGbF4T
         URlz2SVMmOp8LZtYPTkljN/d57yoUWJxHFPTnmUC4rDyeL9Xdk08Esqvj2qS75eft7gY
         cL+nlsFWleO/g7Eej3naB5eVLGS3U3f1v9LY/SBKEYYsS3iu4/safIodKNC3lDLPIGEX
         Rjl5AKcllBBjjYh4rkz7/rw5HAqR+klBDKkSnRL0l/AnfM7yR5hMMFr5J1dvWlN0iVhN
         e+nUoinP/Hr4OnmFjNbpnBQZ/u0/Ya6D2BXl+ynw4pG+RHdwpDwPa6FUuetXkz8udbTo
         aDKQ==
X-Gm-Message-State: AOJu0Yw3971PYb1sH+MrLvswX8vRLIBJpEwBT04BXJNd4KPQfnb0HZ/Q
	HImC8GMdJaTOrb/Jg11kXDxVK0BtBi6a9sRnyLnQ0M053HN+m7Ij/CNCEmvcq92Vnnby2qo1KuU
	lethBpJCFTKVhCKoXI1UfBHVlPqO14CXaLZssXZfJfSiBbYRqjs1aTmtACQbwB0Qm5wKJgKx3AH
	qiSgqJC0ICPIOJ2+Q7WvJJB8owP/SuJi5xpWtPQ1ai
X-Received: by 2002:a05:600c:198a:b0:412:1e23:e378 with SMTP id t10-20020a05600c198a00b004121e23e378mr2514588wmq.27.1708071886230;
        Fri, 16 Feb 2024 00:24:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqnLR4cuSkVYWo8iB5HJOr3vNmg7JaZ7aq2t6v9MvtAeMGhDU3RZttivgdRzF1XkWXgpH3DQ==
X-Received: by 2002:a05:600c:198a:b0:412:1e23:e378 with SMTP id t10-20020a05600c198a00b004121e23e378mr2514571wmq.27.1708071885802;
        Fri, 16 Feb 2024 00:24:45 -0800 (PST)
Received: from [10.43.17.57] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id z10-20020a1c4c0a000000b00410794ddfc6sm1552189wmf.35.2024.02.16.00.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 00:24:45 -0800 (PST)
Message-ID: <619f4471-5f07-40bd-8546-2794ebf41c4d@redhat.com>
Date: Fri, 16 Feb 2024 09:24:44 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wrong luks header backup file size after conversion to LUKS2
To: cryptsetup@lists.linux.dev
References: <CAActgDYkiaypy4Q7tsR5VaARMUT6L96jwCAet+KdYD=P5f_0OQ@mail.gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
Cc: "T.Gavrylko" <tea65535@gmail.com>
In-Reply-To: <CAActgDYkiaypy4Q7tsR5VaARMUT6L96jwCAet+KdYD=P5f_0OQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/02/2024 21:20, T.Gavrylko wrote:
> Hi,
> Recently I successfully converted LUKS1 partition to LUKS2 and created
> a header backup after the conversion.
> LUKS1 root partition was created by opensuze tumbleweed installer
> The length of this header backup file is wrong: 2097152 bytes what is
> corresponding to the LUKS1 header size.

AFAICT the header size seems correct to me. There's no definitive 
correct header size and The LUKS2 header size may be up to 256 MiBs size 
depending the luksFormat parameters.

Your original data offset was probably at (LUKS1 default value) sector 
4096 (2097152 bytes, see the luksDump output). After the conversion the 
data offset remained the same since we do not move encrypted data in 
convert command. The LUKS2 header after the conversion cannot be larger 
that 2097152 bytes since it would otherwise overwrite your data beyond 
data offset.

With regards
O.

> (...)
> 
> luksDump:
> 
> sudo cryptsetup luksDump /dev/nvme0n1p9
> LUKS header information
> Version:        2
> Epoch:          8
> Metadata area: 16384 [bytes]
> Keyslots area: 2064384 [bytes]
> UUID:          3d6055ea-4ab5-4dd0-8f3b-93f51dcc6ddd
> Label:          1n1p9-OS-R
> Subsystem:      (no subsystem)
> Flags:        (no flags)
> 
> Data segments:
>    0: crypt
> offset: 2097152 [bytes]

see       ^^^^^^^^

> length: (whole device)
> cipher: aes-xts-plain64
> sector: 512 [bytes]
> 
(...)

