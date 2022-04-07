Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6392100
	for <cryptsetup@lists.linux.dev>; Thu,  7 Apr 2022 10:05:48 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id m30so7114214wrb.1
        for <cryptsetup@lists.linux.dev>; Thu, 07 Apr 2022 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=B+xvppHm79/LdGZOmLDCKMKiI13IS55cgfeUu9O55J8=;
        b=QfqtRxq6lOySLOwE/f8pvc8m1GBZnB05N5PsBkzN47iSdYtjcET2dqVmLPXSVgjzoc
         Wra0TUx66sZKPLc7o5NGLfy1omeOK7Y/NX2m6tKGDjRPPOSfo8q562I8t6oJXpB2Vth/
         4UAdRycDutLWOO87rVVm8DWwRIqGRSJh0I/W5A23Ne6A5Ykzr4PtBIuIxwh+rM4zjc9U
         K3zjtJ56/kjr+sF9gwSzQqYDXzwWAijbopR7ixRozXFA89pKogGVRh1rffrFCaTqQGC1
         49Bl2lD13x8+LXzNhZbzHRIF8Ntg8GgY3UhYZpn3wqvyP/qZuUybG3YHmMwh9sVaOTEi
         wSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B+xvppHm79/LdGZOmLDCKMKiI13IS55cgfeUu9O55J8=;
        b=EWc3Ih8rjDPJQXtKlF5yyZ1b4vgpTGdHai6pFvC9MeeXNci18Nn+iKYRRgjewQoTdX
         IOEc/LkRIED9UUzHQPv4cwSGHqdVQLSBPxUFCq8FjVZlDm9jlIgw3Zl859O1JuTZuE1X
         UUggfIzZj2/mFVBKpx9V4GVbY7pj4MeAos25iL47y/EqONswk1DlIqlH1LMQn/4u/NvM
         lBeW6QEfDdb2TVduIo43k/W+XdiPZ2T0M/9lqXgiOh2+r8300Uy4K2blL3f/ETyLThc1
         5OEP7CweF6infgWgSfgdJfLvMyd3wc1lFwf6mH0GYKx5ZA63oktNCwAZIB8g0xoInIJq
         zDFw==
X-Gm-Message-State: AOAM532rRDnnLHztsY1D37ctIPcwmmvixlfqpVSdSPqD5QAIRz11SUF6
	RqkooaWDFUXGrDsYjKzJEEOzyRS3cxs=
X-Google-Smtp-Source: ABdhPJwBNRn3bq5mG3N3FF1pnbNOEL5tLM526g7zFowgob5zEXy7QMoJhNbsMHRXjSGVbBink+gjig==
X-Received: by 2002:a05:6000:1a85:b0:205:a4f1:dba4 with SMTP id f5-20020a0560001a8500b00205a4f1dba4mr10414740wry.381.1649325946107;
        Thu, 07 Apr 2022 03:05:46 -0700 (PDT)
Received: from [192.168.2.27] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id 185-20020a1c19c2000000b0038a1d06e862sm7407360wmz.14.2022.04.07.03.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 03:05:45 -0700 (PDT)
Message-ID: <b59b57b6-1468-1041-bdbd-ec9399329dd2@gmail.com>
Date: Thu, 7 Apr 2022 12:05:44 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: dm-verity setup on loop device
Content-Language: en-US
To: Jasper Surmont <surmontjasper@gmail.com>, cryptsetup@lists.linux.dev
References: <CAH4tiUt1_1B64=QgU7uXmnBZZw=4FYEHtN=rZcx-zANJSbaYSQ@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CAH4tiUt1_1B64=QgU7uXmnBZZw=4FYEHtN=rZcx-zANJSbaYSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2022 11:40, Jasper Surmont wrote:
> While trying to understand the dm-verity code, I tried making a small
> verity setup. I created 1 readonly loop device and 1 non-readonly loop
> device. When I then try to create the verity target with the readonly
> as data device (not using veritysetup because I want to experiment on
> a low level), dmesg still says that the device is not in readonly
> mode.
> 
> Is it possible what I'm trying to achieve?

Yes, it should be possible.
(If you have device with Merkle-tree already prepared, if not, it will only
activate in failed state - but it will allow creation of the DM device.)

And if you post the exact command you are trying,
maybe we can show you where is the problem :-)

Both devices should be read only (dm-verity cannot be mapped for writes)
and I guess you need to call dmsetup with -r (--readonly) option.

Milan
