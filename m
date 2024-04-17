Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309646BB58
	for <cryptsetup@lists.linux.dev>; Wed, 17 Apr 2024 07:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713338322; cv=none; b=nhQWrooTtPwlet1wlLU3v9XY+IxIQL8gTr9Dq7c0SdY8XnbEY0UrPiXLCHmxGeutMKbE9hZI5bgUUFqQmzb+VLEC32KM0Kzklfevsla6kX8uaIcdH5BGGB3kkkoo1f3R0RgH94GfKiCvFGKmMaPAD9/+q68oLoc2LxVk6k73VxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713338322; c=relaxed/simple;
	bh=v2ozSkZaIcyqfMWZPHk4gxFoWU4s6wywXojnsaYpZVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICvh60T2ouOsUjgXEWQBXEfYJJni8PAU1E+BQG3mcAm/mYjeu85WGsp7l3faENbe2O4QPfu5gvFGc2VcljTV732vrF8I+LH+5lwrLRmrR03OKJQ9JpbwZEILIjZY7hK2BL/q7AcwFFDn5HKsDX9tPIUBBnykNJGRinbTwsSxYT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDqNauxw; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDqNauxw"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5aa2bd6f651so3768842eaf.0
        for <cryptsetup@lists.linux.dev>; Wed, 17 Apr 2024 00:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713338320; x=1713943120; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgiXR/K+0RoUhVjdtpY+hoI1l0ZUJgdj3zaY1IY5egQ=;
        b=EDqNauxw9pwNlAdmHjPSu3IwPuFvVRtJKNcq5mBdU4nZTpZg6T9iSUCUxbGXR3fAr7
         9iOa+UsyyzJugrM4FKGxUJeI/N9i52pV6NLkD+NQ7uc3wYtqz7MJ2/XRSSjLIXtdr73K
         R+yuFFxRCvqcFnMJ0QAM3SfOAAOSII7+987pQEgQGxOkh/ANW0BUS/l4vKXGe+RMyqTT
         80BCtwsZovraTj+fbHO60/1diPSeS/HW1y/AiQVp9OX/NLOOhtjSsYPBt6UWOd7nB90E
         YqV85s+DCTnVT0niUp8kmfph3fBfnFll9aGYrqFI6B2ymAfyxjdsoLUy48GwAcbHzQv1
         OHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713338320; x=1713943120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgiXR/K+0RoUhVjdtpY+hoI1l0ZUJgdj3zaY1IY5egQ=;
        b=SryBABVnu4tLmvkT0kdMPLTTwANYNiKlagFzFZluk0N3qSKNyx5fxybaYZc6Ou7Xta
         DuS+InUdhRzPTnMazunGcuqRerDMI1V0AIzz8c9D1zhUSTu0R+Qtveged/HLF2KY9aIq
         GeiAA7tK6/PUc7+ZXJKYnqLTm335GHrprdxzdfQu7wW6jMOAmjStmVC4TgUmO9w/dZvH
         OWrInfmokCICb63BCl+foP8J2mzfecoWpt2/DuCnPCMW5mlGdYV7StNRUffrZiDyOZO1
         ui6xscFQJUXxqWozFsBjv3PTMKmIZqJSnxT8gyYuaD670gPB9w3BFp7LihwYK3JG1rB7
         IURQ==
X-Gm-Message-State: AOJu0YxU2T02bp31pwbCcNiU6yhwAdWpVPA7PbiziqdGVk3DG8A58/pF
	QPOJDin0kd9DbPvbe4Bczu4pteTR40CS679UVwabNB/IGFtCAZEM5Bu0Oy32hpyMj7xN32i6psp
	tmTqgPDRSGHaayIJ1lKUnWE+WwuI=
X-Google-Smtp-Source: AGHT+IHp/JAtaGMmQjSsLk6wK3z1MoB7PKjRsqzAilKf8fAGY+4kYM3PgFsFJE0DRmbcdCQmUHoakW6PJlMKw/Trub4=
X-Received: by 2002:a4a:1ac3:0:b0:5ac:9ff2:8ca4 with SMTP id
 186-20020a4a1ac3000000b005ac9ff28ca4mr9108744oof.6.1713338320278; Wed, 17 Apr
 2024 00:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADofXPDMsOh_wWDM52bVxC4-eU6VgBSoHNF=jSF1h05njUT5Mg@mail.gmail.com>
 <df0db981-48df-4c7a-99ea-f8178c1180f2@gmail.com>
In-Reply-To: <df0db981-48df-4c7a-99ea-f8178c1180f2@gmail.com>
From: dE <de.techno@gmail.com>
Date: Wed, 17 Apr 2024 12:48:28 +0530
Message-ID: <CADofXPC=3A-bvm8vvcQT2Cw2CT7z+OBRZySY0ASVUSd=DouVuQ@mail.gmail.com>
Subject: Re: Decrypting only uses 2 threads.
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks. ctr is only used for testing since it's sureshot parallel.

On Mon, Apr 15, 2024 at 3:14=E2=80=AFPM Milan Broz <gmazyland@gmail.com> wr=
ote:
>
> On 4/15/24 10:49 AM, dE wrote:
> > Hi.
> >      I'm trying to encrypt some block devices and trying to use a
> > cipher and mode which is multithreaded. I'm trying out
> > aes-ctr-essiv:sha256 to test multithreading, but have also tried
> > aes-xts-essiv:sha256 with the same result.
> >
> > The encryption is definitely multithread (massively), but while
> > reading from the encrypted block device, I see that only 2 threads are
> > being used. As a result when the CPU is throttled (deliberately), I
> > see a drop in throughput while increased CPU utilization only in 2
> > cores.
>
> I think dm-crypt will not switch decryption from different core when comi=
ng
> from block layer here (if you have multiple threads/processes reading
> from dm-crypt device, I think it will be parallelized as expected).
> Maybe setting different scheduler helps.
>
> Anyway, this is question for kernel, better ask on dm-devel list and
> always mention kernel version here.
>
> > The following commands were used to setup the encryption --
> >
> > cryptsetup -y -d - -c aes-ctr-essiv:sha256 --key-size 256 create disk1 =
/dev/sda
>
> Never use CTR mode for FDE this way, it is insecure as the only tweak is =
fixed
> (CTR requires nonce while sector number is reused).
>
> Milan
