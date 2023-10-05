Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC8820E3
	for <cryptsetup@lists.linux.dev>; Thu,  5 Oct 2023 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="hp/A6hGj"
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32167a4adaaso707140f8f.1
        for <cryptsetup@lists.linux.dev>; Thu, 05 Oct 2023 02:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696497140; x=1697101940; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0OQhAIYEhYa3HfPnFC+jh/eTAgq42HvC80IMaNBtto=;
        b=hp/A6hGjw2UD0Tnu/N3qMk1oYPNpcv4qz8SZGFQLKCUS622de5RtYNIssKqsFVTtRW
         nyrp6d6SuZVegUD4K/tfYYcSSheOCojAeiQ06fZ4uSwpxuypO1i7fBMoBcaCYQBhhYCi
         /fE6RIe66gBVOm1T42lEzytiLgIBToLRs+B6NsnAqDUnd608K00vm989N67J08uIIYzH
         yscZVpdyHuG63nFscbAvvMIS02t8xiHi0X4hCRdYtTGQq5DmUpEQNGWcYf7pZXsKbE6x
         ifM+VbFXqKqXNo5GseGKG1kfE35Rtz58u3OYFrwct35d9drxg4t5/6+0t2qbOG9lsQlz
         4ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696497140; x=1697101940;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0OQhAIYEhYa3HfPnFC+jh/eTAgq42HvC80IMaNBtto=;
        b=sz8fwLfNCazzWZSA2KcjDn1LhSQT0EyzUewfqwahustoCDGkLLiMpyT/riNTRjMwot
         1CkDpDblbeNy+3b2+TuSc+/3sTvkgHE4iRzbtyxih9fqMe9gOaG009mOkKJkrcY7tCeI
         dNeh/pt6L1aQZjSu/d0dRJYiZyJbuG/9ysjiNa7/h3YytRTRPp4SqdrVrDYWZ94JOVy6
         8TUzOxZ71NwHQHjjvcjQaLF/RjYIyfifn7zp5r4QNJNZffyCwf1H0muNAifKCf7oTvuO
         pRcpYvxWFTz6XoWY5BloG+t+yI/Cz7BfYFzjeZ/xk1kpVGq9PVRcJxHwi9uN+/bRqOWY
         5hfw==
X-Gm-Message-State: AOJu0YxaDHVB/lVwk+D8QGueG17Eoe0a7YhAB4DMviCBq59LLNahhQkh
	D7OSasXc6aBp64uhAcde4XZjBkKJCW8ICAIM8a8yJA==
X-Google-Smtp-Source: AGHT+IEjDRfbLPJcXibxq93lN7dEqH2PmMdppR89n3qcQz3wuf2sQLSg2YA+zuRrDDgO26pZZ89T9Q==
X-Received: by 2002:adf:e542:0:b0:31a:d4e1:ea30 with SMTP id z2-20020adfe542000000b0031ad4e1ea30mr4039206wrm.17.1696497140347;
        Thu, 05 Oct 2023 02:12:20 -0700 (PDT)
Received: from [10.1.10.69] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id v15-20020adfedcf000000b003179d5aee67sm1290133wro.94.2023.10.05.02.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 02:12:20 -0700 (PDT)
Message-ID: <2b755969-f9c2-0110-7987-874713483662@smile.fr>
Date: Thu, 5 Oct 2023 11:12:19 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Feature Request: "Fake Trim"
Content-Language: en-US
To: charlesfdotz@tutanota.com, Cryptsetup <cryptsetup@lists.linux.dev>
References: <Nfx_Hmi--3-9@tutanota.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <Nfx_Hmi--3-9@tutanota.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/5/23 04:05, charlesfdotz@tutanota.com wrote:
> Hello,

Hi,
(mail resent as text-only for the list, sorry)

> I would like to request a feature regarding luks volumes. I had wanted to post this to your gitlab but they want a credit card and phone number (?!) to sign up. I hope doing this via the mailing list is OK.
> 
> I would like to request that a new mount option be added for luks volumes that when enabled would allow the luks volume to accept trim requests regardless of the underlying hardware and then to simply write zeros to the sectors that are trimmed. This might seem like an odd request but there are a few situations where I think it would be useful.
> 
> The first is that currently it is just not feasible using luks on top of an SMR drive if it doesn't support trim. Currently an SMR drive if left untrimmed while using an encrypted volume will have performance falls off a cliff permanently after enough data is written to it. For drives with trim support this obviously isn't an issue but at first glance drives that do not support trim would seem to be worthless. Fortunately most drives that don't support trim are smart enough to "time" a sector if it gets filled with zeros (you can find several accounts of people "refreshing" their drives by simply dd'ing them from /dev/zero). Obviously you can't do that if there's a luks volume on the drive because it won't actually write zeros to the disk but if my "fake trim" request were implemented it would solve the issue. This would make proper encryption possible on a large subset of previously unusable drives.
> 
> The second situation is using a luks volume on a virtual machine disk. Often time the VM disk will either be compressed or a sparse file but if encrypted with luks once all the space has been written there is no way to reclaim space. I'm aware some virtual disks support "normal" trim but I believe this would still be useful in some cases.
> 
> Sincerely,
> Chuck
> 
> p.s. I figure most of you already know why SMR drives don't play nicely with encrypted volumes so I glossed over it but I can elaborate if you'd like. Thank you.

Not 100% sure but I wonder if it's possible to implement a device-manager element which take trim request from upper layers and transform them in "writing zeroes" to lower layers (this element being otherwise transparent).

All you would have to do is, then, to put this dm-faketrim just under the dm-crypt in the DM stack.

Would that work for your use-cases?

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert
