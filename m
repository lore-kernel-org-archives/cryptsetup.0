Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AA8224B1F
	for <cryptsetup@lists.linux.dev>; Sat,  4 Oct 2025 19:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759606151; cv=none; b=K10OCBKpagdkXb8ZZYVUR0sKmQbzXSuSZO3MnDWxSyVHF8g96BBtU4xWbGTHa5I0871NWKn7WErRVQxwsxbcnxHWy90L3VBbr1BY2G3RTD7PL/itYwKdmANIz2wm8L6VMXKF+qROAuTqAgsI6uVyLrtRo9VJQq4T7zMG2MKYCik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759606151; c=relaxed/simple;
	bh=rMNM0svuzHrywpUgy7YLFVESpnEGUOLLHOr7XIsK824=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onpFz49gcag0tBOP0HU95IgYdRKjnGJshZLZbkMkZbNpplUGwyIVJuDaUIXuubnnJDgoLWMhQ7aS+6SzS+rt25jl1zMrRY17uALVMt+rn6cGcs/+JhcDVeOeCIcotIF001ZBG9DoM+oV3zTdfSwOP/Q6+2cx4Jd3A39eDS85ePQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbV47lLr; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbV47lLr"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6352c8b683eso4480236d50.2
        for <cryptsetup@lists.linux.dev>; Sat, 04 Oct 2025 12:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759606149; x=1760210949; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+WE500TodNrFACESMrxxKfpJYzyNwAljGR7GXltWTU=;
        b=jbV47lLr7hJ/VTq+StfU5Lw9Slhr89qezo0mVXSHAgfKL2+ncCymoehIOEqYy5KAoC
         JVP7zHFc2aiMNqsIj4fVwsnlVnIR/OIlSlVyjRJaft83+5dR08TDH4GqV8YpeIIjeJV7
         wyRbgM7iGVE65ScVbZ7qMe12zy7EpR1YbEnS/cYlbKeoMKapwpWy69Ygr1XTYZZn/Iyk
         gxFEuL/2vGWnBJE6/gj/EXjalLfDblZH3QYnRCMAr3Hvah8He+BTTG/zplIroVRU3cTV
         QL4v/Z5OYexPWbpD3tvX0/bB6gPU9RX9hbvgjTRGcP2C6Ld724jI3Zt04LIHKw1NWkdt
         7dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759606149; x=1760210949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+WE500TodNrFACESMrxxKfpJYzyNwAljGR7GXltWTU=;
        b=Q5cEbSOU+EgcKzm0i/t7n/u4d1m3NuZBxTpbO6PLcLevoQIJEzGvit8ArK+gexSDaV
         LdttHhshSTwda6oD4qTIgCJtSS59iqUCuorUJOMmx+sTtas83DWcVoWPM59oFStYZijR
         4LXWkftCx1IBehcXYt4Qg0HULsYP9mcvYR33+Tt8AUCFRPu/rZbK7d+XKmUEV7Ap6x+9
         94D6W+1bL68DThVITeR3FPD+wzhjc+SMRYZF47Z+9o3gZYbfeRWnOLrnA4jLXOWDKlBC
         VnYDEft+gYbCJ7xW94QeW/igzF603D2SLghauBLtesN+7z4/nHvshmkd+TZtoiNS74u3
         XqZA==
X-Gm-Message-State: AOJu0YzTxR00SYkHbTvQDQONG7tqB4hAAD+CARk5daR/AIcWWgCGw6Sh
	rp6SM5oFB8ikhY2qbwRlCB6qSrmwmMlue8OKrQjwwZqvFeqdnpOfTSY/h7TsMH1+EI2tnjfuqMj
	OBAOPwHisKhVroQgdyk+jyC73Y3zJPBg=
