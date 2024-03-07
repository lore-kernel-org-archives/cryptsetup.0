Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F56F129A7A
	for <cryptsetup@lists.linux.dev>; Thu,  7 Mar 2024 12:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709813678; cv=none; b=uJsMVhJ67GjPEUXlbgbE/ED2Ijyz0oECT9+kP1eLfEm+jSAtrIpzw/2XKg77JEiDt1LSWLEfEuDorqr9OBkpHeexQkec8y4CLKx5/NxCu6lYVgeblfcYvyRQw2duqEPlncHfgT1RR7SxjO/0ryNRtg8ft/xg7Is5cJKPqKtayTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709813678; c=relaxed/simple;
	bh=DLb5GW0VXfXcKtaJJtHpJ+NFcadFelpg4MmX6tG6PM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=RRAx9PtIgQewUDf0+nV0lUJWMFlD19f4EgPeqINy1Q0neAMC4MON8vLFu2K9nrhCjJcJIxMdkK2+N6svSRG/KVrK2YpqedLsq4bjFYpdvdd7j1fdFRyBmM4ZqR1eW1H5I0pkTIXQKLhp6LmheLsKq1yt5Q2X+J13T3qhVp+kyXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QvmGR+VC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QvmGR+VC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709813676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cMI3SwAr3xt5Dd3NN4ohSQhB0xLQ5rKkbTus6gWwRkw=;
	b=QvmGR+VCskrYYBDoLzmNiI89DO4kJ9LYso2HntQrAn8eOcDlm0dKGvQ6AD7CNZuA+Op4EF
	8n7rCMKA6YJFvl39GOZof3PXisNLv1Zk9XojC4VlbVzLzqP6qtz1mz9Oc3ru1yjlgF3WMr
	wfkCIXZI1gTcGMdbPX665FbBs3BKA+s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-9Gt_rFZdP4WwhCunbQ36Cg-1; Thu, 07 Mar 2024 07:14:35 -0500
X-MC-Unique: 9Gt_rFZdP4WwhCunbQ36Cg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33e6d36db5dso150251f8f.2
        for <cryptsetup@lists.linux.dev>; Thu, 07 Mar 2024 04:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709813673; x=1710418473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cMI3SwAr3xt5Dd3NN4ohSQhB0xLQ5rKkbTus6gWwRkw=;
        b=s87bxOXdf21Dg2ie5N/jcC90IjvTDTC9XsHiCBon0s+PzfXBcaJE4NZXwurU+mXMA9
         +NADo3bsSB3oVzPSAvwKAQ2A1TagM3K6GYJQrgH617yu+6HJEUmQeTTQc2tF7RCVqt7v
         vLuL/ugpD8XI0kDRm63oj44ZijNejAN8Cn5+GCl+1a2MlBdSvpaRAh/kXjT2ezvJoLo1
         CGoVbZZ2oxq/4sDGySrapL8caRS01Q88P7aXJNyb6NH1QZHRLjhnwsflROfGZk2JzoEF
         iU2oAzd+Cx7P4YzPvjsH7HNkxpgP3z4Al8q8TE3dnNxp5VlTYZHprMbYatRf4pwwyWg4
         0diw==
X-Gm-Message-State: AOJu0YzsSu5Gjgv1zX1MboKAKmjTiL7O3oVQGMTjz0u2dFiAm1aUEjYQ
	xRxmagF0fgXtVyqYP+FvSGlc5OmlVK5wbX3CgI9cJ38mPWn32x2q26fTZDqxjhIdaeAidysLU7N
	ZYOaCGQV+eEWOCsOgCEP24rWytZhydwkh13oKv3J5JK/Zl5/aVTYDr47tgPfAj5xyTfulBYGSuj
	HKpQNJ5Ok8E270gWdng0DsiP6rghLLnJ1/+NuBb6+O
X-Received: by 2002:a05:6000:3c5:b0:33e:4590:8bd8 with SMTP id b5-20020a05600003c500b0033e45908bd8mr10592677wrg.60.1709813672925;
        Thu, 07 Mar 2024 04:14:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVHmNdAwLJ+L4j50ZnM5i1zER9CYOdCqQNuXKr5JCZbn8KUIJ28D77aa4fWJkF2g0vHypw+w==
X-Received: by 2002:a05:6000:3c5:b0:33e:4590:8bd8 with SMTP id b5-20020a05600003c500b0033e45908bd8mr10592653wrg.60.1709813672507;
        Thu, 07 Mar 2024 04:14:32 -0800 (PST)
Received: from [10.43.17.51] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id e18-20020adfef12000000b0033cf5094fcesm20094991wro.36.2024.03.07.04.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 04:14:31 -0800 (PST)
Message-ID: <dce9e0d8-dbfa-4b1a-ab61-33b6c7bc770a@redhat.com>
Date: Thu, 7 Mar 2024 13:14:31 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to resume decryption on LUKS1 in-place
To: cryptsetup <cryptsetup@lists.linux.dev>
References: <cd29a952-c9ce-4aa0-8903-a79c325824f0@gmx.co.uk>
 <764b4743-a61f-4e95-af07-d53c1e842e64@redhat.com>
 <3e4d1b13-7935-40b6-883a-68b2ef16545d@gmx.co.uk>
 <80c0a6a8-b710-4483-8e57-56e1951fa213@redhat.com>
 <76ca5ef4-5298-4c03-bdc1-8b1ce012c7b4@gmx.co.uk>
 <6caca783-5a30-434c-b9f1-234a1bff9310@redhat.com>
 <08281b96-b6c3-433e-83ae-3b6b382714ce@gmx.co.uk>
Cc: xndr <xanda@gmx.co.uk>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
In-Reply-To: <08281b96-b6c3-433e-83ae-3b6b382714ce@gmx.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2024 17:34, xndr wrote:
> 
>> In general? No I don't recommend to downgrade to 2.4.3 for normal
>> operation. It's just currently the best option to workaround the bug
>> introduced in 2.5.0 regarding resuming LUKS1 decryption operation.
>
> Apologies - my bad; this is really what we meant.
No problem, the issue is already fixed upstream[1]. Will be released 
within cryptsetup 2.7.1.

[1]: https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/616

Kind regards
O.

