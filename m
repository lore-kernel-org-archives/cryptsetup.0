Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCFCA495
	for <cryptsetup@lists.linux.dev>; Tue,  8 Nov 2022 22:52:14 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id h14so15103185pjv.4
        for <cryptsetup@lists.linux.dev>; Tue, 08 Nov 2022 14:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uUVZuGGc713jKo55pRp9JUPP3aH/h/vXTYbU9Kc5Lj8=;
        b=Z9253yXjUdLU02vgNJg+rpOvg59o2GJ5j1Owh73oR5Y+aqYX7oCJdvZa8NeL6n6qm7
         UbJGoHJglxI0kMsh+44oXKmJhyUQnb90lrbTDBp0pqcQkBg8y8dxB6Sc62N1cl3bx75u
         cbvWkG3T/Joc99yk81hkzhPZkgMqe+tM3pNHNZ9xVwGOXLax/1NxeLm2c9bw9praH9UR
         uER3bDcdU7G9nEIyngK3EFuUEI0N5eHq89IJ/37iKJbRc5IgbloVFCdOYcPJrrZkZ2Oo
         lcCKDJEAI2PZnUJVaqBEd0oL30BTgNV9BoeAKnka1uHS6oSN2pO7PvfT1YXymDr6bq5m
         BALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUVZuGGc713jKo55pRp9JUPP3aH/h/vXTYbU9Kc5Lj8=;
        b=nvb7rV9sKRzfU7nk32R2KBHolljaitZE/TpJI3TJNp64PHrGdkwxPFuq3xHl9V6ghW
         pOcJXDSjGYawssTYoU73nhxXkHnkpDli9rayMKaLh4+qu1kP1uF7LJuw9Bo73mlFWwWO
         hdFV1lz3ciH2zof206H/Cdneq1jv6UNAkjsaQccfnToQbyF7bN1EfVB/7eh5vo8T0Etz
         hyJ1ZLAMi0/hs3fwxHJWzouT9hvyIx+q3qvYIydvDrHehbLuIAaBzjRyZK9lZbq/VrJK
         qEra1Vaf64e5l9xWH0ZLt3Tg/oGfkHzz0kl9J3HWI0UxAnX0CYVQXHhjDp8szs1exwbU
         X+3w==
X-Gm-Message-State: ACrzQf0zsY0MaBK1u4JT/GG5PxpCvfIJq5BwDC87IDUsybvo9yW7tNyr
	6Q+jW+7x+RdQa7g0pPBSWvytTq2EQhxp0zRnqCg9TvnW
X-Google-Smtp-Source: AMsMyM4tuiZaEgZifJQTI8ZzJJBTD6KjC+mQqrbwdlyRjqtgo/wrXT+w4CZKRz14PEWVZ07rigJgGGKkUspnRzdY2cs=
X-Received: by 2002:a17:903:41cf:b0:187:1a3c:517a with SMTP id
 u15-20020a17090341cf00b001871a3c517amr50208923ple.7.1667947933750; Tue, 08
 Nov 2022 14:52:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Philippe Cerfon <philcerf@gmail.com>
Date: Tue, 8 Nov 2022 23:52:02 +0100
Message-ID: <CAN+za=OaHi939USLRp8DttVjamBx7qSxOp-LPm6uNtMN7oek8A@mail.gmail.com>
Subject: reencrypt: how to specify old and new key-files?
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey.

Sorry for having to ask again.

When I'm reencrypting a device in order to change the volume key and
also the keyslot (say from PBKDF2 to Argon2) wouldn't there need to be
some way to specify two different --key-file?

One for the old keyslot with the old VK, and one for the new keyslot
to be generated?

Especially if with --key-slot <old slot ID>, the old slot is
overwritten and all others removed, as explained by the manpage:
> For reencryption mode it selects specific keyslot (and passphrase)
> that can be used to unlock new volume key. If used all other keyslots
> get removed after reencryption operation is finished.

But it seems there is only the --key-file option, for which it's even
unclear to me, whether it's for the old or new keyslot/VK?


Thanks,
Philippe
