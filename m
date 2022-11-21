Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5126EC0
	for <cryptsetup@lists.linux.dev>; Mon, 21 Nov 2022 11:07:15 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id s5so15676227edc.12
        for <cryptsetup@lists.linux.dev>; Mon, 21 Nov 2022 03:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=084EsptsREz9ubJTuX7jTKksIWiSy5jUcASHnwgtzBE=;
        b=bbz+mUlIiuubnORDMOyQB2B3YFl9ROjorbe9nuHk3is6Wopp/7kNWooSvzsXo4K3OF
         W29/PlHvKdsgIRon1S36eqrcS7ZGjzcGsMtieV0cNNNXBJ36pdEof6UOgXDt/JtSnI+g
         8Z2nFaG0DJZUHgvKbWELzXWU6VsmyYp2qRnMvMCOSBBbuePPwb2cCKooOJWxQm+MOxoM
         FJAcok0VdCXNvaqjUXLzTnYaw3MwDFMjhFrXvTfefP5EaFp/UL4TfL+j0em37CQUmyyu
         No5n/U9dzm1RToEBGPSNfZXHAwgyFWlBf1WdIqY1c8W1PSP4zyv7KJSTyL6+ewu5OKtX
         /lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=084EsptsREz9ubJTuX7jTKksIWiSy5jUcASHnwgtzBE=;
        b=TiILCSmOnEz/et2GrOpV+X/xp1tL4v5Zg1u1e4Wu409qR4Dq7UGW2tVKPBndArrM3r
         Vf2UXMuOCx7B3KAUySLifFs/KVuYfPeIeT5OE4Eg6GyVviXhOSoKtybUHbdLz1ophags
         PMbxVnTPT5g8y3+B5vl/kdoePZj0lBupPPXRp3/M2HbXMu+YdjGRtafh5cLTYVn7wxr3
         d4kCIdlFbPHCfN/i9fXg1n78nIJW29GwnHcckPrPQxdgB6uWgmFnzhe9T+RIbaqXbokw
         0ABYuDmQWLZSK4kktKFbXNIswNOOm6RhIbZ9V9x9ncyhs/4662jKuLhPeN3nishGK3ri
         pmLg==
X-Gm-Message-State: ANoB5pluER8ZxUhcNGa3f95Y5UgQWBuhkOOpROIi2oz4Tz+pDIkhgB1D
	9ju7Cg7i+CUPBiuSimXo8Yo+c6cwmQY=
X-Google-Smtp-Source: AA0mqf4oK21yGG7Kv5BkqARr0uVrKzLg0yjKraCeTeD1wlu9XWPyyashDLjlGTyZ8wAYmoq0M26AQQ==
X-Received: by 2002:a05:6402:4020:b0:461:9d22:348d with SMTP id d32-20020a056402402000b004619d22348dmr15591511eda.76.1669028834023;
        Mon, 21 Nov 2022 03:07:14 -0800 (PST)
Received: from ?IPV6:2001:a61:a82:ad02:5237:eb57:e046:3774? ([2001:a61:a82:ad02:5237:eb57:e046:3774])
        by smtp.gmail.com with ESMTPSA id l4-20020aa7cac4000000b00461bacee867sm5006498edt.25.2022.11.21.03.07.12
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 03:07:13 -0800 (PST)
Message-ID: <152dd874-c1ae-8190-9878-e69cada4edab@gmail.com>
Date: Mon, 21 Nov 2022 12:06:57 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Frequency of backup of headers for LUKS1 and LUKS2
From: Lamy Geier <lamyergeier@gmail.com>
To: cryptsetup@lists.linux.dev
References: <5b560ee4-2813-6aa5-484d-1754e118bb90@gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <5b560ee4-2813-6aa5-484d-1754e118bb90@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Given that I won't add or remove any key from header key slot, or I 
won't re-encrypt (i.e. change the master key), how often do I need to 
backup the LUKS1 and LUKS2 header? Is doing the backup once enough and 
making sure that the backup is not corrupted?

Are there any other situation where one needs to backup the headers of 
LUKS1 and LUKS2 more often?

I was wondering if the contents of header changes in any other way, that 
requires backup, if it affects restore possibility.

Thanks and Regards

Lamy
