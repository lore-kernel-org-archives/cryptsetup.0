Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD302F5A
	for <cryptsetup@lists.linux.dev>; Mon, 26 Dec 2022 19:42:34 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id m18so27641928eji.5
        for <cryptsetup@lists.linux.dev>; Mon, 26 Dec 2022 11:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6w3iSVPZgQ1ymo+jYCoITj5AExCLb5zpdE8unLXSQ7Y=;
        b=BgFj8GrqP6fDLg56uAI3f/hwdxqidH7CNF3Ea2k7RLSl1nqCh8deCD8uiiR9/DF0Wy
         Fdg0GIT/78tgnRb5Bgu4zNctjpVkJ8S6hHGQfW6fUlxtz1J606Dfi60WnS01vwR66yXE
         fXqDEquvD9LjZjW9iPbQa8Glic7f0ywGXfYwTHOXizNeRfMHotIaKpkwuQmp49s0Gxuy
         QdkgjeYnP2pMrgwVuo9iScpbHK2+d+4I2Z2xciVX+nUgBCf7BYdZhCZjfkRrUpRGKQYt
         tSdZlYOqL5LXwLdQVWCO96x27ApK4yNd5AylogqyJLZYWGAgS2y/4Lx7+cgK+LY6FIIm
         w5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6w3iSVPZgQ1ymo+jYCoITj5AExCLb5zpdE8unLXSQ7Y=;
        b=Twbuf3F4sbC3oYDEB56un2cG/odxQ8dpotpBEeryUyKUhpND1ahYHRxoUdmVrEmZiN
         oqcLrXb9diWB78OiAAQ+lv2njfE9/Pz1vcf7c8FrToPJ0Lh7Kl+ixvbDQeNHKmxvZmAb
         mcG6Up1wmncOl0I27Ul3OHb1mEhLsXQLM8H+vrPZx9eX+1UTbFn0dxSnbX6oTU+Fr5dk
         FzwzebVgTOeGSaYhiSq+NCMy0wdzHKV3C3+LNA9GOVOSydByS4CPgJOYVRu1doSsBwJC
         NC3S58Ig9gUNEescxcAptuesOEfYW1C65GrhCuT5A6e2AP4oX3q3bTgQI3gIuwk9/jvJ
         j+oA==
X-Gm-Message-State: AFqh2krhwjDLhQke1VGE131DkXKdubewAEZZGZShUta5QP2KhQaW3ASb
	Mj/xFc36esgQggQvZ7R4SI8=
X-Google-Smtp-Source: AMrXdXvWA0Jy5wncmWS/cI+nMSFycjtVk9tocIY982bpMPzDpue8QPNxAnzGgDm86ga2Ip7QeURxpg==
X-Received: by 2002:a17:907:d50e:b0:7b1:316c:38f5 with SMTP id wb14-20020a170907d50e00b007b1316c38f5mr17291074ejc.30.1672083752721;
        Mon, 26 Dec 2022 11:42:32 -0800 (PST)
Received: from [192.168.2.31] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id k13-20020a17090632cd00b00837ac146a53sm5142879ejk.23.2022.12.26.11.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 11:42:31 -0800 (PST)
Message-ID: <611ca3db-6278-6e3b-5df7-0739e47cbfaa@gmail.com>
Date: Mon, 26 Dec 2022 20:42:30 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Are the keys of mounted encrypted disks secured during reboot?
To: John Smith <dingrite@gmail.com>, cryptsetup@lists.linux.dev
References: <CA+5JoNqEPTTCAppS8EFDwBVtkfK8f_xWhf3ZYE+9bAQRNca4aw@mail.gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CA+5JoNqEPTTCAppS8EFDwBVtkfK8f_xWhf3ZYE+9bAQRNca4aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/22 20:13, John Smith wrote:
> During the course of proper shutdown/reboot/suspend-to-disk, does the
> kernel securely erase (or at least free memory of - as it pertains to
> init_on_free=1) encryption keys of all dmcrypt/luks systems which
> remained mounted?

If the device is properly deactivated, then keys are always wiped.

(Actually, with LUKS2, dm-crypt no longer keeps own copy of the key, it
is stored in kernel keyring only for activation and then, obviously, in kernel
crypto where is is directly used for encryption. So if it is not
deactivated, it is responsibility of these subsystems to wipe it on reboot.)

For suspend to ram, it is more complicated - there is a way how to wipe key
and freeze device temporarily (see luksSuspend), but I do no think many systems
actually use it. Debian has cryptsetup-suspend that can do this AFAIK.

For suspend to disk, the memory should be written to encrypted device.
(And RAM contents disappears after some short time with no power anyway.)

Milan
