Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4C0369
	for <cryptsetup@lists.linux.dev>; Fri, 11 Nov 2022 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668163158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BWdwzl0JJH108Sq7mZqsn6TJemmNO78msL/CJ3BI/ec=;
	b=IK7KSeg0I6vtnjcuoggcE9fFpuGG2vbQvRihY3dvJZnPKFp49N0Kxj6usjhDpy9XeGX563
	LByIG14lFTY9p/006TU355Jzf7d4cip/Bf6szkSmzfCuL1Gt0tcJ/2HVTSZRjfexX4P13A
	4cp7dlsXtjSGljS3ravyeyFSHrY6ZVU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-Zd7VZ-SxPZ2eQ1y0ib5gaA-1; Fri, 11 Nov 2022 05:39:17 -0500
X-MC-Unique: Zd7VZ-SxPZ2eQ1y0ib5gaA-1
Received: by mail-ej1-f70.google.com with SMTP id nc4-20020a1709071c0400b0078a5ceb571bso2819807ejc.4
        for <cryptsetup@lists.linux.dev>; Fri, 11 Nov 2022 02:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWdwzl0JJH108Sq7mZqsn6TJemmNO78msL/CJ3BI/ec=;
        b=ldI6zeL/BU+vstrQiiS6spG15ZK/CMGsAOvpiZHZHgbAF9edHnhYo42BJdBkeKeA8J
         AAhndNsKvIpygv62LOf4qeKfpkjGB7c9HLZqHCkFaRepx9Eks+mQlif9pnpJ0zJuozLL
         YKxPQt0ZFKdFTdVmeaD780oT32U16ABHyGMkVtxzBgoIWNaB5uIerGIhO1GcYVCrYZHN
         VCmVElVCUcxNBrexgDA+lTV4SoKSZgMZyEEqTkbWQi6SBejDodBd9Z+Vh6H6X99lSyks
         zXfJ55UaHfjD1x03RZylvhk86m9mOFWGXL99+cQsyhj2aDAHdQ52yRU7wBPbsKXpNoVb
         H7og==
X-Gm-Message-State: ANoB5pmm5VIHrK9klWpe7TkApdregzD/1FW+Y1SDTHto5f5SlVbnbohd
	nlwWybtefwS8glyT15FaZnmE+1VYX/OYUIcOIu6032zSsVzwdDWvPjFzUgtvpaYD2HG90lDvgki
	qakzCqE7nD5Yl039Uc25d+EVSL9A9fy9gPwCoyryxa1rVMNxbvak1LzFwn0Yte1JgdFtYr+w=
X-Received: by 2002:a17:906:6051:b0:78d:9325:55b5 with SMTP id p17-20020a170906605100b0078d932555b5mr1300812ejj.618.1668163155543;
        Fri, 11 Nov 2022 02:39:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4M1iw4yq6rL6N/tmqhNAZRZ4jz039gUama7CweCPj8m3cNNJEOnUOGAMS/ARYCmElLrwp9iA==
X-Received: by 2002:a17:906:6051:b0:78d:9325:55b5 with SMTP id p17-20020a170906605100b0078d932555b5mr1300800ejj.618.1668163155250;
        Fri, 11 Nov 2022 02:39:15 -0800 (PST)
Received: from [192.168.50.107] ([83.240.62.170])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090609ca00b0077077c62cadsm758900eje.31.2022.11.11.02.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 02:39:14 -0800 (PST)
Message-ID: <480cac2f-f20a-e769-f33f-3d1a57e62b01@redhat.com>
Date: Fri, 11 Nov 2022 11:39:13 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: cryptsetup@lists.linux.dev
Cc: Philippe Cerfon <philcerf@gmail.com>
References: <CAN+za=OaHi939USLRp8DttVjamBx7qSxOp-LPm6uNtMN7oek8A@mail.gmail.com>
 <37ecbf51-9c83-eb17-ef98-a68a9975ecd8@redhat.com>
 <CAN+za=P-XaUsM2Xjy2Bip64PHKvYxCi8_d1wKiN_1o9AhEheLg@mail.gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Subject: Re: reencrypt: how to specify old and new key-files?
In-Reply-To: <CAN+za=P-XaUsM2Xjy2Bip64PHKvYxCi8_d1wKiN_1o9AhEheLg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10. 11. 22 15:52, Philippe Cerfon wrote:
> Hey Ondrej.
> 
> Thanks for your reply.
> 
> On Thu, Nov 10, 2022 at 10:24 AM Ondrej Kozina <okozina@redhat.com> wrote:
>> It's not necessary. With LUKS2 you may change keyslot parameters without
>> need for full device reencryption. You may split your goal into two
>> individual steps. Reencrypt the device to refresh volume key and later
>> change keyslot parameters as you see fit.
> 
> Wouldn't especially this order have some security downsides?
> 
> If one has e.g. a "weak" KDF (or weaker settings for it), or a weak
> (e.g. one that
> could have been leaked) passphrase then first re-encrypting the volume would
> also re-encrypt the new VK, but with the old weak KDF and/or passphrase.

Sorry, I did not mean in that particular order. I've forgotten the 
golden rule of re-read the post first before you hit send. The idea I 
was emphasizing is that changing keyslot parameters and volume key 
refresh (aka reencryption) are two independent tasks.

> 
> If one updates (I assume with luksChangeKey ?) the keyslot only afterwards,
> the previously created new (intermediate) keyslot (with the new VK, but still
> old KDF/passphrase) might have already been relocated to some other sector
> on the HDD (or similar for SSD)?!
> 
> 
>> It's for both, old and new keyslot. We do not want to support
>> reencryption where old and new keyslot is unlocked by different
>> passphrase for compatibility reasons. If LUKS2 reencryption gets
>> interrupted (no matter the reason) it would be difficult to re-activate
>> the device again unless it's fully reencrypted. Most libcryptsetup
>> applications (including e.g. systemd) does not expect two different
>> passphrase prompts while unlocking the device. So two passphrases prompt
>> would break system boot, cryptsetup open scripts and so on.
> 
> Hmm I see, but at least from security point of view, I think - if my above
> assumptions are correct - that this is rather unfortunate.
> 
> Cause even if we'd add some line describing the issue to the manpage or FAQ
> it's all too likely that many people will never see it.

Yup, we should mention it somewhere. Also we may add an example in 
cryptsetup-reencrypt man page. Could you create an issue on 
https://gitlab.com/cryptsetup/cryptsetup please?

Thanks
O.

> Still, when I'm right, such documentation should be added and emphasized.
> 
> 
>> Either you provide all passphrases for all currently active
>> keyslots (and all keyslots get recreated storing new/future volume key),
> 
> But as far as I understand, this mode wouldn't help with the above
> problem, right?

> 
> 
> Thanks,
> Philippe.
> 

