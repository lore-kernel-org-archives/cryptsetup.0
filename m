Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F7E2877DA
	for <cryptsetup@lists.linux.dev>; Mon,  8 Jun 2026 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912507; cv=none; b=nzUp5EDBc0OT2fnl1e6ryuSGPlMgWRM7xiFrB4/gX3jHDE67OT1Qo/e22Lxg++tFSckE5BxzM4/v/8jGoaq3B/XKfD2MWTHXIjh5u8Yi/pEja9SGKgyP/qaejhi0nnO1/8EkmbzvTouPKx2xik3qdENXdDkSuYF0uafi4HfcGuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912507; c=relaxed/simple;
	bh=Ix75wHyTT7rypD2NSxA4YKZenX30fwCH9tfC9MSYOAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=oYmk8TbmvW21RFR8RHYv8ego8lFjqdp1ObxjZ0lsI2a1roc8zXfJogub2ucHKWLBS8Bq6kjfCSaUnSVQn6F2vGEgWZ28zmWaV4qTbXP6CmhKe/Ig/kQHVZLL3hrVDChbRK/cQyJhu2SQqsZ4mjIChm6QV1LOhDqTni5rdzcZAcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bi7hQOvN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bi7hQOvN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780912504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MIYC0dVOJstkLC9sgBgPw7VNcInU9lReq0nbA+q6uxE=;
	b=Bi7hQOvNtRGtj+MNaSzkFN5w8Kr4HaD4KrM6YgTTmO/VnK35ndgEEVvoNAK7MyKzUnj09+
	/NNsY2DaCil5kY8bexdmlNVIoQk9UUq4Fz6vAQ7Er9Vb9uGvdoL2e1SXhH10/XYjeWCEtu
	0o7apS0j+pb7jm+xO0qFrvh5ljA9ZF4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-tBVTRE-DOVGxcmJ9iACHGQ-1; Mon, 08 Jun 2026 05:55:03 -0400
X-MC-Unique: tBVTRE-DOVGxcmJ9iACHGQ-1
X-Mimecast-MFC-AGG-ID: tBVTRE-DOVGxcmJ9iACHGQ_1780912502
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490b8adf8b8so39025785e9.0
        for <cryptsetup@lists.linux.dev>; Mon, 08 Jun 2026 02:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912502; x=1781517302;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIYC0dVOJstkLC9sgBgPw7VNcInU9lReq0nbA+q6uxE=;
        b=RSekQae/ndFTVXYHNu59evkA9u4YLKNAqfkb7EY7BJpop+iY034RUDgdNIBJbJaJcN
         6m2o3ihjhqfKDWz8CHMeIi55lBY5nU/ilviEinaNK5J2WqxshRAzbNuf8O+clraoKcKz
         XKEzHLId6ua5m8w6H1AnDunN172pdhoXwX9rZeBTQg24XpNOThsEzhLaA8KBjawIrWCq
         eKcmEq8vEqKts4dl/esxL/Ufo345Svf+C4Wtx+8AcoYrU2Sheec3HhCl+MpUq+gRVO+X
         FW2Q7OzG9jWknotfn8iAK5oUENDO2ryEegoG+lxXt8n1ArFEuWYoJgvmQmpGxy0W8G2G
         0OHA==
X-Gm-Message-State: AOJu0YwPA+PKWFvtNe3qARiNqLYaKuV6PNU6Kqvqt/LJxIvg6m4fhPKE
	Dyj0NUZB5qCvf9uUATwlw14d0EU0k3bpRXtIVRDP3uv1A42L/s+gBJtYOC1iZDULn1v0bHBPg1X
	xDogxfaoRR5isz7AHgoP019pW3xSW3bg60Z/Y4zoOxSJo+K6hQ3DSVx05RbmfjUxocTcnn+XV0n
	erlEYSepDK+OmqRg7J5Bm2TDuRMU4+0SDeRK0Sl6T8aX/9
