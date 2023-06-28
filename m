Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E011181
	for <cryptsetup@lists.linux.dev>; Wed, 28 Jun 2023 21:27:23 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-79470b88d88so2851241.0
        for <cryptsetup@lists.linux.dev>; Wed, 28 Jun 2023 14:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687987642; x=1690579642;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nlI/kpOg97n5ZQyJ1T4ceQy1zSmaaTTgs/aenQCNFsY=;
        b=QQxRySlhxSH4NeHW1MbX6D7fI3rsb7/dnU1jdX+UfBDnMWGDUzvMTOJZKd8uFbPbb2
         umfKNtTkso426AhUdgDL/ksADBCTXjmv0TF9wXYhCD1yMVI9Fy2hlHTtaUzi7nWoQOUb
         miTYVT91JXW6SBbnhlqk7BQyN73SWeqd4Ro7y5eYu5MXD9sEQgwGShWZlQ2NWh1f/ut+
         wAe0M4fCC9Fm8OeSa1pltKFrWoFZiLY8JEvgwdTjj1dd2WGCg+yw5wdzSOjXOPfm3/aU
         A61RpNIUzrpI8nGqj3EKO8MsfpBpLmxKsjzL/G/+qZhtpIfQlX5aySPkIvkzVkJGd0Ki
         uIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687987642; x=1690579642;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nlI/kpOg97n5ZQyJ1T4ceQy1zSmaaTTgs/aenQCNFsY=;
        b=i/Pqf8wJ4PnXfLYEnut1FFBAqE329gck0bH8G9vJNF1aQNBYMHXHxZW5wqKjEvCdck
         /Zm95b4Vm6+gqth1nDXjYnsX7xKIIQz8uf7thVz4p1hoifYLfGESYbhJZprDJpPLaHAu
         DPRPJibQfUdWr/i+A1H/CsfJklUgluPjs8f+ts0U/6dVNFxUK+jejr1StMi4bHJ6TNDk
         0eRhiq6+4z1TyFMlV/V7MzL8lIE2Yv93sEFsYLCtU9gC8KwdXnElfj9T3rAmoqrQTUrs
         Lfyj/YThp32sDEDtc44SZx9vO4MwDa2J1uLliJBMmhTDJdbK7RS23sQumN14evs2AAGM
         1vJA==
X-Gm-Message-State: AC+VfDzqLvU+Ocyxbuf9mgXIheyvy6/S/oq8BgZmegL6RqHRRYaYxSiH
	Jw8SYt0u4GS5S399D3u+z7pF63cpkEl3/j+i9iMrShQ2CcD+Nw==
X-Google-Smtp-Source: ACHHUZ6JCInAXZ04agm8OMNzYM+jOX51I9OdLA4RhR1HxDBRU2sBeI5uR51YOo0Xw0CLoKD5OOEBYk2auy0iWziNM24=
X-Received: by 2002:a67:f7d4:0:b0:443:6c11:fc5b with SMTP id
 a20-20020a67f7d4000000b004436c11fc5bmr5862457vsp.14.1687987641880; Wed, 28
 Jun 2023 14:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Fernando <s.frmattos@gmail.com>
Date: Wed, 28 Jun 2023 18:27:20 -0300
Message-ID: <CAF8rEhp6KN18ZAMCs-vt1dfXt3CJyN3pQbxyKu7w2EUrSt0yQA@mail.gmail.com>
Subject: [Question] Luks container mounted on multiple devices via network
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I have a 50GB container stored on a NAS I've been using for more than
a year. Today, I needed to mount this container on multiple devices
(Debian, Kali and WSL), and I had no problems, until I noticed that
the files transferred from DEBIAN to the container were not displayed
on KALI and WSL. I unmounted the container on all devices and
remounted. The files are there, but I can only see it on the device
that saved the files. All devices are using the same version of
cryptsetup.

Is that normal? Am I missing something?
I'm backing up all the files, and I noticed no damage to the files.
