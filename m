Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAA5614D
	for <cryptsetup@lists.linux.dev>; Wed, 23 Mar 2022 18:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648059019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XyjN8BpUNt3XiI129YvAEi2sn2M1CvwH3/OFcWvuVCs=;
	b=WfX6rrwSwzSXosC8UT1oZqcHhhp52EkMnTdnjWfjy/pECpfAaDrYfufrgJvOh8rowsUBKv
	yMEly+DhAYxIOjCXYcGi40m3em+36VDZ1vk50p8jbQT8b1MIdaalphbullkzjHFhAiKAoS
	Acwnpad5X83GtbzIxYwd3YOXAlvhMJQ=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-GFR-szHVPv-YSSpXtV_Bag-1; Wed, 23 Mar 2022 14:10:17 -0400
X-MC-Unique: GFR-szHVPv-YSSpXtV_Bag-1
Received: by mail-il1-f198.google.com with SMTP id o17-20020a92c691000000b002c2c04aebe7so1337615ilg.8
        for <cryptsetup@lists.linux.dev>; Wed, 23 Mar 2022 11:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XyjN8BpUNt3XiI129YvAEi2sn2M1CvwH3/OFcWvuVCs=;
        b=Jh8wNbVbcd9olRa/i1PQWlINxNCFlqae58WgJx4bIYlSA9SkLYbxomPS3SVfHdTuxX
         41XjpHdSxNxUu4FGzklL1F/0jVRb/dUDi5lr2OYXhPLvW2Wqnw1MdBWZPBzVnAGrfYPZ
         8Ydo4FZLGArnBUUJEQ5bBzzwBB6TvuouZFWcBa75u0gqvKzdZzQ6xnhcOiXfVM/URm2h
         Oe+uYuEZQrclxQV3D/49fLXzUpWKX4TrmyX2QRyz0gftUAXq7ZWJChnEGDtbaPTFN1mX
         x4qOr/WNDeSDzDKmXvVxtuRRvwHEbBZHKryNeWQ5RqajNHE8Y56sOq7X2xEJ73FAKQ55
         rO+g==
X-Gm-Message-State: AOAM5309IjpXofueLWntQ0yysUBuUCjY/y7LMl0pwY3IEJG455noUd6s
	VDBvt1HAPdJMQvzTI3etdYjhoK2I7lCa8nB8l3Fa1G44aISjz50UeGjHPJ2zfrpZ6ZyMq8LVKZy
	8THWnVCm3g7UQdCQszBh4j2OmAlbZFSVZGL5+3g==
X-Received: by 2002:a92:c691:0:b0:2be:8eab:9f7d with SMTP id o17-20020a92c691000000b002be8eab9f7dmr728970ilg.26.1648059016910;
        Wed, 23 Mar 2022 11:10:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkYhLptVJK6MjJ2WHLXb6PnlQQA/d7Gx23CALRd2nT4yVUJgdZlI8a2Aaub9eaFnyqmgrWyB98c2XYF/6tWZQ=
X-Received: by 2002:a92:c691:0:b0:2be:8eab:9f7d with SMTP id
 o17-20020a92c691000000b002be8eab9f7dmr728960ilg.26.1648059016724; Wed, 23 Mar
 2022 11:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJCQCtSRe-nip3a6m+hzccXMYyKTP3AzPmAbHgnVPFJPLbdfCA@mail.gmail.com>
In-Reply-To: <CAJCQCtSRe-nip3a6m+hzccXMYyKTP3AzPmAbHgnVPFJPLbdfCA@mail.gmail.com>
From: Vojtech Trefny <vtrefny@redhat.com>
Date: Wed, 23 Mar 2022 19:10:06 +0100
Message-ID: <CAAkhNO1PUmg4JWnMocUeHMbQAZBom8RsXU_05xixbdt8wrxtBw@mail.gmail.com>
Subject: Re: Bitlocker resize
To: Chris Murphy <lists@colorremedies.com>
Cc: cryptsetup@lists.linux.dev
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vtrefny@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 15, 2022 at 5:51 PM Chris Murphy <lists@colorremedies.com> wrote:
>
> Hi,
>
> I'm curious how Linux distro installers should go about supporting the
> increasingly common case of Bitlocker enabled by default.
>
> Is the Bitlocker format similar to LUKS in that the ciphertext volume
> size is inferred from the underlying partition size?
>
> I see in bitlkDump results of a Bitlocker volume there's no apparent
> reference to its size so I'm thinking it might be conceptually the
> same as LUKS, in which case the installer workflow would be the same
> as LUKS. I know that cryptsetup doesn't support modifying a Bitlocker
> header, but maybe it's not necessary?

BitLocker metadata contain volume size, we are reading it and just not
using the value (which is probably something we should fix). As Milan
said, cryptsetup doesn't even allow changing the BitLocker FVE
metadata areas when the device is active and we really don't want to
touch these in cryptsetup at all. And the fact that we know about one
place where the volume is stored, it doesn't mean there aren't other
entries somewhere else or at other places like the BitLocker header or
the encrypted NTFS header.

>
> pseudocode:
> cryptsetup open /dev/ $name
> ntfsresize --size $size /dev/mapper/$name

I am afraid ntfsresize doesn't seem to be ready to work with
BitLocker. Yes, there is a "normal" NTFS inside, but because the NTFS
filesystem is not presented as smaller than the underlying device, the
metadata areas are part of the NTFS format and visible as
hidden/system files in the MFT and I'm not sure ntfsresize is ready to
deal with this. I did a quick test and `ntfsresize -m` reports the
minimal size of the format as "Minsize (in MB): 102". Which is
definitely wrong -- the second FVE metadata area is around 1 GiB mark
and the third at 2 GiB so at least this information cannot be used
when resizing a BitLocker device.

And don't forget that it's not guaranteed that there will be NTFS
inside. FAT and exFAT are also supported with BitLocker and people are
also trying things like using Btrfs with BitLocker.

> cryptsetup close $name
> libfdisk/parted (resize the partition, create a new one in free space, etc)
>
> Thanks,
>
> --
> Chris Murphy
>

I'm not saying it would be impossible to implement resize support for
BitLocker devices, but it definitely wouldn't be easy. And I agree
with Milan that it shouldn't be part of cryptsetup because it needs to
change the metadata. That doesn't mean it couldn't be a new small tool
that uses libcryptsetup and ntfsresize. I'll be happy to help if
someone works on something like that.

--
Vojtech Trefny

