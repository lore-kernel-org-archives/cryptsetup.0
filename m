Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD3BC2FD
	for <cryptsetup@lists.linux.dev>; Fri, 23 Jun 2023 15:51:56 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b6824141b4so14071365ad.1
        for <cryptsetup@lists.linux.dev>; Fri, 23 Jun 2023 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687535516; x=1690127516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tYrZiASZyEVQAsQoAe2TGwGQBTI0Jm9q/N+l02Md64=;
        b=BdMKsiCf6272iCi2t7jIRvVyDXAxxMuR4L+0HuOvnP+Cdn9WRt8sh6wvBzO7W8wYsT
         crIoikwsAw+HCRCgsQ0DxKZVctB//i8L0GFL33DFY79ZGbHWIxxeVJtN/3PVgQhcNraI
         PCcX78HTa9Xn81hE7OrZlbV7lsG9bElH75rFTo+vEJi5azudHAOnsaQzpY/7IpyEldlo
         ZPD0tF31ntyATLL5t0xhBE2Hggcp7ka7NrgMaenuX3Din05pXt+WCymYXEFDNQb6XOb9
         /iE/0Pe7m5HJ6uL5KdOFSTmcC7rZmuvWYmV3FeYRcf2wpiBuM0ZuV0bOHL+GJtBb33/7
         Sq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687535516; x=1690127516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tYrZiASZyEVQAsQoAe2TGwGQBTI0Jm9q/N+l02Md64=;
        b=RUVy+HvpQDMhp5J/OsqTFPe+6Of9FVeVtTI0znu17Ndzv7refekcJZ1QqDG8ukr3js
         XM+RjEoez8t7BOXj1YFcgbB+pV5nYPHpw8UhoBWAedo3uh5nYfp8dQiplRvlzzYUn/FK
         /sW1HhFxlKyxahx59RxLKJT0ewWOYpN5TA3/UNB/e0rmVdYa53VKBNujfCUCviVG5dGL
         2ITjptmXiJIM+h984zDO4PlqY7/DFENpv2sycUl33nyRoittjOvvdOmYdtuVI7dYSyBW
         NYVY2njx6/BZ+w+coVirLHtJ6Io0eTHywwvEMJOT0fpbgFxf0L+13mZEGd+Z4O3ABDBy
         Yolg==
X-Gm-Message-State: AC+VfDwxLDcSzCC/IT3Wkjten32MSDoBlInsF7FiyGn5Kxa74/UD8cSY
	Iknymd0d6y+vUF8C2YOUbxTexjaUImDCBiSSfhvjNRIxw4txmA==
X-Google-Smtp-Source: ACHHUZ7d4ldBD6tG8FQRjlbz87zmgyjzLHG1TSMzbMXPyiJLb6xW484353hrOCWlo7xRQmD879VPzkpXuZW3pN1UqPc=
X-Received: by 2002:a17:902:ce8b:b0:1b6:a99b:cece with SMTP id
 f11-20020a170902ce8b00b001b6a99bcecemr8861996plg.30.1687535516061; Fri, 23
 Jun 2023 08:51:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJbs9BHP=bu37WAEM_ztReiFUP+rNUVLnPWBdNOmRzjW8Kb_OA@mail.gmail.com>
 <9423d3f4-10d5-968b-c62a-f424515bec2d@gmail.com>
In-Reply-To: <9423d3f4-10d5-968b-c62a-f424515bec2d@gmail.com>
From: Rishi Dhupar <rishid@gmail.com>
Date: Fri, 23 Jun 2023 11:51:19 -0400
Message-ID: <CAJbs9BGg6dOeDj2oBtVqXPnNm1ME+CvD=8FH7YTCaHC67ef+FQ@mail.gmail.com>
Subject: Re: Bypass kdf step with LUKS2
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. Exactly what I was looking for, this had a massive improvement in t=
ime.

# time cat luks_passphrase | cryptsetup luksFormat /dev/rbd0 -d- --pbkdf pb=
kdf2
WARNING: Device /dev/rbd0 already contains a 'crypto_LUKS' superblock signa=
ture.

real    0m4.488s
user    0m4.177s
sys    0m0.060s
# time cat luks_passphrase | cryptsetup luksAddKey /dev/rbd0 -d-
luks_passphrase --pbkdf pbkdf2

real    0m7.075s
user    0m7.023s
sys    0m0.013s

# time cat luks_passphrase | cryptsetup luksFormat /dev/rbd0 -d-
--pbkdf pbkdf2 --pbkdf-force-iterations 1000
WARNING: Device /dev/rbd0 already contains a 'crypto_LUKS' superblock signa=
ture.

real    0m0.312s
user    0m0.008s
sys    0m0.054s
# time cat luks_passphrase | cryptsetup luksAddKey /dev/rbd0 -d-
luks_passphrase --pbkdf pbkdf2 --pbkdf-force-iterations 1000

real    0m0.044s
user    0m0.017s
sys    0m0.006s

On Fri, Jun 23, 2023 at 10:17=E2=80=AFAM Milan Broz <gmazyland@gmail.com> w=
rote:
>
> On 6/23/23 16:01, Rishi Dhupar wrote:
> > Hi,
> >
> > I have an unusual request. Is there any way to skip the PBKDF2 step
> > when a device is being formatted with LUKS2 or an additional slot is
> > being added?
>
> No, you cannot skip PBKDF, this is by design.
>
> But you can set KDF to PBKDF2 with minimal iteration count (1000),
> this will be very fast.
>
> Something like: --pbkdf pbkdf2 --pbkdf-force-iterations 1000
> (this should also skip KDF benchmarking)
>
> Milan
>
> >
> > Here's why I'm asking: I am using a high entropy 256-bit key as my
> > keyfile and the KDF step is unnecessary and does not improve my
> > security profile. If I am managing thousands of devices and want to
> > rotate the passphrases on them, this KDF step is becoming the major
> > bottleneck in performance.
> >
> > Thanks
> >
