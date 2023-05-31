Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFEE16435
	for <cryptsetup@lists.linux.dev>; Wed, 31 May 2023 18:41:30 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-3f7fdbdf68eso66096041cf.1
        for <cryptsetup@lists.linux.dev>; Wed, 31 May 2023 11:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685558489; x=1688150489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DImIUwq3Hn/kOHPadEH4LVvwDbHUTk3mI0QaE3uGS6c=;
        b=ZFGnxb8foxrSwtSj0EEL2lexTLaxSIBp4kBjtSp2A48OFGi2RYWPfpLgxBqtMI3vta
         RFosmBSRelQEul1CwiNBr4bRNtOAkpnFb6YMJzld3+CraFMi7CfvX8RtEQsuPBz6o42T
         8eOfuWVnPw/mkY90ZBgkKJoENaX4DIDC1jGi/n4zYJ659ZT5D9zYqP8UAABPFibZaW9G
         fOh9Y457U11wANI9jzommhQrmft5nH56acDgjeqw9c1+gGCOfkgC30kgP+tvz3OPbJCo
         KEb0rRB6FIU+XCjQ1A0EOFf389RPSsFAxfDRT0kQmURLmETRYJixcVi/OD+e4W/GE2ww
         v9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558489; x=1688150489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DImIUwq3Hn/kOHPadEH4LVvwDbHUTk3mI0QaE3uGS6c=;
        b=TV13hQr6MZzc+EvaGBmggqha0uvvaIXWLe/GibqqxXeEIZSj8DDdlTnR8sDW3xAsT8
         CbYiI5yZ7BTmfUVzE3WvSO3Z3CK+FGKDpCBNpOVkWX8Fbx0x/SAxQWNc6jSzwQH1T/Bb
         U42rBOWpGsDQYDIHq/l9bBylnpIAYVlu43xzIfRaZY30XgoL+IEswOeabwpcix3zj0KZ
         G8lK9NwejEWjchSy2XaMf1MIovysxJU1a7adEwLrLjqUhtiGd3DlExe9XVvZ4HjrTEM8
         AIlwWpQwbuMe79E+sE9awAZnNe6hvIAe6XhzrvY5TXkA6DvNi/1AGpchda/oFmd3gzZg
         vbVQ==
X-Gm-Message-State: AC+VfDzQUHxYcgqqCaGY12GMf9JFA2kSBtmCzo8R53CuuB55fl14xVwC
	rjDPMwDaMmoflg5LmYR/DAmadWyrYWZEIwQ+JXjFAAZR+4w=
X-Google-Smtp-Source: ACHHUZ6oCqUFtWoH8uBjArQVHBgCHOdDwlAMDKeNfni3yCHQ1kgMpcaPVoG7XJV0JvCSTAtOevN7ndADkj1CQPbBS8Q=
X-Received: by 2002:ac8:5a07:0:b0:3f6:c0f7:a5c6 with SMTP id
 n7-20020ac85a07000000b003f6c0f7a5c6mr7766180qta.46.1685558489107; Wed, 31 May
 2023 11:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+zrezRB-PewcH_-h8PZmGOc1RVBwdS-uReago8XXLkVTw+EDg@mail.gmail.com>
 <177b0fcf-1cb0-be45-5f4c-4038f785a1da@gmail.com>
In-Reply-To: <177b0fcf-1cb0-be45-5f4c-4038f785a1da@gmail.com>
From: Russell Harmon <eatnumber1@gmail.com>
Date: Wed, 31 May 2023 11:41:03 -0700
Message-ID: <CA+zrezT8UaDpu5RcMc-Y+G8LiCx2MeJcuYE+BWYsc45ia-8vWw@mail.gmail.com>
Subject: Re: DM-Integrity Under RAID Without Journalling
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(re-sending in plain-text so it gets accepted by the list)

On Wed, May 31, 2023 at 3:45=E2=80=AFAM Milan Broz <gmazyland@gmail.com> wr=
ote:
>
> Hi,
>
> On 5/29/23 04:02, Russell Harmon wrote:
> > Hey all,
> >
> > I'm looking to use dm-integrity with its journal turned off as the
> > backing devices for a RAID-6 array. This is with two goals:
> > Closing the RAID456 write hole (md.4 section "RAID WRITE HOLE").
> >
> > 1. Detecting (other kinds of) silent data corruption coming from the dr=
ive.
> > 2. The resulting configuration will have no journaling (both for
> > dm-integrity and for mdraid).
> >
> > If I understand things correctly, it seems like this covers all the
> > cases I listed. If there's data corruption (either via the write hole,
> > or coming from the drive), periodic scrubs will detect and repair the
> > corruption (since mdraid will consider the corrupt data invalid).
> >
> > Does this seem like a correct/valid combination to achieve my goals?
>
> The dm-integrity journal ensures that all sectors data + metadata(auth. t=
ags)
> are modified as atomic step (it is not stored in one place).
> In the case of power fail it uses either old or new versions.
> I do not think RAID keeps this relation correct after power fail
> (or another abrupt failure like kernel crash that happens during a write =
operation).
>
> IOW, power fail can create a new corruption (note metadata are updated
> in chunks that includes auth. tags for other sectors).

RAID supports its own journal (see "DIRTY STRIPE JOURNAL" in md(4))
that I plan on using.
> > Aside, I see the value of dm-integrity's journal (in non-RAID
> > configurations), but what's the point of the bitmap? It seems like
> > that just reintroduces the potential for undiscovered data corruption
> > on the drive (e.g. if there's data corruption in an unsynchronized
> > region, at the next boot the corrupted data will falsely be considered
> > valid).
>
> Well, I would like to know either :-)
>
> There were some plans for dm-integrity bitmap in LVM LVs as some performa=
nce
> trade-off, but AFAIK it is not implemented yet (?).
> I just added support for integritysetup, so we can use all kernel availab=
le
> features, but I never understood why bitmap mode was implemented in the f=
irst place.
>
> Milan
