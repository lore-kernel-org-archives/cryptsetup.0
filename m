Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504181;
	b=MoWlBPC0V8kZpMenZhtbRiPIpPg5m4rsWK9F17C0L8DxeTVPhn04/wiMI2DeVqRTyLAE
	 xQv7RzkjY81ndl9FxxRzH1j4I4PsF/ristqyTfu3/Oo2aRSKeYU2f5TOPsHjgoZ09Eauu
	 +EXD8OuP10m+dLqi5TYjMagOPHwS9bVo1858lmn0OuvOgF6jnH5U9xPuZZY4Y6Ko9ukjv
	 e4jgnVuEyPj/v5K6gcWN31EhWjdL4EU4NRkT3zUNDKbMpg6QRC2gyKKToGxKBrEmWeneQ
	 bIukQhxa8wTKvVrtlMsXjCWvnE6EPFUoS9fCv/M/9ANVDMX+8n2wgjg3Eo/WPt4X9Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504181;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:Cc:
	 In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding;
	bh=xv/fKAGpUFbEtQE+LLYOMc2nA9IhFqgY/Vo1T9eTqbU=;
	b=MowgfQvJV0kF0I82ObtREvTqzhmoAjMGTwT9CJt4I4nYJzFF3FmLhSc4a/dIEPxt/xRh
	 MRWenPgHjBGB2+I88CmmTDSNwgcW7N5iLDlJkEPh4iQmdx6Dr5X25K1S6C/sL+ppAF/np
	 3B4Zh2SRP3YOZlVCzQ7/pZmipbkHrmvwFX0wXPMzEMdLMlaD0NXonHI16A+KbVPz7uiBx
	 LBU5UjkoFCw2ZjTNr3Pa3KVqeBni2gVJvkPqCYsEM+rfZmqj7P5FVOdjDIhLYizSNsONF
	 3CV4VGZrbvP8E25zv/FsgVN45ECX6KbFmIJX97+9XP4JhN1kW+xCgPF92E2OKyluP8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E2wSwiaz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB962606A889
	for <cryptsetup@lists.linux.dev>; Thu, 12 Nov 2026 17:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB962606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E2wSwiaz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794504179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xv/fKAGpUFbEtQE+LLYOMc2nA9IhFqgY/Vo1T9eTqbU=;
	b=E2wSwiaz7DpA5q1J1gl4xyRMXgstuoFPQplxBh5tfK9xadw6RZw3HYLEe3sYtOH/ugPnQ9
	MpYwV8aAkQq0uKjCz2iXBm1ZtGl2CayUKaDtKirMFQNaINp2kIfY/En7K1rVXnZhBq6NYG
	HHTxc1QMpYZp9cYhWjGeEVUr8+SkdoU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-ndohrmx8ObGF64xSpvyyUA-1; Thu, 12 Nov 2026 12:22:58 -0500
X-MC-Unique: ndohrmx8ObGF64xSpvyyUA-1
X-Mimecast-MFC-AGG-ID: ndohrmx8ObGF64xSpvyyUA_1794504177
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so4425134f8f.3
        for <cryptsetup@lists.linux.dev>; Thu, 12 Nov 2026 09:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504177; x=1795108977;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xv/fKAGpUFbEtQE+LLYOMc2nA9IhFqgY/Vo1T9eTqbU=;
        b=24U5ngMHAlE+R0cWnskVBvLZSFMcUYNRQAxisbb2I0lgQE4wAYj3EgOPCZTNmcVec2
         6m+BO6L5xv3Ba/AXlcHyzTKXqU/nIqjtBsfhDf6B5I8ah9tjAC95yO7AgPxqV+ktxp8T
         qAlDU/vFJZnK7ogv9fNjR9acppmyvW0+a/Gh7q/NEoRmtMPjAjZM78seEqdwALegQV6Y
         qUPRJSjqNdTaiCiNsRzv7e3gw2if+TIABqPF62DiUr6d7iXP4UDEbMToZ5vvWjm/YaSG
         SNZhRj4kevD/E5Jl86rOzirypN08HHUoAOWIwTEDyTwELv1qMocnxTsVZ794nowgJT6c
         ILXg==
