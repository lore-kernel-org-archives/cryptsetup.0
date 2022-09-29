Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5004A44
	for <cryptsetup@lists.linux.dev>; Thu, 29 Sep 2022 16:39:45 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 130-20020a1c0288000000b003b494ffc00bso3033473wmc.0
        for <cryptsetup@lists.linux.dev>; Thu, 29 Sep 2022 09:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=LJe3TV+G/sS3FlhMl1lG2Y/fF8XqaUG1LflWcTvdsA0=;
        b=qX2hpweq2KA7h7OgTNnOonvDpL0sbX2ebYPI0FSb2eAQvLrMWZg1Wv1/o5dbieo1B7
         bMWP5z/YJ6cs+/tjpl/+wI8l7AkoYoZaOPL5oVe4rP2sGEEuTvYeMDHGBfBrGkDYJ3DJ
         tHRSf/ECTylOzSCAMEbBm56/d1NUvw2p2DzRVTSfOj+F7WSP5XaVkAUSN72x9YxKKhOX
         vpDmtawnXaU4nGCUAZ5jNd4vmNk7Cjalr9uESkxo4XXnent2cvXqhm1k+3UmRmrCRy7+
         kQqf7vAwy+U6kMfArs38RoNSg4P6CDQ6upHtYGAsyXdUkfJ+Sh9LxI+QqrnVJSXExDrX
         SHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=LJe3TV+G/sS3FlhMl1lG2Y/fF8XqaUG1LflWcTvdsA0=;
        b=o7xncYiVfV0j3fyjju6/w4t7EQ5bt+3HZhnnENdFWIX/lD+5w0v+aQBde/Mjc/fEo+
         cLEvNZTC4dAGnSEgfPSeLnZ5qA7fAb1F5E4qjvRJ05n+QMJolpkUDHVb5ayIOx9Zuvmu
         bmpfQmYSetPCxaeTrBXofYXTOS6htgtz0VL85QHhPyZ3pxyGdHnuBURxb47NaEErCwvS
         58E3wjG6U8M0SLzv/wHVy+GQdknQCZJn0nMi1i0/xVUUsDrJiVx2sVsggygAqesHcYRz
         r2yZbhX/dfJDNaJC8Idi/63+vUZLjfnQ1mreWIQNV6JpLGSWnrZy2L3znkpUXSz1pZQo
         THdA==
X-Gm-Message-State: ACrzQf1t6J7rfsf5daqC1b6/f6ngeBSX+gx3B2AeAUQAh+rFuCX/BbQw
	i3ybLohW1twLVieR4FH+uOSXhTY06Ok++WzFcxgw0j4lItA=
X-Google-Smtp-Source: AMsMyM648jr/HLvDjzLo+FG0OG3FebIQliscZbaKRLCyFDoVpSEypbiQLiDjYXORpNPx9i1GJ/s8bmMxemsjIF1ZnHc=
X-Received: by 2002:a7b:ce99:0:b0:3b4:9031:fc02 with SMTP id
 q25-20020a7bce99000000b003b49031fc02mr3177095wmj.154.1664469584099; Thu, 29
 Sep 2022 09:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ciprian Craciun <ciprian.craciun@gmail.com>
Date: Thu, 29 Sep 2022 19:39:07 +0300
Message-ID: <CA+Tk8fwf2tH=ZWrpH=hn0NoKM8U-sWDnm6MUZUYV-JLLHozP_Q@mail.gmail.com>
Subject: Creating detached dm-integrity hashes for existing disk
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello all!  (Please keep me in CC, as I'm not subscribed to the mailing list.)


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
dd if=/dev/urandom of=/tmp/dm-integrity-tests-data bs=1M count=128
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
