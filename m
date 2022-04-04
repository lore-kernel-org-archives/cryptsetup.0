Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264A17C
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 17:07:18 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a6so10411557ejk.0
        for <cryptsetup@lists.linux.dev>; Mon, 04 Apr 2022 10:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=MpeZqSjDdzFN1QjKax0n8fO+IksV90D9zEU/oLqhe8E=;
        b=dz48M9asCaa8UDat5TC0k1jw1Q12952pvfBWr+3BaEYjAITlxzJNuPWRrpyhfyQa91
         41qmgl3qfywcyA4DTxcKhALQechN5M+dzJRBO8/4kcpshnsqP5073XS+FilELvfkgsqN
         R2wEeiNAi8jpWkMUZvcYAywOFCUo1Nyf7mPmW/vvkXY/f1fcNnxYU5Y1TYlaFyBQq85v
         18v7V/WUyyzrx2Lc/yvl0+EfQvli4zqlDJUpYzx5jaqoRcWyvvOYEdS7/94vZ7hJOnnY
         I68iC/xP9ExYM2ggcQJ7SqRUdrOd4NE7NOWS9homWJ8XpqSWws+1z/cvOxNLK5fRz5+g
         jjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MpeZqSjDdzFN1QjKax0n8fO+IksV90D9zEU/oLqhe8E=;
        b=HRTQyuxBPa4FmJ7E8tup5ObC0TQtcLgk1di374Db3MOLRS8jQHyb4HSYgYKBmsfM4a
         PtDy1kn9X8llrQYxmjzrxsrQcF7rJMVsUjFoXXsA/5Sh2qnZzHwbYTOziZmus2DrgjH8
         NDUkBL8VgncKTPAny0foUhqigbo6eKk++YYlkJuAYrTe5X9mJv0sWQKeD2evCB0x3EcH
         j0HYQhw4hCmymP/xNTR+lzrdLDwCXrMIwwClcTyc/mwE77FcXw2RoEDfH7b3hd6Y8SKN
         sblQw3hh8axL+ZXvNrh/gFiR/na6RmeaOJSdfnLQYVdXTPNLWpEt86bm2F5aFgORhnOg
         V8Dg==
X-Gm-Message-State: AOAM531/KYiobPITZOjqQX9+XtBiKpEh8jeE09CtDr3QeS5cmgpVYr3m
	HIemPiwvFa/42+3m5G5tVt83asgIAH0=
X-Google-Smtp-Source: ABdhPJwIZrkWoOO91C2XtYDLBuZmoRNngw7O22VqVGyucd/M3RO5OiNd9fcPU37T/qEZVz69eYqW3A==
X-Received: by 2002:a17:907:1ca6:b0:6e0:94d2:fcc9 with SMTP id nb38-20020a1709071ca600b006e094d2fcc9mr1031201ejc.473.1649092036382;
        Mon, 04 Apr 2022 10:07:16 -0700 (PDT)
Received: from [192.168.2.27] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id gn3-20020a1709070d0300b006e1036666bfsm4530451ejc.223.2022.04.04.10.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 10:07:15 -0700 (PDT)
Message-ID: <60fd4577-2409-5d5a-a615-b1b65c0f5fc8@gmail.com>
Date: Mon, 4 Apr 2022 19:07:14 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: cryptsetup: /lib/arm-linux-gnueabihf/libcryptsetup.so.12: version
 `CRYPTSETUP_2.4' not found error
Content-Language: en-US
To: Geza Bohus <gbohus@yahoo.com>,
 cryptsetup development <cryptsetup@lists.linux.dev>
References: <etPan.624b1819.7c3954eb.74ce.ref@yahoo.com>
 <etPan.624b1819.7c3954eb.74ce@yahoo.com>
 <2bdc84bb-de25-3a07-450d-0001a602030c@gmail.com>
 <etPan.624b1fa6.52ad5a2e.74ce@yahoo.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <etPan.624b1fa6.52ad5a2e.74ce@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2022 18:41, Geza Bohus wrote:
>   
> 
> Thanks for your reply. Of course I saw the problem with the versions, I just don't understand how it can require a newer version than what apt claims to be the latest.
> 
> If I understand correctly, you're suggesting to do
> 
> sudo apt install cryptsetup

Basically, yes.

You have somewhere in PATH new cryptsetup tool, but in lib dir old libcryptsetup.

(If you installed it manually, it can by in various non-standard locations, so
the best is check "which cryptsetup" (or "type -p cryptsetup") and remove it
from there manually, then reinstall the version from your distribution.

Usually we are backward compatible, but it is really not a good idea to combine
different version of libcryptsetup and cryptsetup.

(IOW what you see is the "correct" error caused by library symbols versioning
to prevent a malfunction :-)

Milan
