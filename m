Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A6E8F73
	for <cryptsetup@lists.linux.dev>; Fri, 23 Jun 2023 14:17:27 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51a2de3385fso778840a12.0
        for <cryptsetup@lists.linux.dev>; Fri, 23 Jun 2023 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687529846; x=1690121846;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Feaqos22T0ceze+OTZPYJZYxpGNCMZA2Oipto5cspkM=;
        b=cXSVntejLS1hMExxTMTdogLbpF57mda2oZHw+4GscPonE+hIqYqKMDyQ+6rusIq85E
         cZD73wkikjIC/W/mcgYs65vr+b055alSo8gmjr2ppzqmUEOCW4QgNV+DcZIB5tXsS6VO
         DWLVP0rd3X59iOqrau3sHf6q0LXUl/p3A6JT2QLC4VK5OWAFG5FW3yzvd6Ug6oJ48M2H
         2vx3dz8jhhJycKNOm6cfUTOdNtRQMT7vwhguGnLkycmkn6p7kenVxLbL7tduj8CYL4NM
         x7J3rpga1nsUSX3w7zTmALlXfaD4yRU8zyi9Zsf3apLizjdjl1cTeOyxOsLbbeK41Z/l
         Jrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687529846; x=1690121846;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Feaqos22T0ceze+OTZPYJZYxpGNCMZA2Oipto5cspkM=;
        b=XlBhXkCZXbSh1+tu9k1wDebiNHYKVRZtAdVg4/ENbEkwVuqakmfskjEBD5OA4oQMM+
         T8v6tP+itW7GVducOEdFMwxazr9F9Qc53Ka/S+RcJminxk6bSooLR6iyLhKISg/zWit/
         B13qFsRmx1OBfrrZ0X0dei4hdR9Ny1NmZc7fZ6MF/LVfkjzGWtyThwuVVw0OFYf6EB6+
         JPQ8Z8NO3UNzdhKT3TPFeLKa6EoIAH4LabN7zt+X5fm1fJsCysp4nbWGtP7eaRfsECCs
         R0AqzjlCh++cCAFGgaLC36pfKjUXoWYt3XS4BJxruvle3B4N+jnRiW857N31/8wo70B+
         BvgA==
X-Gm-Message-State: AC+VfDxTd5y+CC+K+SM91HyyQLGGAK92vSFyWyBxIF4yzT9HJEIOB7Dp
	s4l79AVpzp+JTBUwUIZTWQQ=
X-Google-Smtp-Source: ACHHUZ6TWmaR2qXAb114tNRo95zHhNejCdKx5uW1awffznxFaNFfOkfbg/QfQZFUhtxQmRIe0rHfZg==
X-Received: by 2002:aa7:d292:0:b0:51b:dfce:1a49 with SMTP id w18-20020aa7d292000000b0051bdfce1a49mr5171613edq.37.1687529845864;
        Fri, 23 Jun 2023 07:17:25 -0700 (PDT)
Received: from [192.168.8.101] (37-48-41-218.nat.epc.tmcz.cz. [37.48.41.218])
        by smtp.gmail.com with ESMTPSA id d17-20020a056402001100b0051bf998b25fsm655635edu.44.2023.06.23.07.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 07:17:25 -0700 (PDT)
Message-ID: <9423d3f4-10d5-968b-c62a-f424515bec2d@gmail.com>
Date: Fri, 23 Jun 2023 16:17:24 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: Bypass kdf step with LUKS2
Content-Language: en-US
To: Rishi Dhupar <rishid@gmail.com>, cryptsetup@lists.linux.dev
References: <CAJbs9BHP=bu37WAEM_ztReiFUP+rNUVLnPWBdNOmRzjW8Kb_OA@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CAJbs9BHP=bu37WAEM_ztReiFUP+rNUVLnPWBdNOmRzjW8Kb_OA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/23 16:01, Rishi Dhupar wrote:
> Hi,
> 
> I have an unusual request. Is there any way to skip the PBKDF2 step
> when a device is being formatted with LUKS2 or an additional slot is
> being added?

No, you cannot skip PBKDF, this is by design.

But you can set KDF to PBKDF2 with minimal iteration count (1000),
this will be very fast.

Something like: --pbkdf pbkdf2 --pbkdf-force-iterations 1000
(this should also skip KDF benchmarking)

Milan

> 
> Here's why I'm asking: I am using a high entropy 256-bit key as my
> keyfile and the KDF step is unnecessary and does not improve my
> security profile. If I am managing thousands of devices and want to
> rotate the passphrases on them, this KDF step is becoming the major
> bottleneck in performance.
> 
> Thanks
> 
