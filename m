Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D261BDA83
	for <cryptsetup@lists.linux.dev>; Tue,  6 Aug 2024 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722945331; cv=none; b=mI+DUJczGV81eMeEuWKtJuW9pptwxqdzx1OuFm051FxsvIrS8fy1IL0LZkGhuPrA7AxpebwoDphrfyCjc13I+v583REEXDonWOSbioiMd1Gc+jEjcd0sFRBJQQ0sT96RG1UjIdfPpe9cHaVlTYrP1WmqYSmz8LSSAr4B5IT1eFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722945331; c=relaxed/simple;
	bh=1xfR6N0wluXVx9YFsIAxVOmm5K6QIQXzYE+h2t6TMMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=su2DLbFh7jaxCcwz8dpDcct5ksfSCIY7l+IyeSqijyaUPwUAlRGpZUE1WRptiMig/1XLZVRgZJxe4JSLtr8S/c3WHx4ypG+4m6bLQbAFmsadkfGlNPJUT0FDKhFrFGMxA04dU4UH8HDRlJnMEksnIbnxLDnU18BPizH7YkTKDkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSJjKeZm; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSJjKeZm"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-69483a97848so3983377b3.2
        for <cryptsetup@lists.linux.dev>; Tue, 06 Aug 2024 04:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722945329; x=1723550129; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xfR6N0wluXVx9YFsIAxVOmm5K6QIQXzYE+h2t6TMMI=;
        b=jSJjKeZmwMIfggMvDHbyZBOsqHIpDJniFjWvQgND4JGAaVtp5lI61pb/ozMVZ18vd1
         xger5mqxSXKB+kRBEq3AoNbsueA8qRreX/AuuLXviRarfTqdUjGb712Myb1Ft6vPlcgg
         QqP/yBnxOZyMuYTlcBitBYrJxYkbNzij0N3C2rEEjS4RKDHmc6AmOTGsAg8Tyu9oewC0
         /FGitTftR5++vFDaKmxdUhr4WJMWZVKtY7lKOhwf2zFcfLteVb14L4CtCf4RXTLsn4Q5
         xrDcJhESGfzrtgpI8A/M32h8ty3T9KDPcqlVSBtb9f8bOEOUjk2IV8rXxIqUmnSlLlY7
         aM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722945329; x=1723550129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xfR6N0wluXVx9YFsIAxVOmm5K6QIQXzYE+h2t6TMMI=;
        b=uRY2C8fEN4KeL8SwZRBdlewGwixTMLRrRYXau6BjEyNVwOJ50e1pjdkKFbDDwxEqKH
         7NnUYLlCwr0QKBsPo8FZWw+k5yk9IyKBc2ABLGhgKKrZVyLXR1ZwBYOqXCKjV3tHzHOP
         xXFjgjy6OnXRmY6o6QpxUDZBlWZWKsOLB+mC2ive0+lFfAcpiMUaRAEhT/YZ5uaGAV4+
         72whOsqGM3bHB1QdPp0WqFm3gWLKgbZq4d0IWzAOiXFFgn/jxzcUTm6sWR0YATDRspin
         DMkB332W9EWVTWKL9ET1uBkgxwLNEWiJLC5bFPNOT/y+6KO4Aya9dwdLIZEuFlTsIS4b
         XkPw==
X-Gm-Message-State: AOJu0YxeRWfuAQRtlPLKRM2JyLQPNyC3yC6BgPodqxm7trT3NxRVPJaC
	jJC6kVvuVj2+v3f10CB8pDgRtKy1Y1g0wIPkIhsgRS0H6CrUhKJjbko6r5YL8xfAb1z8Zt4W5TV
	xq0KSuGqQJVU+lgaDTt+dkVjPbcdFsfcr
X-Google-Smtp-Source: AGHT+IGlTsK3EbLjL92m+htW6wNWIkaV4B5fkZyfwI5/BqskWpNQd0F4Mzi1ty8aFFFc2GYOUGu8kRHPbA1J0UfM0CA=
X-Received: by 2002:a05:6902:2605:b0:e06:405a:27e7 with SMTP id
 3f1490d57ef6-e0bde293b68mr19082418276.1.1722945328599; Tue, 06 Aug 2024
 04:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABYE94Hx36XOAzqtjpcKdT4S4YyBoCiXVdVXo2bCu02JguBgEA@mail.gmail.com>
 <7c0b967d-1b88-47b4-9d87-bb93a9f90945@gmail.com>
In-Reply-To: <7c0b967d-1b88-47b4-9d87-bb93a9f90945@gmail.com>
From: Tomasz Kurzawa <tzkurzawa@gmail.com>
Date: Tue, 6 Aug 2024 13:55:07 -0400
Message-ID: <CABYE94EyAoO3XvSvQtPoQna_5ZbHLtQb=WD9wEsG_vxkJKGG4w@mail.gmail.com>
Subject: Re: Custom OpenSSL
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So, just to clarify, there=E2=80=99s no straightforward method to specify t=
he
OpenSSL version for cryptsetup using an environment variable or
configuration file? I=E2=80=99m trying to use a particular OpenSSL version
exclusively for cryptsetup without altering anything in pkgconfig.

On Tue, Aug 6, 2024 at 7:30=E2=80=AFAM Milan Broz <gmazyland@gmail.com> wro=
te:
>
> On 8/6/24 7:02 PM, Tomasz Kurzawa wrote:
> > Hi All,
> >
> > I am currently working on building Cryptsetup with the --enable-fips
> > option and integrating it with my custom OpenSSL build, rather than
> > the default OpenSSL provided by the operating system. Despite my
> > efforts, the debug messages indicate that the system=E2=80=99s OpenSSL =
version
> > is still being used.
>
> Cryptsetup does not do any magic here, it just use what it detects.
>
> So, for compilation, change your pkgconfig to point to your devel version
> (usually links in libcrypto.pc, not in openssl.pc that references it!).
>
> After installation, is is only about your ldconfig path.
>
> It is not so easy as link to one library, OpenSSL3 uses providers and the=
se
> need to be loaded from a specific location (see libcrypto.pc).
>
> If it is for older OpenSSL2, then situation can slightly differ, but
> the logic is the same.
>
> >
> > Here is the command I used for the build (custom OpenSSL is installed
> > in /usr/local):
> >
> > LIBCRYPTO_LIBS=3D"/usr/local/lib64" LDFLAGS=3D"-Wl,-rpath,/usr/local/li=
b64
> > -L/usr/local/lib64" CPPFLAGS=3D"-I/usr/local/include" LIBS=3D"-lcrypto
> > -lssl" ./configure --enable-fips
> > make
>
> Do not use it this way, keep autoconf to detect LIBCRYPTO_LIBS
> (set by pkgconfig).
>
> Milan



--=20
Tomasz Kurzawa
