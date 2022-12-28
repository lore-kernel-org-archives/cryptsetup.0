Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B60810E9
	for <cryptsetup@lists.linux.dev>; Wed, 28 Dec 2022 08:51:59 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id jo4so36982773ejb.7
        for <cryptsetup@lists.linux.dev>; Wed, 28 Dec 2022 00:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wktiBw3SUpRn7/QpbIRyAwtz7SHXac7+wz9cKFle2J8=;
        b=Itpn6qFWQhvd2QdrNg4VwO97z3hs7ouAyqP/WQUNQodsbLao6ILhknH2shDSGwEJtv
         llYf7jvHA8eA/pvOglszujw3/QINg5R3ndmNofcwJ/Z0X2sjQRzim78XB/9IKvpM2m0E
         yco2/1hcTd72QFzMSqYGbwiw4xvKAfbNBPrOSiDJ/F17fxWsFr6MKLWc/hnM0uzOMEPr
         vjafZ7BtIKR5e00ZvxcFMdCu9/E1HvgQN2J9dZRDE4UPjwoyExQDvmk/oj7K1fZnGCz9
         56X0fwS8bupMfPxHzONcDvBC/D676jXyQx19oxrJV6vu107hyK3XY6m7hdYtmRW6gFky
         L7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wktiBw3SUpRn7/QpbIRyAwtz7SHXac7+wz9cKFle2J8=;
        b=RVsuMVzRZJbDXM3dN1jk7Rjjtt0n0HAOTkNuqURXbPBR77uris+2CtST2u4BPZedHZ
         cq7N2E6KbHMI1T6sLbkvS3S5dzsUm1/FCdc78+i0yRB4WVoqsBssam58r8Cyqu9Nq+F2
         HQ1NJcXleWwFjU6ztxoI1wWnqO7Rsz6+XdcMnIK+1edv2qU5nYBNCFEmkbr9hOmuT60h
         WcD5DhVjQ7vNPrQJOIcyTP3F+E7qxfUpqTlV8dBw4D4b04Ox1EX9xRlZ65TkhasKmnA1
         /ssDQSkEzXCtEitVboK4fQdYBMLrLj1xlS4K7N6Iv/FNamVVFqtwlTcanx8JReNd0puZ
         QL1w==
X-Gm-Message-State: AFqh2kqlrHMGihooqJkueO+ja2O30ZcPKe9FUsibG9PW7yy7nswm9NC8
	j1gMbyah8TU69dtDlGVPFxg=
X-Google-Smtp-Source: AMrXdXs+v9j07h4RssenqVYAwkJAsG+mphmar8rDxorR+85eQo/GmHo7+7XpKbaSkkNKKgBwKpsaEQ==
X-Received: by 2002:a17:907:d681:b0:7c0:eb38:f8af with SMTP id wf1-20020a170907d68100b007c0eb38f8afmr20330557ejc.2.1672217517640;
        Wed, 28 Dec 2022 00:51:57 -0800 (PST)
Received: from [192.168.2.30] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id z25-20020a170906945900b007c1633cea13sm7254311ejx.12.2022.12.28.00.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 00:51:56 -0800 (PST)
Message-ID: <1fee767c-39b8-668b-bf93-f46004340dc4@gmail.com>
Date: Wed, 28 Dec 2022 09:51:55 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Are the keys of mounted encrypted disks secured during reboot?
Content-Language: en-US
To: John Smith <dingrite@gmail.com>, cryptsetup@lists.linux.dev
References: <CA+5JoNqEPTTCAppS8EFDwBVtkfK8f_xWhf3ZYE+9bAQRNca4aw@mail.gmail.com>
 <611ca3db-6278-6e3b-5df7-0739e47cbfaa@gmail.com>
 <CA+5JoNp5PF+43AqbYHnjern792b=LYJtAEheFynEU8mRmw0Vxw@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CA+5JoNp5PF+43AqbYHnjern792b=LYJtAEheFynEU8mRmw0Vxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/22 21:10, John Smith wrote:
> I'm asking about when a regular shutdown/reboot/suspend-to-disk is
> issued. In most cases the rootfs volume is not unmounted because that
> would require a pivot_root to a special initrd/ramdisk-rootfs just for
> powering off.
> So that would mean the device isn't deactivated via cryptsetup -
> because that would fail.

Cryptsetup (libcryptsetup) is just library that performs the job,
it does not run itself any actions.
Once it is called, keys should be wiped.

The deactivation/reboot/suspend is handled by init scripts, usually systemd
units these days - so check there. It really depends on system configuration.

However, last time we played with memory scan for keys after reboot,
cold boot is no longer such a problem as memory is wiped during reboot
on modern hw (but virtual machines images is a different problem).

m.

> In that case, when the kernel is preparing to reboot/poweroff, will it
> wipe the keys or just leave them there vulnerable to cold boot or
> forensics?
> 
> On Mon, Dec 26, 2022 at 7:42 PM Milan Broz <gmazyland@gmail.com> wrote:
>>
>> On 12/26/22 20:13, John Smith wrote:
>>> During the course of proper shutdown/reboot/suspend-to-disk, does the
>>> kernel securely erase (or at least free memory of - as it pertains to
>>> init_on_free=1) encryption keys of all dmcrypt/luks systems which
>>> remained mounted?
>>
>> If the device is properly deactivated, then keys are always wiped.
>>
>> (Actually, with LUKS2, dm-crypt no longer keeps own copy of the key, it
>> is stored in kernel keyring only for activation and then, obviously, in kernel
>> crypto where is is directly used for encryption. So if it is not
>> deactivated, it is responsibility of these subsystems to wipe it on reboot.)
>>
>> For suspend to ram, it is more complicated - there is a way how to wipe key
>> and freeze device temporarily (see luksSuspend), but I do no think many systems
>> actually use it. Debian has cryptsetup-suspend that can do this AFAIK.
>>
>> For suspend to disk, the memory should be written to encrypted device.
>> (And RAM contents disappears after some short time with no power anyway.)
>>
>> Milan
