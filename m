Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D1B5CB9
	for <cryptsetup@lists.linux.dev>; Fri, 28 Apr 2023 16:05:24 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-63b5c48ea09so149550b3a.1
        for <cryptsetup@lists.linux.dev>; Fri, 28 Apr 2023 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682697924; x=1685289924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0wvXqY0exSK8DmmOvK8Bt4p3Rf+MQfm9O+T6UGjLXU=;
        b=pNL8U4BNUkJGYDEU3ZL/4jNiWmnW0ijoXt0HfSQJCY2Qz0TJqkWjhVQO//SBfJJ4wp
         vMvAwLSUiK4DbTmvyqH4POZsmSIMmtIRIagQaoP1odMEX+FqoRsN32o2T/LtGGQi9TXB
         8o2czxeSkBfhWukX3Pykp3Gw5uVYWIHeRVyNLzu40vPznAMrhvE9oqcV9KcRWO/BInEh
         w0FHJDp3y9Tev5cdvoI2Zyc7ZCsyqOc/Dn+/wAI/XYDIeqy2CKDEho5qtVRJJGacKt+8
         HDig4KapLTf0EHk5FrOQefaE3Cyd00OS/y+iuG/pO7vdjVNYW9YRC83LlyHmlLsBuIFZ
         YH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682697924; x=1685289924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W0wvXqY0exSK8DmmOvK8Bt4p3Rf+MQfm9O+T6UGjLXU=;
        b=WhOUE9uGh9FKWgnzddaVsq9EbsXw5DRQjiEBiOS/AZsVvJxz+F3fNXQ58DFYrWlqWA
         k+mcu2tda8ldFPVuPfwKQ14250jDE3g9dlAvMq9Iwu763ZwJQtdC8Jsh+aMP/bReC16q
         N4saxXUuZGX6U13LZ/t8rHGY7kALC9rO+Bnqi5llFLiR8ZvkCjwPiy8oQUqY2vVKPspm
         I4RVF6tasa+43JPFexDZjaaYKEOADGaTR5sbNQFp6zgIr+gbhAnY3QvLIROZPh2M9qmP
         U+iMTvbED/Hw6TwSgLUJaNZ5A+bKACFnMcamN8Xg8X8Kys1INKie6NA87UGAva+zyPb+
         Yaxg==
X-Gm-Message-State: AC+VfDypGkuH3Z/qGkHJx6Nrxdwk5w8ilYtolojRzOO+Oev6+0/35hdE
	d7V32us14N78t4TUfFuKYyb/wynZsnf4xOFfybk=
X-Google-Smtp-Source: ACHHUZ5GT3MsOF1OQ5s7fSeAY+VPplSBTVC0FJfMzU0fSd5Iew3RTahVvKjWKAea3ETxoCp1g/hF4j/Y1a+VWi3FkwE=
X-Received: by 2002:a17:90a:c705:b0:247:31c9:65a1 with SMTP id
 o5-20020a17090ac70500b0024731c965a1mr5992454pjt.14.1682697923616; Fri, 28 Apr
 2023 09:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABOqr=M+uDDXC-xG_hnxGB-7MZnWUwONizC6c=r5NCYaCz6Pxg@mail.gmail.com>
 <eb371bc1-6210-95d7-ee63-d8dc243b7da6@gmail.com> <CABOqr=MqFcTn77WEg9XPHDPBx=Y7nD-fR+_=ujDzmRQq7LW67Q@mail.gmail.com>
 <b08003f6-b01f-d419-c771-28237dd9590e@redhat.com>
In-Reply-To: <b08003f6-b01f-d419-c771-28237dd9590e@redhat.com>
From: Lodewyk van der Westhuizen <jl.westhuizen@gmail.com>
Date: Fri, 28 Apr 2023 11:05:12 -0500
Message-ID: <CABOqr=MFLfQsPg8sUJ2pYCkZSbtwXVcpRcakqiZQ1HEuLNX-KQ@mail.gmail.com>
Subject: Re: Performance issue LUKS1 vs LUKS2
To: Ondrej Kozina <okozina@redhat.com>
Cc: Milan Broz <gmazyland@gmail.com>, cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can do that - what kind of information would be helpful to add.

An interesting observation (anecdotal at best) to add is that
initially there is a whole bunch of kworkers threads and then it goes
down to a few 2-4 whereas in RedHat 7 the kworker thread count is
exponentially more. I only see more kworker threads when increasing
the size of the files being created/deleted (1024K vs 2048K vs 4096K
etc).

I'm still hoping it's just a parameter/flag that needs to be tuned.

Thanks for all the help.

Regards,
JL

On Fri, Apr 28, 2023 at 2:28=E2=80=AFAM Ondrej Kozina <okozina@redhat.com> =
wrote:
>
> On 27. 04. 23 18:08, Lodewyk van der Westhuizen wrote:
> > Hello Milan,
> >
> > Thank you for the response. I'll try to answer your questions as best I=
 can.
> >
> >> NOTE: LUKS1 is not cryptsetup version 1.x, it ia a metadata format.
> >> All recent cryptsetup 2.x versions can use LUKS1 as well - just use "-=
-type luks1"
> >> in format (so you will compare the same formats on different kernels).
> > OK let me rephrase, when using luks1 or luks2 the performance slowdown
> > is still there. The only difference is the version of cryptsetup,
> > dm-crypt and the kernel.
> >
> >> You mean slowdown with access to encrypted data, not unlocking time, r=
ight?
> > Correct, measuring the I/O (creating/deleting files)
> >
> >> Which crypto modules are used? What architecture it is - do you use AE=
S-NI
> > acceleration on both systems?
> > It's Red Hat for both machines (RHEL7 vs RHEL8).
>
> Please open bug on https://bugzilla.redhat.com/ (product RHEL8). It may
> be system configuration issue unrelated to dm-crypt/cryptsetup. If it
> turns out to be issue in upstream code as well, I will open upstrem
> issue for it myself later.
>
> Thank you
> Ondrej
>
