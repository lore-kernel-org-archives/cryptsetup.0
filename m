Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC9A13959C
	for <cryptsetup@lists.linux.dev>; Thu, 15 Feb 2024 20:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708028465; cv=none; b=MCWVLR/OyhUm7VC21o2OshMhxXDiCVXFrGc9ZxX36jVQauUp4EL7jDu6SDd+xqjfCkaYA3kPFwYtB0jx3r8cnlvPe5LFkqHDTCYU0O4Tait5xDXEeYb3y1Qb4+o2Phs3HLJ7lgNlmDGvIFZrrAz6ky+fl/NxKLBPl0G+Na/28EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708028465; c=relaxed/simple;
	bh=oTInDyv3WRPOf8eFFCkN3kyOov39odAgF4G3wrC5Lk0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=nb7yAVXejzlPribT0gAyQScYS4FtDqyPZR2f3bY1RSi+A/RhAbb+4eI4HmEODaAbuBWfuKmVJDLBb+Twn/5yNk721cCWSASCJ9uDwnumZiw3rOpwqWSrZDHe2RO4ONt9hcAXFOhUsnzruD0ABcuTqSkIikirqBLwWxGBI9bSpLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VS3nYo+7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VS3nYo+7"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d91397bd22so10750105ad.0
        for <cryptsetup@lists.linux.dev>; Thu, 15 Feb 2024 12:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708028463; x=1708633263; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yj5VJfh+9IVSUHcQb69xk0eui6pnHDefXWxEAEU7PCs=;
        b=VS3nYo+7RUDjuKSd3ZrZDimEgcFT+23mvbe+d6OAsQ8EPjuhLlo9rpJCfS/vDNYfy6
         s2UOGwd/ivcvVsl+pkVcA/W4eO1LaV/5Zi/76gnD4Vywl+72bxMoxVw8l8x34J0QemLO
         xJEjvPPhWqIDslxQnmhIaTtycGktFKKOyA1Ih9d8xTnC+fCSdVU+vTcaZjvAEAwkgDbq
         o+Qu8qbZ5gzLgf+Z8CDiLegy8gwVNCcmDbVPHqHGy0gOqjP3VRgfZlbbU7dhrcd+2vvF
         hCn2AeQ9NxexI3ct+jb+bAyzRGAqmVRHitMNyt3kbrZXg40gQUF4vxI0+Sm1L7UOphC/
         45Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708028463; x=1708633263;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yj5VJfh+9IVSUHcQb69xk0eui6pnHDefXWxEAEU7PCs=;
        b=i8YunOklGAt72iFkZt3XB/UEz3K+Cj8JL7iAhcWw/DJG9OVnCP8aBPzlbu7lHH6P6m
         C8hLabuEdZ3Sr0W8mHI5z8yC6ZIgsNKfF0LNDaD4hHcJ77oP0EH1+3wmEbT2rjN0zW7Q
         ZWQCkHYkfLlN5i3C+7SSN3JiLAyMaFZ6jOgeuIUq8wVP3c5G6i51fbhiehc701Z6/6aK
         9EaSpm/6x9XvUjZaQOdaf/Vt1bGe41kX8unisi5zoG7PlRKao/hsBka6Est709uWf/ko
         vd0Ghlj0UxgS6j4SeulGtJ3HevslK4A+nshjKo+WbTBPfIgg8CfWI9RIXfRB19VGTehO
         7mOA==
X-Gm-Message-State: AOJu0Yy4kBAGAMv0Zw+b4Ebppnhb9Ug2hmDtf1PyoA1b1B07h75ErXGq
	zNI11htg1QLpmOT0f80hsL6lhGM2LQu1MtosecWwKb7nvhWA86PxJivRZE3Rf7S9tmnAWg/USC8
	TUfNOKeIMxiRUWw7hfs7VwGFn0r2nATLX7e19/g==
