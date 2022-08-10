Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4917817EC
	for <cryptsetup@lists.linux.dev>; Wed, 10 Aug 2022 12:52:02 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id t5so18884763edc.11
        for <cryptsetup@lists.linux.dev>; Wed, 10 Aug 2022 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=myIWPo2vGGb/juDVdnXaDWQav3WLA+4nmxF2dNQik38=;
        b=bGY8vnXbOqa1i+/g2Pmn1nYeYGJZ1J45WNH6Eg/3hgC5Tr0RPpYBHgyYcIAGsKgwWw
         b4UYcfOvX2L1r5Nn5GqMgxmqF7lod+hCxWZmAzMBseowaKBswYPC5FDTkbPtErLEoPU3
         31UV/IYD7nkHpeZ6Zc+hX24j9BYyIdYv8jldKcDaES6NKW0AQVXyfUJZhBpVEvASnYxM
         7n/EFRbazgJqlZLO5Di7BFAdB4Eq61M7E94FdqfA9DOufY7AfDXn3NZECjNvmwv4BFni
         vQ1Fh+Zf/4ppvnaCO00evjHd+rWQ9imwT8eyaqCCR78GhVsRT+YRwUz2GZ2/cKAms/uS
         2A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=myIWPo2vGGb/juDVdnXaDWQav3WLA+4nmxF2dNQik38=;
        b=kn4kh0HpJgSgW3fnd5c9aCG9oVuI34xy3x/NWWGhusNgDls/wmZNpW64jXFYVvy9nO
         iHyvgqzbz0H+tFA+h/JtA2VUi/kNQJeLw7rpfgodWHKj20XilmG05/7kwtmvbvUUi9hE
         iZoKNNnoXL64qSdMWgc0/XB1zvnGkX2gFVos3CJRJE7R5d+oND5ok4eytKfTUrcrekRq
         JrZPpf83v/9EiTXBK216lJThM+RNVb/nFVZ/reaB5XKIjX7tNr/J8Y8ZmWYeVSNawuz5
         zbpWfWEwiFqsOpEEyTU1/UysBOyZA+uhe691il74XM7BJEWPDAASY2oFuP01dJ//FzN/
         Dw9A==
X-Gm-Message-State: ACgBeo2ThmjGBgjJc+/GozgIhUVONJImaKbKHhzmuVN/oJimy4CUhyF1
	fP29FirW/i5PGpAdnD/+90n/Gxxrroe7h682SlxWYpTMs8mk/5NZ
X-Google-Smtp-Source: AA6agR5Wu6875SD9H2d5F9HSR5g+Q8teqHG6ZN3kpFBjxEKAG+UaGWZVp2trZ/sSmT43W0Fj3LnNcMVUVIYU1oHAX0M=
X-Received: by 2002:a05:6402:1004:b0:440:7244:e8a5 with SMTP id
 c4-20020a056402100400b004407244e8a5mr17121807edu.335.1660135920496; Wed, 10
 Aug 2022 05:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACHosL9ri_XGPoLxsAb4vEnav1-w3B=YWCE1YidhRn-ONrW=fw@mail.gmail.com>
 <df769461-e347-9abd-7195-556e22f5d481@gmail.com>
In-Reply-To: <df769461-e347-9abd-7195-556e22f5d481@gmail.com>
From: "doffloster@gmail.com" <doffloster@gmail.com>
Date: Wed, 10 Aug 2022 15:51:44 +0300
Message-ID: <CACHosL-VutFNrdARLWufPYRuBvYDD0bdTbR-yP2y31LAj+CYtw@mail.gmail.com>
Subject: Re: Bug: luksClose search LUKS header but it is detached
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Milan,

I appreciate your quick response.

Here is my reply:

> No, this is expected. But for close (deactivation) it proceeds even
> if it does not find the detached header.

Why would cryptsetup seek the detached header in the device?
Wouldn't it be better for cryptsetup to use the '--header' flag?

> The reason is that even close need some information from the header
> (for example UUID).

Doesn't the linux kernel store this kind of information?

> Is there any functional problem with this or it just looks strange?

There isn't any issue.
I just noticed an unexpected behavior and thought that I should report about it.

Best regards,
David.


On Wed, Aug 10, 2022 at 9:58 AM Milan Broz <gmazyland@gmail.com> wrote:
>
> On 09/08/2022 23:53, doffloster@gmail.com wrote:
> > Hi all,
> >
> > I noticed that cryptsetup LUKS extensions is searching for a LUKS
> > header in the device.
> > This is expected when the LUKS header should be in the device.
> > But I used a detached LUKS header, so I wasn't expecting to see
> > cryptsetup searching for the LUKS header in the device.
> >
> > You can see that in the log file "log.txt" - in the URL:
> > https://drive.google.com/file/d/1DcrpklgE75oE5znAxHAlp9CPikkYbVq1/view?usp=sharing
> >
> > You may notice that I used a "--header" flag, but I also tried without
> > it - still, cryptsetup behaved the same.
> >
> > The incriminating lines from the attached log are as follows:
>
> ...
> > Do you consider it to be a bug?
>
> Hi,
>
> No, this is expected. But for close (deactivation) it proceeds even
> if it does not find the detached header.
>
> The reason is that even close need some information from the header
> (for example UUID).
>
> Is there any functional problem with this or it just looks strange?
>
> If it is problem, you can always use low-level access through
> "dmsetup remove <device>" here, but it can keeps some underlying device
> active (for LUKS2 this is used only for integrity protected devices).
>
> Milan
>
>
