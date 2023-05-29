Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9F27E
	for <cryptsetup@lists.linux.dev>; Mon, 29 May 2023 04:32:59 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-3f6c81cc112so32070721cf.2
        for <cryptsetup@lists.linux.dev>; Sun, 28 May 2023 21:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685334778; x=1687926778;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X5IxMsBxz/EFXYd2tHHP+U5kmgcs5RVf2CzEGSkHurY=;
        b=HI50HgHJczkz9a8XGOjL/gkgbeQeVOm7c7lqcn0pphE0f7b8xzmqsjOcyAEjAQVCt1
         tYeIBb85ebmtMaNihKsIZcgSOan6jRwJVbWRl95hwpeiV0kAKU0OQxmyGRoB8V/nyp1y
         OEZzwRF2rh6d5l351RO1HySykvyktS+7HU3DZn4duvl7LqoE4b3eELkpW7LY0X+mSJDh
         e95U43N84pnSviJBK0s/DHNUqrq1XO8ON9sHwvAUEun8H+FDpbzA7vYyvI4LBC75UyfM
         khozTIXlInOoFvnW/AayXR641qFAzN9nmLT1f1sTmKsBJfRW1av2Ak18TFsNmjptCaIA
         yUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685334778; x=1687926778;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5IxMsBxz/EFXYd2tHHP+U5kmgcs5RVf2CzEGSkHurY=;
        b=Te/OsNZwA8VpKUYvzDR/BimJmiBbdAnFl6TqwzOKD5yoxhg6P12Eu1vBgX1hn8isOV
         kAzbIAKtnz5Fl2WWE1mZ4aYkL2fuixFFJETXVY0wi8HDsFxJBwnuxN2LIDx50MZLYIbE
         l/Y99DIIMhhc/HZL4xiHKeM3cByfDunb+5BiPpDojfvKBuPPkMA1mX9se7I/CyCF+XIz
         gKzIZzQVim9YtPIxArHB2tk4jKngNEIK894F0aDVYzWzMmQsHNowP4YcsD7tKl8NEhmC
         MX6gyAmBhLNuAVT52i+atWIpOrMdrKI+gYJ2TQCNobuHe0xA6m0/RT1oLuUHPxsslbda
         Fkdw==
X-Gm-Message-State: AC+VfDzFW3vUZh2mDlLxkM+WlXh0cM0FT1JhCNtaslTEUAmsuVHCg7WK
	5WcrLGlV6QbxpgylZLhHgPHB6ABkR9D8IG9X51pKa9hwxCRR5g==
X-Google-Smtp-Source: ACHHUZ65I7IfN221OvKR8Nhz3NJJ3nMsrbD8RcGwkImhEE/dHHC6uxCy86F2dHQIk1AtacErGAMQN9aU6zTirSZkojE=
X-Received: by 2002:ac8:5981:0:b0:3ef:6c09:edcc with SMTP id
 e1-20020ac85981000000b003ef6c09edccmr9171648qte.22.1685334777900; Sun, 28 May
 2023 21:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Russell Harmon <eatnumber1@gmail.com>
Date: Sun, 28 May 2023 21:32:31 -0700
Message-ID: <CA+zrezRkXUtC3AVWBT_-tRH6TrtU2gUD_LSFRSh3t5iUkmerFQ@mail.gmail.com>
Subject: dm-integrity: Documentation Improvements
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I've been trying to more deeply understand the behavior of
dm-integrity, and want to drop some of my learnings here in the hopes
it's useful for others in the future.

I've got a 4k drive, and wanted to see the data+integrity. So after
formatting I started writing a known pattern to the dm device using

    badblocks -b 4096 -o ~/badblocks.integrity_sdc -t 464367618 -w -v
-s -c 128 /dev/mapper/integrity_sdc

I then inspected the drive using `xxd /dev/sdc1`. The following comes
from several different tries with this combo, while varying the
different format options.

When you format the drive with `integritysetup format`, it's got
several options. In my case I used:

    integritysetup format /dev/sdc1 --sector-size 4096
--integrity-no-journal --journal-size=1 --interleave-sectors=8192
--no-wipe --verbose

Note there's a bug, you cannot set --journal-size=0, if you do it just
becomes the default size.

Based on this, my findings are:

* On a 4k drive, setting --sector-size 4096 fails to fully utilize the
sectors reserved for integrity. In order to fully utilize the sectors,
you've got to have 4M of data per integrity sector (assuming 4-byte
tags).
* --interleave-sectors is *always* denoted in 512-byte sectors,
regardless of what you set --sector-size to
* The output of `integritysetup dump /dev/sdc1` has a
`log2_interleave_sectors 13` field. The way to interpret that is as
2^13, or 8192 in my case, which matches the value I passed to
--interleave-sectors. Again, this is in *512 byte* sectors, regardless
of what `sector_size` says.

I intend to utilize these settings when configuring a RAID array.
Please make mention if it seems like this is a bad idea.
