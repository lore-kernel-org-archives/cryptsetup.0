Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890A02581
	for <cryptsetup@lists.linux.dev>; Fri, 24 Jun 2022 12:23:00 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id k22so2903801wrd.6
        for <cryptsetup@lists.linux.dev>; Fri, 24 Jun 2022 05:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fhfvN0yDyQ0q/e0peDZvbnZOmg4woJ4OZY7Un00hKvA=;
        b=c4MGl+2s4uBvigZr1O7Qv6pmCr9t14mLC+TfpJtI80ityLTnepe/3Wmdg9bUtWSGA2
         qec4+xCcFkm0WxiFy4hQEAiGD3pWzFLIzpq8E1+YRoOIT1Ya1AV9MoEw37kiulFpHsky
         wmzq1zhTJne3g8Uc/PNtN4BlSkbonIv/H3I3woVis17dltxALUFdlrr7ZlQ9P6+zLNRI
         9CElWJq0JHCfcvlZLQrgXUnJApuAtRQ6B2/2mjNYw/5pg/FOvgHu6mMFVxCnJetAfRe8
         Z5Lcprru0S+oYLvSx9Hj6EqzAZsgkGByxt04BoDmiOMThFA149l8377Bdxtx67BLQogQ
         yoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fhfvN0yDyQ0q/e0peDZvbnZOmg4woJ4OZY7Un00hKvA=;
        b=SX4fK7IqztVgjM2NoaH347xLj9hGogkloEavVbEPrpJ1WYtMY8ElqKfNBvnK6uVEvH
         guqqITCfcTdd1G6o95RrJapE8q/JOKMz+FJT1Du27SN8WnDsTgBZ9RmUMZI5p7k6FhLV
         aeMcU6ffDteizw/yKJ6mmGjAIsyFyGNSKu1LcivG4/DbNutH7NpanceP1r5oq0UiG4/l
         I1RMa3n3Lwo1mieJAZ8sr93mXFjGhXXqakqQUcCg6X43GLNmrsNkUuiyzgiOVh7xnq5d
         ybOHIrlzeuJUMC1ZdrHC3ljdnzyG2JXGm0aQDpJfDRJH1wZOICd6JUDuTWIkgQEeZ4B/
         BbBw==
X-Gm-Message-State: AJIora/aFrI0uJPGIiyi5tR9IL5m8194OSbWS8COfjqF9vTzjz5Q+N3W
	6dQo3HZx0jdLrzQKVNHtgoM=
X-Google-Smtp-Source: AGRyM1uLoqlrHpfy4HYhRNh/tzgM4Ia/vNgmqV4/fKehtPF1CV9hzo3tq3BQNcn8FQAXi+oFJfC4/A==
X-Received: by 2002:a05:6000:1147:b0:21b:93db:701a with SMTP id d7-20020a056000114700b0021b93db701amr13009541wrx.447.1656073378675;
        Fri, 24 Jun 2022 05:22:58 -0700 (PDT)
Received: from [192.168.2.27] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id e10-20020adfa44a000000b0021b903a018bsm2155099wra.92.2022.06.24.05.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 05:22:58 -0700 (PDT)
Message-ID: <355ad599-f036-2e5a-ba55-53e8a8f9845c@gmail.com>
Date: Fri, 24 Jun 2022 14:22:57 +0200
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
 <846e6b9a-0c2a-3d18-f9bd-99a0052471cb@gmail.com>
 <20220624104937.uliqk5bdboqhoniv@Rk>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <20220624104937.uliqk5bdboqhoniv@Rk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2022 12:49, Coiby Xu wrote:
>>> Thanks for the reply! Sorry I meant the way to estimate the overhead of
>>> crypsetup itself i.e. ~256M in the above example. Previously I only take
>>> the memory consumption by memory-hard KDF into consideration and
>>> neglected the memory consumption of cryptsetup itself. This obviously
>>> leads to an underestimation of the memory requirement of cryptsetup. I
>>> need to overestimate the memory requirement a bit to make sure OOM won't
>>> happen that's why I am asking if there is a way to estimate the
>>> upper bound of memory requirement of cryptsetup itself.
>>
>> There is no generic way to get a number - it depends on configuration
>> of the distro, libc, translations, everything that is locked including
>> shared libraries.
>>
>> If it is about RHEL, you can perhaps know exact configuration - please
>> ask people in Red Hat.
> 
> Provided the configuration, is there an golden algorithm or a formula to
> get the number? If it doesn't exist and I need to do some tests to get
> an empirical number, are there any big factors I need to be aware of?

Think about current locales, OpenSSL policy and many other things.
(The major I remember was locking all libc loaded translations in memory.)

So really, the only answer here would be ... 42 :)

You can try to measure it. Not sure if it is reliable.

Usually people want to know this for some weird scenarios like kdump
or so - this is definitely not something upstream can help with.

Milan
