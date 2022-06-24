Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FEB7C
	for <cryptsetup@lists.linux.dev>; Fri, 24 Jun 2022 09:14:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id r81-20020a1c4454000000b003a0297a61ddso1504963wma.2
        for <cryptsetup@lists.linux.dev>; Fri, 24 Jun 2022 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9D6tQpu8etLc0MJWxn/QaT4d/Ym/T05I4+GPQ1CvY04=;
        b=phwQX1sLYRU7N2UQx2UkMvkzCK1Wb4QNe5EeF91WCzJ00SJz4XHNxJnzqmEDPAjLTX
         uREhpNEamX0n5s4K+cqy3wr8yGTVxGz8ZbAoMuCwhbbXwaT0t/1f8bTGO1s7RG6Vl7fb
         8ikABiQaD+lea7Yeu75xsUWUh4kF4tWX+0dNJR6SnSfVhEwpYM4OAXtTciJCGhnqGjGq
         leKOGjC4rmxj6FOr18AiHVPc7mKgVije7DLvKg/nqDtfpvylpdBaWfumEJBAEtk4UlHI
         B1cWjUM5kQWdLEnLW0PrEqt2g2MJYxFhU1LfAUYAL9TxmJWKPy4X7RNhu1ZncEG1Qf70
         LrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9D6tQpu8etLc0MJWxn/QaT4d/Ym/T05I4+GPQ1CvY04=;
        b=eXH8FMkEtpR0xeL4dTUcnHQUvGrQTAjggHSrVIu08eGvBnxjVNSAuM17mZefdGwWz0
         tK9TcfQsnRDdQ3Q8x8RuAmNq7o0VBNLSOGEPriqDm4DFWnaoj4qsPGX8FfJO710+gu7f
         9IsmP195STH8fccJVOYczOsVdArp7EEV6Xz7FoXsU/Yruy7aDXJqA0Pno0+abN7oNg1i
         JD59zz3WUkKF6FExM1vBJQwkUy/c4kvr5d+jL3lrAbDLGMZ36oSUpxnJ4g+FreVHo3Ut
         ohD5d+Oiu0qedYFwdberU6ChnN8TZvig8Y2zegHXX7OsmJpNYOtkRRBLpLPTz1ifoshA
         1QKw==
X-Gm-Message-State: AJIora/JA5hD3pUiecommKcIwfnZRDaG976rUkniomj5af+M30YGgqKq
	WVb8usHwXj3xJeXUl8UvyaE=
X-Google-Smtp-Source: AGRyM1uehey+OXN5Ac/tWzKehH/nc3qJlTUYBLLi44s0x8RfDJoi2FHs6/PQEiKjCIIzmSCWoFwV3g==
X-Received: by 2002:a1c:c909:0:b0:3a0:1725:619d with SMTP id f9-20020a1cc909000000b003a01725619dmr2528412wmb.19.1656062079072;
        Fri, 24 Jun 2022 02:14:39 -0700 (PDT)
Received: from [192.168.2.27] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c358d00b003942a244f47sm6777328wmq.32.2022.06.24.02.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 02:14:38 -0700 (PDT)
Message-ID: <846e6b9a-0c2a-3d18-f9bd-99a0052471cb@gmail.com>
Date: Fri, 24 Jun 2022 11:14:37 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: How to estimate the upper bound of the peak memory consumption of
 cryptsetup itself?
Content-Language: en-US
To: Coiby Xu <coxu@redhat.com>
Cc: cryptsetup@lists.linux.dev
References: <20220616044339.376qlipk5h2omhx2@Rk>
 <11d06783-c697-db7d-ed09-237d389aa07d@gmail.com>
 <20220620001924.aymrih4ilzglgxpi@Rk>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <20220620001924.aymrih4ilzglgxpi@Rk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/06/2022 02:19, Coiby Xu wrote:
> On Sat, Jun 18, 2022 at 05:12:56PM +0200, Milan Broz wrote:
>> On 16/06/2022 06:43, Coiby Xu wrote:
>>> Hi,
>>>
>>> Recently, I notice cryptsetup itself consumes significant amount of
>>> memory (~256M) when estimating the memory requirement for dumping vmcore
>>> to a LUKS-encrypted disk,
>>>
>>> $ time -v cryptsetup luksOpen encrypted.img volume --key-file mykey.keyfile | grep "Maximum resident set size"
>>>           Maximum resident set size (kbytes): 1309828
>>> $ cryptsetup luksDump encrypted.img
>>> ...
>>> Keyslots:
>>>     0: luks2
>>>           PBKDF:      argon2id
>>>           Memory:     1048576
>>>           ...
>>>
>>>
>>> So is there a way to estimate the upper bound of the peak memory
>>> consumption of cryptsetup itself without running cryptsetup?
>>
>> As you already found, the major memory consumption is by memory-hard KDF.
>> But this memory is used only while calculating keyslot encryption key,
>> it is released immediately after the Argon call is finished.
>> I do not think we have better estimation here.
> 
> Thanks for the reply! Sorry I meant the way to estimate the overhead of
> crypsetup itself i.e. ~256M in the above example. Previously I only take
> the memory consumption by memory-hard KDF into consideration and
> neglected the memory consumption of cryptsetup itself. This obviously
> leads to an underestimation of the memory requirement of cryptsetup. I
> need to overestimate the memory requirement a bit to make sure OOM won't
> happen that's why I am asking if there is a way to estimate the
> upper bound of memory requirement of cryptsetup itself.

There is no generic way to get a number - it depends on configuration
of the distro, libc, translations, everything that is locked including
shared libraries.

If it is about RHEL, you can perhaps know exact configuration - please
ask people in Red Hat.

>> (Another story is locking all memory, including big areas used by libc,
>> but that should not be problem here, I hope.)
> 
> Do you mean locking all memory first in order to know the memory
> requirement?

We use (mlockall(MCL_CURRENT | MCL_FUTURE) so it locks all used memory
+ all future allocated memory.

Today, it is not the best option and we will probably lock only specific
region with stored keys in the future.

Milan
