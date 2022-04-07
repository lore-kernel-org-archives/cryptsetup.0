Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89312560
	for <cryptsetup@lists.linux.dev>; Thu,  7 Apr 2022 12:15:03 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id m30so7609282wrb.1
        for <cryptsetup@lists.linux.dev>; Thu, 07 Apr 2022 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=A8nvQP7WStRd5ZTbC68Iqv5zgL3JpV5UdhB/7Sp3/uo=;
        b=MxyQRpjDahcUWtFoCzSTmjGC0XZcphnQNC/uo2vGVlLZQN2kc6mhUCPkznSu5/HwoH
         SKusQRYNRMQEG3x9xa101USxC/2JpI3OCLz7/tyPKHsR565IqjlyRHUF99c6sO4GSbKt
         bLc4fndfUptpRDGp4mLlbiJRQ8NTKlM6ufqM3UWbRNgU2HpUH6UuGe3Hr8h/kPYbMP+s
         DVsHwZwayRvKIV4Z/NanjYizyAAmcDKHJhIyYCk1BqKSMJ3uJ3jPXYp520wiaXoOwXRB
         szXuXLUVCQDa0forgESUOWE084wMjm1vWgRM6T7tyVQwNpVfVYRibkwqt0jZcivmaUr7
         iu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A8nvQP7WStRd5ZTbC68Iqv5zgL3JpV5UdhB/7Sp3/uo=;
        b=vIeAiXe5Tc8MlV7V05QNnUhz3f7qoOXwZMqOCnRLtWmlQTp4jrTZeBcBqMWNofRdch
         1sZFGJojjsK4+KyIiCleA1serVtUTl3kK2IUR6R9RMdxLZ5cIO7dKHubwJS/UebQaov0
         xKQ4HtUfNXqYsR+EDURIDX5L1JmbR7YFV1B2XJuNN3Xb7bVv0gz1KBYzDzAFW8SSbO92
         pyA+Sgj5dixV50FJBQUZDIcjjDxsB40nD1g7BxS84ZT6kFu7YppzVqo5o1AzL/ZlERis
         BQZsw93RJBqhLs0QKNO1Mxm3o5s9PemRKuA1Gbx93/FW4F/FrFRhMhVlm/6RHkoCvoYd
         ldAA==
X-Gm-Message-State: AOAM5339SyrkLYPzs9ltwIvqSx9is3KcM8JnMmjEowguI+OWNK7C0/Ff
	JFScOTknZFRz/W4LROor2zKkZ1hx84U=
X-Google-Smtp-Source: ABdhPJxUZsFvcETllI9E2Lvrfv+53OclL/IB6sLyL5q3nRnuOXXXirZWlO9GSxm5SSpQWow6aTDRIA==
X-Received: by 2002:a05:6000:2a6:b0:203:ebe1:2900 with SMTP id l6-20020a05600002a600b00203ebe12900mr10588130wry.423.1649333701989;
        Thu, 07 Apr 2022 05:15:01 -0700 (PDT)
Received: from [192.168.2.27] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id k129-20020a1ca187000000b0038e6e789f08sm7471060wme.39.2022.04.07.05.15.01
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 05:15:01 -0700 (PDT)
Message-ID: <6db5c4f2-4d86-05d5-bb04-557aed30a8c1@gmail.com>
Date: Thu, 7 Apr 2022 14:15:00 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: dm-verity setup on loop device
Content-Language: en-US
To: cryptsetup@lists.linux.dev
References: <CAH4tiUt1_1B64=QgU7uXmnBZZw=4FYEHtN=rZcx-zANJSbaYSQ@mail.gmail.com>
 <b59b57b6-1468-1041-bdbd-ec9399329dd2@gmail.com>
 <CAH4tiUtK_faaxTW72Z2Y56j2FG6-VCju9LJPm8JDEUuNjenBYg@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CAH4tiUtK_faaxTW72Z2Y56j2FG6-VCju9LJPm8JDEUuNjenBYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2022 13:42, Jasper Surmont wrote:
> Hey,
> 
> Thanks, I didn't realise you also had to use the -r flag with dmsetup.
> 
> I've got a few more questions concerning dm-verity:
> 
> - dm-verity itself (not veritysetup or any userspace programs) expects
> a full merkle tree to be built and the corresponding root hash to be
> passed as an argument. I saw in the source code that the constructor
> will verify the root hash using the sig if enabled, but does it also
> check whether the root hash is correct concerning the hash tree? i.e.
> Does it traverse the tree to check if the given root hash is correct?
> I don't think so, but since there is quite a lot of code I might be
> missing something.

Best read Google design doc for Android, I think that is where you aiming
at anyway :)

DM mapping table need to receive a correct root hash, I think incorrect
format is the only situation when the device is marked invalid immediatelly
(see dmsetup status).

The verification is then run according to reads of the device - once a read
comes, the path in Merkle tree (up to the root) is verified.

And in normal situation reads come immediately after activation - because
udev initiates scan of the device for known signatures (blkid).

There are several optional performance optimizations, though, like ignoring
empty sectors (ignore_zero_blocks) or to cache verification (check_at_most_once)
see https://gitlab.com/cryptsetup/cryptsetup/-/wikis/DMVerity
(I do not like it, as it allows some attacks with switching underlying device
content, but Google apparently need it for Android.)

So it depends on configuration, but for default, everything should be
checked on every read up to the Merkle root hash.

> - The documentation states: After instantiation, all hashes will be
> verified on-demand during disk access. This means that the hashes will
> be verified on every read to any block on the data device right?

Yes, see above. There is page cache above the block device, so not
everything propagates to dm-verity repeatedly.

BTW there is one special case, when device is so small, that only root
hash is present (then the hash device contains only header).

> - If the previous answer is yes; where is the actual verification of
> the hashes done? I see a lot of functions with '_prefetch' and I know
> what prefetch is, but it's all a bit confusing to me.

In normal situation it is directly in kernel dm-verity kernel module.
And it *is* complex... You have read the code here.

You can also run test verification in userspace with veritysetup command
(good for testing injected data corruption).
Android has own tooling, but veritysetup should be compatible with images
created by Adnroid tools (including additional metadata areas we do not use).

Milan
