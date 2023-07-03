Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BABF9C6
	for <cryptsetup@lists.linux.dev>; Mon,  3 Jul 2023 13:18:42 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-569192fb4b2so2276587b3.1
        for <cryptsetup@lists.linux.dev>; Mon, 03 Jul 2023 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688390321; x=1690982321;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mX8lGsp2bwKMqBvnXPtDSrB9oQ82VYDhOdmPs+mVpQ8=;
        b=PsxMHratQLcNmBkuGtq/uWOaI5tAFdzU2kZ1g7z2OnCjTbWZM5vL3iJWJY0ojve3sj
         yRSRYEbFGMLtvFH8SXf1d+uO9lC8Wl2NXo7vIsB4LxZq32mQ0PJl0Ovn2Huf52ERxgZ2
         wx0t2jqES93o/ubpyfWKsUaDlC/HfoUtyrPtg4Ffg30ByUNyEtKeXYJ2ToH2ngSTTUwY
         HOL4wK9/ZjIEv/ME3Q468SkEhGajx8rdVdsA7xKDDOGC83KKG/57phWq/Qj65acsrzbR
         AYeGbwA4ZOmTpc/glfG48HkuQSFmL9bos1cClDSWDeBsM4dvgLCJf4o8Kj2fCRd3EjsD
         4CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688390321; x=1690982321;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mX8lGsp2bwKMqBvnXPtDSrB9oQ82VYDhOdmPs+mVpQ8=;
        b=Fsi9TlUAqL4hEns3OTipoOw8tGgsl9RNBi5JGeR4xUFwTIqFsT53b2aT8gWSTjoLVv
         93Wc0D8oAeZCnPXAIcm8HtT6lc0djX7MUqLm8N+qtcU+epydcGskzDMKtR84KtNsmtoh
         fJ4eaeFHUGBVGErF1DYaLaGLYGxIR5npggFCaljx770hxf/hHRFsM++1Uz4uzripsg0g
         8ga0UgNVZK2vlhmez6AtE4h4ah3wqn0yJpxe5X9S5bmSKIenxL+p1/8PKZYMc/HvDo5f
         oatK9mogZxO/qX0yXPMHGnSzmwPJWEoDa9IAqovxfTsuaBpmYmW92iLlbA5h25qIulUB
         b8Sw==
X-Gm-Message-State: ABy/qLZRetKp0w5vJDgqffjrDTxB0M/SX7JbqI4158DQ5opnYkCHZ0Vu
	gF5w0V0CvSFuOG7BgmV/cNTy9FRVjl+hO+P+BTYks5dNXAgdHA==
X-Google-Smtp-Source: APBJJlGuyPrCSwXtk6G21Oig12N/DE9iYdMPvWCR+PvRfAVRDeztm8TKjzU8mqryoQEZHIjpnebYdHTcCVGYtv8+zec=
X-Received: by 2002:a25:dc10:0:b0:c4e:48eb:b8c8 with SMTP id
 y16-20020a25dc10000000b00c4e48ebb8c8mr2392141ybe.6.1688390321441; Mon, 03 Jul
 2023 06:18:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACJx3YoFZse7gyk=ZzuqKKRKr=r2_+3yuwRyOmuBZ=RnL=8BGw@mail.gmail.com>
In-Reply-To: <CACJx3YoFZse7gyk=ZzuqKKRKr=r2_+3yuwRyOmuBZ=RnL=8BGw@mail.gmail.com>
From: Alvaro a-m <alvaroam007@gmail.com>
Date: Mon, 3 Jul 2023 15:18:30 +0200
Message-ID: <CACJx3Yqq13sijSLdsGfjJ1bZigrfeP-oR79nXgbXw4_6mPt04A@mail.gmail.com>
Subject: Re: QUESTION
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI everyone,

My name is =C3=81lvaro. I'm texting you this email about LUKS. I have a USB
with 3 partitions (/efi, /boot and /data with LVMs encrypted by LUKS).
I have a problem entering the password as I don't have a keyboard and
I need to enter the password with a touch screen. I tried to search
for information about that but nothing was successful.

Do you know any solution for this? Can I enable the touch screen
before LUKS gets up?
Thank you, have a nice day.

Kind regards,
=C3=81lvaro

El mi=C3=A9, 28 jun 2023 a las 10:45, Alvaro a-m (<alvaroam007@gmail.com>) =
escribi=C3=B3:
>
> HI everyone,
>
> My name is =C3=81lvaro. I'm texting you this email about LUKS. I have a U=
SB
> with 3 partitions (/efi, /boot and /data with LVMs encrypted by LUKS).
> I have a problem entering the password as I don't have a keyboard and
> I need to enter the password with a touch screen. I tried to search
> for information about that but nothing was successful.
>
> Do you know any solution for this? Can I enable the touch screen
> before LUKS gets up?
> Thank you, have a nice day.
>
> Kind regards,
> =C3=81lvaro
