Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50E5160
	for <cryptsetup@lists.linux.dev>; Wed, 10 Aug 2022 06:58:39 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id gb36so25983153ejc.10
        for <cryptsetup@lists.linux.dev>; Tue, 09 Aug 2022 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=hAp65lXUs4L1JcmAvHwCQu6BG8sHB7anGYDWSNyXAMs=;
        b=F3pH3UPMjmlN6in0iZgR0PWv53VInZnRqpld1RzYdDQiuYvWpLr0tAa+k0/wbVCcdj
         JhlhYAtgUQvRBHgo34ieRSLYyC4zFGaXzFLGWk8Ocl9jAMKEU0KiYS2rnFa95DDKaquS
         CV06o9aeipGzgQAobRmcSCLhaNnhuAk0Egd9jHjKwz2ZLcyDOr1XSCJ6BXqfGEkEZ9jU
         I/mdicR85Ul/GBOkSrYWoion9ZgjIBx8reGOrn6aJ6BRg/wEGvUfu0ZVsM3EOoICUP3N
         iYkiYbUcLD6aRqYp5xm1Q4szuXGLCk5RwRWmivXy9vXomXOgEywTuXoJQbFVg8sWJWTf
         OZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=hAp65lXUs4L1JcmAvHwCQu6BG8sHB7anGYDWSNyXAMs=;
        b=c/zuufcaylxmoAtG8u1qW5Pc32RJsE13ukNL/cA89ZFFGVECMe984afwcRTvuqaPPp
         D3OColgRVNwwaf1QPirTo+bJ4jJSqqNekffw97a7KczOv7BRn1e0FXqMfNe3BqSLinp9
         ORHLv0OPXJXvskhbkic1XN6a1ukTxNi7rSTAhMDB3IpHPdr3rdWR/oKA22w2uwN8TPta
         3//GW2UVMdXxFkDKQjZisnNuU8qHuAA7LqGYtEIIiJjVm6zYX+K0tpkBeQeOvWiCnr2F
         1o44ETwWwVxvGvO9/FN9SMqpwSh/+bX3bVoaoswg3LZt6wJgHGQ1x+Wjm1cAzAn3LHPY
         x4qA==
X-Gm-Message-State: ACgBeo0BDGGsApJ5mvMHZCif9rHB8RdSq910cEeNZMWf8SoPmg3TFa0s
	X8EMecP7+PHB13eISDAR/YYobrm1bjk=
X-Google-Smtp-Source: AA6agR5l97KwOkYK1yYvD8aYNWQE1HClDouwj3nEup+5CPvhpfrxN73bVe3+i4QQelpsRLfWaIRYJw==
X-Received: by 2002:a17:906:9beb:b0:730:8e6c:a8fa with SMTP id de43-20020a1709069beb00b007308e6ca8famr18487639ejc.258.1660114717823;
        Tue, 09 Aug 2022 23:58:37 -0700 (PDT)
Received: from [192.168.2.27] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id y14-20020a170906448e00b00722e603c39asm1980744ejo.31.2022.08.09.23.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 23:58:37 -0700 (PDT)
Message-ID: <df769461-e347-9abd-7195-556e22f5d481@gmail.com>
Date: Wed, 10 Aug 2022 08:58:36 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Bug: luksClose search LUKS header but it is detached
Content-Language: en-US
To: "doffloster@gmail.com" <doffloster@gmail.com>, cryptsetup@lists.linux.dev
References: <CACHosL9ri_XGPoLxsAb4vEnav1-w3B=YWCE1YidhRn-ONrW=fw@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CACHosL9ri_XGPoLxsAb4vEnav1-w3B=YWCE1YidhRn-ONrW=fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/2022 23:53, doffloster@gmail.com wrote:
> Hi all,
> 
> I noticed that cryptsetup LUKS extensions is searching for a LUKS
> header in the device.
> This is expected when the LUKS header should be in the device.
> But I used a detached LUKS header, so I wasn't expecting to see
> cryptsetup searching for the LUKS header in the device.
> 
> You can see that in the log file "log.txt" - in the URL:
> https://drive.google.com/file/d/1DcrpklgE75oE5znAxHAlp9CPikkYbVq1/view?usp=sharing
> 
> You may notice that I used a "--header" flag, but I also tried without
> it - still, cryptsetup behaved the same.
> 
> The incriminating lines from the attached log are as follows:

...
> Do you consider it to be a bug?

Hi,

No, this is expected. But for close (deactivation) it proceeds even
if it does not find the detached header.

The reason is that even close need some information from the header
(for example UUID).

Is there any functional problem with this or it just looks strange?

If it is problem, you can always use low-level access through
"dmsetup remove <device>" here, but it can keeps some underlying device
active (for LUKS2 this is used only for integrity protected devices).

Milan


