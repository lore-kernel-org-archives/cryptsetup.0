Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A2E7E
	for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 16:11:55 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x21so4635732edd.3
        for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 09:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=/0LCTNaZENXNYYlAuiLbY9JIbAXQUXwCIpu/dvG/rjA=;
        b=Glkick37TIJWtoRXT5AiGYD4Ym/7pcRczBW5456PYmE/6baKey1UoB6Au0Ue9L0HdZ
         f2PMq7Hft8Fo+HS5H9tnFZnOXcmuXtttTidkslMyHaRQi3ExyuRzDqHGit+E/WCnkMzf
         QBvg8AeF07w9DYjNT5SQgf6/5PrXp1qCpKI+bsvf1XQ66iTMYvmhtrjuX/ZHAkGme0tN
         y1AUNePKyn/7zI8m4wAJ+MtnP/NzRjWpoF2yeRPYRvBO28pynQGR59qz9aDzK3jN7Zlv
         /V2kPrhd5PhFQvIdTR2qX3Iil3+WlaFZmWBCw9GQL8ZrQ2YrXbERqfkwQMSYemXiSs6j
         Fbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=/0LCTNaZENXNYYlAuiLbY9JIbAXQUXwCIpu/dvG/rjA=;
        b=xz4WYUTUXtdTwGiYryXimoqLfb3CufDAQYqY892DGcfEGAPdi2jT5YSA+mGKM+naY8
         2cROSjIWZaxLQ1Se9wiQqosNoRrIKeQq22uA1NMTKCfwWf7evVDQWxZXSLKUBO+ZZPx0
         Ai+Kzd0++qNO2TUj7V9KJtBTDsSLzkySpNb2gzgU8LWJz/SqkREcybkdIvNcTzJtNzZ2
         jttrLh7M2f9RdoWG8NFWyYydiDoOEiOwrBuunb36aDX4d5Tr3yyewr6l1bO+ej+alFnM
         d/gpDW+5Eny+Bz4Fr1iLC3PJX4ddYDR/jVRaNWgmSdQqfzCavuYkNug2mp0tJDDfBt8c
         2wlA==
X-Gm-Message-State: ACgBeo0bKEX1WVcKCiNij1obQLZPiRPLSG6n4oZaX5Tk4UQjYNp9Q5es
	L/FFP62VV4qPTnFXo8Zh8Rs=
X-Google-Smtp-Source: AA6agR6J6YpYgAsdFfg8bRbCwSZizo2fY1FimwwOzdro+zJV69A9mysE9bL3+4Vb7/Ufwf7TlM06YA==
X-Received: by 2002:a05:6402:3546:b0:43e:466c:d4ed with SMTP id f6-20020a056402354600b0043e466cd4edmr7980416edd.48.1660407113872;
        Sat, 13 Aug 2022 09:11:53 -0700 (PDT)
Received: from [192.168.8.100] (78-80-28-162.customers.tmcz.cz. [78.80.28.162])
        by smtp.gmail.com with ESMTPSA id fx18-20020a170906b75200b007306d3c338dsm2005061ejb.164.2022.08.13.09.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Aug 2022 09:11:53 -0700 (PDT)
Message-ID: <de150ba2-46fe-36f6-86b5-37411af760e6@gmail.com>
Date: Sat, 13 Aug 2022 18:11:48 +0200
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
To: "doffloster@gmail.com" <doffloster@gmail.com>, cryptsetup@lists.linux.dev
References: <CACHosL-U7pWY95fHP08D7FGoCk7=kZfRTudfSs4E1h8buxjaLQ@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CACHosL-U7pWY95fHP08D7FGoCk7=kZfRTudfSs4E1h8buxjaLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2022 17:50, doffloster@gmail.com wrote:
> Hi all,
> 
> I was playing around with LUKS extension in cryptsetup and noticed
> that the iteration count was 14 in my case.
> The iteration time that I chose (arbitrarily) is 4123ms which is above
> 4 seconds!
> So I was astonished to see an iteration count which is very low.
> As far as I know, using a modern computer, the iteration count should
> be above 100k.

Please do not confuse iteration for PBKDF2 (default in LUKS1) and memory-hard Argon2 KDF.

These are completely different algorithms, you cannot compare iteration costs here.

If you set 100k iteration with 1G memory cost for Argon2, you will get
unlocking time that is perhaps in years... :-)

m.
