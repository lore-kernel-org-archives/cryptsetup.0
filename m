Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6357E
	for <cryptsetup@lists.linux.dev>; Sat,  4 Mar 2023 06:55:21 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id n8so1531627qkp.5
        for <cryptsetup@lists.linux.dev>; Fri, 03 Mar 2023 22:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677912920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TA09+5ljBZP5xf9w9GIS/fVT2Tt7WRYvcozTW4+r208=;
        b=AG/a0FG9DvWJPmu86EiZkYiO1ilBtjPukAutGzx1dAOBFiYoWoubrvgQcl1IKfmENj
         KCN24gtZJSEhhVwz7JK68GFHicA6EKH0Eu+OCgpjf+IDooQQjMJVP+32liQVFbxRGm8U
         vRcaRrpWOUKkfFlUvs9NFLWnVb+3NZwLiKGBfI4f7uRQCmoURSmVslEYWmu4unoRcYDT
         7T6xX4SKXUK4Z9pzyNhfDT6TXqEBLvTzrNVVbZS7qZTvg48RIWawMPz0geFDSFiqO9lZ
         PLdJzKFtfwkHWMS6ah3IfDisrmLE3Af+5a8JY5ybLjipz+ekhMw8IB03o+dpiBcVvl4i
         mTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677912920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TA09+5ljBZP5xf9w9GIS/fVT2Tt7WRYvcozTW4+r208=;
        b=IKqZFqElIDzGUS8H34pFpKHiY6F23tBl1JmxmGwr+I2mhmnjGvv2iJzF5QNa8n/Xnt
         5vOAFxyQ5nvXpOHSlRkJXWwOJPVDhOLvqWYUY99Gt7rEOmSWsK0J0umo/0sEys5Vdf7c
         kt2KxcsGIprX3jy/1DSKykAJgqDFoohLEpWer+3JkiQepURQG61ykiNo8wzC7Ucp5TzV
         bWG66WhyGK9mtYvwowI7J1UDtJfDkkwXHuWhZlTBuc3YFl+MroVtiP8VDL0C2JC11eZd
         Q4AtNqbfu2uqTKELnZrQFE65fmrun8pwM27hDUF9ms8IkKKzg1jaDOC0INGFCpFbGGMt
         vtOw==
X-Gm-Message-State: AO0yUKUHo1un55K4nmnn2vb6D05Jv3rRr+WJLm/E5O8eEoOjX08u1ws+
	EZncZJ8BbTS4KcCWNZIboyUJE3DXlU6Uq0Fsfhw=
X-Google-Smtp-Source: AK7set9sMGgZnuYM0iA3fcgG5owJSKOuvqR8JZK7UIfbaZkBNnk8FrozaZ+Fju+/yxBwS2ENwWrGkqukO+1ihk33TYU=
X-Received: by 2002:a37:644:0:b0:742:7fb5:f505 with SMTP id
 65-20020a370644000000b007427fb5f505mr1169209qkg.14.1677912920626; Fri, 03 Mar
 2023 22:55:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD-Ua_hj1hkymLbyEyT-eNyCj_naiqHqg7nr3nos8tp9XCERDg@mail.gmail.com>
 <64fc6294-ca5e-f7a9-302f-63b09d569586@gmail.com> <CAD-Ua_h2GDZexz=DC3YA88nO-OhXKyGp1v2D6rWvHHQVwtCgFw@mail.gmail.com>
 <3b08eace-b038-bab1-4f65-f9c322dc90a4@gmail.com> <CAD-Ua_j_AR4BJWJPXs9Lv+qO1-c33M59UPg_1_XQdB60s0MEXg@mail.gmail.com>
 <46a11902-fdbd-4c75-a589-840e4e1f3e27@home.arpa> <CAD-Ua_gQLB+6a8=eRQd7B8u76hmvGFH+xPtzJKXPwn=gjuF=uw@mail.gmail.com>
 <47da0423-7e8c-c059-c65c-fe6252b0e384@gmail.com> <20230303174253.GA24756@tansi.org>
In-Reply-To: <20230303174253.GA24756@tansi.org>
From: Lars Francke <lars.francke@gmail.com>
Date: Sat, 4 Mar 2023 07:54:44 +0100
Message-ID: <CAD-Ua_hPjBLHK0cyEz3k7KYBj1Mz-pbj84ycU0is7xqsCks+bw@mail.gmail.com>
Subject: Re: cryptsetup - No key available with passphrase
To: Arno Wagner <arno@wagner.name>
Cc: Milan Broz <gmazyland@gmail.com>, =?UTF-8?Q?Michael_Kj=C3=B6rling?= <152cc69a347e@ewoof.net>, 
	cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 3, 2023 at 6:43 PM Arno Wagner <arno@wagner.name> wrote:
>
> On Fri, Mar 03, 2023 at 08:55:50 CET, Milan Broz wrote:
> > But memory failure is just a recipe for disaster later...)
>
> I agree. I usually run memtest86+ (there is a new version out)
> for 2 days, just to be sure. Things have gotten better with
> DDR5 (on-chip ECC), but you can still get failures in buses
> or uncorrectable errors with low-quality RAM. Sometimes the
> RAM is even completely fine, but the mainboard manufacturer
> has screwed up the parameters that the BIOS uses.

This is what looks like happened here.
BIOS update seems to have screwed up the parameters,
Once I reset those everything worked again.

Maybe what cryptsetup could do is an addition to the FAQ that
intermittent/spurious/weird mistakes warrant a memory check.

Cheers,
Lars


>
> Regards,
> Arno
> --
> Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
> GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
> ----
> A good decision is based on knowledge and not on numbers. -- Plato
>
> If it's in the news, don't worry about it.  The very definition of
> "news" is "something that hardly ever happens." -- Bruce Schneier
