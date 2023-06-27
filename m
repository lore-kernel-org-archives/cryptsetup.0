Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7FC17723
	for <cryptsetup@lists.linux.dev>; Tue, 27 Jun 2023 11:10:24 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-c13cb2cb428so377933276.0
        for <cryptsetup@lists.linux.dev>; Tue, 27 Jun 2023 04:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687864223; x=1690456223;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WpogHqtrrgnHDb/YwO7bldeLvKm/A8LIFPgYVG6S+pc=;
        b=A8XA0ZPHW4Iv7HSyEVp0Le71mY2uJGHJWp9tHBzJJGckuJpCnN6APcqMk9Ob5pxIdu
         45XPwsXCiPQFpupWqfxWC986oUfUfchCiGWMIx6TTZJqwOKtAopt6GG47WWTj3/pkm8l
         HdVv4Gtyv35TlXH1kcmBFRGwo8VAHXXoj/t3TGimwol4chxXFA4zoWq+xs59DO2bjz6p
         COdUoTkotkOPaanbutmnOmw5aIO9CoB5u/raX7cO17fagIgGRwzqL4WhnLtFfhZ2BMBu
         5SqTt78BFGv/ag9wmLbFLoNvVKJ1wZSwDyN649TnbmzI1vlw7UtXlQ1mwkt+MZOSMZqx
         i0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687864223; x=1690456223;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpogHqtrrgnHDb/YwO7bldeLvKm/A8LIFPgYVG6S+pc=;
        b=cMoeZwwn5XASLBBm8VZBVJmrUQoutvGOi+JG+LFW+QQxzhomwTrC9DGMJIEfM4cZTS
         Q4r/Y3K74hSsC+VFJZwc24Vi0zsegLYahH1iVqsnw3Kc/FBN+ZeRTnMEobQM5YxUqNFa
         eLPhA+R10sNgl1c/PyG/6bv8mjFF1XVJunUv3wnE638zC36kT2X54Qb6YQUI50PTp+M1
         I7NLVJeyLduEmrHj/YAatrnlekMVQK6FDste/Ol//YNC0bMS0wopaNaqt8sBgbK5zyiy
         ipWSol32EkMaR5cSX1N0YJmsyeOnZ5myqQ67z+3ggqMkpJP9X17toRZiLpWqzt/vVaUI
         995Q==
X-Gm-Message-State: AC+VfDzrhoWPcYguVrjDeK+uJUvuf0W4oLVenhtlKEdTfoKSk0gM5eRC
	xbIS5k5kYOZy8PXdWQWshua2avNE6V33Ih+G75SAe8oPocK95g==
X-Google-Smtp-Source: ACHHUZ7M/YRrR7kpKqtDVmUISPrBIbKIkZiL7BbSMr0SjulxvbEPl3vKlL+ZvB7NzrWt+KEFmFzEsv7Ikd9GhdPSLyo=
X-Received: by 2002:a25:ab44:0:b0:bc7:8e8c:839f with SMTP id
 u62-20020a25ab44000000b00bc78e8c839fmr484689ybi.5.1687864223381; Tue, 27 Jun
 2023 04:10:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alvaro a-m <alvaroam007@gmail.com>
Date: Tue, 27 Jun 2023 13:10:12 +0200
Message-ID: <CACJx3YpDV2=J8rStSG685iBSW6OSEV2UaS4oRL6=qVGGSsoRvQ@mail.gmail.com>
Subject: 
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
