Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138E136894A
	for <cryptsetup@lists.linux.dev>; Tue, 24 Mar 2026 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343867; cv=none; b=a/Qqx5v2Q18loIDruLGac0uQTp3mK7OXPkgm0dDrUyaGHWTIQ/Ao+pFuDdUVs+lxbnZ8x3xCw8HJZQXGRFMkzJnB41fbBC5hTUOnfwqPdIb6LBfKkwpntFGWwe8CG5PLslQyJHcy0xUiTUARYzv7xXcuRc86Ls7htW+OClCiMKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343867; c=relaxed/simple;
	bh=FcXcGc3SGThzxi1wyIgl4s9gjUtW6WhuFKDhPIifbaQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sc5SztcJwRmpX+vVEAIUxb9fQDylDDKapsLHObSfWzc5iWPt0lFtFIzdMnv6Z1sfoa0ex/owxyL9Jl2WPmuSARfqAha/L4+TmhddKSSd0xG5Fs7n6ZR0e4cVSuvCNHJo/Mty9EmUqwY6s+BZlZQDwxlQaXMIKOLPYIrkCTnuyaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QG7DWSUm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QG7DWSUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774343856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=B7bJOAAmshWZJGeWn2b2t5BVjq2X2GrOn+wJLznNGNw=;
	b=QG7DWSUm4FRnLcRe7jrMHXr3p4fQvMbQ/MdynlQhw9Be1xkVjSTu8d00xlVRJfqt1K/GgQ
	4g06dDoQpGK12uiuRAJ1jiSbfGxi0q+YPRPAVsNmdNptgsJmpk0zDLv5iJfwLMtEs5YWhI
	cSH2lw8vIFyuov7+cJmpj50NJLAVq48=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-pV5Ripm8OPeamJ3Qn5kdEA-1; Tue, 24 Mar 2026 05:17:35 -0400
X-MC-Unique: pV5Ripm8OPeamJ3Qn5kdEA-1
X-Mimecast-MFC-AGG-ID: pV5Ripm8OPeamJ3Qn5kdEA_1774343854
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b979930aafeso378557166b.2
        for <cryptsetup@lists.linux.dev>; Tue, 24 Mar 2026 02:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343854; x=1774948654;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7bJOAAmshWZJGeWn2b2t5BVjq2X2GrOn+wJLznNGNw=;
        b=WzY0paqDEHuKACJSUg8ITi0J0BjNKMrzeHpsQL+db7jJO0Dtwh2sdJfTXFOOh+B3sb
         PM211yLDUIZ9jPd4vI/z7uGS63joi7TrG24Oc8JdBb9EnxHt6Pq28KrMuCUrngdJEnPj
         Vhl13BzCAgd7a12JTV6a27hGy/1Fi12HseKWcFpr/VBYjJMyyPxTgOY13LLea/aF/aZ4
         i4BUI2tJWhf8XYJ80qU6RS01d155qVVN2cEZ/PvWa7QMv3BF3OnmRSBbUziEhqTczjyE
         q9V35fRpeRTCDo1/0gWibpYCRfhU8YsoKm8dhew1y/fgAzjulLROOTZihmGve44vWWOC
         GGBg==
X-Gm-Message-State: AOJu0YyRm/8D+lumYLL/HQYWgoZzpYzZr40ZvUJKPj4mbR1zPiqqoIjw
	IisOuGp34q3ydFtwqOV8kSEkjg8hyp+6TrL2ahYEzyzYt11hr9N1vSXhHf15sjCI4T/o3tlctHN
	h0MYiuBYK7cZesgOIDL425Ig2qJjHqK3TaA6GvyKvKoaPxi10fwsNe1AJY9FicbSEkmXtNSNbS3
	J0BDJA7cnyKfLb+orm3ZIOE+lumUf20jex6yWJpsaa9TyF
