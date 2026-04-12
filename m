Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44761FCE
	for <cryptsetup@lists.linux.dev>; Sun, 12 Apr 2026 08:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775981357; cv=pass; b=D4Px21y+LAJ+78iqRdx7OOLbvuSz8Nt1JGBAMp7pyRP2b8d2WOzH73gfJRfH0hwFZILTYGLWFoZECkU7Z4uRAy5pPE3Y/vODM1AYrsUe/fpNgQcHHPleIEN7PcVUi/z9yxBBEAYkPh5mVGxED/+YtL6gmDYVnHfTBUgpIqO7Fts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775981357; c=relaxed/simple;
	bh=3aXNRtsXIH3zJ92o1ol92FCArMQ5QXOVdw2D/9HYtw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RruQKW2bsuIc4jwyYzdiZs0IjPy48IXIHtT7yhq/DFKkTgXMrjHEhJmdQFhBqyJIKGL54sz4ykQLMFV/5ZLK+y+fRhnAYPn9I7iFy7OMPcPhaXKXqtumuDoEo8aLOP5vrQbAlDlkJx/037uZIDXgIS2RHfPYie17a8WvBoZpah4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXRne+Uk; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXRne+Uk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ad9516a653so15799335ad.0
        for <cryptsetup@lists.linux.dev>; Sun, 12 Apr 2026 01:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775981355; cv=none;
        d=google.com; s=arc-20240605;
        b=HM58j+cYNrhkUfNkWzqHHqqV+M0iw8lJig5MuOHkJ3trNU/zelONYZt6aVLb1B6Y6b
         /tXcVnHEbuFd2QlgTjJy9luu1fZ1YDe8dn6AjxKdxLGnAehEQ4sbNotsjFz4Qf6jiHKT
         4VuUyaTK0mvcUatYPsNr/hrJ627L2NWKYtOX9T+O52yy6RUj4+yx6V0OVhPfHy+BYlAp
         mOrFURNgVkGkbn4WT6+aRukNCbGjCgZHEnvAUNZGfuMd6W5f6bn1OfRo8e4dq9cIIgd7
         epy5HqoqkgyACPz5ScTdTZmP1ORdRSr+vwstLDaf1DZr42cheovJzFpQR8eZFKLhOmAq
         oZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3aXNRtsXIH3zJ92o1ol92FCArMQ5QXOVdw2D/9HYtw0=;
        fh=wDW+69BXdBDBu96a/du9fHRw36ZO1yF13s3DAOaJGO8=;
        b=NFIummMYF8sYSbTk41JiT3+Xv/ma2m6kQddtzIFzAYpiFfMI60MOFAQF2W7sUWKq+O
         kczB8Mg2BbCee9zS9yEidO9vci9KighQteiY4dd2mOkfWnHyUdjTowgii7ad5U52ULIv
         u9KfBlDFlEhiPgtUDr4SCyAH/4Bwx/PStBmpDrXJhfomGa3R9vaSfvRW9NX3CFQNMshw
         4HINdgwyht2ZDhoSAXFYnCg+6HjUknis3C0a1u5uSg0qQlua4IH/N80mWggBzJ+1sxjT
         OrPAWwIM/d8BBRADN5mpi/RlcHA00UZqfrhrTRya+aSsT8FvWDfLxaZMXPE6WMIpgeQj
         8enw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775981355; x=1776586155; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3aXNRtsXIH3zJ92o1ol92FCArMQ5QXOVdw2D/9HYtw0=;
        b=EXRne+UktIYkSV6aAqA/HXMjoSqvN4tRt2mEyCQLKejewLCLZ3nWPWJYoGG/TuqoQW
         LdrP9jnqQlLoJgQzFteWH1aqnpHbrBL3TItE5YVDL0Oh1/vI8E+ls19uHx0uzoq3km2g
         mUhxE9XqGqI2BSpZsUdecLjd5s7RUOwwC1Svuo97QvpUcdHj1xzCqVrn048GK+AhLCcK
         OX/s6VsS48SgRYp0XzGrtlPwzQWXlOxR9LDngIOdwc2gwwI6Ru+BTxjZwx4uNBs6apba
         T4b7fZC25wYb5esUlMN6f88JuZNqK35MA3GGNc6NoTCEkqib8+kQRJTomOsrLYudY15b
         F/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775981355; x=1776586155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aXNRtsXIH3zJ92o1ol92FCArMQ5QXOVdw2D/9HYtw0=;
        b=Zh9gkEO5FQTRgqPgBhYm1oiynZnF08AlvKg9CWcJUkbPaPFnFxgvqYyRSKJiDSAQ/6
         KKhexEC42Zucjo6XhWYRLdkvDFwjNYRcqyjl7x7s+AB7ydNEfubdm9/JTN3s+48cubhu
         B+8Oz8mI4jZ16w/cs1zoKVQpkbJizlfC0T/mDcasFR5FPU4/g+16EhFPLRK751ZLQl2U
         RUEEYNUZVnhLPgIsEwcHdo8YVajedlTUhJf3REACL3+AsIdHGXBypldTguWTVtM1xCtp
         WA8VEZtcdeJcMspZdYQrLfge5tWRlMQxvJpQGc42kQg6AwW3/27xMr4iL2SLRIDVH1hP
         NFiA==
