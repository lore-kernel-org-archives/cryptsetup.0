Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A82F23
	for <cryptsetup@lists.linux.dev>; Thu, 10 Nov 2022 14:52:40 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so4840374pjs.4
        for <cryptsetup@lists.linux.dev>; Thu, 10 Nov 2022 06:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=imEtVzgrg8NpaOfNSk9m4OyPmg4KyiK3N3SbgpPjKSk=;
        b=bdbst+JKHllx4J5h1LIc+gpuEKOjHjGw4Ym2kgINYEB7ru5UoabwcxDyH1ScIY4xCk
         qjptcp+gu1X0ePaD9WF5PxhUtlQmsWMDeNMMsjbX/Zw36uy6ArLiU/tDGRimw4xrVneV
         1Q/a4GwDhzUJMJ+WH3BHVM04dZbAGFM0V+YuNQfx9Fc7i0QwkeKn9E47dyZStCVij9QO
         /LNojsgmqU5l5LiRO/h5p9pgIrV/BfDAJGnC2Rgb7JO1onq0AYmImB5M7z+DI/scZELC
         LDD4ZigK+0dpj1JDSeuYM9UJ6zU6c7wOMGjqvkzTxGeSgkXSHwCi5pAgemb26H7pwnDH
         sIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imEtVzgrg8NpaOfNSk9m4OyPmg4KyiK3N3SbgpPjKSk=;
        b=JmECouT8La0U76Bl7blmOGVyYYn++muIolAgCAt24iShPWAJD/varlsmprrI2LkK9Y
         haSBCZs9HAWwfoRTW9CzazzkjfzoPslPnWJIR5g7XMFXBl/CjAldu0kkmLyDG9FfAwCB
         6FvNRZqFUQqIM2xY3OshTSzHkpTHnXsy/PKguTUhBGm1VddsEMavvIuvzoL2R+N4KAAj
         46j53LJx50JoDal1lvucd6k3hjfx6rQKP4zXeW7LO0ZNDfj7efJm54QYHeVcZkBy05Qv
         qlkUBsixj7yeB8FMn3SO5B7XjoYD/895cavuNS6Gh++NAJn+px8SDzH39QwjBKNYFwoT
         kMGg==
X-Gm-Message-State: ACrzQf0JYj0Ix5S1++9Vav+51G5KHUiFQ4gdOgTHIOh7v4jhIIJnkNMG
	9Opm8m5f6d1pnIzDBEYnBaqmZWM8UEffyoVYj3haay6L
X-Google-Smtp-Source: AMsMyM7stwZ9kAua/I6bh/8kcA81rkzyUFljo8FVaX+xiM6qRZk1VaxhQjO3sGfqFRWhbeZRsObPHXc27Cp8BqX+O5w=
X-Received: by 2002:a17:90a:4212:b0:215:eee3:bb10 with SMTP id
 o18-20020a17090a421200b00215eee3bb10mr39320062pjg.130.1668091959668; Thu, 10
 Nov 2022 06:52:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN+za=OaHi939USLRp8DttVjamBx7qSxOp-LPm6uNtMN7oek8A@mail.gmail.com>
 <37ecbf51-9c83-eb17-ef98-a68a9975ecd8@redhat.com>
In-Reply-To: <37ecbf51-9c83-eb17-ef98-a68a9975ecd8@redhat.com>
From: Philippe Cerfon <philcerf@gmail.com>
Date: Thu, 10 Nov 2022 15:52:28 +0100
Message-ID: <CAN+za=P-XaUsM2Xjy2Bip64PHKvYxCi8_d1wKiN_1o9AhEheLg@mail.gmail.com>
Subject: Re: reencrypt: how to specify old and new key-files?
To: Ondrej Kozina <okozina@redhat.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey Ondrej.

Thanks for your reply.

On Thu, Nov 10, 2022 at 10:24 AM Ondrej Kozina <okozina@redhat.com> wrote:
> It's not necessary. With LUKS2 you may change keyslot parameters without
> need for full device reencryption. You may split your goal into two
> individual steps. Reencrypt the device to refresh volume key and later
> change keyslot parameters as you see fit.

Wouldn't especially this order have some security downsides?

If one has e.g. a "weak" KDF (or weaker settings for it), or a weak
(e.g. one that
could have been leaked) passphrase then first re-encrypting the volume would
also re-encrypt the new VK, but with the old weak KDF and/or passphrase.

If one updates (I assume with luksChangeKey ?) the keyslot only afterwards,
the previously created new (intermediate) keyslot (with the new VK, but still
old KDF/passphrase) might have already been relocated to some other sector
on the HDD (or similar for SSD)?!


> It's for both, old and new keyslot. We do not want to support
> reencryption where old and new keyslot is unlocked by different
> passphrase for compatibility reasons. If LUKS2 reencryption gets
> interrupted (no matter the reason) it would be difficult to re-activate
> the device again unless it's fully reencrypted. Most libcryptsetup
> applications (including e.g. systemd) does not expect two different
> passphrase prompts while unlocking the device. So two passphrases prompt
> would break system boot, cryptsetup open scripts and so on.

Hmm I see, but at least from security point of view, I think - if my above
assumptions are correct - that this is rather unfortunate.

Cause even if we'd add some line describing the issue to the manpage or FAQ
it's all too likely that many people will never see it.

Still, when I'm right, such documentation should be added and emphasized.


> Either you provide all passphrases for all currently active
> keyslots (and all keyslots get recreated storing new/future volume key),

But as far as I understand, this mode wouldn't help with the above
problem, right?


Thanks,
Philippe.
