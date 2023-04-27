Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C7A8460
	for <cryptsetup@lists.linux.dev>; Thu, 27 Apr 2023 16:08:39 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b5c48ea09so7054103b3a.1
        for <cryptsetup@lists.linux.dev>; Thu, 27 Apr 2023 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682611719; x=1685203719;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm4M06ThMjwqBg9Bz5r1Cmos3zSEGC7Am48cq7j82hI=;
        b=TwwqoEWByUs84W46TN4F0cIWPJDHvtoRdCu1HY211SDPbhUyFX5apE/kQKVcOgsKCb
         4vJvkSl4HE491blnJGkIf6/kRAIJhE/ZRWx24Gf+1UZzzWtDmrHFoEWyfiTctHJ1QGt9
         +7s88AKZZjzX5aIv26RYFJxnukv6bn92vi4cJvL9TXTw/hn8sfwuHTK8+jqPFQMFfQs4
         Ubat3thuLLwzqnLPgCy1ro3I0SCCFuj118WENi/inJ6LU6+cyoVfC5Qdel2U2zfjjp8z
         uLWxt6nXSl740iwEE2is64rQBIrAJS+APZ+Rda+xHutEPUrx+a0WlyuWoSk87IHLeUuI
         LxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682611719; x=1685203719;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pm4M06ThMjwqBg9Bz5r1Cmos3zSEGC7Am48cq7j82hI=;
        b=THGbeQOz9tw+yKf9YM26bQobEz0m/2to/Dr+TW0uuWy1pcFYR0Ynta95KOaYlfFSDs
         WfUkABaeLjvVjmbJb8DQfc3txwbRfq1diNOwKezv7xCufRLEKLUBB1IeY790fNFuTH4h
         R9VdW3pQXk+ABAU98TaMMY/02df9BzF9GPLzq+il5hgxXZ/4CsYWi+ZSFoBBYRpkMgJP
         d4B4LNOPDkG8MMXPM3pFvigfWptyvmhYM9q4DR48gcQ/jBd0jWdZf5xLaHRaw+vw0tRq
         h//jE1XhovKZ4sZI5tiOr/VRgwfsJsBkpxMkBD6YEhDvsWI3myegME8RhZzJ/4ZFS6Yf
         rhxg==
X-Gm-Message-State: AC+VfDxvZbFju5U1wtLkAjbwkTpgUbmDhXP0ULicwGB+u1f9WTbbmX99
	BO5/7r2orwFxom7/1lk/2RlFbMGEIFXiW8t+vHv0adz060q0tg==
X-Google-Smtp-Source: ACHHUZ4v5DpZRmuLq7frydkedIrcHBM2mRw92kEnRAbDUy4e3izuGSlJovmpwWJ08l5r2e6//Q69FPftlVcv/CKDRag=
X-Received: by 2002:a17:90b:4c43:b0:247:6c32:37e5 with SMTP id
 np3-20020a17090b4c4300b002476c3237e5mr2391661pjb.13.1682611719180; Thu, 27
 Apr 2023 09:08:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABOqr=M+uDDXC-xG_hnxGB-7MZnWUwONizC6c=r5NCYaCz6Pxg@mail.gmail.com>
 <eb371bc1-6210-95d7-ee63-d8dc243b7da6@gmail.com>
In-Reply-To: <eb371bc1-6210-95d7-ee63-d8dc243b7da6@gmail.com>
From: Lodewyk van der Westhuizen <jl.westhuizen@gmail.com>
Date: Thu, 27 Apr 2023 11:08:27 -0500
Message-ID: <CABOqr=MqFcTn77WEg9XPHDPBx=Y7nD-fR+_=ujDzmRQq7LW67Q@mail.gmail.com>
Subject: Re: Performance issue LUKS1 vs LUKS2
To: Milan Broz <gmazyland@gmail.com>, cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Milan,

Thank you for the response. I'll try to answer your questions as best I can=
.

> NOTE: LUKS1 is not cryptsetup version 1.x, it ia a metadata format.
> All recent cryptsetup 2.x versions can use LUKS1 as well - just use "--ty=
pe luks1"
> in format (so you will compare the same formats on different kernels).
OK let me rephrase, when using luks1 or luks2 the performance slowdown
is still there. The only difference is the version of cryptsetup,
dm-crypt and the kernel.

> You mean slowdown with access to encrypted data, not unlocking time, righ=
t?
Correct, measuring the I/O (creating/deleting files)

> Which crypto modules are used? What architecture it is - do you use AES-N=
I
acceleration on both systems?
It's Red Hat for both machines (RHEL7 vs RHEL8).
x86_64 - pretty sure AES-NI is used, please see below:
---
grep -o aes /proc/cpuinfo shows "aes" for each CPU (so 48 times)
sort -u /proc/crypto | grep driver | grep aes prints "aes-aesni,
cbc(aes-aesni) and cbc-aes-aesni" to name a few.

> Benchmark calls userspace kernel API
Interesting... I thought it is only using a single core because the
output here is comparable between the two.

> Is the keysize 256bits in both cases?
Yes, please see dumps below.

> luksDump older kernel using luks1

Version:        1
Cipher name:    aes
Cipher mode:    cbc-essiv:sha256
Hash spec:      sha256
Payload offset: 4096
MK bits:        256
MK digest:      fb 6f ea 0e 57 e9 31 88 e7 a5 c2 e5 84 2a d1 f8 03 c5 db 3a
MK salt:          2b 17 6b aa 1d 0f cc 0e f4 ac 12 8c 19 85 ec be
                       3e 9a 20 5a 0e d4 5d 2c b2 62 c5 b0 63 a7 51 1c
