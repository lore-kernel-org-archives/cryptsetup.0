Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069087B
	for <cryptsetup@lists.linux.dev>; Wed,  8 Jun 2022 00:05:48 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id a21-20020a9d4715000000b0060bfaac6899so5243166otf.12
        for <cryptsetup@lists.linux.dev>; Tue, 07 Jun 2022 17:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=mNKgKDURaQuNrF32Ybm12hR9WVoTnrLzl5jtL69MJKU=;
        b=D6OiklN7NIqMAyYv7/DPlv8z37Yh5bvwt70L2drhHw0raO/4k69YIQRe48wTBxIbBG
         lQGf5sZcXe75d9d/MBf+7vnXaNyG6WgPUIR21SAuNcwB09AI6LIOcXv2UBPeSi6dOOxo
         OxFaOzbjBqDf4d+uD7OahMmJVdDJhJUNjIb6PzGQifEUngGoc/noE0pnD9bYkMLOFD6Y
         E9EXJ+20HNF4FOaOryNPAdDT7ZAXv/sExMCbJ5weczrjyJDDDRU8fDWe97P1gtbjuIvR
         UixMJxj4tF/vwteScfxj0CAouFKkYjVXJBeyyHtSI/RoyOqjJ3ewvMKUqXikl0ycucFG
         vHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=mNKgKDURaQuNrF32Ybm12hR9WVoTnrLzl5jtL69MJKU=;
        b=Qt/ODO/dcolUQG2Nsz4Qt69/RyYw6AC7gO1t0DvNVsc89fdd62UXfPRCeDogSGjpA0
         RRQBNSbcsp3z/dK91i4Uz9i0RVKTpiDmDVx4LtNPxM00QP1ZFfqsh2mJoycadY96VBLV
         0PbBno+mRPMDwQpoFyUCPb0GmgC+TpArCqL2keGGbI5NOutxlAwlG9piEKyA724ZMb46
         piyxxepdLUfbvqpWUA/NA1GiY8GHGAaQSQMUyAiA/tPbp9K7Jig+rkljq+mVfQhvJW6I
         x2koUfvLGNm721ywEej07nrg4Okevq0QnEflk9aYXCTyvZo9FVXXRfPurWcLV7WaD57Q
         OLUA==
X-Gm-Message-State: AOAM531wWBgoQqFePxKAGj6nik5J41zDrC2qDRw9UBeWVeYuyPzb9dvz
	728El0bWxuuvPzknLW3dvmgiUjEeN0PQHkhzAKAD53eSlGY=
X-Google-Smtp-Source: ABdhPJwixbYNLNQvoBqY4YCVrHiqCkhoYzxxIlwHX2GDtyWSoWIjh/ko5UfZl8fAvsMGbajaojOn1Hmzshl7OLxVjwA=
X-Received: by 2002:a9d:7d95:0:b0:60b:c0d:4fac with SMTP id
 j21-20020a9d7d95000000b0060b0c0d4facmr13646668otn.188.1654646747747; Tue, 07
 Jun 2022 17:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: midnite zandiro <midnite.hk@gmail.com>
Date: Wed, 8 Jun 2022 08:05:26 +0800
Message-ID: <CAF_ETu5COFQ8D09K3YrqOD4XnFb7MzLrJXvSqMGenw_DFcaJiw@mail.gmail.com>
Subject: Re: To make LUKS detached header even more secure?
To: michael@kjorling.se
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Michael Kj=C3=B6rling,

Thank you very much for your prompt reply. You have given me a better
insight of LUKS.

> So, if I understand correctly, what you are proposing is basically a
> _split_ header, with part of the data stored in one location and part
> of the data stored in another location, and one (but not both) of
> those partial headers possibly detached from the container?

My apologies that I did not present my suggested setups clearly. Let
me explain by the pseudo code which I copied from the LUKS1
specification.
https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/LUKS_docs/on-dis=
k-format.pdf

In the partition header, during creation:

(C1) phdr.mk=E2=88=92digest =3D
PBKDF2( masterKey , phdr.mk=E2=88=92digest=E2=88=92salt , phdr.mk=E2=88=92d=
igest=E2=88=92iter ,
LUKS_DIGESTSIZE )