X-Gm-Message-State: AOJu0YwfrFZOLyG9d31gYoBkJrLDYDvDEqkOAol8LPu46cLOOdY74j3n
	oGY0eQbXEEBYZicO/r8tmoACQqydS8MdFbzlwpN+6cO7AyD1SJAmDBjNNxUhdAOQ9dKPDxzm9uU
	HxG3XlyZ33VHPxzJgvKyYOVdOKHNEWDeCz3uw
X-Gm-Gg: AeBDietZ5DDfFCEuXBw8weYnjAUs2eUvc5v7qnCy54CKdf1hJdr0c53gcG8CfS6GwYW
	wTJ+YiO2otyyY/SaG8jL/cbpPHItItIrg2y0URiO5qIHJhknbKQ1SjQprkAt4tzegpmI0sGcYBx
	mFTdpGqTyR4o5Mopc5qnX/3Rt76ZQTROe1/DSkqrHtyDl9f/IgGeUZXpJFo4VU2B7sWngGwsNHm
	+WKXvguGAvWI1vF/v3wkYdaCOcMmwgaKY/S/fYAl2TUb98+pvt6CuAdpXzsTd2qcSZaQtwytzxu
	MRzjrhQKyl+wRdRoaZWc/Mm4MVC/doBos2sudhkvXQ==
X-Received: by 2002:a17:903:f84:b0:2b2:596d:594 with SMTP id
 d9443c01a7336-2b2d59619a5mr89984135ad.13.1775981355417; Sun, 12 Apr 2026
 01:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+vw=V+c4SP+dPwY6oYk=V+QQS=797XuqSRan8N5vSSFwvN8aw@mail.gmail.com>
 <42b530ab-3f92-4aae-9714-076dbccaf0f0@gmail.com>
In-Reply-To: <42b530ab-3f92-4aae-9714-076dbccaf0f0@gmail.com>
From: j4ck32 <j4ck32@gmail.com>
Date: Sun, 12 Apr 2026 10:09:03 +0200
X-Gm-Features: AQROBzDwvMGhXJ0DIJ4NeTWZgLY9dNDVBiGQilDo9qU1B2j_xkDno_4vYVgDKbw
Message-ID: <CA+vw=VJc1Oh1v379uaJzSXPsfn_Mr5NmXFSwpaAOi0g+GMmS+A@mail.gmail.com>
Subject: Re: Unable to use a keyfile
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

memtest86 immediately failed...
I did multiple test runs and determined one of the two modules failed.
So I removed the faulty module...
Now my system accepts the original key-file again.
And adding new key-files works again.

Am Sa., 11. Apr. 2026 um 23:21 Uhr schrieb Milan Broz <gmazyland@gmail.com>:
> This should work. Could you try to add "--pbkdf pbkdf2" for luksAddKey?

I skipped that. Now that the issue is fixed.

So using a key-file uses more memory than a passphrase?
