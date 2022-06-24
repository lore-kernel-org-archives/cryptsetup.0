Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA9023CA
	for <cryptsetup@lists.linux.dev>; Fri, 24 Jun 2022 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656067811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V10Vhk8f6gN2xZMNfI4fUJlvedCnw03c6s+sKU+hsuk=;
	b=Fhv4dyjG+Sfml50d7+sADKiDHPKiQ8KRp5hlaSiO8Xhhnf9KgvTfEFuGLwiawpCf5DdCt3
	kC4NV3vhayPoMJ0EcouL/WKq3I70erAH0pKW47bwDqEW79q/C11QAAP+d49gOR59DIYoWw
	/BJXsKfqQm/i/EGlJk1xqoL0BmA9Bpw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-ghmpITAOMieznyKYJyIvYQ-1; Fri, 24 Jun 2022 06:50:10 -0400
X-MC-Unique: ghmpITAOMieznyKYJyIvYQ-1
Received: by mail-pg1-f197.google.com with SMTP id o22-20020a637316000000b0040d238478aeso937982pgc.2
        for <cryptsetup@lists.linux.dev>; Fri, 24 Jun 2022 03:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V10Vhk8f6gN2xZMNfI4fUJlvedCnw03c6s+sKU+hsuk=;
        b=d4iNORzpponbE+Yv9xxH2v/435xqQp/OiM61XfBixFg68J7ihmgrpCMdwn3o1PIYkW
         lV3/yGo6+Z3+t1UrtIy7iSUm38tJpaMDotszDU8CTGCuEADvIYKIwlZdkJ9ahKD4Y6wc
         iY2JZokyFxMFuYahTxgBu/S5e1S4+8Z/VWQy9PUKeKgYsC9vVRZst362fHHzX9K5+0je
         d7r8tiigm6YsUTvfRSx1l+fUxaIKbDZPCgltEI1+bU6spm5Vi9XcmE3lHRcCeNsYYhAd
         n7IswTRu6bTLh581OG8r2IecPjNBwA/RShQ1E03CgPoOew/dXja+yU2WpO3GdyUQJl5d
         arpg==
X-Gm-Message-State: AJIora+sKKaKhHrXuY229qFs/gQejxD47t6htI0mUfB52OnjvEWXIq+M
	3at/cfLpPuVo5dB2ouc1j5OFxnIPzbA4omhyP4vl3aGxqPRN/kO3YvrNboXF9fbsDBgMzkG4BlG
	cLYKsqIo0L2O60XZp2J6Vrg==
X-Received: by 2002:a05:6a00:21c8:b0:4fd:f89f:ec0e with SMTP id t8-20020a056a0021c800b004fdf89fec0emr45000771pfj.83.1656067809058;
        Fri, 24 Jun 2022 03:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1su9oKtsbaH7VTWeGbYivcFERdmda/WDHNx64C7oXYa8qgOtnVxfHfzPIRdE96wppBYQUPW8Q==
X-Received: by 2002:a05:6a00:21c8:b0:4fd:f89f:ec0e with SMTP id t8-20020a056a0021c800b004fdf89fec0emr45000750pfj.83.1656067808739;
        Fri, 24 Jun 2022 03:50:08 -0700 (PDT)
Received: from localhost ([240e:3a1:2e6:6da0:835e:518:292e:5ed7])
        by smtp.gmail.com with ESMTPSA id x2-20020a170902b40200b00168dadc7354sm1482633plr.78.2022.06.24.03.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 03:50:08 -0700 (PDT)
Date: Fri, 24 Jun 2022 18:49:37 +0800
From: Coiby Xu <coxu@redhat.com>
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Subject: Re: How to estimate the upper bound of the peak memory consumption
 of cryptsetup itself?
Message-ID: <20220624104937.uliqk5bdboqhoniv@Rk>
References: <20220616044339.376qlipk5h2omhx2@Rk>
 <11d06783-c697-db7d-ed09-237d389aa07d@gmail.com>
 <20220620001924.aymrih4ilzglgxpi@Rk>
 <846e6b9a-0c2a-3d18-f9bd-99a0052471cb@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <846e6b9a-0c2a-3d18-f9bd-99a0052471cb@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=coxu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Jun 24, 2022 at 11:14:37AM +0200, Milan Broz wrote:
>On 20/06/2022 02:19, Coiby Xu wrote:
>>On Sat, Jun 18, 2022 at 05:12:56PM +0200, Milan Broz wrote:
>>>On 16/06/2022 06:43, Coiby Xu wrote:
>>>>Hi,
>>>>
>>>>Recently, I notice cryptsetup itself consumes significant amount of
>>>>memory (~256M) when estimating the memory requirement for dumping vmcore
>>>>to a LUKS-encrypted disk,
>>>>
>>>>$ time -v cryptsetup luksOpen encrypted.img volume --key-file mykey.keyfile | grep "Maximum resident set size"
>>>>          Maximum resident set size (kbytes): 1309828
>>>>$ cryptsetup luksDump encrypted.img
>>>>...
>>>>Keyslots:
>>>>    0: luks2
>>>>          PBKDF:      argon2id
>>>>          Memory:     1048576
>>>>          ...
>>>>
>>>>
>>>>So is there a way to estimate the upper bound of the peak memory
>>>>consumption of cryptsetup itself without running cryptsetup?
>>>
>>>As you already found, the major memory consumption is by memory-hard KDF.
>>>But this memory is used only while calculating keyslot encryption key,
>>>it is released immediately after the Argon call is finished.
>>>I do not think we have better estimation here.
>>
>>Thanks for the reply! Sorry I meant the way to estimate the overhead of
>>crypsetup itself i.e. ~256M in the above example. Previously I only take
>>the memory consumption by memory-hard KDF into consideration and
>>neglected the memory consumption of cryptsetup itself. This obviously
>>leads to an underestimation of the memory requirement of cryptsetup. I
>>need to overestimate the memory requirement a bit to make sure OOM won't
>>happen that's why I am asking if there is a way to estimate the
>>upper bound of memory requirement of cryptsetup itself.
>
>There is no generic way to get a number - it depends on configuration
>of the distro, libc, translations, everything that is locked including
>shared libraries.
>
>If it is about RHEL, you can perhaps know exact configuration - please
>ask people in Red Hat.

Provided the configuration, is there an golden algorithm or a formula to
get the number? If it doesn't exist and I need to do some tests to get
an empirical number, are there any big factors I need to be aware of?

>
>>>(Another story is locking all memory, including big areas used by libc,
>>>but that should not be problem here, I hope.)
>>
>>Do you mean locking all memory first in order to know the memory
>>requirement?
>
>We use (mlockall(MCL_CURRENT | MCL_FUTURE) so it locks all used memory
>+ all future allocated memory.
>
>Today, it is not the best option and we will probably lock only specific
>region with stored keys in the future.

Thanks for the explanation! 

>
>Milan
>

-- 
Best regards,
Coiby