X-Google-Smtp-Source: AGHT+IGYqTMxXfbiIm8ClVyWvozxANaBvdEqF5Wiy5MOrr+0Nb7MF1Lh80EIwKDzBUuvzUBxWUj5dq0LEJzC1rSGNLU=
X-Received: by 2002:a17:902:d507:b0:1da:31b6:e31 with SMTP id
 b7-20020a170902d50700b001da31b60e31mr3227423plg.67.1708028462755; Thu, 15 Feb
 2024 12:21:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "T.Gavrylko" <tea65535@gmail.com>
Date: Thu, 15 Feb 2024 21:20:51 +0100
Message-ID: <CAActgDYkiaypy4Q7tsR5VaARMUT6L96jwCAet+KdYD=P5f_0OQ@mail.gmail.com>
Subject: wrong luks header backup file size after conversion to LUKS2
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,
Recently I successfully converted LUKS1 partition to LUKS2 and created
a header backup after the conversion.
LUKS1 root partition was created by opensuze tumbleweed installer
The length of this header backup file is wrong: 2097152 bytes what is
corresponding to the LUKS1 header size.

ls -l
-r-------- 1 root root  2097152 Feb 15 20:01 nvme0n1p9.img

Command used to create header backup
sudo cryptsetup luksHeaderBackup /dev/nvme0n1p9 --header-backup-file
/tmp/HBAK/nvme0n1p9.img

Used cryptsetup versions for header backup - 2.7.0 tumbleweed and
cryptsetup 2.4.3 Linux Mint:

sudo cryptsetup --version
cryptsetup 2.7.0 flags: UDEV BLKID KEYRING FIPS KERNEL_CAPI PWQUALITY HW_OPAL

Commands used for conversion from LUKS1 to LUKS2:

cryptsetup 2.4.3
sudo cryptsetup convert /dev/nvme0n1p9 --type luks2
sudo cryptsetup luksConvertKey /dev/nvme0n1p9 --pbkdf argon2id

luksDump:

sudo cryptsetup luksDump /dev/nvme0n1p9
LUKS header information
Version:        2
Epoch:          8
Metadata area: 16384 [bytes]
Keyslots area: 2064384 [bytes]
UUID:          3d6055ea-4ab5-4dd0-8f3b-93f51dcc6ddd
Label:          1n1p9-OS-R
Subsystem:      (no subsystem)
Flags:        (no flags)

Data segments:
  0: crypt
offset: 2097152 [bytes]
length: (whole device)
cipher: aes-xts-plain64
sector: 512 [bytes]

Keyslots:
  0: luks2
Key:        512 bits
Priority:   normal
Cipher:     aes-xts-plain64
Cipher key: 512 bits
PBKDF:      argon2id
Time cost:  9
Memory:     1048576
Threads:    4
Salt:       04 80 c1 a7 63 01 d6 c5 79 87 56 c6 1a a8 63 66
            35 20 5a 1e 8b 00 8e ec 21 db 13 4d f8 0f 34 6f
AF stripes: 4000
AF hash:    sha256
Area offset:290816 [bytes]
Area length:258048 [bytes]
Digest ID:  0
  3: luks2
Key:        512 bits
Priority:   normal
Cipher:     aes-xts-plain64
Cipher key: 512 bits
PBKDF:      argon2id
Time cost:  9
Memory:     1048576
Threads:    4
Salt:       32 45 1d b6 b9 64 f6 60 0c cd 5d b7 5c 3b fd f7
            79 64 51 12 5a 9d 33 4c 1c cd 4b 03 6a ad ef b0
AF stripes: 4000
AF hash:    sha256
Area offset:32768 [bytes]
Area length:258048 [bytes]
Digest ID:  0
Tokens:
Digests:
  0: pbkdf2
Hash:       sha256
Iterations: 328913
Salt:       3d 3b d9 a5 ba 75 86 7f 7d 12 66 c1 01 58 2e b2
            58 e0 b4 c0 4f 26 4f 65 4f 69 1a 7f f7 94 d4 3f
Digest:     00 2e 58 47 d4 9c e7 df e4 17 c1 06 c8 e4 10 53
            e9 16 4d 89
