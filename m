Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338483594B
	for <cryptsetup@lists.linux.dev>; Sat,  4 Oct 2025 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759601869; cv=none; b=Q1TtC05wosTblu39y1EPQOAGAYTdnETqP3vRZPCLGiJF3Z65Qq02/5PtL/Kn61ginmLFrbM9a98cyYMjlfi9JsbcD8U/Vx8Ftio7GEeS02CCgxiVze9W6XrQTdcnARvX7EkVFtzzoxwHTl6vu3dCSGPKEpur5Ve+2PRLANNI7lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759601869; c=relaxed/simple;
	bh=+ZRD0mvwQqGc+1uNlAgEdGLaGxNbIFTcqlsc+GqXrmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=H5TvFu84NjbEYwyKVbCvjbViafTSPr6CHww1Ixd8RBf8bpPz8a5B0HTzlfLpv5xGJAbBbjKPzASL7HcxYdkqwQnCJ+889SFe49844M2x8zZR/mXljSyKnw9HQz9bzQ/EfNMb4nwnUn6/R+PsmYuBNtE2v16bWZ81xcQxzYYMtAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HekVS4f6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HekVS4f6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso23944145e9.0
        for <cryptsetup@lists.linux.dev>; Sat, 04 Oct 2025 11:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759601866; x=1760206666; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9cyGb5/2JiYy3IRXvwWhCJO/NNAZYMww0Z4Jpzg8p3Q=;
        b=HekVS4f6iQu50oPRjIBWsfX8CG5gfjMKTxyZEf9VDyP6L8/E+AUE72OcAKMXvyueyx
         mVPwiM3fWA0WyEoZ5Uy2qBDrH9xRdKf/+uh3CHvWra6ICVxWgl4TYLPDllsF/Y+BvfuI
         /ROTZcqJKMm1u+bED2pz+qwL4rNC6e1QexD2GDx9vjRRT9kLshmPvcVHETgtlWhEl96W
         i8AJ1eIzF7aqBVC0rmqeEKoXYmcqpD5SWcWYPEw50V2vK8SKzfaTBKOYs6+7lopJ89ZC
         T68NN8bR3KBjwvaHRygLtY61D2wytJDTE4aUKTJcMcSchS2S+xAvvle6tLdpQIVOJEML
         c43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759601866; x=1760206666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cyGb5/2JiYy3IRXvwWhCJO/NNAZYMww0Z4Jpzg8p3Q=;
        b=jK1vj1JwLQoM77CPpGblHDrA0aGY6z9c9UKanmtnUixy/7pCea9COnTJgvx/+jfWXT
         a0VAQcveXs9rEqbbRKUrdjLhRdjxPeUheRlcCXwtzSUby3Emx5gUBE/PJDfQ1fsGlc3T
         WEBXGxine8rJIhKm2TuQ9kF7mKjAaJJ29b8F97dywJp8UEFK2E1HEab+zUNVSI9SY1LH
         Q/v5C2qGrvRQ3kV9m1RTOHze8oudexG6z2HpPzp01VhlADGb1c3xdtWUWPZiRD9X3Dlq
         xexlptGE4Pz+tvz6RM10hs0o3bxCiiaghl/OLynsMzEK/meog/4wHjxLTixMxJcn6Rst
         k7kg==
X-Forwarded-Encrypted: i=1; AJvYcCX9G2gnbnqrA2GvbF/1vsyMjuZ+4viK/GjLr5PPFnPtAghJnzr0LnkZ3II1S031/HZf9MQqTeoDR0hC@lists.linux.dev
X-Gm-Message-State: AOJu0YzkdnLcjgmugVF1dtrBT9i1InriIqpcbXk7RqYKZIFrdhJYJLfs
	HmW9/hdHO6+cP086HL2N0CPrkckMJM7dtL8UGx442w45BZZJY2xHO5yt
