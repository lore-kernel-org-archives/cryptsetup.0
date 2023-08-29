Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8C6ED1
	for <cryptsetup@lists.linux.dev>; Tue, 29 Aug 2023 07:02:03 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99bf8e5ab39so522267866b.2
        for <cryptsetup@lists.linux.dev>; Tue, 29 Aug 2023 00:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693292522; x=1693897322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ZUQCB6l2yAZ5iD80BlTXh62oPZZeLEvYRxInybb9lQ=;
        b=cBVh8RXNx3TWLBHhGvMJTl4hKiulV2gkfaBjtp9MlH0PtN8wivZKVND5OGd/gTjLZv
         kNbKMPW1M+9I3/1PmoRfqvCDbmmiGi7tPSILz76V6lBZ8mbx3Knxne+Ilb2Z1KMrakpL
         kc94Sq13KMt5aZRjgN5Af614KRE3mjIaV4Z0TTAsxtbr0NXJmZ5UG8nJ5ep8MSfacR9X
         zYVY9Qrl9puiCVUBk0MEBXKyGLGM6vLB/T5KhBTlnNhRSAUgS9JdAH88ISLNs52W656s
         jWXy7k4H9UP1I2v0zVVPC7euvLJRbz7/MU7hlfyG2HQcfwnyWafchbq2UkhE/UC6asRq
         sTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693292522; x=1693897322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZUQCB6l2yAZ5iD80BlTXh62oPZZeLEvYRxInybb9lQ=;
        b=JfslZpvdIR7FowG0TSg5ZkJoI6WWuFaTl+ij46cmfAjlRWXpwucF1k7HAPGgZP2Qmt
         n5CKRdHcDwSZQxFJjefY5iXC43J30nPRTshG3Y7ZOU1g2hAMZBw8gcgSC1Lz+RHC1rtz
         2HjphCNAGcD01J8+MkxLTIcCDpd659iabtIc/tjG8tsAWXEsWcg9lCHazeJ6XAxi69mG
         k04fzcVhWc4VuT7t9Iixkmu88h2nHr/eAzdETfZ9hHCUA2yo1a2N6cCzoKYLCX7To5jl
         24/DTxYS41wNfgBW0RmF4Kct7g3m8rRQU2Q3zIc6CDJ8Nb7ieOOxs183JuEpBAfsZXme
         GNcw==
X-Gm-Message-State: AOJu0Ywxf5RYbAAG8bcvRGWNjK8He6e0JAONMhlbBkoSvGxbSeWkugB7
	nXZ4Orp6NbPwliL03ZJWhiZDgcrlsZ0=
X-Google-Smtp-Source: AGHT+IGiR4CBAAxzU0XBRMv60oYc5PCDeeRM+z0661yf/Vq0QaOJfE5ONhLA3NM+W4t1tGiBoQWkKQ==
X-Received: by 2002:a17:907:7629:b0:9a1:f4e8:87b9 with SMTP id jy9-20020a170907762900b009a1f4e887b9mr11347685ejc.45.1693292521512;
        Tue, 29 Aug 2023 00:02:01 -0700 (PDT)
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id h7-20020a170906718700b0099bcf1c07c6sm5617978ejk.138.2023.08.29.00.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 00:02:00 -0700 (PDT)
Message-ID: <159b42fe-d616-4a4f-8fbe-cff5067a57f5@gmail.com>
Date: Tue, 29 Aug 2023 09:01:59 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to use Serpent
Content-Language: en-US
To: Fabian Stargalla <fabestah@gmail.com>, cryptsetup@lists.linux.dev
References: <CAMEBZxWhAmwuJqpvtk0mh5vceEp_9AEs46DKC94vGQkrqW6uCg@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <CAMEBZxWhAmwuJqpvtk0mh5vceEp_9AEs46DKC94vGQkrqW6uCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/23 01:37, Fabian Stargalla wrote:
> I would like to seek advice from someone who is familiar with the
> Serpent cipher, encryption and cryptsetup in general.
> Currently, I'm planning my new Arch installation with a BTRFS
> filesystem that is encrypted using cryptsetup and LUKS, and I'm
> finding little to no information on how to properly use the Serpent
> cipher for system encryption, as well as for encrypting hard drives
> solely for data storage, and for a swap partition to enable
> hibernation support.
>  From what I've read and understood so far, it would be best to use
> Serpent for my system encryption in the same way AES is used by
> default with LUKS, that would be serpent-xts-plain64, but I'm not 100%
> sure and can't verify it any other way than to ask here.
> Furthermore, I would also like to know if the XTS mode with plain64 is
> also appropriate and works well for my swap partition and my data
> storage drives/partitions?

Usually if you need to ask these questions, then just use defaults.

Anyway, Serpent works with LUKS without problem, all you need to do
is use --cipher serpent-xts-plain64 during format (and enable Serpent
in kernel). XTS mode with plain64 IV is appropriate (and the best option)
here.

But as there is no hw optimization, you will get significantly slower
encryption compared to AES-NI (check output of "cryptsetup benchmark"
it measures Serpent by default, see 512bit key as it is default for XTS).
  
> Just in case someone says I should just be using default AES (like in
> one thread on the Arch forum):
> My primary concern is the higher level of security that Serpent
> offers, which is why I prefer it over the default AES encryption. That
> also means that speed is completely irrelevant to me, as long as it
> remains within a bearable range.

It is also about implementation issues. I highly doubt sw implementation
of Serpent in kernel is side-channel safe, so AES with AES-NI hw enabled
support could be practically better solution.

Anyway, I am just responding to the technical question, not the security one.
Serpent can be used with LUKS easily without problem.

Milan
