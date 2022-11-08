Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD02CA460
	for <cryptsetup@lists.linux.dev>; Tue,  8 Nov 2022 20:10:32 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id m6so14799532pfb.0
        for <cryptsetup@lists.linux.dev>; Tue, 08 Nov 2022 12:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a38GOfMYfvlcPORSE9QLOH661hnrAHUtM+MU/BIqhQw=;
        b=Er0tVAn9tD51kAFbjpC4LcIXb36XWTn1m+LIelwVtH4/tv7gCRN1+2T8gdHUVyk1KX
         mY9vDNkZrNFmhCE1B3fxwZRSKhknDsB2HM7oXow5COCvb98dgpornPfb32maU3GRDSD0
         t4VxCo81LO7xeWzHVKAWLdapPWNwOdvfhz80gQROPas1AGeBy0ZBJz8rZpoWo1HFgCUA
         KzX/N8T6EPz9STvb3N4NR1uHMTV0tgjSEoO1bCmTy4XzMtbA7YwY3WHxIDOTyhOpRzMF
         4YDvOSvSf5FSn8fy1rSALRPck+8hKeTnoX/V6mu5yspq908zfFc82lTsVotNTvirFmNU
         GQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a38GOfMYfvlcPORSE9QLOH661hnrAHUtM+MU/BIqhQw=;
        b=2Oo9x5Gg7wFimop2E/Ajxo+bCoBwd5YKWeRQoJSkBIDRR16Z/Rb7goVr4nhIzgE+0P
         WH5oGILtneoK1g6y5eKRwZbrOrad8dhCtE4bK/qZPXE4cvV6587nuHnBgoxAMq5R5Tvv
         ZhGphvWImC9jVdwmOUcRl0zSvGe7JBQNvRz5S/EiduZ9fjS+fEKKzT5oKpsP5p+yoVrN
         QpLxtcskd/d8Y7UomclWudU/DwVmPdjvYKelFOeUzrg0mwNa7/6V7J3CL734oK1zTtxu
         aSnXlz4XR6SW2/ikTmJWcaX5ehe5TnQ0SLAs2USC56mDczk7bI3JmajklM63utCj08OM
         n0Hw==
X-Gm-Message-State: ACrzQf2d0qVXzPgzPwa9ReogSM6Vl7A8MSHTrcRVOgzhbj47fSr8Dz8K
	oHkiXBB1qi/mw31cgKm/2t7w9W8DShyENA5oWyu/n6uW
X-Google-Smtp-Source: AMsMyM5lEFB6CRJdhi8yOTN4Ksl+pgiOxrfeOYKhg6+WtEnA1mD0aNfA+88Fu/mCXF2uaFjYzm5k3MyXHJISIt3X1rM=
X-Received: by 2002:a65:5583:0:b0:461:25fe:e982 with SMTP id
 j3-20020a655583000000b0046125fee982mr49275203pgs.4.1667938232168; Tue, 08 Nov
 2022 12:10:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN+za=M8rBabbD841n=L55bP9KdCjiPDAAgGDtoUM6ydje0few@mail.gmail.com>
In-Reply-To: <CAN+za=M8rBabbD841n=L55bP9KdCjiPDAAgGDtoUM6ydje0few@mail.gmail.com>
From: Philippe Cerfon <philcerf@gmail.com>
Date: Tue, 8 Nov 2022 21:10:21 +0100
Message-ID: <CAN+za=PQpm8MiUYpbB_aYqEnTRz2Do2sqr2yZthEp3oO4qGSPw@mail.gmail.com>
Subject: Re: security of re-encryption
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey Michael.

Thanks for your reply! :-)

> Consider just that the first several bytes of the HTTP
> request portion of a HTTPS transaction are not just guessable, but
> can
> pretty much be considered to be _known_ since they are essentially
> dictated by the HTTP standard.

I had thought about that, too, but imagined that the following might
make a difference:
- With HTTP, only the first few bytes are the same (more or less)
unless one transmits large files or so (but then again, wouldn't TLS
renegotiations hapen after a while)? With LUKS one migh have many TB
of ciphertext (before and after). So I wondered whether that could
make a difference.
- With TLS, doesn't one typically have some ephemeral key, and even if
that was compromised only that particular session (or part thereof)
would be compromised. For cryptsetup the key is "static", so the
effect would be much bigger.

Of course I didn't want to imply, that I'd knew of any such attack.
I'm not an expert, so I merely asked whether something is known and
whether re-recryption is recommended from a security point of view!

So I guess it is. Thanks for your help.

Sincerely,
Philippe