X-Gm-Gg: ATEYQzw+3vLdUc+kdv64YnZ/ltDWc8wYI5OUAWQZMdFvlhEkWOOU83gGLUCAu715Qc4
	v4z92tvZFeatcwb2AGoNDrI7BQn991oxhvfWDa6yR9o2BxlcBBQzo1LEwK3VI1xLAizq+YlJRql
	4K/yQd1kaBk2eFS2lDQmicKXDyp6yUW9LnYU4Mk/MbRAnhG05GhWfgy8O/gYQQwC5zLOGnEgxnm
	r+JfR1wOlmtyOB2eixhFEb/ztu29nb4Ptnbb7eUp9BYZbXG2RRKcnJFjr5E2xUZiaU8KcLZOucv
	IanQXbyIOVjAF5tqA0sqZB+g+/6oPAnE95RBMSCGGFWt44Jm/NS0z0pPlQWFhdqzjXbPQj/SZlr
	TBm56vWYyLHE=
X-Received: by 2002:a17:907:c70f:b0:b98:d58:f75e with SMTP id a640c23a62f3a-b982f21d51cmr1004548866b.2.1774343853760;
        Tue, 24 Mar 2026 02:17:33 -0700 (PDT)
X-Received: by 2002:a17:907:c70f:b0:b98:d58:f75e with SMTP id a640c23a62f3a-b982f21d51cmr1004546366b.2.1774343853151;
        Tue, 24 Mar 2026 02:17:33 -0700 (PDT)
Received: from [10.43.17.192] ([213.175.46.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cd050c4esm4465259a12.0.2026.03.24.02.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:17:32 -0700 (PDT)
Message-ID: <a01a2cda-9cd6-4694-9df8-d23454ee1ed0@redhat.com>
Date: Tue, 24 Mar 2026 10:17:31 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ondrej Kozina <okozina@redhat.com>
Subject: Re: Cryptsetup renecrypt failed in LUKS2 metadata initialization
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Cc: Mike Wong <mikewongmai@proton.me>
References: <7XqkTH2BWNTfXhvFglwFhH9JKJD4Zk-w6454Gib-gGCqgQDBJZc1owm-UH9fVNGXuUHwOtj5mqBHatFNjawEouB-qpJTzv2G6njL-8TmT-I=@proton.me>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
In-Reply-To: <7XqkTH2BWNTfXhvFglwFhH9JKJD4Zk-w6454Gib-gGCqgQDBJZc1owm-UH9fVNGXuUHwOtj5mqBHatFNjawEouB-qpJTzv2G6njL-8TmT-I=@proton.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8z6wBD9Wk67WK_d4AKKguErZLf4q1lmjlTF3mXF46KI_1774343854
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/03/2026 09:03, Mike Wong wrote:
> Hi,
> 
> I got a "Command failed with code -1 (wrong or missing parameters)" error when trying to reencrypt a plain btrfs partition. I'm using the latest version 2.8.4 in a ubuntu 24.04 box.
> 
> What's the cause of the problem and how could it be solved? Help is much appreciated.
> 
> Below is the --debug output:
> ```
> # cryptsetup 2.8.4 processing "cryptsetup reencrypt --encrypt --type luks2 --reduce-device-size 32M --init-only --debug /dev/sda4"

(...)

> # PBKDF benchmark: memory cost = 0, iterations = 642509, threads = 0 (took 51 ms)
> # PBKDF benchmark: memory cost = 0, iterations = 642509, threads = 0 (took 816 ms)
> # Benchmark returns pbkdf2(sha256) 642509 iterations, 0 memory, 0 threads (for 1640-bits key).
> # Keyslot 1 unassigned from digest 0.
> # Keyslot 1 unassigned from digest 1.
> # Keyslot 1 assigned to digest 1.
> # Failed to read data at offset 0 (size: 16777216)
    ^^^^^^^^^^^^^^^^

There's fail in reading the inital data block on /dev/sda4. Do you see 
anything significant in syslog (kernel) about it?

Could you post "lsblk -t /dev/sda4" output?

Also, for bug reporting the 
https://gitlab.com/cryptsetup/cryptsetup/-/work_items is better platform.

Anyway, I'll take a more detailed look eventually, but without block 
device parameters I will not be able to be of much help.

One more thing, do you have the btrfs filesystem mounted by any chance?

With regards
O.

