Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40391FA1
	for <cryptsetup@lists.linux.dev>; Fri,  3 Mar 2023 07:55:53 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so3304683wmb.3
        for <cryptsetup@lists.linux.dev>; Thu, 02 Mar 2023 23:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677830152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e63wfQav+SCFvs9LHKFqMdhmyW29t+evbk12Ak+xedo=;
        b=V/Ps53PG/Q7wpD1lTyUEboiBEKx0eNWeMsF9EcVt05EFfHbexxXYU/kNpCVyLl1VtC
         tNh6OERHN2eIi5cBw+V/dDkhA9La+qYTdsTzJE8SIplzwJmNk8dmWXiwQQ8gyGsP38qg
         TOuo2N2zzUOEHR3IfEeqMx0/5B8Vbm++tX/ZtEkee2RNKQUX6qMSsDzgW5qJi80aL5IW
         Y8MFIzEKVcKhWGLbl5MQuNgzF4Kn25v3S65g6LfTzBkymqd5qhiMVUkhWlAsahoE4MQV
         G6tB8RlYP2gaFL/ud7goJbm2pk9d0a3XP4Cwe2pMkbVo0fvsdmMczm11XuLcHtbkNgHk
         C2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677830152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e63wfQav+SCFvs9LHKFqMdhmyW29t+evbk12Ak+xedo=;
        b=2nbCLoqVpM6MhcbQ4tSR2NQpTChkOH7WzFnYQH3ht7dccRWkwQXUEXUohzzYgc0fD7
         CTMaznCR/MLTxHnrGKUGdCPeFDnIRO0bVq9xJ80JCeeRTSeCJzSjnFN/4hnoPDRziyqA
         35owYn3Nk25NRWcWRwOimy4EKDCO2rpaohD5fWSgNmOJHgUSo72p/5SC6GkNflgM2lGq
         1RyGoPvN0btOzl53i2mQ2EfHN/Q4ZQLINDJy5AI4/6Oc3y6Tb1chJw+Pk/9haPp1xnYu
         5bw+fNedNJh9+zu0wtTH51mqT4oDIn7gEiOJiy2Vp3OmI+uxpTebksroe3ZYH4HSc/H+
         joAg==
X-Gm-Message-State: AO0yUKXJZ9SNA4hYNUDMeSLuUwUepYmtf1uhWf+zZw54ygDUdK9syple
	4gM6okCWWkhqcMd5nTvS1Ay9AqSH8UM=
X-Google-Smtp-Source: AK7set/yitVu7s5qGAOK5XnaZsiX8Xje8UuF7B2FxMKl1KdP9q4QDKGqwEDVTPHtlbq8793s3ODhjg==
X-Received: by 2002:a05:600c:5127:b0:3ea:dbdd:66df with SMTP id o39-20020a05600c512700b003eadbdd66dfmr752885wms.2.1677830152020;
        Thu, 02 Mar 2023 23:55:52 -0800 (PST)
Received: from [192.168.2.30] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id j18-20020a5d6052000000b002c53f6c7599sm1424670wrt.29.2023.03.02.23.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 23:55:51 -0800 (PST)
Message-ID: <47da0423-7e8c-c059-c65c-fe6252b0e384@gmail.com>
Date: Fri, 3 Mar 2023 08:55:50 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: cryptsetup - No key available with passphrase
To: Lars Francke <lars.francke@gmail.com>,
 =?UTF-8?Q?Michael_Kj=c3=b6rling?= <152cc69a347e@ewoof.net>
Cc: cryptsetup@lists.linux.dev
References: <CAD-Ua_hj1hkymLbyEyT-eNyCj_naiqHqg7nr3nos8tp9XCERDg@mail.gmail.com>
 <64fc6294-ca5e-f7a9-302f-63b09d569586@gmail.com>
 <CAD-Ua_h2GDZexz=DC3YA88nO-OhXKyGp1v2D6rWvHHQVwtCgFw@mail.gmail.com>
 <3b08eace-b038-bab1-4f65-f9c322dc90a4@gmail.com>
 <CAD-Ua_j_AR4BJWJPXs9Lv+qO1-c33M59UPg_1_XQdB60s0MEXg@mail.gmail.com>
 <46a11902-fdbd-4c75-a589-840e4e1f3e27@home.arpa>
 <CAD-Ua_gQLB+6a8=eRQd7B8u76hmvGFH+xPtzJKXPwn=gjuF=uw@mail.gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CAD-Ua_gQLB+6a8=eRQd7B8u76hmvGFH+xPtzJKXPwn=gjuF=uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/2/23 23:12, Lars Francke wrote:
> Thank you both for your help and sorry for raising this unrelated
> issue - cryptsetup was probably just so early in the installation
> phase, other steps would probably have failed later as well.
> I can't think of anything cryptsetup could  have done to prevent this.

It is related - as it is definitely only you who experienced it.

Actually it is quite interesting issue. Argon2 KDF uses a lot of memory
and any glitch (even one bit flip) will change it's output.
So memory failure explains what you see here.
(You should see this rarely if --type luks1 was used for format,
as LUKS1 does not use Argon2. But memory failure is just a recipe
for disaster later...)

Thanks,
Milan
