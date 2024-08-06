Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419521C3789
	for <cryptsetup@lists.linux.dev>; Tue,  6 Aug 2024 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722942199; cv=none; b=hhttjpAYCj2d98DE6G5rFO1d/KrMVrXaCxCVZDhokCdPltowVXzBUG5pq4uK4j0gnyCvXYIMD4B5doBspug4hxotDVPJgBl4zA4tbzdZ2ubmF/vfatoxvlsnbtj5O7Aw6SaJV6711gz613Q4Wxu/xkb731kPNWYgtYMp2rNils0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722942199; c=relaxed/simple;
	bh=YPldN2DZL6N8CDng/NzPfUbzSWEF865k1mIad7d2VY0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=kCaftcMm1vymjdxL4sFGqw4/7R9tRd/YZVCn8nR0cLKA/oldFCsl0zGyuuQAGiOqGUqBbSIHp4IhCN5DEj8zI5Y9I7Qps+Xk9QWm/tS9F1hSAU1+4mN4BAWWfsLdIg9a1OV/Sgs8nWL/YmVWWC0kvg1LwsA6TNKoHU5ZFpyzJGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z308WB4t; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z308WB4t"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dfef5980a69so527394276.3
        for <cryptsetup@lists.linux.dev>; Tue, 06 Aug 2024 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722942197; x=1723546997; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YPldN2DZL6N8CDng/NzPfUbzSWEF865k1mIad7d2VY0=;
        b=Z308WB4tSu+nX1Bj0bxFrHovSoM2WFtX6HxnCshFAavBv7x+KCbeIOhF2e75zt1xJ6
         mXp7EOB7EKszpBERnMW8qWoSnhkAq227bJEed9Q1j3w6TmyJAovGanOxhqVbvFJW9cmC
         ATZBtzIe98b3HpDOIREtYmFkw5timgeVa8q54czUZT/IV6iDYzG2Zc7Q6IugMHDda4sd
         6UJlk1o7uxd2vNUav9rh5Qz+2/XmRCMFXhU+HQRpBpQ06nR3ucyJG1UGgpnvMXAyjEUj
         AQnUvYnaeOKsa/Bv1C29cOjISdgtTD44tpuUsjfMxGaBzvLbkub5eUmVjSM6idQEPCQN
         nDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722942197; x=1723546997;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPldN2DZL6N8CDng/NzPfUbzSWEF865k1mIad7d2VY0=;
        b=pj/fJpTrVfIGsmGYafZQQYGrNduH2F4SkKXK4tiZiLwBXwlF7yyA/ehvMcMiXUPVUW
         oCdTjo9jlQKhEl0oS05LM6ilQeKBA1/95JWlra6F5TZPscUR9vTQBsm69ozFFa8OlLNL
         6B42CqlTmVySwg+TWk2tGNRl81r3EJjqA8qWP837L0brwqwAq4xz5Ytr8ankpekVa6Fg
         4xWe4kdTAXwDI67NPTTNF+XCqJi1If8JL+rA9Nb+XQPczYA6dEz1HTt+DW8fdJb2Ytwb
         qgPMHM63eTUMoUG8QyZaJ9KRT+rlGjZLarer1RZ+AqpOCKqYYM8jpZhV60ayoTqYh/nO
         gpwg==
X-Gm-Message-State: AOJu0YymO+HuIT+sh1s3ZnYk7hukjnFFplbCJh76TlhlF5VmI85PGQMO
	YOgAb0MxUMWSTZdwXRrbX4hAW5PhXvbBl4hYS16AYN8Sugc9taIwRDIwg5D5T1y3ZxTwIBgMU82
	pZH0n2j3s2XOrj2NxG7L2k8FwsWqar5zL
X-Google-Smtp-Source: AGHT+IGMHQvDGdYgq0LAvZYGOSM4GUwewtIAc7cHNiUES8x6a5uVyWN2qffj7uRBkhJ7EyABFlonhiTsM2Abz+OU8uw=
X-Received: by 2002:a05:6902:1145:b0:e0e:499f:3d88 with SMTP id
 3f1490d57ef6-e0e499f4a37mr10102741276.26.1722942197112; Tue, 06 Aug 2024
 04:03:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tomasz Kurzawa <tzkurzawa@gmail.com>
Date: Tue, 6 Aug 2024 13:02:55 -0400
Message-ID: <CABYE94Hx36XOAzqtjpcKdT4S4YyBoCiXVdVXo2bCu02JguBgEA@mail.gmail.com>
Subject: Custom OpenSSL
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

I am currently working on building Cryptsetup with the --enable-fips
option and integrating it with my custom OpenSSL build, rather than
the default OpenSSL provided by the operating system. Despite my
efforts, the debug messages indicate that the system=E2=80=99s OpenSSL vers=
ion
is still being used.

Here is the command I used for the build (custom OpenSSL is installed
in /usr/local):

LIBCRYPTO_LIBS=3D"/usr/local/lib64" LDFLAGS=3D"-Wl,-rpath,/usr/local/lib64
-L/usr/local/lib64" CPPFLAGS=3D"-I/usr/local/include" LIBS=3D"-lcrypto
-lssl" ./configure --enable-fips
make

I would greatly appreciate any guidance or suggestions on how to
successfully configure Cryptsetup to utilize my custom OpenSSL in FIPS
mode.

Thank you in advance for your help.