X-Gm-Gg: ASbGncu24xX9q/eb2RjpVPRFLzWZIpADU+ul0J8dNjBhqHcXd3nx8oapUTdpTPIDtrJ
	zvfROyxRdB9nCxdW5S6oq0F7PgA8x9YcwAi2fI0zbklYN0jKjQTD3ok2EaWTH7NzURsbJqwjaTy
	Q/a3Tj9FjFfidM3vTgh7WqO7QiRFZk2zaEjwsucABYs5hnugPJz2jW+Fk2wESMQmKF2lftNjI56
	YE+Ma6NiJQGKiC4wOXmnH/ymt9n6XehIyg5jQfBalsCGbOA6/dt3v2qxjZoDfj/cI2BIsVsMj+s
X-Google-Smtp-Source: AGHT+IEU6eHfcONn1GLiA+1/jHYrmpxyFpqDzBt2AYYfPuf/EjqqB5sFWkzlCtQJ9BZiuQBR3WlWHXrIorLB68qEm0s=
X-Received: by 2002:a53:8641:0:b0:62a:b339:20d4 with SMTP id
 956f58d0204a3-63b9a0728c1mr6411254d50.21.1759606148808; Sat, 04 Oct 2025
 12:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251004003554.234647-1-kfirka3@gmail.com> <61a493d0-0236-4508-aec9-b29ea6433244@gmail.com>
In-Reply-To: <61a493d0-0236-4508-aec9-b29ea6433244@gmail.com>
From: Kfir Ka <kfirka3@gmail.com>
Date: Sat, 4 Oct 2025 22:28:57 +0300
X-Gm-Features: AS18NWC_MnWGlkfGswudf49adtc5rQoq3BbKr8oMwa-wI0I4UY1wZO2W0NJrYso
Message-ID: <CAGr_o3CFk+EaQ9uEXCbGWow9mE+P0AYinfqFytuRG0ckzGyCGg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Bitlocker: Support clearkey
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev, Vojtech Trefny <vtrefny@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would like to create a Merge request but unfortunately I do not have
the permissions to do so.
It seems that you will need to add me as a developer in the gitlab project.

=E2=80=AB=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =D7=A9=D7=91=D7=AA, 4 =D7=91=
=D7=90=D7=95=D7=A7=D7=B3 2025 =D7=91-21:17 =D7=9E=D7=90=D7=AA =E2=80=AAMila=
n Broz=E2=80=AC=E2=80=8F <=E2=80=AAgmazyland@gmail.com=E2=80=AC=E2=80=8F>:=
=E2=80=AC
>
> On 10/4/25 2:35 AM, Kfir Kahanov wrote:
> > This code enable support for clearkey bitlocker protection.
> > Closes: #962
>
> Hi,
>
> as this is not trivial feature, please submit it through
> merge request through GitLab project page.
> You already have issue there, so it should not be a problem.
>
> This way it can go through CI and all discussion and changes
> will be there. Also it need to include some tests.
>
> For the patch - we planned support for Bitlocker clearkey,
> so it is definitely something that I would lite to merge.
>
> However, I do not understand why you need to touch API
> and other formats. The whole implementation should be embedded
> in BITLK format support only.
> IMO if Bitlocker header contains CLEARKEY, it should be used
> directly. I know it will be a little bit tricky to support
> it through existing calls, but I definitely do not want new activation
> API call and commandline option for it.
>
> Anyway, this discussion should happen on Gitlab, we can
> discuss there possible options for integration.
>
> Thanks!
> Milan
>
>
> >
> >
> > Kfir Kahanov (2):
> >    bitlocker: Support clearkey
> >    bitlocker: Add clearkey option
> >
> >   lib/bitlk/bitlk.c         | 106 +++++++++++++++++++++++++------------=
-
> >   lib/keyslot_context.c     |  97 ++++++++++++++++++++++++++++++++++
> >   lib/keyslot_context.h     |   2 +
> >   lib/libcryptsetup.h       |  24 +++++++++
> >   lib/libcryptsetup.sym     |   1 +
> >   lib/setup.c               |  24 ++++++++-
> >   src/cryptsetup.c          |  20 ++++---
> >   src/cryptsetup_arg_list.h |   2 +
> >   src/cryptsetup_args.h     |   1 +
> >   src/utils_arg_names.h     |   1 +
> >   10 files changed, 234 insertions(+), 44 deletions(-)
> >
>