In each keyslot, during creation:

(C2) pwd=E2=88=92PBKDF2ed =3D
PBKDF2( password , ks.salt , ks.iteration=E2=88=92count , masterKeyLength )

(C3) splitKey =3D
AFsplit( masterKey , masterKeyLength , ks.stripes )

(C4) encryptedKey =3D
encrypt( phdr.cipherSpec , pwd=E2=88=92PBKDF2ed , splitKey , splitKeyLength=
 )

In each keyslot, during decryption:

(D2) pwd=E2=88=92PBKDF2ed =3D
PBKDF2( password , ks.salt , ks.iteration=E2=88=92count , masterKeyLength )

(D4) splitKey =3D
decrypt( phdr.cipherSpec , pwd=E2=88=92PBKDF2ed , encryptedKey , encryptedK=
eyLength )

(D3) masterKeyCandidate =3D
AFmerge( splitKey , masterkeyLength , ks.stripes )

During decryption, check against the MK digest:

(D1) MKCandidate=E2=88=92PBKDF2ed =3D
PBKDF2( masterKeyCandidate , phdr.mk=E2=88=92digest=E2=88=92salt , phdr.mk=
=E2=88=92digest=E2=88=92iter
, LUKS_DIGESTSIZE )

As I am far from a professional in cryptography, I aim to replicate
the algorithms of LUKS, hoping to achieve the same level of
cryptographic strength. From the above, the phdr.mk=E2=88=92digest (C1), he=
nce
the first (C1) and the last operations (D1), are unnecessary for the
MK encryption and the MK decryption. My proposed design is just DO NOT
STORE phdr.mk=E2=88=92digest in the header. This leads to a problem that we
cannot verify the masterKeyCandidate (D3). But it can avoid hacking
solely on the header.

> (Detached header) No, that is not proper 2FA. As is clearly demonstrated =
by your
> argument about how the second storage device can be copied (and
> relatively easily, at that), both are "something you know".

I would like to point out that, even if the detached header is in the
hand of another person who does not know the passphrase, an attacker
who acquired the detached header is sufficient to start the cracking.
It is identical to the non-detached header scenario. The attacker is
just yet to obtain the actual data. Given that (as far as I can find)
no security advice on the Internet which encourages re-encryption of
the entire volume on a regular basis, the data is at plain risk until
the hard disk dies. In which, a patient attacker can have 3 to 5 more
years to work on cracking.

P.S. I do re-encryption regularly.

> You claim increased resistance to passphrase guessing by an attacker
> who has access to the detached header but not the encrypted (locked)
> container itself, but there's already a simple way to do that:
> increase iteration count, passphrase length, or both.

I do agree that the current LUKS, with the contemporary hashes, is
already very strong. But the strengths of encryption algorithms depend
mostly on the speed of processing power. It is strong today. It may be
breakable next year.

In my proposed design, an attacker can do nothing if he gets the
header. If an attacker gets the encrypted disk, he can hack on the MK,
the tough way. Only when an attacker gets BOTH the header and the
encrypted disk, then he can start a normal cryptographic attack.

One more point to note in real life scenarios, users tend to have
multiple copies (the need of backups) of the header USB Keys carrying
around, to the office, to the cafe, etc. It is a lot easier to get a
clone of the header without the users' awareness. On the contrary,
cloning the encrypted disks usually involve breaking into premises and
take longer times.

> Since this would be aimed only or primarily at
> users who use a detached header stored on a separate device, who seem
> likely to already care more about security than the average user, I
> don't think either is an unreasonable assumption.
> ...
> None of this is to say that the security of LUKS couldn't _possibly_
> be improved upon somehow (such a claim would be naiive), but there's
> ample reason already to not add complexity based on what appears at
> least to me to be a rather contrived threat model.

I do agree that there is not an urge to update the current LUKS. I do
like a quote from the FAQ, " It is better to have less protection
against low-entropy passphrases and ***people actually use LUKS, than
having them do without encryption altogether.*** ". Convenience plays
an important role in the real world too.

Thank you again for your informative reply. It is my pleasure to
discuss the concepts with you. In the future, I will fork the project
for a few paranoids like me.

Best regards,
midnite
