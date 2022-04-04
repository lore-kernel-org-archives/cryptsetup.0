Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479087A
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 06:53:09 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bg10so17830484ejb.4
        for <cryptsetup@lists.linux.dev>; Sun, 03 Apr 2022 23:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=1q6pDxcmTYuTrmOmy+i2pF/UuixslSP7GLLVI30Ov1E=;
        b=FD9keKunz8UXKdLcZyqmQ0kczwiHRJooeblf5NX+xEGFjg3oAtTWXS7Iy11YFxzzfx
         2KNN8pwEWyR8XlSQ4i01NmL/GqoMv5AJaAsHFutAu1YEcYymMrLGYhZGh8Fen5KUXHsa
         /S9L1QDe4NtCIyvQTAbv8VgWD+VmiYUgQ5kOirP2a31RmFtWWiqYFvcJkCBCPHubcTYE
         FTbWRzW3gNma4mW1gJSCD7ORGXitQ+KX/UAi9fhtGMI+dOWW/A53Yg9A091GvZEsvjBJ
         hepK8L7RvKIgStMqAai2OwoOGM+CVpBcLePTQyj2R8Nb0iUwyHbP3GizR/scAvrqGjeh
         Ls0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1q6pDxcmTYuTrmOmy+i2pF/UuixslSP7GLLVI30Ov1E=;
        b=BQatSoMn4zdm6QMGSVuXL6wN45lMwPQHrX1Thk0OAc4WX74JIzEIAVihfK4gtiXkKp
         QKYHWP08h8ww/vaDEw1aygn3XBFPvJSCKVPWcE+KAA9745hEzhU/AO2qoG69wMRV5FEI
         XQIgdV+U4F+h5ySKDLyqi9Q77x4XM6mzWQpZilWBeuEzozvzC84HvC+RMXzjgUu0c00r
         dVVMBoVuKoWWQ/p6TacgfSayiHl6XxxbUIEr9k/kXcp4p9RfcPcA8FuQY2X5r5YfRQBI
         741ehSk0s3Quz7WxABpc4W8j2SjXUHotY9Qz75NwyRWDHF5gWeQggYMJoE6lq37YTT6K
         6U4w==
X-Gm-Message-State: AOAM530LhZ3iXvuRiuN3P2KP4k8ZsoniPBhzntNeIWVKTu5IdB0LsuT2
	+M/kCE+LPRoYReH4GEInZ3E=
X-Google-Smtp-Source: ABdhPJzqkWyOk/lxybow75Y6SdfiXKmCIYqHqf8LfLG2+Uhf+cMk0NUjiGykv7IQAjQey8/04a8SGw==
X-Received: by 2002:a17:907:6d83:b0:6e7:f485:925a with SMTP id sb3-20020a1709076d8300b006e7f485925amr1710716ejc.190.1649055187370;
        Sun, 03 Apr 2022 23:53:07 -0700 (PDT)
Received: from [192.168.2.27] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id f3-20020a056402004300b004162aa024c0sm4778756edu.76.2022.04.03.23.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 23:53:06 -0700 (PDT)
Message-ID: <3a31492f-c942-2e8e-107e-99ab0de3814b@gmail.com>
Date: Mon, 4 Apr 2022 08:53:05 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Development environment preparation
Content-Language: en-US
To: Surmont Jasper <jasper.surmont@aalto.fi>,
 cryptsetup development <cryptsetup@lists.linux.dev>
References: <PR3P192MB1087A708C36CD34F77AC517CF1E59@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <PR3P192MB1087A708C36CD34F77AC517CF1E59@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2022 08:31, Surmont Jasper wrote:
> Hey!
> 
> I'm trying to analyze the code of the cryptsetup project. In general I prefer to browse and analyze the code in VSCode. However, after setting everything up and including all the header files, there are certain macro's that are, according to vscode, not defined.
> These are Macro's like: DEFAULT_VERITY_HASH, DEFAULT_LOOPAES_KEYBITS, PACKAGE_NAME etc.
> 
> Is there something I did wrong? Or should I make something first? I can't really find an answer on the docs / issues on gitlab. Thanks!

These comes from generated file config.h according to configure settings.

So you did not run autoconf.

If you use git, first you need to prepare autogen.sh, then run configure.
If you use released tarball, configure is already generated there, so just run it.

It is always good to start with README, as it configure --help is also mentioned there.
But I guess we lost some info about build from old INSTALL file, though. That should be fixed.

Milan
