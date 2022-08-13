Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8FA257D
	for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 20:00:19 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id x21so5053063edd.3
        for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 13:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Qi9DeR0vTxUrAcUDoEkD0VEONQDufHwFBxDfrTkzlX4=;
        b=etcFq0++9J5KQn02Ssute0lCAtNqmeG8flftBMWgfdGf+xXP1jkufuE7tuzJ262RN0
         WX3f6PAtH4rMJtR4RxjEz4FCtKfdIZns+Mgn7PbE6v80RpWmy4mluo2Eli7TffET1sSK
         nMBGaRgT2pXGJGlHdkbgMC16A+/kvoyzt6VrLK3QKLXcpVTulho8DbVP/WD5jUpz36lH
         59nQunz1tUeZoToI9xmCT822gu7ZfnIicpOB+PiE8eW9BX8ACJmwfHGD0wZRqri4nszW
         yogVGWLr9S2DQ4SKpTPyvzhlpgfKz1pQHPgNEimNOO4TNqSj0uyh1MMws0bdxJ7pkhrn
         THcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Qi9DeR0vTxUrAcUDoEkD0VEONQDufHwFBxDfrTkzlX4=;
        b=OVEBVxMYgbwtpIeuHo4hQmKt//UXMuGLIwrUbcP61BiVYhRvDBv892xSa3bN0NNDkU
         Q/UO95NrljgJqVL6p8W3RpgQiwVhwwKjZosC0kRGzIDoIilXe2Zcy8iLKqdEcX46J1DQ
         itdmUfgUkBADAvDh2Qq+8OfGZJVNEFqlN7TnqIIXqFD253PgJa1UiVyeMDnr2JiObmRg
         7t+ryVuv4tKn/ad9bKsKbuSJlwb1Yb3hvE7oWEW4SVb0LZ1J63s2wT6R/F+K0NLkmhsM
         hYqA9bfLKVAFGe27vdIJ1mayQSUZtV0EFPAQuIndG96sgG05Zgpis70zqFDBl/GqvHe1
         kU5w==
X-Gm-Message-State: ACgBeo3YeZbFSWlNZee31Ke7dqri70upCaLEIYGa1B+E3q5ctw134R2s
	JgirReJpL8/Y7NAXQrwLLP8fiT4mCSY=
X-Google-Smtp-Source: AA6agR5TAVCAFvXEK9r7R7LY2qEUnQ6w+0EBsLnr2ql8koQIPoMrh/iG5sMujGUSGj077ocUC7gAXA==
X-Received: by 2002:a05:6402:400b:b0:43d:b0a1:dee with SMTP id d11-20020a056402400b00b0043db0a10deemr8515745eda.223.1660420817449;
        Sat, 13 Aug 2022 13:00:17 -0700 (PDT)
Received: from [192.168.8.100] (78-80-28-162.customers.tmcz.cz. [78.80.28.162])
        by smtp.gmail.com with ESMTPSA id kx23-20020a170907775700b0072ffbbc3341sm2226251ejc.204.2022.08.13.13.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Aug 2022 13:00:16 -0700 (PDT)
Message-ID: <df5fe77f-9474-6f8c-79cc-b199afbb7748@gmail.com>
Date: Sat, 13 Aug 2022 22:00:15 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: cryptsetup LUKS: Too low iteration count: only 14
Content-Language: en-US
To: =?UTF-8?Q?Michael_Kj=c3=b6rling?= <michael@kjorling.se>,
 cryptsetup@lists.linux.dev
References: <CACHosL-U7pWY95fHP08D7FGoCk7=kZfRTudfSs4E1h8buxjaLQ@mail.gmail.com>
 <de150ba2-46fe-36f6-86b5-37411af760e6@gmail.com>
 <e05733d4-2e45-4075-b1cd-dadc753fb89e@home.arpa>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <e05733d4-2e45-4075-b1cd-dadc753fb89e@home.arpa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/08/2022 21:35, Michael Kjörling wrote:
> On 13 Aug 2022 18:11 +0200, from gmazyland@gmail.com (Milan Broz):
>>> that the iteration count was 14 in my case.
>>> The iteration time that I chose (arbitrarily) is 4123ms
>>
>> If you set 100k iteration with 1G memory cost for Argon2, you will get
>> unlocking time that is perhaps in years... :-)
> 
> Out of curiosity, how did you arrive at the "years" order of
> magnitude? Is there an exponential component involved somewhere when
> increasing the iteration count?

Ah, my bad, sorry.
It was more a rhetoric note (I meant: it will take very long time.)

It expects that the memory cost is the same, though.
Once you will increase memory, it influences iteration time too.
Cryptsetup KDF benchmark tries to increase memory, then iterations,
but here it hits the 1G limit already.

Sorry for the confusion, I should be more exact :)
Milan
