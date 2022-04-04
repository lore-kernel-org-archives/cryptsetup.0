Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED3E7A
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 16:26:50 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id p15so21071331ejc.7
        for <cryptsetup@lists.linux.dev>; Mon, 04 Apr 2022 09:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=FeDa/Z5I5ob3+DQqOiIL4JKFvKnay+aGW/aqhl/ovpc=;
        b=HMhy8pXizIkrC6SwBL5EEdB87Dt9tFyV/azZT2lF8YqfiuaBhD8tfWLOa7JbDaRoaq
         oGA08BlUds8Nun0CXLTnfRafGQcu9fTIN7nseo1DPWbql4apIrZsVrFA6r2cR42f2Fny
         wut+BD3tHK9qx90ukjKqTZM4Qn5WAV2lpvtThPH8jsiihmshZ3tLQQFOw7BJoGuxY69v
         zqQEDMRktrSrfCgRbMLep6LjwfIqnbP6gSnzk6Q5JDpSMTuukkeOGeAo0yo2Vn9AgsuC
         S/DsNY0wIjVxVZF2tcab34IkW4wq5V5x+pDCpyOj3+1P6oU4tq6ontpQEbexRE/FB5pA
         8z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FeDa/Z5I5ob3+DQqOiIL4JKFvKnay+aGW/aqhl/ovpc=;
        b=o7MziHfQA68uvy2R7oMGwzhwmLNOUpDnZYTk/G31mOEigQqsgdsP4cjSG1wQ+hUpyf
         dZgDYXioVQkuoJcbTKhQEdMkd1c+bcDCaAfSN6gUtoSdHbxfPRRsi7N+0IJyoJtb6d7Y
         C35Igv0z3PPCnRi6gFOkuNpqxI4jhkzUF0We9V//2nJ+fP8vkvVtLtQPlHA4qwc6M4sh
         So0CuJ7KpVeYt+FZiZppcc0kcv7M0QO54ATZ/z6yRwdnGUfYMqSjvon5tDgb3i+C+z5o
         qFpmbjkNHQ9EOUYzrt5shaAEgzjNjl/veZCFZtJjJz3YVjAsY2rb6wj1GwJnk/RGV8Xl
         +jsA==
X-Gm-Message-State: AOAM530rATFVgL1aSES9EJfrf2Pv4AM6kefom0AV4jf6hSDFIhs1Ihdo
	fZS1VqJPv4IbFgOtrZwGRltKftlHED4=
X-Google-Smtp-Source: ABdhPJyBj6TTZDWfjMEzWDz8FS8L7KS30WsLDkbWx86EoSs8b/tWGkioZTjGEjNnphfaOCYQTs5sKQ==
X-Received: by 2002:a17:907:728c:b0:6e6:d8c7:5b50 with SMTP id dt12-20020a170907728c00b006e6d8c75b50mr882611ejc.726.1649089608369;
        Mon, 04 Apr 2022 09:26:48 -0700 (PDT)
Received: from [192.168.2.27] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id pk9-20020a170906d7a900b006e05b7ce40csm4536917ejb.221.2022.04.04.09.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 09:26:47 -0700 (PDT)
Message-ID: <2bdc84bb-de25-3a07-450d-0001a602030c@gmail.com>
Date: Mon, 4 Apr 2022 18:26:46 +0200
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
To: Geza Bohus <gbohus@yahoo.com>, cryptsetup@lists.linux.dev
References: <etPan.624b1819.7c3954eb.74ce.ref@yahoo.com>
 <etPan.624b1819.7c3954eb.74ce@yahoo.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <etPan.624b1819.7c3954eb.74ce@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 04/04/2022 18:08, Geza Bohus wrote:
...

> I have installed cryptsetup-2.4.3 as described here: 
...
> 
> apt claims that I have the newest version, v2.3.7:

Do you see the difference in versions?

You just cannot have old libcryptsetup with a new command line tool.

Either install everything from the distro repository, or install everything directly from upstream,
but you cannot combine versions this way.
(Here new commandline tools depend on new API calls that are not in the old libceryptsetup.)

Better do not compile it yourself, use distro provided versions.

Milan
