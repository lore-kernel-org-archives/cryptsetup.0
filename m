Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4A6541457
	for <cryptsetup@lists.linux.dev>; Tue, 22 Sep 2026 12:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079689; cv=pass; b=Q/985SE5rSs6S2iZ0r45oaYyLqiD52Si26sLHzA5i5tGe8wX3qPx6Sj0TsVWRS4bHw4EUSjCQZTCgUJ/JXeXKmlknmz/XtaXOF+yyMi1SiJwE6LzFH8W2ManAzvu5zDh1+BxMcOqS6O2S6W35VlDmLU4QhKQMfneTGc0IDik6JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079689; c=relaxed/simple;
	bh=6vGZYtRGiAikgwwIH6D+uH9Wc2Nd8ifJanY2OngjdbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJfAWNJ4y02k3H0IScttpUvyR/s5fYIBjWBAwy4CfalMoe8cyA8VSX/4JweiWBekmeR5X1uq98wwD48S0Ej8B52F1bQYuTTrCmyMjmQDAA/gv8olfDcfi1VNg+jIVfjwROzLDSOA0fKKdv/wodyePaG8rV4YytcqHovvnIziYjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY39t0/S; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY39t0/S"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-859023466e6so1903617b3.2
        for <cryptsetup@lists.linux.dev>; Tue, 22 Sep 2026 05:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790079687; cv=none;
        d=google.com; s=arc-20260327;
        b=WvOe4poLg8MFzfVr3P7awx9ZyS/6BigABrhn7/KRcWzLkpzP+G4mWBah5GGaBiOCRy
         j8ZoU7YN2t5cFj2/2IOqnW1UW7eEXDwPebeoWy/igqfIFK56IijetsnpaDnq0lB7XfAo
         2sphGAD677hvsYeKkdqW1ACCar63A/25sLBJZCkRc4huT4jYsf9wJ5l5ByLD/7D2Lmhl
         Mfs85PfdltsXCHFimIk3C9xB1mhtcxafl48IWloJGRzvnlsx+0XAGmVUcuU1MRbdnlv5
         9ihcydSXsRDR/aDcI2NS040bMT+GRGxuCabn2LI257tgg4I6J4yOX/fpqnq+CUNY5Jrh
         2kJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6vGZYtRGiAikgwwIH6D+uH9Wc2Nd8ifJanY2OngjdbA=;
        fh=7CeQXh2vBXPpYmy0ZcqDAlKw7/XvmHDO2gf+Y/nh2g8=;
        b=A8vqj2vPDoCusumR6GlWOrBwuq/GaixFqopHd/kFCP7W7rS7dqJgGvwQzH4nqBgmNl
         XqvKLfOC3xHhxH67RbtevSGT2MrmupTE3e3QU9b8GO9bTOvVRGSQ+zqBDuvqab2H0IgK
         Rt57yGd805PL8mlNj/x9fk2GfWShz76FXMQXGjcNx9B/bwJp8UkWN9+xXXwYO5NKKJLI
         ESwNDxoUOVEuIFxLYWhbrk3Io8jW0p6Xd3orliPVN546KD0m2ES+IJ5MSSqF6ucLrxc3
         t6PJyqTv0C6GcYwj5PJYNMw3V6xYVqjw2ePM7vdujzfpKbwLfeqchfNiGsC1t6fCfLGE
         56tw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790079687; x=1790684487; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6vGZYtRGiAikgwwIH6D+uH9Wc2Nd8ifJanY2OngjdbA=;
        b=BY39t0/S9YpYWzVxyRvJ3HGx7LA5di9r6iBsvsFOsGTXp9RPm/bEIrJSt5rawFVHO7
         Vc3dDDhDzgPGnqq+2nMFQdjjKGFm9R/Auj149V2dIwKf0b4bknJECzvYNrIE4M0a7ZJ+
         2BvX0Z5/hu9+puNgoQL1m/KRhFYH0nZH2dvvbHHj2R3wq/RWw6rx5f1ghCagwEm1Ae/W
         h4MJqY2DGLu9dTfHntqAHKxZ9hBDR6X0ER5SzuEThl8LaHgohmOzYKp5fkvj+med0cm5
         SbORt0SWcc9Bag8nLOez2yzGnJ7K7yJ6Ng2abgZUM+Hag60QPjRDSFaQxFWz5DApTmQ4
         6Iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079687; x=1790684487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vGZYtRGiAikgwwIH6D+uH9Wc2Nd8ifJanY2OngjdbA=;
        b=wyWUtIJWAUzwcua8IV0A6EIRFBYkGCC3NPJFcAUJRBCxr9R7PE2lq3hzUuhSWDw6bb
         DgcvD4aVlvN+zJx+zNvBgBdn3Xbmp6D09n1i3SeY0xNN1TDUeoCQ9dU3pXoNZPaRQ0H+
         uW8BvJx/A/nzanWyBWF8ek+pu7/PrhmszR1PuurJ3Hd+e/aQ+4vbm6VjOYeMaZbR91dV
         oYmWocKcMG/ncj0GCDuyB9fOgfXrvC6Bjf//g0KR6vB//e85+ROUnS5Z4EZAw/nY6xjy
         QRNVudmXFR6wZO8ON/2StEfUcDT8E2wveVwIYBCM+85fqEBusdTQLtOWWWcUUuPdgwtF
         y7Ag==
