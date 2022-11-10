Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D121382
	for <cryptsetup@lists.linux.dev>; Thu, 10 Nov 2022 09:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668072259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bz8Y/enEzRWT4ckQOmV4iiqoD1jJyuhB8aCkO/v9uUM=;
	b=T/pMtPlbykzQk4Z2Gbbi/IOB3vB0asjIlqT/a40duaKvJHLc+rulVTPtG8fXfcqSFf7QbB
	3UAIh5z+HlrUeIKjsSPdg11cwBWmR2UFgSkuidBn1H2qXFcoI0LT4CioIg8i3PMn0cyPnD
	AFSD3jh/YZ9e62e0kRsskGK/UE8eNkc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-07Aa3lLSP2SeLsbeYLHO6g-1; Thu, 10 Nov 2022 04:24:17 -0500
X-MC-Unique: 07Aa3lLSP2SeLsbeYLHO6g-1
Received: by mail-ej1-f71.google.com with SMTP id oz34-20020a1709077da200b007adc8d68e90so834580ejc.11
        for <cryptsetup@lists.linux.dev>; Thu, 10 Nov 2022 01:24:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:cc:references:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bz8Y/enEzRWT4ckQOmV4iiqoD1jJyuhB8aCkO/v9uUM=;
        b=C/SAQIBpaxPFrv6E+0EigANJgaa/SpMXMSfygsOSJLOyB6xfAJ1hzo+llP8Iqjidf2
         C5u0t0Q8rHlWoTHV0ZoUzLxRWJeIy8eY7Xl+ueoNy6T3DnrJcMtN2lIJT/DxgzhHoE5C
         dZkZTC8z1Rjdhvn5vEHrRgvAdhhk2TM+dhVoiwsogx/9Pcq/Hm8IYyIKM4PYDnqpcr3L
         krAAPHs0cUVNC2O0NpU/IGtFcwR1NELIx0bNBlnMFkZGVRBUz61f6kqcZK6CYcgaUaOG
         X5oblSEw6GFvVxVYCDWbDFND3X3rWNWWfNWuYLEMyv2Kml7in92wg0IpYcTS4vk6d8dg
         MtXw==
X-Gm-Message-State: ACrzQf3LFh0CG7+37TmonMnojZ3xSt3vwASXsZ2H8dPrBGpLF1E8+wyz
	OpRM3lILcKzAEEk5+CEjEkWEPfeAHDVvSZYZ6QfvFqJ2ikziHnRgksDUxo1JmIbxqRxnTmotTuB
	88rF2FKMRKF5bu7S+w0jfHXOtIXPIH4E3Zc1Mcx7eWjrjrwKB05hUUWlqgmGttDSoG2x3acc=
X-Received: by 2002:a05:6402:50c:b0:461:bc01:1828 with SMTP id m12-20020a056402050c00b00461bc011828mr63154923edv.64.1668072255687;
        Thu, 10 Nov 2022 01:24:15 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7g60r+8vBdp35TX8ETY+5R98dFhnmH4Xg1kM8jy1A8KxNjsAC+zQjtlu2dprDzX/awsxFuiQ==
X-Received: by 2002:a05:6402:50c:b0:461:bc01:1828 with SMTP id m12-20020a056402050c00b00461bc011828mr63154913edv.64.1668072255417;
        Thu, 10 Nov 2022 01:24:15 -0800 (PST)
Received: from [10.43.17.42] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090627c800b007ae90c54e74sm1995268ejc.10.2022.11.10.01.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 01:24:14 -0800 (PST)
Message-ID: <37ecbf51-9c83-eb17-ef98-a68a9975ecd8@redhat.com>
Date: Thu, 10 Nov 2022 10:24:13 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: cryptsetup@lists.linux.dev
References: <CAN+za=OaHi939USLRp8DttVjamBx7qSxOp-LPm6uNtMN7oek8A@mail.gmail.com>
Cc: Philippe Cerfon <philcerf@gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Subject: Re: reencrypt: how to specify old and new key-files?
In-Reply-To: <CAN+za=OaHi939USLRp8DttVjamBx7qSxOp-LPm6uNtMN7oek8A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08. 11. 22 23:52, Philippe Cerfon wrote:
> Hey.
> 
> Sorry for having to ask again.
> 
> When I'm reencrypting a device in order to change the volume key and
> also the keyslot (say from PBKDF2 to Argon2) wouldn't there need to be
> some way to specify two different --key-file?

It's not necessary. With LUKS2 you may change keyslot parameters without 
need for full device reencryption. You may split your goal into two 
individual steps. Reencrypt the device to refresh volume key and later 
change keyslot parameters as you see fit.

> 
> One for the old keyslot with the old VK, and one for the new keyslot
> to be generated?
> 
> Especially if with --key-slot <old slot ID>, the old slot is
> overwritten and all others removed, as explained by the manpage:
>> For reencryption mode it selects specific keyslot (and passphrase)
>> that can be used to unlock new volume key. If used all other keyslots
>> get removed after reencryption operation is finished.
> 
> But it seems there is only the --key-file option, for which it's even
> unclear to me, whether it's for the old or new keyslot/VK?

It's for both, old and new keyslot. We do not want to support 
reencryption where old and new keyslot is unlocked by different 
passphrase for compatibility reasons. If LUKS2 reencryption gets 
interrupted (no matter the reason) it would be difficult to re-activate 
the device again unless it's fully reencrypted. Most libcryptsetup 
applications (including e.g. systemd) does not expect two different 
passphrase prompts while unlocking the device. So two passphrases prompt 
would break system boot, cryptsetup open scripts and so on.

The cryptsetup utility (reencrypt action) therefore supports only two 
setups. Either you provide all passphrases for all currently active 
keyslots (and all keyslots get recreated storing new/future volume key), 
or you choose single keyslot and provide passphrase for it stored in 
--key-file.

Again it's not big deal. You may change the old passphrase(s) before or 
after reencryption operation completes.

We do plan to add support for initializing reencryption using different 
unlock methods (e.g. LUKS2 tokens) but it will be added in future 
version. For passphrase based activation the precondition for old and 
new keyslot both having same passphrase will remain

O.

