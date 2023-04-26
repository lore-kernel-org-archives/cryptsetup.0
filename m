Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43532F51
	for <cryptsetup@lists.linux.dev>; Wed, 26 Apr 2023 14:53:12 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-24781e23c27so6441263a91.0
        for <cryptsetup@lists.linux.dev>; Wed, 26 Apr 2023 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682520792; x=1685112792;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JPneb1rOk1M5lhgUL6UG66Pd80Ao80oZRRW7wNhKrYk=;
        b=nn26XEP6CztUpSn602d3KiFYyDOO0B6uhJaNhml5C0UUehwrjUqLMpSIK+wecTVgzO
         CZp+DpJUbPoLZp/jLxiD5CS2zSE6yhOlmHdXLeLIXkw3Qi/43F5+xtjLUV3f+lAGW6or
         TsmHuymlWK1b1tuN/0qRaSINm3AwcDgTXT2lnx4wEpXT/nP/38fF4nRRvF+w6j4coKei
         rZ1/r90+Nbyna7eeH8oakNSE6GueWCg8+yPKdZ//VFoVKDTGbqESjaY5F0zgIv5pJwqP
         YHAdZ4BGzIXoY71XTsDNCNdO7D3aVh5xUn4pvRHdCm+KHw8LpWRpdPclHcGkqPcfdbGo
         sUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682520792; x=1685112792;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPneb1rOk1M5lhgUL6UG66Pd80Ao80oZRRW7wNhKrYk=;
        b=CAVhNd9iqNYLnz6HsFsidtcunJDTO48xetBldy+zVQzOgT4C7WZI+AX/EA2jYVesA9
         NRkNwvWanSIwCBLi6qHd6UV55jAQRxyFFKG99elYeLl8AzhLF4bkavOLyZttZg0jj8XV
         e0lh7c4oxD8z7KClZGmC0hiWHwDMed+/JiycrAu2bK7yUurk9RyCQpqqT/9+E3qbD/b7
         nytya6iPSC/XHmUzJ1Z74ofSk6auLZIJRtVs1fYGMwoJMehkM0BJlKN8EI7sTbJf0LnY
         C2jNgKHwfCFXnOpjE0Nbm/Vx9SOCXVWsI+WFKZT6tkqonh1RD+YUxLc8sTekjZ4IGOBY
         Q6EA==
X-Gm-Message-State: AAQBX9ctngtvGq4oTvBSUVblnxxFSY5xkxCK7PEXXLeHZNA3tgxAjjOu
	xYqigyVlU1+aWdGRvyidU8lD/KhlSv6Tw4Z5HF4niMWMPlVMCQ==
X-Google-Smtp-Source: AKy350aFkYtFUZazr16wg358bG4omtPfkKr+kVuVwMXBpLG6IZ850o/wTHyfFCq48khVAdY7IvQ3GMH4yfzq5W29S7I=
X-Received: by 2002:a17:90a:1b49:b0:234:889f:c35d with SMTP id
 q67-20020a17090a1b4900b00234889fc35dmr21188412pjq.3.1682520792169; Wed, 26
 Apr 2023 07:53:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Lodewyk van der Westhuizen <jl.westhuizen@gmail.com>
Date: Wed, 26 Apr 2023 09:53:01 -0500
Message-ID: <CABOqr=M+uDDXC-xG_hnxGB-7MZnWUwONizC6c=r5NCYaCz6Pxg@mail.gmail.com>
Subject: Performance issue LUKS1 vs LUKS2
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey All,

Sorry for the long message but figured the more detail the better... I
was hoping someone could point me in the right direction. I have
machine that runs two different operating systems + cryptsetup
versions and I am seeing big slowdown on the newer setup. Please see
details below:

Setup 1 (using LUKS1):
cryptsetup 1.7+
kernel 3.10.0

Setup 2 (using LUKS2):
cryptsetup 2.3+
kernel 4.18.0

Hardware:
CPU(s):                48
On-line CPU(s) list:   0-47
Thread(s) per core:    2
Core(s) per socket:    12
Socket(s):             2

When running cryptsetup benchmark the results are the same (but AFAIK
it only uses a single core for that).

I am using the same encryption algorithm/cipher - the only difference
is the LUKS format (using LUKS2 instead of LUKS1). On the older
machine there is good cpu utilization amongst the cores but for the
newer setup performance is roughly a 1/3 of older setup. It's as if
the other socket + cores are not being used at all.

Here is how I format/encrypt (again only difference would be luks1 vs luks2):

cryptsetup luksFormat --verbose --batch-mode --type luks2 --cipher
aes-cbc-essiv:sha256 partition

Perhaps I am just missing a flag with the new setup?

I really appreciate any help in this matter.

Thank you!

Regards,

JL
