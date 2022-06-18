Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCF87B
	for <cryptsetup@lists.linux.dev>; Sat, 18 Jun 2022 15:13:01 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id y19so13650678ejq.6
        for <cryptsetup@lists.linux.dev>; Sat, 18 Jun 2022 08:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=0Q55Rwm9awko8HfuX/Pxngr9tp4oyOzWk0bMwF3Wuyg=;
        b=ByBhB9R1D9owkq+alp8zzx6kGpk4X+xYkDiWuV1uAfxh/nzu/blC0aVBQ9lus7ckXH
         OW82wWxr1nwgDa2Lb3+28F4cdIOXApTK28RkaFDBzecu59DNQpkTx7ANbGQHji8e/Uc8
         uONfbZWiU+5zJSoCieMuFGqf/XzM0tnj80Sdv0sYC5Br8RgVdGSZD6csT3IL874im9Kk
         ujmmH5+IIrLh9XyewLg9QcQtAjnOfe0t7GTnY9AZF9N3csRpt1tSllUBFPYe0S+8zZeh
         eDIkhvNx+EYWMBT7XSPCZgabCqCXkdD0+aBjQ7MAOfeKBqIZj5777QggwQsb96fD1h5+
         Dh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0Q55Rwm9awko8HfuX/Pxngr9tp4oyOzWk0bMwF3Wuyg=;
        b=PJg2sRUQQcDje1X8sjFE3j81i8lwESfg1PmN2MZ/qPhVtE4kUrQZXKvLGyaXgEEAhD
         RHTvLr9Y8t0Ztntd6fC6hRb4IpyjcPiqy/HgSVhfwfKEVJ1uFI7ylOaw1pIBWTgFoyDU
         8I7ZS36Fq9dAr703eM0n3hjH3d7VP9RD4oEFArU0zLXXO3VNba9ChfLd1WF+IuNf5U0p
         L6uyRBvsrMJFS61xr1f1tHnmU7D8Gndo/p2mHxE6pIBbkoh9kuGtn/NsQRtzqQkBm7js
         7jkecgr/H+Pi7yO6stZ13ymzRV6y5R97xm+MsTeW2KeO/DRB6oyb34yMFjuKa7kYcL7s
         0U2g==
X-Gm-Message-State: AJIora/r3Rqofs33crlTnB+NY1Fof1ldctZz++zkofAhNlXlA+dXWevW
	jg6KFxD7QNOG6EQFiVdSIjw=
X-Google-Smtp-Source: AGRyM1ua9eL0/GQ/cRfwGwrSjYVZuFWv7tnEb8KtHsJBuXmgzYdYQnRqCpuDgfmIXmKSwa42/2jeoQ==
X-Received: by 2002:a17:906:dc8f:b0:70e:5e7a:cc59 with SMTP id cs15-20020a170906dc8f00b0070e5e7acc59mr13971770ejc.423.1655565180124;
        Sat, 18 Jun 2022 08:13:00 -0700 (PDT)
Received: from [192.168.8.101] (37-48-9-249.nat.epc.tmcz.cz. [37.48.9.249])
        by smtp.gmail.com with ESMTPSA id la5-20020a170907780500b006f3ef214de7sm3534447ejc.77.2022.06.18.08.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jun 2022 08:12:58 -0700 (PDT)
Message-ID: <11d06783-c697-db7d-ed09-237d389aa07d@gmail.com>
Date: Sat, 18 Jun 2022 17:12:56 +0200
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
To: Coiby Xu <coxu@redhat.com>, cryptsetup@lists.linux.dev
References: <20220616044339.376qlipk5h2omhx2@Rk>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <20220616044339.376qlipk5h2omhx2@Rk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/2022 06:43, Coiby Xu wrote:
> Hi,
> 
> Recently, I notice cryptsetup itself consumes significant amount of
> memory (~256M) when estimating the memory requirement for dumping vmcore
> to a LUKS-encrypted disk,
> 
> $ time -v cryptsetup luksOpen encrypted.img volume --key-file mykey.keyfile | grep "Maximum resident set size"
>           Maximum resident set size (kbytes): 1309828
> $ cryptsetup luksDump encrypted.img
> ...
> Keyslots:
>     0: luks2
>           PBKDF:      argon2id
>           Memory:     1048576
>           ...
> 
> 
> So is there a way to estimate the upper bound of the peak memory
> consumption of cryptsetup itself without running cryptsetup?

As you already found, the major memory consumption is by memory-hard KDF.
But this memory is used only while calculating keyslot encryption key,
it is released immediately after the Argon call is finished.
I do not think we have better estimation here.

(Another story is locking all memory, including big areas used by libc,
but that should not be problem here, I hope.)

Milan
