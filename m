Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6302904
	for <cryptsetup@lists.linux.dev>; Thu, 11 Aug 2022 06:42:35 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id e13so21685406edj.12
        for <cryptsetup@lists.linux.dev>; Wed, 10 Aug 2022 23:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=GTdR5Zb0BSoxZwB5DTVD/4cp4GBormXVG5wL/43lVUU=;
        b=oQetTZBB/9PAi3NuW0XvmGGhHvkRAZlM3toj5kQSIl/r3VxESfLSaFCgfTNh1DHcxn
         LWMCrtwpWbdlvuXpq3gn72LP/Yo5QuOCr+t26anSnf5EUrH0VnQkzg+5dx7MqQ3ugOPj
         n9HYD7GLz7mNy7nqxkaaNZ2sgfYt/qv7ADOwfx4nHw0iA3DmVfJ60dzr0iwjB565q65/
         vtWk7TlJQAB3oGnCWGxjs1LYtRgxWv2F8k6Cr/gbxN77BC5lUKqM8UDrF6COWE1lDB6n
         w+X7ZGQIJGWmJFUQcJqdL2CjrvyCWc6g3t+2Uqwbby7Z85LprvH4bovCE4mlYqPDFike
         6ptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=GTdR5Zb0BSoxZwB5DTVD/4cp4GBormXVG5wL/43lVUU=;
        b=rWdwnfTza6y7xDyOtEHal66eJ37uiEBLFKrBVcJi+L2/t/jSCnYNWJdGq0R98Z+WiU
         aC18EqFbX9oqmyq60tksq82ixLa2gptpb2PA2BjVz0GtXlreA4A76uFLkzY03A4L2Ed+
         sPgmvnXy5cChvPRCJ+9G3UtwOamSRDj4jA08hCMOIUDxVZ0yjkZVU394d+ofbgSBYYvK
         M7r8QbmR1uv3oqdT4Xl1CYRMlwoWJjjW322TY3DgHMLBdl2oKhAeMY+E6jwMXpAU/MOW
         pcz/OU0uag1k2ihF2YhNXd32Jz2cPaFc9YJt2l+hVB4i3DW4p/Gr1A355godV4BTzpxG
         V//w==
X-Gm-Message-State: ACgBeo3QR396Y9SuU1+4XivWiskpY/gqXMKEUWqwt5EeOV6X8wAWoFGu
	ikrva1qZbAlVIYSMYnAIdNG/8KXEaDk=
X-Google-Smtp-Source: AA6agR40QNGTP34/cu+qGkGyYUFQyCeG5J2jbqAgb7ZzLYE44wU2qcs+S9W1HThnlN3hCaYckDJXvA==
X-Received: by 2002:a05:6402:2802:b0:43a:9098:55a0 with SMTP id h2-20020a056402280200b0043a909855a0mr29216715ede.179.1660200153961;
        Wed, 10 Aug 2022 23:42:33 -0700 (PDT)
Received: from [147.251.42.105] (nbbroz.fi.muni.cz. [147.251.42.105])
        by smtp.gmail.com with ESMTPSA id r2-20020a1709061ba200b0072f441a04a6sm3205163ejg.5.2022.08.10.23.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 23:42:33 -0700 (PDT)
Message-ID: <dc3f57ca-e8ad-5e5d-e951-8589bb65604f@gmail.com>
Date: Thu, 11 Aug 2022 08:42:32 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Bug: luksClose search LUKS header but it is detached
Content-Language: en-US
To: "doffloster@gmail.com" <doffloster@gmail.com>
Cc: cryptsetup@lists.linux.dev
References: <CACHosL9ri_XGPoLxsAb4vEnav1-w3B=YWCE1YidhRn-ONrW=fw@mail.gmail.com>
 <df769461-e347-9abd-7195-556e22f5d481@gmail.com>
 <CACHosL-VutFNrdARLWufPYRuBvYDD0bdTbR-yP2y31LAj+CYtw@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CACHosL-VutFNrdARLWufPYRuBvYDD0bdTbR-yP2y31LAj+CYtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/08/2022 14:51, doffloster@gmail.com wrote:
> Hi Milan,
> 
> I appreciate your quick response.
> 
> Here is my reply:
> 
>> No, this is expected. But for close (deactivation) it proceeds even
>> if it does not find the detached header.
> 
> Why would cryptsetup seek the detached header in the device?
> Wouldn't it be better for cryptsetup to use the '--header' flag?

Kernel has no information that detached header was used, so userspace
always tries to initialize the context using header.

Close was, for a long time, an exception, the device was just teared down
without checking context.
But we already have use cases where we need full initialized context
even on close (check that header has correct UUID referenced in kernel etc).

That said, it should not scan for header if there is no space for
it (IOW data offset is 0 - there is no reserved space on data device
for header; only detached header exists; data device is fully used).
If this is happening, it is a bug. (I'll check it.)
  
>> The reason is that even close need some information from the header
>> (for example UUID).
> 
> Doesn't the linux kernel store this kind of information?

Yes, but it need to be compared against the header, not the kernel.
(Imagine that you need to check password before tearing down the device
- not the current situation, but we already have a need for it in the future).
  
>> Is there any functional problem with this or it just looks strange?
> 
> There isn't any issue.
> I just noticed an unexpected behavior and thought that I should report about it.

We can easily add option that will not check the header on close, but
if it is no real problem, I would better keep it as all actions basically
works the same.

Thanks,
Milan


> 
> Best regards,
> David.
> 
> 
> On Wed, Aug 10, 2022 at 9:58 AM Milan Broz <gmazyland@gmail.com> wrote:
>>
>> On 09/08/2022 23:53, doffloster@gmail.com wrote:
>>> Hi all,
>>>
>>> I noticed that cryptsetup LUKS extensions is searching for a LUKS
>>> header in the device.
>>> This is expected when the LUKS header should be in the device.
>>> But I used a detached LUKS header, so I wasn't expecting to see
>>> cryptsetup searching for the LUKS header in the device.
>>>
>>> You can see that in the log file "log.txt" - in the URL:
>>> https://drive.google.com/file/d/1DcrpklgE75oE5znAxHAlp9CPikkYbVq1/view?usp=sharing
>>>
>>> You may notice that I used a "--header" flag, but I also tried without
>>> it - still, cryptsetup behaved the same.
>>>
>>> The incriminating lines from the attached log are as follows:
>>
>> ...
>>> Do you consider it to be a bug?
>>
>> Hi,
>>
>> No, this is expected. But for close (deactivation) it proceeds even
>> if it does not find the detached header.
>>
>> The reason is that even close need some information from the header
>> (for example UUID).
>>
>> Is there any functional problem with this or it just looks strange?
>>
>> If it is problem, you can always use low-level access through
>> "dmsetup remove <device>" here, but it can keeps some underlying device
>> active (for LUKS2 this is used only for integrity protected devices).
>>
>> Milan
>>
>>
