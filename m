Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6824683
	for <cryptsetup@lists.linux.dev>; Thu, 15 Sep 2022 14:17:33 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id lc7so42591035ejb.0
        for <cryptsetup@lists.linux.dev>; Thu, 15 Sep 2022 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=uK5lT5fhFhKy1JpR6sS7jaBJZtK5f4DjhkLIjuaF7EI=;
        b=KyafTOTo3UrYUoT9VpKNnPKxBCZwKUA9f+SggLZvEmcN5JlpEVtp4Xr7bumD7GQjsB
         3v99UIYEEnP5rg6i2RO6RUVIsuG4Su+rQxwYIt16fmQ8tgvLLI0ae3hk0RnNCSdwSMCi
         /zbSNqydZXh9ASMab7WtNiPGa8+1hgD4Jci4R0QLkJqU/mElKVz6jgVto024LXavfuIj
         CktuFsdXtnw+veDkUjiwkLMikzn0fXN5/xfDbnIsZaT3Cj+dA9NVYqVwvl6CmrEN+Wzu
         oZuOvmSzjpnI0xdBCO0bEZDMLKYiiE/IRQuiZtBzij6zF+iVQ5dCr0iqOcIluN+blr1e
         xfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uK5lT5fhFhKy1JpR6sS7jaBJZtK5f4DjhkLIjuaF7EI=;
        b=MD/7W0t22I+NDbMD81jO+gL/ts5+cgl6lYccsFTxNTP2wPDj7gHXSV31nLMbWoLuBv
         0kEz8qeWi5eed+D3kB/w1yBXJgFANJiwwhyrf4LXa/6he53cJ2yy+/GfElZbZvdUi8VC
         Xc94A8Xyxvds074tT+a0dyCeEMx/1XK8UU8oa5sE3DkWwaMdcr95VfyvUsl/L6Mkh46X
         d2rYC/JFXXXUyyq4MU0cQWGBBfZ3mPXQED4H0Am3LtjiuF/ylDa/N5dYkrbkcbR6f6Ka
         8mwWVPuy3Fzg/LBw7vnOlEOL9XC48DQUSmOUMPDRA5f0o0Ya4YdzBvLA1xQQTFS2jwah
         6Afw==
X-Gm-Message-State: ACrzQf22gANMT+xPOgR/f0my6uPW36KReuqo/Anbp0zJ4PrTH31X2vSO
	I1MX5ZFoF7h1AJxeQLGX4zN7WDAxvXY=
X-Google-Smtp-Source: AMsMyM4biCO2EzzYS3Qa6RYhH8gpkpXedGwZ9BHTdAhK4g25buxk+geAn+BD5/7K/hnRBbR71I+nNA==
X-Received: by 2002:a17:907:75e1:b0:73c:2333:7135 with SMTP id jz1-20020a17090775e100b0073c23337135mr121795ejc.495.1663251451217;
        Thu, 15 Sep 2022 07:17:31 -0700 (PDT)
Received: from [147.251.42.105] (nbbroz.fi.muni.cz. [147.251.42.105])
        by smtp.gmail.com with ESMTPSA id p20-20020a056402155400b004479cec6496sm11940578edx.75.2022.09.15.07.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 07:17:30 -0700 (PDT)
Message-ID: <aef47dfb-e253-114e-e4a1-fa6c4bf369f1@gmail.com>
Date: Thu, 15 Sep 2022 16:17:29 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: sha256 in "AF hash" despite using sha512 during luksFormat
Content-Language: en-US
To: "doffloster@gmail.com" <doffloster@gmail.com>
Cc: cryptsetup@lists.linux.dev
References: <CACHosL-Nxs5dHJddw8RjqnK4d7OewzA2FT6G1ZQcAhw=PzLLpQ@mail.gmail.com>
 <7f403984-bd0d-9b75-d0eb-0cacbb41810d@gmail.com>
 <CACHosL8YcOXCouZvhTX4rn_F7buVj7tdiefEbHvgGwbfC3t-CQ@mail.gmail.com>
 <8d17f923-271f-d0a2-f28a-5cbc910b6513@gmail.com>
 <CACHosL_rLDJss0N1rmszEEtsaxpTdXwV9mXHbTNMWO62AauYTQ@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CACHosL_rLDJss0N1rmszEEtsaxpTdXwV9mXHbTNMWO62AauYTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2022 14:53, doffloster@gmail.com wrote:
> 
> Do you mean that the choice of 'sha512' for the flag '--hash' is
> reducing the security strength?
>  From what I could understand, it shouldn't reduce the security strength.

No, I said it will not increase security (while it can increase processing
time and keyslot storage space).

> I executed "cryptsetup --help" and found that the following default
> values are defined:
> 
> "
> Default compiled-in key and passphrase parameters:
...

> As far as I understand, for LUKS2 the default PBKDF algorithm is
> 'argon2id' and default hash is 'sha256'.
> So, I only changed the default hash to 'sha512' by using the flag
> '--hash', though I didn't change the PBKDF algorithm, so it should
> stay the default value, i.e. 'argon2id'.

Yes, it is visible in the luksDump output.
SHA hash was used only for AF for that keyslot.

> Also, I didn't find any mention of the 'Blake64b' hash.

Sorry, my mistake, I meant Blake2b; it uses 64bit words.

See Argon2 RFC:
https://www.rfc-editor.org/rfc/rfc9106.html


Milan
