Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD213220
	for <cryptsetup@lists.linux.dev>; Fri, 28 Apr 2023 16:35:41 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2478485fd76so118167a91.2
        for <cryptsetup@lists.linux.dev>; Fri, 28 Apr 2023 09:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682699741; x=1685291741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeNQl5VJGIT32pBfhtLwl2Q2JBCJ+DppPozdjQBoECI=;
        b=cZzTsn3gUCQu55HSlBEot5ZGKDi7zVzZly3OILdKr0NOXrjEM7gjgT9ZFTG9Sa0Oj1
         MB2CyOwYgPSIrH0OoSOZtINqiwa1/tKNXMzQd2XLblEHrHF7k3l9XYkGpzsb/LHqRDGd
         zJMGywwR+D2klFFPTDrMtxIXqtvCPuhX+hlw+AyvcT8z4GEd42+z+zU6r0N92XRdN0IE
         GFJ09t04BRKy2bnEGuMp1i+syyGhCvh1HwIPPdba4XJAxoB4urla8RVpclhJc7BM7SfU
         OHKF0Z9JTgyST/D9AZQlAwbolT7Ff3WNKW99tG/XwR5VvsnZLvg1dOhEiG91fKCIoeJm
         4rfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682699741; x=1685291741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeNQl5VJGIT32pBfhtLwl2Q2JBCJ+DppPozdjQBoECI=;
        b=i/9VydrtvLm34JIvs8K6Fp6hG09R4oTBJ4kHtsc0n+N9R1HTWzUc6UgjtGY1dzHUX6
         lvMP/btrsMZUcky2BmlQfC+P1dXPsuHzXmCxYNHmjbMpMIFyDzW7euAlk7xcn6HUxJcW
         +41jvIC0dygp4tUSVWycdmdITXe/OIpM4WZQHJpghB/UN51s1YcUlmkF7m3pEP3WXt0N
         FZoTkslWTfRsZn+/BgiokSbp8qqTchnMFS8VU2+0ngzAyYqBYDJTXt6KIbyB+ytNvCVj
         UD7kxC0DfXj0NEux49cLLnS5uZr3+h5VSnXGN8o2ipfa2KnEWcNR6H3TP6E28EGZ3EaR
         I4hg==
X-Gm-Message-State: AC+VfDx5Ple6wpceefBtWHkpf1LEv6fclTMGX0Qx3FuQs7oCtpk8ZARX
	3zADPDcpgFbq2O5SkZen1mgK9a5I1XgFKUcxLko=
X-Google-Smtp-Source: ACHHUZ4kDD8pmFK2ZlOKNoXjjeZujMJHoPyO015TDuvYYatAHxAtB0Cxtdv9A16qgZ9yeZMegWgxjVCOkP21sD53tUY=
X-Received: by 2002:a17:90b:1bc9:b0:246:91d0:9e6f with SMTP id
 oa9-20020a17090b1bc900b0024691d09e6fmr6000346pjb.3.1682699740726; Fri, 28 Apr
 2023 09:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABOqr=M+uDDXC-xG_hnxGB-7MZnWUwONizC6c=r5NCYaCz6Pxg@mail.gmail.com>
 <eb371bc1-6210-95d7-ee63-d8dc243b7da6@gmail.com> <CABOqr=MqFcTn77WEg9XPHDPBx=Y7nD-fR+_=ujDzmRQq7LW67Q@mail.gmail.com>
 <b08003f6-b01f-d419-c771-28237dd9590e@redhat.com> <CABOqr=MFLfQsPg8sUJ2pYCkZSbtwXVcpRcakqiZQ1HEuLNX-KQ@mail.gmail.com>
In-Reply-To: <CABOqr=MFLfQsPg8sUJ2pYCkZSbtwXVcpRcakqiZQ1HEuLNX-KQ@mail.gmail.com>
From: Lodewyk van der Westhuizen <jl.westhuizen@gmail.com>
Date: Fri, 28 Apr 2023 11:35:29 -0500
Message-ID: <CABOqr=OEyA_gFycqG9_sGm8LmpahFeo9gWqgLfsP_=feGTGt5g@mail.gmail.com>
Subject: Re: Performance issue LUKS1 vs LUKS2
To: Ondrej Kozina <okozina@redhat.com>
Cc: Milan Broz <gmazyland@gmail.com>, cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CORRECTION: the file blocksize (not actual size of the file)

On Fri, Apr 28, 2023 at 11:05=E2=80=AFAM Lodewyk van der Westhuizen
<jl.westhuizen@gmail.com> wrote:
>
> I can do that - what kind of information would be helpful to add.
>
> An interesting observation (anecdotal at best) to add is that
> initially there is a whole bunch of kworkers threads and then it goes
> down to a few 2-4 whereas in RedHat 7 the kworker thread count is
> exponentially more. I only see more kworker threads when increasing
> the size of the files being created/deleted (1024K vs 2048K vs 4096K
> etc).
>
> I'm still hoping it's just a parameter/flag that needs to be tuned.
>
> Thanks for all the help.
>
> Regards,
> JL
>
> On Fri, Apr 28, 2023 at 2:28=E2=80=AFAM Ondrej Kozina <okozina@redhat.com=
> wrote:
> >
> > On 27. 04. 23 18:08, Lodewyk van der Westhuizen wrote:
> > > Hello Milan,
> > >
> > > Thank you for the response. I'll try to answer your questions as best=
 I can.
> > >
> > >> NOTE: LUKS1 is not cryptsetup version 1.x, it ia a metadata format.
> > >> All recent cryptsetup 2.x versions can use LUKS1 as well - just use =
"--type luks1"
> > >> in format (so you will compare the same formats on different kernels=
).
> > > OK let me rephrase, when using luks1 or luks2 the performance slowdow=
n
> > > is still there. The only difference is the version of cryptsetup,
> > > dm-crypt and the kernel.
> > >
> > >> You mean slowdown with access to encrypted data, not unlocking time,=
 right?
> > > Correct, measuring the I/O (creating/deleting files)
> > >
> > >> Which crypto modules are used? What architecture it is - do you use =
AES-NI
> > > acceleration on both systems?
> > > It's Red Hat for both machines (RHEL7 vs RHEL8).
> >
> > Please open bug on https://bugzilla.redhat.com/ (product RHEL8). It may
> > be system configuration issue unrelated to dm-crypt/cryptsetup. If it
> > turns out to be issue in upstream code as well, I will open upstrem
> > issue for it myself later.
> >
> > Thank you
> > Ondrej
> >