X-Gm-Gg: Acq92OEbkQVTFP6dBo3EgRMr5evYr8z0jp/6sOpkQkOOwKzqA06UUozV/qEyDAhH2VA
	BgC6JCOReE26MV+TBzGnzWeCY5G49gcrobYXLbG6bRgjNgMGTPzgIoSA7PWsAoAwBpHZtiIJWZZ
	dfNDbS8sNwD+uvp8ZEzPsbO8/rJrOADLu+oYRW0U6XP4cDvrARkQhP5dQYDCXbNCVWTQ2mCTNkh
	DE2jVGJwurk+UDPH3peSbGq7CT7hxPH+APxiJheIMSHnrIKvX3pny3sHK7ZdIipyFbZFilFmpE5
	s4pYEr/yhraq3yy4rCl4IILedNBAb4VUNeNZwBP1mrTXo0GOFV+V9d2R4t1q10lzRoo2biv09nc
	edCqjN2+Dm1jj8Q/pqllsKw==
X-Received: by 2002:a05:600c:3f10:b0:490:be44:32ea with SMTP id 5b1f17b1804b1-490c2591fcdmr255418715e9.7.1780912501929;
        Mon, 08 Jun 2026 02:55:01 -0700 (PDT)
X-Received: by 2002:a05:600c:3f10:b0:490:be44:32ea with SMTP id 5b1f17b1804b1-490c2591fcdmr255418205e9.7.1780912501355;
        Mon, 08 Jun 2026 02:55:01 -0700 (PDT)
Received: from [10.43.17.192] ([213.175.46.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm347839595e9.3.2026.06.08.02.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:55:00 -0700 (PDT)
Message-ID: <b5e88240-b51b-4d6b-9eff-cda79448fc27@redhat.com>
Date: Mon, 8 Jun 2026 11:55:00 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: reencryption with multi keyslots in batch mode
To: cryptsetup@lists.linux.dev
References: <ac44ad4e-e9ec-4ab4-ac8d-6b545ece7d2d@canonical.com>
Cc: Frederic Hoerni <frederic.hoerni@canonical.com>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
In-Reply-To: <ac44ad4e-e9ec-4ab4-ac8d-6b545ece7d2d@canonical.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -lCf6JWpqPjyhtIWERbRoaJlt8CnwB04n-sO5kzBYPU_1780912502
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/06/2026 14:43, Frederic Hoerni wrote:
> Hello,
> 
> If we want to reencrypt a disk that has several keyslots (main and
> recovery keyslots), I believe the only way is to do it in interactive mode.

Correct.

> 
> But in some cases, we would like to do this in batch mode. We could
> imagine a scenario like this:
> 
> 1. Setup of the use case (no modification of cryptsetup needed so far)
> 
> # Initialize LUKS container
> dd if=/dev/zero count=200 of=disk.img bs=1M
> echo 0000 | sudo cryptsetup luksFormat --keyfile-size 4 \
>                                          --key-file - \
>                                          disk.img
> # Add two keyslots
> echo -n 0000x111111 | cryptsetup luksAddKey --key-file - \
>                                               --keyfile-size 4 \
>                                               disk.img
> echo -n 0000222     | cryptsetup luksAddKey --key-file - \
>                                               --keyfile-size 4 \
>                                               disk.img
> 
> 
> 2. Reencryption (this step needs modification of cryptsetup)
> 
> echo -n 0000x111111222 | \
>       sudo cryptsetup reencrypt --key-file - \
>                                 --keypipe-sizes "4,7,3" \
>                                 --batch-mode \
>                                 --force-offline-reencrypt \
>                                 disk.img
> 
> 3. Verify all keyslots
> 
> for passphrase in 0000 x111111 222; do
>       echo -n $passphrase | cryptsetup open disk.img --test-passphrase \
>                                                      --key-file -
> done
> 
> Do you have any on-going work in this direction?

No, currently I do not have any plans.

> Are you open to contribution for that? (I already have a proof of
> concept for the above scenario)

Of course! As with any other open source project feel free to contribute 
via a merge request in https://gitlab.com/cryptsetup/cryptsetup

> Do you have any particular caveat about developing this feature?

Me personally, I'd probably go with dropping the additional keyslots for 
the time of reencryption. The reencryption performance is more or less 
dependent on a free space in LUKS2 header keyslots area. The only 
exception from this rule is reencryption with datashift (reencrypt 
--encrypt --reduce-device-size XXX command for example).

And you can recreate additional (or recovery?) keyslots after the 
reencryption operation is completed.

With kind regards
O. Kozina

