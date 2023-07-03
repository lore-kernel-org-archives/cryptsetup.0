Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3E2FBE0
	for <cryptsetup@lists.linux.dev>; Mon,  3 Jul 2023 14:02:34 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1b055511f8bso2838457fac.1
        for <cryptsetup@lists.linux.dev>; Mon, 03 Jul 2023 07:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688392954; x=1690984954;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=it/Q6WGzc63ZldAsaa3YfBeObItFQboxL8I6uH9mtWY=;
        b=d2xaSw8uflSImezZh0tr/dvRa+hTpZ5Sw/iioJ54Fyh9sYB+YOROWkoq2UN+h3HdBU
         IOJI4YDjEaYlPZF3imMfdI9uZvTJtJZf1ZZ6T8FhKSvFPrtYxgKBnF7pkIW0hnJVfHMN
         jX/Kx3Caj2A8SsXoAvUwm5/5Lnuoo5luk2Eb6moCiXbOeOzgsZusLo1IXFIO6y9qlE96
         0W+KhMbZy4BWS8n25eVDbWmBifqqYUuFmJIYAfqAJFUJI0wh2WXB1YJKn16aTV701ll2
         A5tlfzJo5opY7iaJWk8eQvxZmNlzL34kCk9Xq3Gk/brlgQbXS0eaP5QY56ABTMVh+v2f
         A5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688392954; x=1690984954;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=it/Q6WGzc63ZldAsaa3YfBeObItFQboxL8I6uH9mtWY=;
        b=JaO/DVAElRz8DkJ0ADC8P9d5tMCbG9Rrv7n6dVZDEx5GjSK1mJ0LjOtyPvqV0Us+0u
         rO9q4NWijaoQJ4j2o5zoEdQdALE8ToxjsukTUAmhKHTIj567QQ2RIXHRc59QUHD5TZgC
         DIQniRIJ0B2mAojHWZR10L5756nF+TO56Ji762BMDPx0yExtoMoZU7y/U8YrxsIobHkp
         fu4qees7g1SiAYSBIbp0STkGlD97sB5ga9JMU77s08zBHxtSp6hB6rp1xtF34G7UBPUR
         ijz1vxvLk+Fhoxb8ykSYYCISDMX/HT8HqDzFnGhmKb3PzW7OU0A2fH2cn0lLpFBlragx
         chBg==
X-Gm-Message-State: AC+VfDy9AUkoWrBxFAW9k369JFwAQqenerr5wkydAEUcvj2KdrDeasYN
	bZt2WI0FtpsZwZmK8ynIEWY=
X-Google-Smtp-Source: ACHHUZ51M70UDLCOOyeWNyb4shYSpFecKzgRDgCjMxQZL47GWWxlJuwqxUwvE8G3ahTn0oENJyetFQ==
X-Received: by 2002:a05:6870:1d1:b0:1b0:6ad0:80c3 with SMTP id n17-20020a05687001d100b001b06ad080c3mr8487024oad.3.1688392953851;
        Mon, 03 Jul 2023 07:02:33 -0700 (PDT)
Received: from [147.251.42.107] (nbbroz2.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id g6-20020a056870c38600b0019ea8771fb0sm12427060oao.13.2023.07.03.07.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 07:02:33 -0700 (PDT)
Message-ID: <e9a43d1b-a6e1-070b-94e1-10808f651eef@gmail.com>
Date: Mon, 3 Jul 2023 16:02:31 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: QUESTION
Content-Language: en-US
To: Alvaro a-m <alvaroam007@gmail.com>, cryptsetup@lists.linux.dev
References: <CACJx3YoFZse7gyk=ZzuqKKRKr=r2_+3yuwRyOmuBZ=RnL=8BGw@mail.gmail.com>
 <CACJx3Yqq13sijSLdsGfjJ1bZigrfeP-oR79nXgbXw4_6mPt04A@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CACJx3Yqq13sijSLdsGfjJ1bZigrfeP-oR79nXgbXw4_6mPt04A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I think you already got a reply, see
https://lore.kernel.org/cryptsetup/CACJx3YpDV2=J8rStSG685iBSW6OSEV2UaS4oRL6=qVGGSsoRvQ@mail.gmail.com/T/#t

cryptsetup is just tool to unlock disks, to handle input you need to load
all proper drivers and sw before it (in initramfs usually cryptsetup just
receive input (passphrase) from other tool, it does not handle query directly.

I am not sure if there is an easy way to do it, but this is definitely question
for your distribution. Systemd has a way how to ask external application for input,
but I have no idea if anyone use touch screen this way.

Milan


On 7/3/23 15:18, Alvaro a-m wrote:
> HI everyone,
> 
> My name is Álvaro. I'm texting you this email about LUKS. I have a USB
> with 3 partitions (/efi, /boot and /data with LVMs encrypted by LUKS).
> I have a problem entering the password as I don't have a keyboard and
> I need to enter the password with a touch screen. I tried to search
> for information about that but nothing was successful.
> 
> Do you know any solution for this? Can I enable the touch screen
> before LUKS gets up?
> Thank you, have a nice day.
> 
> Kind regards,
> Álvaro
> 
> El mié, 28 jun 2023 a las 10:45, Alvaro a-m (<alvaroam007@gmail.com>) escribió:
>>
>> HI everyone,
>>
>> My name is Álvaro. I'm texting you this email about LUKS. I have a USB
>> with 3 partitions (/efi, /boot and /data with LVMs encrypted by LUKS).
>> I have a problem entering the password as I don't have a keyboard and
>> I need to enter the password with a touch screen. I tried to search
>> for information about that but nothing was successful.
>>
>> Do you know any solution for this? Can I enable the touch screen
>> before LUKS gets up?
>> Thank you, have a nice day.
>>
>> Kind regards,
>> Álvaro
> 
