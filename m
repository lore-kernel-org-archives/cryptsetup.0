Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A229563C2
	for <cryptsetup@lists.linux.dev>; Mon, 21 Nov 2022 14:51:36 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id k5so10624995pjo.5
        for <cryptsetup@lists.linux.dev>; Mon, 21 Nov 2022 06:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PEcFDTAk4oA0b4ES3jQGKUxdzDVbAcL+0en9xIPoRdM=;
        b=QLJHHxFo0SzsITxRWy1i+DDfB1c1AWpyiSiDbY4Ed8RYA7NgFrLkdiNw9xgX6WCHys
         +Z6WnPjWGu+P8HMdiEpVbJor7/XNo+BvF8e7+mWD8up9StpNcyWvkL7CY/gPqcRIkTv/
         PUIqN0WaCFubuTDNT7jhEugwKz5kLY1ba0FmRtrcDlGYaLrXdt4/1Pp+njX041JuN9n/
         m5ufyPJhqRbmjNQ1ny84FfEQy9VCnv5E2R9GBGOhVK75o1ViLRSS4NEpP3epPG1etYa8
         1D7A/Rkr0wYd5jaqeUD7EecS5KUGbjKwwdxto02H/xQniuJX7+TuVjPSER6jtrU9JQlT
         s75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEcFDTAk4oA0b4ES3jQGKUxdzDVbAcL+0en9xIPoRdM=;
        b=W874eRvWR2cGwrrqmnnzqpCEVWCRg/wCcvmOjWAQc0IdWq/EbGSP7lCY7cCz7apd43
         js30j4as2lHf6d266lWPLCcApnDRXwmUV72eBbBEzNkRXc3JJyeoL2uGf+tWHPMufu59
         oXwO1wx9EWlMgg5bv77Aev5cPdhWfsF9DT9EqQPlUuB2wkMJHqcRtWJ3HowvquPju1Vd
         MGPk0i8tQrhgGqozhH6l7d9LjI/I0hM87aY2QaRqvGdRBSB+bxufwZ7sZaUExBjCq9WD
         a7036nX8i7lU9NWvZQ/6PUdwUBc3t3PdKaR0VyhXGbcdL1COUZcZG9+UsYzAW3PpahiP
         4LaQ==
X-Gm-Message-State: ANoB5pkaeotwMgv+04FgkLLjcG83VcWCFe+Z7mdztfJxjeLYVGJyvyrU
	Z4c0hMc5SHJ5Mq0vNiuTb1tPXYrln1vCXjQ0hFa3WQ9whcl8vw==
X-Google-Smtp-Source: AA0mqf7hZAkFoHlS26pw9mTlVeyA/QbpD74gVXu0I8eGK8F6pyogrbJUDtbpqxpTDyoElztW7TMcuzanIixgnRFEqmE=
X-Received: by 2002:a17:902:d0d3:b0:186:f1b6:c3dd with SMTP id
 n19-20020a170902d0d300b00186f1b6c3ddmr11707844pln.20.1669042296021; Mon, 21
 Nov 2022 06:51:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+Tk8fwf2tH=ZWrpH=hn0NoKM8U-sWDnm6MUZUYV-JLLHozP_Q@mail.gmail.com>
In-Reply-To: <CA+Tk8fwf2tH=ZWrpH=hn0NoKM8U-sWDnm6MUZUYV-JLLHozP_Q@mail.gmail.com>
From: Ciprian Craciun <ciprian.craciun@gmail.com>
Date: Mon, 21 Nov 2022 16:50:59 +0200
Message-ID: <CA+Tk8fz25r7ZMcqiLAHCb--Wpya8i8bkotaKv9R0wMEpdJYESA@mail.gmail.com>
Subject: Re: Creating detached dm-integrity hashes for existing disk
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello all!  (Please keep me in CC, as I'm not subscribed to the mailing list.)

I've sent the following email two months ago, but I assume that either
it slipped through the cracks or nobody has any experience with the
use case I'm mentioning.  However, I'll try to submit this question
one more time, perhaps with more luck this time.  Thanks for the time.


~~~~


I already have a large disk containing important data (backup data)
and I would like to use `dm-integrity` (with meta-data on a separate
device) to make sure that when reading from that disk I actually get
the original, non-corrupted, data.  (It seems that just the SATA
provided CRC isn't enough sometime with a problematic USB-to-SATA
adapter, and I get successful reads with corrupted data.)

Thus, I've tried using `integritysetup format` with `--no-wipe`,
`--data-device` and `--integrity-bitmap-mode`, and then
`integritysetup open` with `--integrity-recalculate`.  However upon
subsequent `integritysetup open` without the recalculate flag, the
`dump` command still shows the recalculating flag.  Searching on the
internet about this I've found only a few issues about this, but no
actual solution or more insight.

As such my question:  is there a way to actually force `dm-integrity`
to compute the hashes without wiping my original data?




Here are the snippets I've tried (on blank files via loop devices):


# create empty files
truncate --size 4GiB -- /tmp/dm-integrity-tests-data
truncate --size 512MiB -- /tmp/dm-integrity-tests-meta

# fill the data with something to make sure dm-integrity doesn't touch
the original data
dd if=/dev/urandom of=/tmp/dm-integrity-tests-dat
a bs=1M count=128
iflag=fullblock status=progress

# compute a hash of the original data
md5sum -b -- /tmp/dm-integrity-tests-data /tmp/dm-integrity-tests-meta


# the data is loop0, and the meta-data is loop1
losetup --show --sector-size 4096 --find /tmp/dm-integrity-tests-data
losetup --show --sector-size 4096 --find /tmp/dm-integrity-tests-meta


# format, but DO NOT TOUCH the original data
# both the bitmap and hash should use 4096 bytes
integritysetup format \
        --batch-mode \
        --verbose \
        --no-wipe \
        --sector-size 4096 \
        --integrity sha256 \
        --integrity-bitmap-mode \
        --bitmap-sectors-per-bit 8 \
        --data-device /dev/loop0 \
        -- \
        /dev/loop1 \
#


# open, requesting a recalculation of the hashes
integritysetup open \
        --verbose \
        --integrity sha256 \
        --data-device /dev/loop0 \
        --integrity-recalculate \
        -- \
        /dev/loop1 \
        dm-integrity-tests \
#

# read the target, checking if we get our original data
dd if=/dev/mapper/dm-integrity-tests bs=1M iflag=fullblock status=progress \
| md5sum -b

integritysetup close dm-integrity-tests


# open, without the recalculation flag
integritysetup open \
        --verbose \
        --integrity sha256 \
        --data-device /dev/loop0 \
        -- \
        /dev/loop1 \
        dm-integrity-tests \
#

integritysetup close dm-integrity-tests


# recalculation still shows up
integritysetup dump -- /tmp/dm-integrity-tests-meta


Am I missing something?  Shouldn't the recalculation flag disappear?

Thanks,
Ciprian.