X-Gm-Gg: ASbGncuU/gowEg7lQD9WUa//qBg6nG1ACCnvtco61UirKbSbAE6NA/V4H2ROijsaMxz
	vU5QWNLVDdwBM2/QPhVF26xwwjbZsEKjUkxxy9YC+jK3K85C/7iv22BmWJ3vZyVpGrX2v8fsXey
	snLZ3Fj2xLJ26WX1ca5hmMHM5lGdJZ9PusGYD5eTgpTuJcRG79938GVHrB403exkD+kaCAAlMy7
	pA7ro8f8G+bklgG/JfCA+NR/KP9Yq+w4CF0JyRSFFz4Ar+2ab1ZEgtpiCbjV4Bc55nOwIi5bn7f
	i1c9kthJW6aSNcHeUq5uTxgdI1koOlZVA997eqYk4rZI55ttVMIk+EUJtA0qiXpyx8KDdRBRi50
	mrGOqhyQDGCNemUOKgPqJ+HORlJ9WIBskv0Wlv0Nnuo+DHAxJ3KAj925SiY49AKRx+d0vGBI4
X-Google-Smtp-Source: AGHT+IHDaYVkLrn7u2D3tv2C6PZW+1RRKnGHjmD0NaXTbEY0HhKDrUd9fm8jTS1vwNBQjV+j8NJMRQ==
X-Received: by 2002:a5d:5d88:0:b0:3ee:1523:2310 with SMTP id ffacd0b85a97d-4256715add3mr4632741f8f.27.1759601866149;
        Sat, 04 Oct 2025 11:17:46 -0700 (PDT)
Received: from [192.168.2.12] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8acc4csm13041954f8f.16.2025.10.04.11.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Oct 2025 11:17:45 -0700 (PDT)
Message-ID: <61a493d0-0236-4508-aec9-b29ea6433244@gmail.com>
Date: Sat, 4 Oct 2025 20:17:44 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Bitlocker: Support clearkey
To: Kfir Kahanov <kfirka3@gmail.com>, cryptsetup@lists.linux.dev
References: <20251004003554.234647-1-kfirka3@gmail.com>
Content-Language: en-US
Cc: Vojtech Trefny <vtrefny@redhat.com>
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <20251004003554.234647-1-kfirka3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/25 2:35 AM, Kfir Kahanov wrote:
> This code enable support for clearkey bitlocker protection.
> Closes: #962

Hi,

as this is not trivial feature, please submit it through
merge request through GitLab project page.
You already have issue there, so it should not be a problem.

This way it can go through CI and all discussion and changes
will be there. Also it need to include some tests.

For the patch - we planned support for Bitlocker clearkey,
so it is definitely something that I would lite to merge.

However, I do not understand why you need to touch API
and other formats. The whole implementation should be embedded
in BITLK format support only.
IMO if Bitlocker header contains CLEARKEY, it should be used
directly. I know it will be a little bit tricky to support
it through existing calls, but I definitely do not want new activation
API call and commandline option for it.

Anyway, this discussion should happen on Gitlab, we can
discuss there possible options for integration.

Thanks!
Milan


> 
> 
> Kfir Kahanov (2):
>    bitlocker: Support clearkey
>    bitlocker: Add clearkey option
> 
>   lib/bitlk/bitlk.c         | 106 +++++++++++++++++++++++++-------------
>   lib/keyslot_context.c     |  97 ++++++++++++++++++++++++++++++++++
>   lib/keyslot_context.h     |   2 +
>   lib/libcryptsetup.h       |  24 +++++++++
>   lib/libcryptsetup.sym     |   1 +
>   lib/setup.c               |  24 ++++++++-
>   src/cryptsetup.c          |  20 ++++---
>   src/cryptsetup_arg_list.h |   2 +
>   src/cryptsetup_args.h     |   1 +
>   src/utils_arg_names.h     |   1 +
>   10 files changed, 234 insertions(+), 44 deletions(-)
> 

