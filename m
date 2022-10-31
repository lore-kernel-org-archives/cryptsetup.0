Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E5C23CE
	for <cryptsetup@lists.linux.dev>; Mon, 31 Oct 2022 14:10:08 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id b62so424540pgc.0
        for <cryptsetup@lists.linux.dev>; Mon, 31 Oct 2022 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4I2bg7pX7msjYELvNJNjWo4RRUHtGmZ6UCzpTNybbpY=;
        b=Rb706CHURpa/fD22rRnpVZ6Y8ziQBRmlyx3vA6oh9jJPtFz73Ivfpyr1mb4is3s9Lu
         uHqRZwhNkuezyPKE4JEt3uaf/kUYtUyrreOJQwNYAYT1n0jJk8qZ2D1GCo77zfsrWWEE
         gscd/vYaOD2sbXoiaJZFotu8LOipKZvl7v1/fPrK3gJ3J0UcSrjggPq0wNKkHDqPhPSq
         2As4hsfHl2BPmau4QmjzMOjuV2PZjs1++s5OyweG5mOT1KiDZhI4Mha7LcvWT2jyMcEd
         1Wj4rK1pXtfVo5h/JLekfA+yqkxEWEbdYykNUDeJpPmtfAVzSvk1nQEtuLPNR14O5K54
         uIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4I2bg7pX7msjYELvNJNjWo4RRUHtGmZ6UCzpTNybbpY=;
        b=Fb/e3kweURdb5EOZoRtiEC6eXctGfXLlUPaq1ButASjX2eYHa5hZiVLGFWzZNNCXjM
         JRFSZRKo0o7sRS/JsvJkTJqXUnMVeC3G1BVYWVNS2vqah1ci6b2dp+FeWZE3/cM/HC0/
         /4swP3+HWd+EFC9Kc1DpK98CYpxag5nmvuHuzJRHFhlgGqGiuM/GGr2CTqDETFBz/+zH
         2Cu8YiSd/w33tMULrBrxF2m95fYADju3ggNWsWFo2U0weTO2gqUQQ9SeeCnsbQrBu4gf
         EJ56voEgcGR3GwaGRVNkqsT97aCsA5zY3wXd7s5X7d0asLXyo7q9sIaJyPcGCF2jQirk
         2rxQ==
X-Gm-Message-State: ACrzQf1+0xfH7f2K7VTuLWyBZgC8Gc2YsUBOV4QhOj4lCSpuZiAihLmI
	NkMryjWOtotjYQClNEYmf0v1HjFuW4oGPku+Uh8SxS0Rrzw=
X-Google-Smtp-Source: AMsMyM5oHS8DuDt//piTZsDp9ZNSIpsRszingrhUCy/9DV6DW+rCBCdzMndPtYFu2FkReRrRCbkmOGr9SPzFE928010=
X-Received: by 2002:a62:d412:0:b0:56c:6f25:8b12 with SMTP id
 a18-20020a62d412000000b0056c6f258b12mr14492854pfh.60.1667225407670; Mon, 31
 Oct 2022 07:10:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "doffloster@gmail.com" <doffloster@gmail.com>
Date: Mon, 31 Oct 2022 16:09:51 +0200
Message-ID: <CACHosL9Wjtm_2tXyQNzsg1DwOGcYBLQouOst-Kxi7BHRxaQA8Q@mail.gmail.com>
Subject: Quantum-Resistant Cryptographic Algorithms
To: cryptsetup development <cryptsetup@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Soon in LUKS / cryptsetup?

"NIST Announces First Four Quantum-Resistant Cryptographic Algorithms"
at
www.nist.gov

Best regards,
David.