X-Gm-Message-State: APuU4Z+15e+kWABy4sfHNT/huFpeZchhbMMuqG6pbiqgLVxLt1uI2a2f
	uXajHRnJlfaA67+eFpxRYm3/xAs/gdI6tZ2unXqSdKbqp8Mn8oX/WN2tr5+ZzpNqRGGLDZWMtGA
	K+8+zXyRK/A2cyQgiA95IeppA4E458DH7lkMpGPKc+8z05bUjPRXbxX2CNBM8OD60KFFIak2tAf
	V3ar+ynJVyf763TUWhr5gKNXrPJMgUpjt063jmMmHsWijK
X-Gm-Gg: AYBFou0kxmL0I7niNw8Htk67SkZbKeeaMhAOJc/bzGDjWj8H0ynV4xRTyVj/Suvi8pc
	fjj4DYT94nvFNUTuyrrUQj7GrQscuv1B4Dvv3MyWF9jEz9EFQ0SRbV2a62QFkUsPyl79hwJiVs9
	lCsIDc3W2b94pMxzgJu5kxOF73GH9ZWuLphFW5nnm3qldDLI3NiwHWx+JEgPJm//M/xhaVl7di9
	34kh+nGMxor1o73I65T8/WGX1tgGPhBOpU0Gy0Kyrflaw3S02v34aeqWJJ1IBdPksFR/TBzipxp
	FRgy9OC2kHJ+xc+LjdOuIWhHAJy7iP3w32wce2vQdpYEKVJ7rYfc9VZZ/zhXxKWi3l9nKC9vTMP
	72EeKHU13HR8Vm7zfM9DP7FHDIQFR0mKBTIJeS939RzFnz808L4lq+WVAx4ncFXD28ILKZ8Vxrv
	Y=
X-Received: by 2002:a05:600c:3e0b:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4ba09383e7cmr113605255e9.24.1794504176873;
        Thu, 12 Nov 2026 09:22:56 -0800 (PST)
X-Received: by 2002:a05:600c:3e0b:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4ba09383e7cmr113604825e9.24.1794504176386;
        Thu, 12 Nov 2026 09:22:56 -0800 (PST)
Received: from [192.168.50.107] (85-193-33-201.rib.o2.cz. [85.193.33.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e423dfsm136902325e9.1.2026.11.12.09.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:22:53 -0800 (PST)
Message-ID: <e9143d96-db6f-46dd-8804-10254d859864@redhat.com>
Date: Thu, 12 Nov 2026 18:22:52 +0100
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Post: <mailto:cryptsetup@lists.linux.dev>
List-Help: <mailto:cryptsetup+help@lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
List-Owner: <mailto:cryptsetup+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Rotating OPAL range key
To: cryptsetup@lists.linux.dev
References: <CAB9Cg3=1UKw0KHYDh42P69wPDm1DABfLNDsftjdTJp6s6YvE2A@mail.gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Cc: xeyrion@gmail.com
In-Reply-To: <CAB9Cg3=1UKw0KHYDh42P69wPDm1DABfLNDsftjdTJp6s6YvE2A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tgyT0vk8bXwU6Q4fHlwm4OhHPS5hRoZyh9sNEh5t8OI_1794504177
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 18:02, xeyrion@gmail.com wrote:
> Hello,
> 
> If my LUKS key gets compromised and I am using '--hw-opal-only', what
> is the procedure to do proper key rotation?

> 
> I can rotate LUKS key using 'luksChangeKey', but as far as I can tell,
> that will keep the OPAL range key unchanged. And since nothing is ever
> reliably deleted on flash drives, OPAL key is still available with the
> compromised LUKS key, making the rotation moot.
> 
> Since OPAL range key can be trivially rotated using eg sed-util, is
> this just a missing feature in cryptsetup, or is there any technical
> reason why this cannot/should not be done? If it's a missing feature,
> are there any manual workarounds possible? Can a new OPAL key somehow
> be "injected" into LUKS key slot?
> 
> Thanks in advance.

There is planned support for User authority PIN rotation, via 
https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/976

It will be mostly beneficial for OPAL2 devices with SUM support, but it 
can be used also with regular OPAL2 devices.

What sed-util command did you mean exactly?

With regards
O.

