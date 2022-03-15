Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2650423CC
	for <cryptsetup@lists.linux.dev>; Tue, 15 Mar 2022 17:19:36 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id dr20so41707755ejc.6
        for <cryptsetup@lists.linux.dev>; Tue, 15 Mar 2022 10:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=29eEhqsmuUfAhOmfNGc+ERcUX7ti/hOEPV7m82Jp2nM=;
        b=DDYOF18wC/dx19SAVj43YZYeOkDnxAU7bE490Tt6bE3xT+10CUcI/DQ/SUzs4mbemO
         xdMjglr9psMkZfFjFWqSWxa7NcvEhTPWgCSr6Cme8NesURCO59zoCYu0mpW0BhnyXf12
         cOJeg250mK1lYxkSsdPVznOjpYySLvog7y08hDTK6GxKhh3OU9vsmozpo0gWHQKsSBHQ
         GneLuJPrF8PY2Rh4H3bywOFqXFhwhiEc/YiNFxwlgstJ1F2ooCNE8XZr+L6wZCgOrV5g
         U0TlYRwPBJtZG6z1hzOTuY342ou3dSNHqi6rTfCM1S8u2rfsMyO8mM64pi5UwXspjPL5
         nisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=29eEhqsmuUfAhOmfNGc+ERcUX7ti/hOEPV7m82Jp2nM=;
        b=r3i/0PZLyCio0sFD+gq049cPHEd9VAXd13Px106kKocUnmSzQfbxHkIciKgvetC3p5
         jVhrWf0vdEP+71nZGn4hpr82liTYn5+Sk+NWE0AtUkyvSZHbnHMjwsolAPmuFh22LmQp
         /xrg49wON8m28+5Dysmd7ujgWRXd1mHEANDlPM0TzcEWm1KTo8YwceZ8QahIvzRX4otU
         Y2j2imwMEWKo0mxFbIc6hUQTKv/ogy7E5wlRNWLt0yDDjeDENaP3/YEdr+6Qm8uIjk4X
         S55bye2mDBVafIx2PsbB5OM325lWZFyBDZTO5yF2+s5aB7AY7ZvOxNO2gRHvMnx/xGo3
         SVMQ==
X-Gm-Message-State: AOAM5317H/wrEchwoJOJFVIBrF/G5q2hW6QxHUJOfbRexnykWGImf752
	rgmVV5c49UpwGMp/czCX82p4jI6wv7I=
X-Google-Smtp-Source: ABdhPJzSjEuqymSXMHnZaXIgG+CS0gsAnE0WxtYOaa/Z8Pk4BY9rG3AduCNzrCb/dc9PrTdHA3CKyg==
X-Received: by 2002:a17:906:58b:b0:6cf:65f5:de28 with SMTP id 11-20020a170906058b00b006cf65f5de28mr22899188ejn.614.1647364773141;
        Tue, 15 Mar 2022 10:19:33 -0700 (PDT)
Received: from [192.168.2.27] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id p3-20020a1709060e8300b006d0e8ada804sm8278004ejf.127.2022.03.15.10.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 10:19:32 -0700 (PDT)
Message-ID: <22b5eb15-eda6-5eef-c504-c92da4fd1aab@gmail.com>
Date: Tue, 15 Mar 2022 18:19:31 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: Bitlocker resize
Content-Language: en-US
To: Chris Murphy <lists@colorremedies.com>,
 cryptsetup development <cryptsetup@lists.linux.dev>
References: <CAJCQCtSRe-nip3a6m+hzccXMYyKTP3AzPmAbHgnVPFJPLbdfCA@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CAJCQCtSRe-nip3a6m+hzccXMYyKTP3AzPmAbHgnVPFJPLbdfCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/03/2022 17:45, Chris Murphy wrote:
> I'm curious how Linux distro installers should go about supporting the
> increasingly common case of Bitlocker enabled by default.

Not sure about installers, but BitLocker support through libcryptsetup
is actually already used (as it is integrated through udisks).
  
> Is the Bitlocker format similar to LUKS in that the ciphertext volume
> size is inferred from the underlying partition size?

Well, we activate it this way, and it seems to work.
But metadata can contain some size info we just do not process yet
(as it is not openly documented).

> I see in bitlkDump results of a Bitlocker volume there's no apparent
> reference to its size so I'm thinking it might be conceptually the
> same as LUKS, in which case the installer workflow would be the same
> as LUKS. I know that cryptsetup doesn't support modifying a Bitlocker
> header, but maybe it's not necessary?

Libcryptsetup will never support any metadata write operation for Bitlocker.

We will only support activation of existing devices (and later read/write
access of plaintext data is done through common NTFS driver).

> pseudocode:
> cryptsetup open /dev/ $name
> ntfsresize --size $size /dev/mapper/$name
> cryptsetup close $name
> libfdisk/parted (resize the partition, create a new one in free space, etc)

Not sure if this works - if ntfsresize need to access Bitlocker metadata
(on activated volume), then we mask them out during activation.

Perhaps just try it :)

Milan
