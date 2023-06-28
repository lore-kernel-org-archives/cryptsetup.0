Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451B37469
	for <cryptsetup@lists.linux.dev>; Wed, 28 Jun 2023 08:45:12 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7670479ac4fso35169685a.1
        for <cryptsetup@lists.linux.dev>; Wed, 28 Jun 2023 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687941912; x=1690533912;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WpogHqtrrgnHDb/YwO7bldeLvKm/A8LIFPgYVG6S+pc=;
        b=Qma1tpZlg6agz2gIqSRE95S0/6cnEpR8O5LODkLSZObnaPSOn/fNtn5HI8wSdLKNYv
         QNmi+sKchi+yVqIyJUaPLddEFAIcUVOYS7hQSuT2P3CX0bpTZuRFzDxN9ii2aBHOLUFM
         oK7ZjSh8iwcGMm4D3iTvoq1wX1GVgY1tx4UrqVF0ocIRJW69h5vyEWwtZ5nsDrQk5qGU
         EvMw/CjbHfqCgHJFl6Y76S/JZfN5Mm/aZM6cx4FzScWEYaPLFbebczAighxk3Z7SG1yE
         qdxfn21Y5Nu+XKDrfOIhjYX9DD8/T/7C33Eaq91KBuyVlYztU1nAkt/9+0wj6SiCDBl9
         sZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687941912; x=1690533912;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpogHqtrrgnHDb/YwO7bldeLvKm/A8LIFPgYVG6S+pc=;
        b=Izl6fXjDde0DFoX4Izj+1S3/QYYZe5nJVntq49aY+2jui6sTNhigy4WC1PfwMShcEz
         w6fyKla62TAZrTEa521MB5bk5c88wIHwIicyQmqP/T2UDasvGRCM54X/A/s5ADkd80Av
         HQTT8xHUBcazJKLbV5JWntLUDEYmaD+X4Ypa+z4DshZaA0xt9ASRGC59CgfW0PqFb5MJ
         CtfZPdSfDZ4gDSL7ffZfUq2rxWRoCwFxKvIVf/+bYge28sJJTR41nnG2ic5jYk1Eoen4
         KOSZDBmdW4FCv0vUAuWUAWESB/ZRsdOQWivvgW3TTwk9sGvWBx/Fj6p2Y/QYYnkSTHPe
         1lgA==
X-Gm-Message-State: AC+VfDz9WVqAZJps3hhPOu/slhbr0EmriQ1TyMtozDsIpBt7ZrGH+BFk
	XrgRAUJIUC6ba6Ort2T07DyeTvEQkUbUhzBPvPIWpUehvpxoqw==
X-Google-Smtp-Source: ACHHUZ6MDZQCmDqsFmVdznILIQ2dNNvJmYwweyZKM5l5kNnfGs7jdQKGFvw5lJ7lIfBIFTjBU4qA0hzEQoBawDO+ZP0=
X-Received: by 2002:a05:620a:4484:b0:762:63b:e10b with SMTP id
 x4-20020a05620a448400b00762063be10bmr6607267qkp.1.1687941911666; Wed, 28 Jun
 2023 01:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alvaro a-m <alvaroam007@gmail.com>
Date: Wed, 28 Jun 2023 10:45:00 +0200
Message-ID: <CACJx3YoFZse7gyk=ZzuqKKRKr=r2_+3yuwRyOmuBZ=RnL=8BGw@mail.gmail.com>
Subject: QUESTION
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI everyone,

My name is =C3=81lvaro. I'm texting you this email about LUKS. I have a USB
with 3 partitions (/efi, /boot and /data with LVMs encrypted by LUKS).
I have a problem entering the password as I don't have a keyboard and
I need to enter the password with a touch screen. I tried to search
for information about that but nothing was successful.

Do you know any solution for this? Can I enable the touch screen
before LUKS gets up?
Thank you, have a nice day.

Kind regards,
=C3=81lvaro