MK iterations:  71250
UUID:           19274b4e-c0cf-490f-902b-1d3052f03919

Key Slot 0: ENABLED
Iterations:                 571427
Salt:                          98 c0 5c 0c ce c9 bb 50 93 84 c2 e2 d2 1c 75=
 3f
                                 23 66 36 17 18 d9 f0 f1 c6 66 41 0a e9 35 =
dd a0
Key material offset:    8
AF stripes:             4000
Key Slot 1: DISABLED
Key Slot 2: DISABLED
Key Slot 3: DISABLED
Key Slot 4: DISABLED
Key Slot 5: DISABLED
Key Slot 6: DISABLED
Key Slot 7: DISABLED

> luksDump new kernel using luks2

Version:        2
Epoch:          3
Metadata area:  16384 [bytes]
Keyslots area:  16744448 [bytes]
UUID:           7ebd4515-93e0-40f7-945c-cea47e6dcfc0
Label:          (no label)
Subsystem:      (no subsystem)
Flags:          (no flags)

Data segments:
  0: crypt
        offset: 16777216 [bytes]
        length: (whole device)
        cipher: aes-cbc-essiv:sha256
        sector: 512 [bytes]

Keyslots:
  0: luks2
        Key:        256 bits
        Priority:   normal
        Cipher:     aes-cbc-essiv:sha256
        Cipher key: 256 bits
        PBKDF:      argon2i
        Time cost:  6
        Memory:     1048576
        Threads:    4
        Salt:        58 bb 77 36 95 b3 07 dd 5d a4 c7 d4 fc 18 7f bc
                       5f d8 a5 83 f2 ea 87 4c 7c b9 30 9b 2b e8 14 41
        AF stripes: 4000
        AF hash:    sha256
        Area offset:32768 [bytes]
        Area length:131072 [bytes]
        Digest ID:  0
Tokens:
Digests:
  0: pbkdf2
        Hash:       sha256
        Iterations: 179796
        Salt:          d8 a8 e8 ce 7b e3 b3 8d b8 bc 8d d9 33 08 ec fc
                         da 37 15 bb 0f ee 39 16 06 de 88 21 c9 c8 66 08
        Digest:      0f 1d 84 ce 41 f1 58 c8 43 a1 e3 d2 39 25 f8 cf
                         19 e9 88 3a 1c a1 a3 3a 26 6b 6c f2 53 8f 46 33

> there are some flags to try that can help
I've tried these and did see a performance increase (+- 10%) but the
CPUs still seem to be underutilized.

Thank you.

Regards,
JL

On Thu, Apr 27, 2023 at 7:01=E2=80=AFAM Milan Broz <gmazyland@gmail.com> wr=
ote:
>
> On 4/26/23 16:53, Lodewyk van der Westhuizen wrote:
> > Hey All,
> >
> > Sorry for the long message but figured the more detail the better... I
> > was hoping someone could point me in the right direction. I have
> > machine that runs two different operating systems + cryptsetup
> > versions and I am seeing big slowdown on the newer setup. Please see
> > details below:
> >
> > Setup 1 (using LUKS1):
> > cryptsetup 1.7+
> > kernel 3.10.0
> >
> > Setup 2 (using LUKS2):
> > cryptsetup 2.3+
> > kernel 4.18.0
>
> NOTE: LUKS1 is not cryptsetup version 1.x, it ia a metadata format.
> All recent cryptsetup 2.x versions can use LUKS1 as well - just use "--ty=
pe luks1"
> in format (so you will compare the same formats on different kernels).
>
> >
> > Hardware:
> > CPU(s):                48
> > On-line CPU(s) list:   0-47
> > Thread(s) per core:    2
> > Core(s) per socket:    12
> > Socket(s):             2
>
> You mean slowdown with access to encrypted data, not unlocking time, righ=
t?
>
> The difference is almost for sure in kernel, LUKS2 is only about key mana=
gement
> (the dm-crypt parameters should be the same in the end).
>
> But kernel 3.10 is really very old, so if it is "enterprise" heavily patc=
hed distro,
> it is hard to say if it is really 3.10 or it includes a lot more recent b=
ackported changes.
>
> Which crypto modules are used? What architecture it is - do you use AES-N=
I
> acceleration on both systems?
>
> > When running cryptsetup benchmark the results are the same (but AFAIK
> > it only uses a single core for that).
>
> Benchmark calls userspace kernel API, so it should use more cores
> (you can easily see it for CBC mode - decryption should be always faster
> as it can be run in parallel - unlike encryption).
> But benchmark does not use dm-crypt, and dm-crypt changed a lot between k=
ernels 3.x/4.x.
>
> > I am using the same encryption algorithm/cipher - the only difference
> > is the LUKS format (using LUKS2 instead of LUKS1). On the older
> > machine there is good cpu utilization amongst the cores but for the
> > newer setup performance is roughly a 1/3 of older setup. It's as if
> > the other socket + cores are not being used at all.>
> > Here is how I format/encrypt (again only difference would be luks1 vs l=
uks2):
> >
> > cryptsetup luksFormat --verbose --batch-mode --type luks2 --cipher
> > aes-cbc-essiv:sha256 partition
>
> Is the keysize 256bits in both cases? You should paste luksDump from both
> systems to be sure.
>
> >
> > Perhaps I am just missing a flag with the new setup?
>
> There are some flags to try that can help (basically revert dmcrypt behav=
iour),
> search for "-perf-*" flags in man page.
> Try luksOpen with -perf-same_cpu_crypt and/or --perf-submit_from_crypt_cp=
us
> for luksOpen.
>
> Also, you should use XTS mode, its should be faster here (at least for en=
cryption).
>
> Milan
