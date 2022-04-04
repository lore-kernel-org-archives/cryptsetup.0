Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C767E7C
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649063128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkYirQq8T38RUwR25cJG/UrUp0jOVx8jeSDEIsBRXNg=;
	b=L0MPcne9eufg0f89pIvBoGIC/DRvn68xDFvvqbCPTBJls935zXTi47JOW8xOi+d2oHRwnG
	QcrevsjuJCjOmHtrLMHZPALkOwYSGW2lTUvP6KshVWmsqC8mi2p7kL2JfpuE+CUTS3756p
	O/dMIsEECiuWzUP0PYdX5tWP5MWa3VM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-lNlvhkU5Mf2RrYyO77EqJg-1; Mon, 04 Apr 2022 05:05:27 -0400
X-MC-Unique: lNlvhkU5Mf2RrYyO77EqJg-1
Received: by mail-ej1-f70.google.com with SMTP id hq25-20020a1709073f1900b006e7f39d46c3so691637ejc.4
        for <cryptsetup@lists.linux.dev>; Mon, 04 Apr 2022 02:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=YkYirQq8T38RUwR25cJG/UrUp0jOVx8jeSDEIsBRXNg=;
        b=KWz+PCh7x2FlTqkyg28BoNTR5IuzBaFmeqKWiIt7vJr3LVs4nsd4bBr5uzizsjzdep
         +FBA4DKG9SWGeigiXTdVzQKktRgYvI9HyQvC+bEDPqxvLnH6rjh+EEjpq13P8zgcC1GH
         +nKu2wBurW65M5qwe50Dq1d4iCH8HlWZv9HoWakcAC4mv7PjuBkTyk4bRuIS33L+3sJD
         WTNENUHbkoXVBkwqYrMpd7fETyviP2DD/UQ1xDhs/jp/anaPfvfFI6n3xK9W0kaT5ky1
         CKJBSSTE+M++lGpjF23RhNDo92dTcZin1m2jNJxbm2S9qZO5BVMuP1DVnjkBfI/yT+My
         qIlQ==
X-Gm-Message-State: AOAM531ofKpQYfxqblVwJtsYxV+EDPUiKIZthvd0EasQm58ekIOIO0QR
	d888jSuvYiWVz3R+77fkDRyZZZSvK4J612b8VY74vo5CeF+3Eje9TR1oxTtsWqJNPkC0fOoZ2Rx
	0D6UuHzycxyjDz7Fzz+Tg
X-Received: by 2002:aa7:c98c:0:b0:41c:bfbd:380 with SMTP id c12-20020aa7c98c000000b0041cbfbd0380mr6237876edt.313.1649063126169;
        Mon, 04 Apr 2022 02:05:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy6nRkD7EMRDzWcqKdZCzuk11yvwBDIsb9NbZdQraf97f1/112cmRaw3vK07BUe7i4shynAQ==
X-Received: by 2002:aa7:c98c:0:b0:41c:bfbd:380 with SMTP id c12-20020aa7c98c000000b0041cbfbd0380mr6237865edt.313.1649063125987;
        Mon, 04 Apr 2022 02:05:25 -0700 (PDT)
Received: from [10.43.17.42] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id gl2-20020a170906e0c200b006a767d52373sm4044756ejb.182.2022.04.04.02.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 02:05:25 -0700 (PDT)
Message-ID: <70ae3ef5-85dd-56bb-eebb-1e6f3f502534@redhat.com>
Date: Mon, 4 Apr 2022 11:05:25 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: Surmont Jasper <jasper.surmont@aalto.fi>,
 "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
References: <PR3P192MB1087367FCDE3417198711049F1E59@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
From: Ondrej Kozina <okozina@redhat.com>
Subject: Re: Lib and Src directory
In-Reply-To: <PR3P192MB1087367FCDE3417198711049F1E59@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=okozina@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04. 04. 22 10:46, Surmont Jasper wrote:
> Hey, newbie question here:
> 
> What is the interpretation between the src/ and lib/ directory?

The /lib directory contains source code for libcryptsetup library.

The /src contains sources for all cryptsetup project maintained command 
line utilities: cryptsetup, integritysetup and veritysetup.

> For example, I see files like integrity.c or verity.c etc. Are these files also files written for the cryptsetup project,
> or do these contain the same code that can be found in the linux kernel /drivers/md/dm-integrity.c for example?

Yes. It's internal libcryptsetup code. For example the integrity.c in 
lib/integrity directory contains code for managing dm-integrity kernel 
driver (DM target). The low level access to DM kernel drivers is done 
via the libdevmapper library which the libcryptsetup links with. 
Libdevmapper is maintained by lvm2 project.

Regards
O.

