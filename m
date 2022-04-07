Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0159A2100
	for <cryptsetup@lists.linux.dev>; Thu,  7 Apr 2022 09:41:03 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id g41so2416666vkd.4
        for <cryptsetup@lists.linux.dev>; Thu, 07 Apr 2022 02:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=E60JwWTDDXJ0sv7FJ6X99FTdxMHKhQRPeAgP5au3jPA=;
        b=j4QNwLabajyyaYYYOtCRNQYwMlWiGCGi79j15q50iga37V8M8FHD84UpFTtpAgkqXI
         UwjbBadoJzu1vwEEm/e3F7e/HSWMZlOT99d9kxgWX4Zm/z4FES7lYjlkM2mbF+m1k8zf
         xwU4U+Cb/mRYapYlZwa1/tSk+HybStBkJQ7NpTZxL8zQ8Ynb0iRlzJijaiLyB1ERT0ap
         seqf1Va4s9fgWQg4zNMph+5v+USHD9q0dUdfXAYWHY5+hSnYM+Mjiw/GF9lvzSQ4jcjr
         wSOat0M0/nupWHAI2O59lO3ZD3FRfQjGto1CtgNnd/H6GhmixOxPHx9KnTxfeNW1FCu5
         9ptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=E60JwWTDDXJ0sv7FJ6X99FTdxMHKhQRPeAgP5au3jPA=;
        b=HaNHCt6wGlji1UToi5AQ64TdUYMI042I3Ju4zDidlBhVxDz9mZM31RXGW/c1rlwi6G
         CSEG+iOWnUJpnFua+d5/UoHOFtI548bcAYZXa97brRcd7xw56p6xZcsKRo7sNCEftC/j
         T1X7MLPBkrPhTXjw4rFQr0LZAxMAEuT9q9FZeYADLY75ksI8qCCwK+YUZYEXNtXJOmbl
         nrtu+OHxEAuARswdEu1slyfqUuQgCwh3PqmcNr1S7bKbeePRYYrVQ0RtsIYTOOE3dv+t
         cIfVu8wIhaeTSKXOfna8z8YiKz/WWFCCP0KyMsG4O/t1BMLQt7sBlSXXn0VFpIA2fHpu
         49dw==
X-Gm-Message-State: AOAM533pPhOnOV57tVZ6cLfe//QwCjC/hsT1Q1B9dxAkbnW/2f8Kr1jd
	yeDH0nPUoUYKd32duu1khJtUTWtxT56MdpMXWhgY45+OQghw5gShU7s=
X-Google-Smtp-Source: ABdhPJwTodCH9QL9ImVLP2cfn/mCJyR2z7wCVVEVuiK/QKd088hGaneSNNLdHwVLHzAha2nS5bHIgYDbn0HeFUCIBfw=
X-Received: by 2002:a05:6122:8d2:b0:344:541c:c8e5 with SMTP id
 18-20020a05612208d200b00344541cc8e5mr4404757vkg.32.1649324462614; Thu, 07 Apr
 2022 02:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jasper Surmont <surmontjasper@gmail.com>
Date: Thu, 7 Apr 2022 12:40:52 +0300
Message-ID: <CAH4tiUt1_1B64=QgU7uXmnBZZw=4FYEHtN=rZcx-zANJSbaYSQ@mail.gmail.com>
Subject: dm-verity setup on loop device
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Dear,

While trying to understand the dm-verity code, I tried making a small
verity setup. I created 1 readonly loop device and 1 non-readonly loop
device. When I then try to create the verity target with the readonly
as data device (not using veritysetup because I want to experiment on
a low level), dmesg still says that the device is not in readonly
mode.

Is it possible what I'm trying to achieve?
If so, what am I doing wrong?

Thanks! Regards Jasper