X-Gm-Message-State: AFuF++kSDl0KizxlSp5P1B6Ccm7/RGoaVL6dhoDHxJfcm8lil/EWBU4K
	XQmfvYj6PNU9M4Y5wIFprIt7HEC081pIH5XJ10DdVs/7h6dkyiYPq0a9rWIcnVolf7iMh62qUgf
	0AUn6f7zu4/LgiF/6Y/KXfyEWpknOL4k8woDM
X-Gm-Gg: AYBFou1u8gxOizChXnStsbb/ckLD5wsC+FHLpsmjPubNozu2s9FrC4xk424OTcM937/
	yLJaeTHdl/7pyM1xwbN6lWNarMtdOwmq4ggg4fAyiFdBGya4YVwOKTkgRDOzPPhCL5FR4NUtzNO
	yBBomlM4+G3fSu/lmqozFqP3ylJ2EViJ2GJ/5JntVyxjca34tpi0jxt9yPcTQXIuZQ0Lno0kpkz
	+VuDsvDWc+io2UhRw16EuN00DDvxwvLnBEiF2GJmZjxWHCKctIPHlylimz40FkjMrcJRiwikB09
	7vg5C5Dx2xSmI5apHJ4aoMwBHn+t5se0Kp3XU8/SilrakJSMgmnwNBwe
X-Received: by 2002:a05:690c:3704:b0:855:914f:a45f with SMTP id
 00721157ae682-897b2237221mr86775667b3.2.1790079686703; Tue, 22 Sep 2026
 05:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922100554.28692-1-itai.handler@gmail.com> <d3823e0b-3387-4b3a-b5e8-a3d5f266308a@redhat.com>
In-Reply-To: <d3823e0b-3387-4b3a-b5e8-a3d5f266308a@redhat.com>
From: Itai Handler <itai.handler@gmail.com>
Date: Tue, 22 Sep 2026 15:21:15 +0300
X-Gm-Features: AclHuK_4JeX5ogCyyg3YHlMlhplz_gwS6v_LhDWzzJtmK85-7R_R3sPQOpF1uU8
Message-ID: <CAFpOueSNq-S3X74YR4OE=6NpNqkhYuvNeKkXq9XHyM3LeZx8uA@mail.gmail.com>
Subject: Re: [PATCH] Reject LUKS2 header with out-of-range encryption sector size.
To: Ondrej Kozina <okozina@redhat.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:07=E2=80=AFPM Ondrej Kozina <okozina@redhat.com> =
wrote:
> I don't think this patch is necessary. We do not check the upper bound
> value for sector_size in LUKS2 metadata validation code, but I believe
> it's on purpose.

Understood, and I agree - please drop the patch.

The forward compatibility argument is the one I had not considered. A
hard rejection in the validator would stop an older cryptsetup from
even dumping a header that a newer dm-crypt could legitimately support,
which is worse than letting the activation fail.

You are also right that corruption does not motivate it, and I should
have noticed that myself: to produce a test header with sector_size
65536 I had to go through tests/generators, which recomputes the
checksum. Ordinary corruption is caught by crypt_load() long before
segment validation runs, exactly as you say.

Thanks for the review.

Itai
