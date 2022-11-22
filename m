Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C223B1
	for <cryptsetup@lists.linux.dev>; Tue, 22 Nov 2022 13:34:48 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id gv23so35832468ejb.3
        for <cryptsetup@lists.linux.dev>; Tue, 22 Nov 2022 05:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23X8VfG7F3H1ZfEwLGdjCxOspv/mqang+IqHKYz6lDg=;
        b=fK0qg61ugrde5Ezefgy54u6hRXGd1/8EyE1MV3jIdT2geqlHVUePaZUKFyC2CpsyzA
         4fb46t2ups+kIHEqFZZnzRYmFDuFR6SCgkc0xXFSH4lNvE5kzfgEqZdlarUr44Ky3pS4
         lUXwQzzK4UTGIZRiQAZNpa6F/lA2j3mrVaRDYNaZSrdvcaAtDS5AsBZMEMkai93abTBR
         8g3VxEhjz5R4PEK25lKjkXijBAiH2R4rIQLG3RkdCAF8vza98payaGPuxhzLSoTlnKBv
         F+Lprh52vKbZDKDyzx2sLxiWe1tviDNkcFrGnZ8VeSv/1rCENZ3k9c7SxabCiIN5xjEl
         wiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23X8VfG7F3H1ZfEwLGdjCxOspv/mqang+IqHKYz6lDg=;
        b=OOwe4qvuGq4i4rgoUpy2cawMkFF30y3UENCyo+dQL6hXsqmMm5QpTuJXT7DVNCmTuR
         E0YN3QA/Glxx7vCvPn2J9Twh/I83OzZtViQrTpnyg607sdXqJcOCg5OtRbLwELsrL+Vo
         5RSQxDKCItK9ZVZ3VPEl0RLdyBHMQuAPNQdWo2i+kzfdJYtqbpRmEk9mofUSZgodRMbV
         BcOJWEfoLAFI6IJ6bFM4MtPDar0XpSDkQ34SlNeJ+IPEBj1JqvdhQ8UCID4y/aaLvTBj
         nfWR8HkLCSjiim2rwky1T9sk1b0051QqN5+YNlrKAweHrdc2Bj9msJ1DQeJO9bf6ajTm
         lwbQ==
X-Gm-Message-State: ANoB5pnRvrh/v/ylLYGdk7GwHOxTpIzJ7H7XLUFiOkyuA+OB/DuLf7sE
	0RUaK2mjvvogy1yV+Fmz6IeT8Yt8B8s=
X-Google-Smtp-Source: AA0mqf5uVLiHscK/6vqJlq84bUp5CWvgIutp2EumwzPHR3VaD74Xe9dUbq5P9vb879VRaDKB3Fcyjw==
X-Received: by 2002:a17:907:378:b0:7ad:db82:d071 with SMTP id rs24-20020a170907037800b007addb82d071mr3870529ejb.200.1669124086819;
        Tue, 22 Nov 2022 05:34:46 -0800 (PST)
Received: from [147.251.42.107] (nbbroz2.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906310800b007aee7ca1199sm6164559ejx.10.2022.11.22.05.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 05:34:46 -0800 (PST)
Message-ID: <af24f4dd-0394-3336-6a73-c1db990e30e4@gmail.com>
Date: Tue, 22 Nov 2022 14:34:45 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Creating detached dm-integrity hashes for existing disk
Content-Language: en-US
To: Ciprian Craciun <ciprian.craciun@gmail.com>, cryptsetup@lists.linux.dev
References: <CA+Tk8fwf2tH=ZWrpH=hn0NoKM8U-sWDnm6MUZUYV-JLLHozP_Q@mail.gmail.com>
 <CA+Tk8fz25r7ZMcqiLAHCb--Wpya8i8bkotaKv9R0wMEpdJYESA@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CA+Tk8fz25r7ZMcqiLAHCb--Wpya8i8bkotaKv9R0wMEpdJYESA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/22 15:50, Ciprian Craciun wrote:
> Hello all!  (Please keep me in CC, as I'm not subscribed to the mailing list.)
> 
> I've sent the following email two months ago, but I assume that either
> it slipped through the cracks or nobody has any experience with the
> use case I'm mentioning.  However, I'll try to submit this question
> one more time, perhaps with more luck this time.  Thanks for the time.

:-)

Actually I planned to respond, just had not time to test it.

TL;DR: the recalculation flag is persistent, it is ok that it remains set.


It is there because if the data device is resized later (and as it is separate,
it can happen), you need to recalculate the rest of the device (also automatically).

Check "integrity dump <metadata_device>", you should see recalculation offset,
and also the recalc sector pointer e.g.:

# integritysetup dump /tmp/dm-integrity-tests-meta
Info for integrity device /tmp/dm-integrity-tests-meta.
superblock_version 5
log2_interleave_sectors 0
integrity_tag_size 32
journal_sections 7
provided_data_sectors 262144
sector_size 4096
recalc_sector 262144
log2_blocks_per_bitmap 12
flags recalculating fix_hmac

Here you can see, that recalc_sector is the same as data sectors, so the recalculation
is finished. If you need to recalculater everything from the start, use
--integrity-recalculate-reset option.

There still can be some bugs (mainly for bitmap mode that is very rarely used;
better test it in internal hash mode).

Some more notes inline:

> I already have a large disk containing important data (backup data)
> and I would like to use `dm-integrity` (with meta-data on a separate
> device) to make sure that when reading from that disk I actually get
> the original, non-corrupted, data.  (It seems that just the SATA
> provided CRC isn't enough sometime with a problematic USB-to-SATA
> adapter, and I get successful reads with corrupted data.)
> 
> Thus, I've tried using `integritysetup format` with `--no-wipe`,
> `--data-device` and `--integrity-bitmap-mode`, and then
> `integritysetup open` with `--integrity-recalculate`.  However upon
> subsequent `integritysetup open` without the recalculate flag, the
> `dump` command still shows the recalculating flag.  Searching on the
> internet about this I've found only a few issues about this, but no
> actual solution or more insight.
> 
> As such my question:  is there a way to actually force `dm-integrity`
> to compute the hashes without wiping my original data?

I think you used it in this mode already.

> Here are the snippets I've tried (on blank files via loop devices):
> 
> 
> # create empty files
> truncate --size 4GiB -- /tmp/dm-integrity-tests-data
> truncate --size 512MiB -- /tmp/dm-integrity-tests-meta
> 
> # fill the data with something to make sure dm-integrity doesn't touch
> the original data
> dd if=/dev/urandom of=/tmp/dm-integrity-tests-dat
> a bs=1M count=128
> iflag=fullblock status=progress

here you decreased the data size (you perhaps want add conv=notrunc)

> 
> # compute a hash of the original data
> md5sum -b -- /tmp/dm-integrity-tests-data /tmp/dm-integrity-tests-meta
> 
> 
> # the data is loop0, and the meta-data is loop1
> losetup --show --sector-size 4096 --find /tmp/dm-integrity-tests-data
> losetup --show --sector-size 4096 --find /tmp/dm-integrity-tests-meta

Do not setup loop devices, integritysetup will do it for you automatically
(and removes them on deactivation). Just use images file paths.

m.
