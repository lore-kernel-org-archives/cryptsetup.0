Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95034D524
	for <cryptsetup@lists.linux.dev>; Thu,  2 Mar 2023 22:12:53 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id d7so906075qtr.12
        for <cryptsetup@lists.linux.dev>; Thu, 02 Mar 2023 14:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677795172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLU57gGnKbYtTPcoBDXhf8kk1hZyzrN9NYfoqb4KPVk=;
        b=SJimYgOchvLKHUq67WdeLLmJsCjFjXFeaoQyWNHL7vMaoTnfF9RE5J/rlaYHifLG4l
         m2Ep1KsYU/rTbgSCphOFz00qakgo6vKPCrSZuETk+gBMncnJHGciI2U8n8uM9guKvXau
         x/0qUJjXrEKKXZMr2cMS6kCGshmZj8zW5p6ZQxlBEXg9lWYjRj25mwb4vtH6aiImGsjC
         7QOoIIZMXYfNYgYAjygoMGwxqmh85sPCZ1GkcaCjP5aFW2PO5JkE6eA3FzqKDjF/WhLt
         CILLei1mLWlnqCos+4XvYD/+Rpw6gOvCZMeWdumjS5YLZ7olXQ4J+sOUhbf+2mLSoDRi
         bamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677795172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLU57gGnKbYtTPcoBDXhf8kk1hZyzrN9NYfoqb4KPVk=;
        b=v/iPjjW6V/2Fh6ww7yJTWfSiIn+oajQ1D//rgbWY2+Yp5pVcftJUd16LGr/sQ9EN8Z
         5KCQxGSJd8dUYMatb572P97cNhlHcPbes8NqjOuwgBR8H+HaV94kuVk9SnWo27g/Ijj4
         sjoZC6HUQfisElsqqGZAfKZoOWW2ojFlkcvgv38+kQjf8gN+zmNZeHMCd4MR0nXM+TzL
         LdPWVZa5arLUvlVmL286tLncGZH4sQf/OJ2XTg8u9e+SPRObr9q/t+nrW/fEGLZt1312
         IpyEgDwMlGRTPmnrTKPPbu/GFCShKan1FHP3xP+rUuMumsevzUqvt3HrHcLiN7Z5Yoph
         +llw==
X-Gm-Message-State: AO0yUKVlE+uurCKI6eD8wS6DQ5TldiFPh/qvCr4U925fYAaOsQZ7jx7+
	oBry85pACsFHyo0ri5E4Pf1gQJWM76uQIWPrEUeJBW2sA1k=
X-Google-Smtp-Source: AK7set/NOjYT+uVXyCaYoRXctoNc1djTagzP3TYLFxJh1cqp2iA+m7XaQAKPvTUeDFLLiTFCizHkJvxNKoBNzV7OFoA=
X-Received: by 2002:ac8:116:0:b0:3b7:fda4:c86e with SMTP id
 e22-20020ac80116000000b003b7fda4c86emr933464qtg.3.1677795172416; Thu, 02 Mar
 2023 14:12:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD-Ua_hj1hkymLbyEyT-eNyCj_naiqHqg7nr3nos8tp9XCERDg@mail.gmail.com>
 <64fc6294-ca5e-f7a9-302f-63b09d569586@gmail.com> <CAD-Ua_h2GDZexz=DC3YA88nO-OhXKyGp1v2D6rWvHHQVwtCgFw@mail.gmail.com>
 <3b08eace-b038-bab1-4f65-f9c322dc90a4@gmail.com> <CAD-Ua_j_AR4BJWJPXs9Lv+qO1-c33M59UPg_1_XQdB60s0MEXg@mail.gmail.com>
 <46a11902-fdbd-4c75-a589-840e4e1f3e27@home.arpa>
In-Reply-To: <46a11902-fdbd-4c75-a589-840e4e1f3e27@home.arpa>
From: Lars Francke <lars.francke@gmail.com>
Date: Thu, 2 Mar 2023 23:12:15 +0100
Message-ID: <CAD-Ua_gQLB+6a8=eRQd7B8u76hmvGFH+xPtzJKXPwn=gjuF=uw@mail.gmail.com>
Subject: Re: cryptsetup - No key available with passphrase
To: =?UTF-8?Q?Michael_Kj=C3=B6rling?= <152cc69a347e@ewoof.net>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

thank you very much for the ramfs idea and your input.
I would have done this next (and I still might) but it could be that I
found the issue.

I'm running more detailed tests now.
This Github issue[1] made me run a memtest and that did show errors,
but those errors went away as soon as I enabled the AMD EXPO mode to
overclock the memory.
It's the next rabbit hole I'm looking at now. But using that
overclocked memory I am able to run all the commands from this thread
successfully (at least when I tried it just now, I'll reset everything
and will try again).
Next test was disabling the EXPO mode again and it still worked and
memtest shows no errors. That is weird.
I _did_ update the BIOS yesterday. All PC components are brand new....
it worked before the BIOS update, the problems started after the BIOS
update but because there were a few hours in between I didn't make the
connection until now.

I have to admit: I did not think about memory as being a potential
problem but it makes sense that cryptsetup/LUKS/dm-crypt need a lot of
memory for some of the operations.

I'll update here should I find more.
For now I hope I have a stable configuration.

Thank you both for your help and sorry for raising this unrelated
issue - cryptsetup was probably just so early in the installation
phase, other steps would probably have failed later as well.
I can't think of anything cryptsetup could  have done to prevent this.

Cheers,
Lars


[1] <https://github.com/systemd/systemd/issues/14927#issuecomment-636415564=
>


On Thu, Mar 2, 2023 at 10:55 PM Michael Kj=C3=B6rling <152cc69a347e@ewoof.n=
et> wrote:
>
> On 2 Mar 2023 21:34 +0100, from lars.francke@gmail.com (Lars Francke):
> > I honestly don't understand what the problem could be. All of this did
> > work last week and it did work _once_ earlier today for some reason.
> > I checked smartctl to make sure that the hard drive is not reporting
> > any errors and it doesn't
>
> SMART data unfortunately is not always conclusive; particularly, it's
> not always conclusive in indicating the _absence_ of a problem. Plain
> and simple, storage devices _lie_, some more than others.
>
> I would try again, but this time creating the LUKS container using a
> file in a ramfs (not tmpfs, which is allowed to be swapped out) as
> backing store, possibly mapped to a loopback device. Doing so will
> eliminate persistent storage from the equation.
>
> If that works, then my suspicion would be on the drive itself.
>
> If that doesn't work either, then there's likely something problematic
> about the software stack, at which point exact versions of everything
> becomes interesting. Kernel, cryptsetup, libcryptsetup, ...
>
> --
> Michael Kj=C3=B6rling                     =F0=9F=94=97 https://michael.kj=
orling.se
> =E2=80=9CRemember when, on the Internet, nobody cared that you were a dog=
?=E2=80=9D
>
>
