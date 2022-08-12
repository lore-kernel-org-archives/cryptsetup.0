Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3A2138C
	for <cryptsetup@lists.linux.dev>; Fri, 12 Aug 2022 15:04:24 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id f30so1181770pfq.4
        for <cryptsetup@lists.linux.dev>; Fri, 12 Aug 2022 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=t33xrFz6Ei34A6XQRWmtHGtUe7b1OcKr4MPSIBA8t7w=;
        b=N9hmvsAqdq7/hKw/vaL+yuAKMeNv8ORHDZxEj7DDZTc51bh6+1zcL8msDFhTCnRrm5
         dG5IXofwYvlgiUTiTWx6sRRnvsnQSXoTAc/em4woYPVsBhaEaYB9cWNwrLxo33HHBrn6
         iH9O04txIBVuSe4cj7w9zot/KHxttXNGp9214GFLlSqYMhn1kcJ6RJzXhKzcscCaBw6b
         4u1La9AKEjHcEgRMFUgdwQ7EzjiFaI6pqvvg9Z7iij9PcJmomeoYL+ADMYnKLehkyuSi
         1H8cZI2bsTTJhQPvoYPaINa4LZdGVB+jHZ5WULMRsGXZAI+PhTnmgyVMeGp1an678sTp
         AHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=t33xrFz6Ei34A6XQRWmtHGtUe7b1OcKr4MPSIBA8t7w=;
        b=hJtgNZRgfG1gkwwD/euhCtX7mG6jckpUaMp0UCnpiTC59xZjAX+QOwe5V+7b2BeqMy
         SWMuT1g6eQ+lDwXSdf+ks+6OCk9qqomKKEJ7ikeK7YbdlDkfpvRPEi0Q0WoNs1MsXhpR
         aQTuAvIM0+dUUYE9sostGCUDXwdvb6vlDjif53OUmToTBlGvh/uA9UfQzam78/cDf8Sh
         QeUeI8uR6/hFR2VW0kfeFSTfnRxgV8U0NEZM5ZrW7ddXeul8aO5CD0wNp1jnO1DtwKl3
         z2aRrk4aMvlC92dXUAMU1jJ18MYbpFi2GHWmFpb/s/bKt3eeYbOiXyEJCzFguYBIcrO8
         t/yA==
X-Gm-Message-State: ACgBeo1ex51sXptOMqZQ/j5LTSrNzWZZ8X+3ISyOHUjP0tkK6o/7jGIV
	NwlVB6gf/CgrGGEJ4GeR4PXS4mE7ziqv+l7L6K2iab8OPi0=
X-Google-Smtp-Source: AA6agR67CoxMWIjYmoeWfawxXYdAT6q+Jd1KhwU4zA1Rp49zVv8hPLAAWpJtqgH/rk4FqtedepM69/7BbArUniaOzAc=
X-Received: by 2002:a63:34cf:0:b0:422:6ad6:b9b7 with SMTP id
 b198-20020a6334cf000000b004226ad6b9b7mr1612593pga.385.1660316663591; Fri, 12
 Aug 2022 08:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "doffloster@gmail.com" <doffloster@gmail.com>
Date: Fri, 12 Aug 2022 18:04:07 +0300
Message-ID: <CACHosL8YNzrWpy40ik8Ne6h1KSG7R6eN5cJDyJvs9ZX7yZ=14g@mail.gmail.com>
Subject: cryptsetup header in-place decryption - reporting about a bug alert
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

In this email I'm reporting about an issue that I read about:

Regarding the webpage "Removing system encryption" in website
"archlinux.org" - link:

https://wiki.archlinux.org/title/Removing_system_encryption#Decrypting_LUKS2_devices_in-place

There is the following text under the subtitle "Decrypting LUKS2
devices in-place":

> Warning: As of 2020, and version 2.3.3, when using cryptsetup to
> decrypt a LUKS2 block device the program requires you to provide a
> LUKS --header file. If you do not use the "detached header" feature
> of LUKS, and naively try to pass the block device itself (which
> contains a LUKS2 header) as the subject of the --header, cryptsetup
> will accept this and go ahead with alleged decryption. Afterwards the
> block device will show up as a LUKS2 device with no key-slots, and
> your data will be lost. If you try to use cryptsetup luksHeaderBackup
> as the header file used with --header, your data will be lost. If you
> try to restore a backed-up header after this faulty decryption, your
> data will still be lost.
>
> If you still went ahead with the decryption, the data might be
> recoverable by shifting the partition start after the now defunct
> LUKS header: [1], still, do not rely on this.

Note: I did NOT test this, though I'd rather let you know about it.

Thank you.
David.
