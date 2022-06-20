Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2877B
	for <cryptsetup@lists.linux.dev>; Mon, 20 Jun 2022 00:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655684417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wVvp/aGvHwio1Andkru3+PUzG7BcGlTyJGz32ev8YdI=;
	b=VPoHzlLUZzXCMYzfbQzUKLEF8MlSq3QNZWrHK1P/QZ4a0Kz+xtF17xg8tMxkpRSGw3WfVA
	kY5wwCsAN0ihX0tgC1ReYjaWDWrjtvFAJkKuew1M45UrdlAwsZkInFvlC3QucDEc01SrM6
	3FrkHnPtl0v3kc7fuL31w6icmeYwUO0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-NACNlXiUOh2OXAIZn-JPAw-1; Sun, 19 Jun 2022 20:20:15 -0400
X-MC-Unique: NACNlXiUOh2OXAIZn-JPAw-1
Received: by mail-pl1-f200.google.com with SMTP id l5-20020a170902f68500b00167654aeba1so5971417plg.2
        for <cryptsetup@lists.linux.dev>; Sun, 19 Jun 2022 17:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wVvp/aGvHwio1Andkru3+PUzG7BcGlTyJGz32ev8YdI=;
        b=kgjVPDLhBE2mmh+w94NaueehsMu5YgxE44YkgEc/xbQ1/4ziHff568xYe7oPFTRbOf
         Vufjm+0kki59bfWF7RC7OZXqjiN0yh/dTDAEXiFiseBBxNCo5Zm1MXrIG/F1TNu6/fXS
         94Rrh6BcobCE6lx7I8gKA/LRPTmIsqsmVCT+F1OXB0sSL5WJeBD69/0Zw7MWT8ErE46Z
         ZMiTBJYyE4zaI1UOjo0V8dxUnrzYVSZNmU6GWGWpmwyvYJGg9df4iE1azrmPN0EVddET
         PHuT/7LO8NpQMd6tZ4+i/blPC5S8NA8t8Shi5pTP1MG17nLmDIyXWltb/Nk43VnWmOOq
         wNRA==
X-Gm-Message-State: AJIora8XKbt6fLVGI7ZrZnVhsoduZFH8W6DSC/vnochxGfsCvyHfJtet
	u99roWtS13n7dL8OVOFwqA68BYTJZD6fsx2e5L1YPVqWLVAVrIfGwE0+LJtX3ijfLrv4YPxo0cl
	tn1W34iqZ/mrpkXCnyV/b0w==
X-Received: by 2002:a05:6a00:e0e:b0:522:990c:ab60 with SMTP id bq14-20020a056a000e0e00b00522990cab60mr22045248pfb.8.1655684414604;
        Sun, 19 Jun 2022 17:20:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uvomSdDrZngJM9yKyoXgq5ru5As08dDayiwAZyzPaAsr26pMxJUH2h/EkplYDa45S6VZTTHA==
X-Received: by 2002:a05:6a00:e0e:b0:522:990c:ab60 with SMTP id bq14-20020a056a000e0e00b00522990cab60mr22045229pfb.8.1655684414262;
        Sun, 19 Jun 2022 17:20:14 -0700 (PDT)
Received: from localhost ([240e:3a1:2e6:6da0:835e:518:292e:5ed7])
        by smtp.gmail.com with ESMTPSA id x14-20020a62fb0e000000b0051bb1785286sm7496102pfm.167.2022.06.19.17.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 17:20:13 -0700 (PDT)
Date: Mon, 20 Jun 2022 08:19:24 +0800
From: Coiby Xu <coxu@redhat.com>
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Subject: Re: How to estimate the upper bound of the peak memory consumption
 of cryptsetup itself?
Message-ID: <20220620001924.aymrih4ilzglgxpi@Rk>
References: <20220616044339.376qlipk5h2omhx2@Rk>
 <11d06783-c697-db7d-ed09-237d389aa07d@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <11d06783-c697-db7d-ed09-237d389aa07d@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=coxu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sat, Jun 18, 2022 at 05:12:56PM +0200, Milan Broz wrote:
>On 16/06/2022 06:43, Coiby Xu wrote:
>>Hi,
>>
>>Recently, I notice cryptsetup itself consumes significant amount of
>>memory (~256M) when estimating the memory requirement for dumping vmcore
>>to a LUKS-encrypted disk,
>>
>>$ time -v cryptsetup luksOpen encrypted.img volume --key-file mykey.keyfile | grep "Maximum resident set size"
>>          Maximum resident set size (kbytes): 1309828
>>$ cryptsetup luksDump encrypted.img
>>...
>>Keyslots:
>>    0: luks2
>>          PBKDF:      argon2id
>>          Memory:     1048576
>>          ...
>>
>>
>>So is there a way to estimate the upper bound of the peak memory
>>consumption of cryptsetup itself without running cryptsetup?
>
>As you already found, the major memory consumption is by memory-hard KDF.
>But this memory is used only while calculating keyslot encryption key,
>it is released immediately after the Argon call is finished.
>I do not think we have better estimation here.

Thanks for the reply! Sorry I meant the way to estimate the overhead of
crypsetup itself i.e. ~256M in the above example. Previously I only take
the memory consumption by memory-hard KDF into consideration and
neglected the memory consumption of cryptsetup itself. This obviously
leads to an underestimation of the memory requirement of cryptsetup. I
need to overestimate the memory requirement a bit to make sure OOM won't
happen that's why I am asking if there is a way to estimate the
upper bound of memory requirement of cryptsetup itself. 

>
>(Another story is locking all memory, including big areas used by libc,
>but that should not be problem here, I hope.)

Do you mean locking all memory first in order to know the memory
requirement?

>
>Milan
>

-- 
Best regards,
Coiby

