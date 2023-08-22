Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA9E944B
	for <cryptsetup@lists.linux.dev>; Tue, 22 Aug 2023 10:16:18 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-52683da3f5cso5185545a12.3
        for <cryptsetup@lists.linux.dev>; Tue, 22 Aug 2023 03:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692699377; x=1693304177;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y4dvwlAlw8yI6UlEwvV4R5zoB5Jw54RYe8Iihdk4+VA=;
        b=XHUVXhh1UP2yykv3DQkUavIsLU+ZJKGro+5ciInY4HD+eSvw8QVWCHK0u8xMq+iXnz
         MolRoyNcapcH+Pqspl/XzpfmAcze/DVGsXPWZ2o5aa8AOzaBvWmEB6sy46tev4ZcdFje
         3P7E0g1IlQQu22dmzwSPpL17AcjRGljigb1T+uSIUuaJdxFVXr7KfeLngJ02ufZVi4va
         9S7/wYjrsI3yGj480YsKbDMDsZ4WPCOHKcXAXI3r+uyaWzwVPjTEXnu2abi5Pr15R8mv
         Fewd+xzjJi7GqK5B4ZWp/RyCK6IHOOu8Md7pgvlPd8KRyWvpIe7IZKsezmBmeLz552I/
         sgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692699377; x=1693304177;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4dvwlAlw8yI6UlEwvV4R5zoB5Jw54RYe8Iihdk4+VA=;
        b=TTMswvBKpKC4V7f/DD9ICXks5wkG0lg1ysm8giMnKNe0eSK6xVSGm45FGhYk8lXsyV
         zt+HoZ6Dbm6yBHlCXSvB7WM+hOYcRCkMdWaaXUykznK15ElxhDgrXLC2TR4yZ+ThaUdl
         eGChEz/7p2aRKlYkfbJZ+NsBotPu1oXvje8rAehZbGl5l9drnjWwXz9DLewRgut+DlS4
         6kaqwOXsKYb9goZCbEjSuXU72lE61WLKnhjeqRPkd/xhgjIQem8Vl3+ISTI6h+JxcgRa
         /XroFmFzcSuebOZZgG8Dw53th7UvxWElswGB7+Gb/R3JgRh9p0yWRy0N77oln0BB3lpR
         m3Xg==
X-Gm-Message-State: AOJu0YwQ96KXeu0vA53WQK0WPZLJjI/94sd1BcXI6x1mgHvmcxp9y0b3
	3Idwvk4SKY+FegfwvXpGENcFit2ucxc=
X-Google-Smtp-Source: AGHT+IH92aYM5F+ou3tpJe3gpH3voux7xcCOVOyqyD6PddU2Ty30nGP3ae1O7YIyUTFF+2OO8utWKQ==
X-Received: by 2002:a17:907:2c59:b0:993:a379:6158 with SMTP id hf25-20020a1709072c5900b00993a3796158mr6987960ejc.17.1692699376780;
        Tue, 22 Aug 2023 03:16:16 -0700 (PDT)
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id qh10-20020a170906ecaa00b0099caf5bed64sm7986273ejb.57.2023.08.22.03.16.16
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 03:16:16 -0700 (PDT)
Message-ID: <6889c3d8-f7bc-4c41-9882-cadfb7c53a75@gmail.com>
Date: Tue, 22 Aug 2023 12:16:15 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unlock a Veracrypt/Truecrypt partition which uses a keyfile with
 a passphrase from /etc/crypttab
Content-Language: en-US
To: cryptsetup development <cryptsetup@lists.linux.dev>
References: <CALmZR2OZ0sKRui1Eu1FxQzBCBhvHHXbsHipGq+jfPUcteROS9A@mail.gmail.com>
 <20230822093701.GA7436@tansi.org>
 <42e1583e-2407-448b-8143-678480344a1a@gmail.com>
 <20230822100905.GA8037@tansi.org>
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <20230822100905.GA8037@tansi.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/23 12:09, Arno Wagner wrote:
> On Tue, Aug 22, 2023 at 12:01:37 CEST, Milan Broz wrote:
>> On 8/22/23 11:37, Arno Wagner wrote:
>>> That sounds like a question for the Veracrypt maintainers.
>>> /etc/crypttab is not even used by cryptestup, the topic
>>> of this mailing list.
>>
>> Actually, this has nothing to do with Veracrypt code, systemd crypttab
>> supports mounting of Veracrypt volumes through libcryptsetup.
>>
>> Milan
> 
> Thanks for the correction. I would not know, I am still
> running systemd-free and have no intentions of changing that.

I think Debian non-systemd crypttab parsing supports tcrypt
libcryptsetup mounting options as well - I was quite surprised too :)

Milan
