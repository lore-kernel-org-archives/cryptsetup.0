Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC9BEACD
	for <cryptsetup@lists.linux.dev>; Sat,  4 Oct 2025 00:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759538196; cv=none; b=Llosk22y0y6U0R0NvjFsbhH0RV7xe8qcfbyRLAdC4yJDSHGKOJ00st6sC4Dc1k9s+czrymr0IrIdreDVHtTgsOUx7xwnigu+IbHwuBCp+wjsxmM8Ouuy9M+agzBU3fgFZ/so5e4HVzFTihY9xyRyJoJMB2RNcaHpTPp9ewlvPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759538196; c=relaxed/simple;
	bh=Ym6zypFE90t9Fw8p6o2APhOxoJMnYspgKYalUQ0o3oE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XZi04UxrKDva2IoIpkbCT/7bir3XJIRsovN7hPwtCcKdbpC+KI7H11NEjsUlMKdaVka792jatW2XtYKfg1c9XEjves8m93pfvRGrfY69mm8eELElSvI50ib+R/0Qw43PIoP5LcDfU4L8MaRd3MXZR83mSKQNAyyaQfogfof4gKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXVap9T0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXVap9T0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso23385395e9.3
        for <cryptsetup@lists.linux.dev>; Fri, 03 Oct 2025 17:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759538192; x=1760142992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M/ltuNu2H0TuYvPMRJYWT9SAijDxwxtSnAj9/RFitCE=;
        b=jXVap9T0ha5xU2IsIt9elz05oMpjlPVyhGk2QgFdzpx4ey5oXHGHNzxWAAdRRZ1Mm8
         RWLufnT1ENyPPfEpiVXrr+AVMUlrHBvN29xcA7ko6fXN6DrxuQ725Rco6sxtep9JTa74
         Bj+udbPatvxC7gTBxK1OmNlIij5pvAPihsSEnT7o6mmGySgvpa3LSda6ZNP38n2W2TXE
         1CYT8GMVJDIac1zE3EHyQaEBTpPN6wQS4ijv2SQ6UxmT8Tiquyn86uP8RVu1VSEqi/FZ
         w9+tde4xpmAaOR5nZ1GL+o1QdtiK6oaVV3/Jt5GvD40tccrxQEJMMZzAxEB08qOUsyyN
         AtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759538192; x=1760142992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/ltuNu2H0TuYvPMRJYWT9SAijDxwxtSnAj9/RFitCE=;
        b=JtlaQ1eALQFYzbvAS4YChcSqfehNdLO91CrHGJQL200aFN+0qPJhEFx9EhA5vEl5oG
         p6sJE8KM5RN6ZbwBVnif1EmGysnyi6OemrG/o2iF4EDnvi+2xXTcPqrEHDfOJoh4LgV2
         ZrCmVQFXt73bWFYboTwDff0nmzpx85ECJijmSuyutN91KH2VbUpWcGjk/sMsicoW1p3x
         DkM9CIsrduVrczFgDCTQh82j7HGuebgkbkXYGh322TbladGU5wAz89tS2TkhJmQ0nPZ0
         3Uxx3hf8H1X++Gkdx4kl7RDIRP/ORKlST/brB83j0sH+QRxwJ879IRJIUvBtuthRS24A
         Ge/g==
X-Gm-Message-State: AOJu0YyeHtnZTpUzIsKmsQA8WvC7gRjnTYx79lbAPcThjWBvES9oVsG4
	nN/J+JmszyBDCzUmAqzJjaG5vblqn5G6M7AisrzjDj4GcHWqz9ZejhgKMfhaiQ==
X-Gm-Gg: ASbGncvUtp4sRL1dxOIbHenH4pCBlwtzZKc6YDqQNMwoQATvr0DHYWe/Ehd0udG/lXS
	eLPZyVZsdAZLq9nSUEQ8Z1XccvIMqroB4sKN7wDXamGquJOOz+c7gEnsGhxi3wadp7B7cnV4oc/
	1+JIO79+DyjyFioVviejVHjhsdFFPpHTe2OxKQ5iPAEmAUt4m7AC98JrwxBH8a7kU7DAuc5ydS6
	9RuuTcI8IkCxMqXHL1scANgZWPe6YkZT1uGxvmuHaM3QjIwv2Zmr/NDarCys8kpLC8UHoePJh85
	eKtmrGZIiL4lIyrmCnFfaHkB/3mY2rG2kk9pX5LPCRq+UBPry9Qi+rkO/my2qvqPcnoogTawXIp
	6mW487n8tCiGALah7uCecFDaKG06ivBea3uhJNX7plpsSxENzaGCt91MimCTOCgrp2tCMfKs=
X-Google-Smtp-Source: AGHT+IHJxrNCDqloSbF1i446RQg2/nCinyek67o01JD2CBmalyUdv4aMsHdoVUlsgYPOfwE7nRsINA==
X-Received: by 2002:a05:600d:41d3:b0:46e:477a:f3dd with SMTP id 5b1f17b1804b1-46e71151c19mr33123205e9.36.1759538192373;
        Fri, 03 Oct 2025 17:36:32 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:9d5a:ed00:f05f:1922:a66f:12b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a18b76sm152737795e9.18.2025.10.03.17.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 17:36:31 -0700 (PDT)
From: Kfir Kahanov <kfirka3@gmail.com>
To: cryptsetup@lists.linux.dev
Cc: Kfir Kahanov <kfirka3@gmail.com>
Subject: [PATCH 0/2] Bitlocker: Support clearkey
Date: Sat,  4 Oct 2025 03:35:52 +0300
Message-ID: <20251004003554.234647-1-kfirka3@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This code enable support for clearkey bitlocker protection.
Closes: #962


Kfir Kahanov (2):
  bitlocker: Support clearkey
  bitlocker: Add clearkey option

 lib/bitlk/bitlk.c         | 106 +++++++++++++++++++++++++-------------
 lib/keyslot_context.c     |  97 ++++++++++++++++++++++++++++++++++
 lib/keyslot_context.h     |   2 +
 lib/libcryptsetup.h       |  24 +++++++++
 lib/libcryptsetup.sym     |   1 +
 lib/setup.c               |  24 ++++++++-
 src/cryptsetup.c          |  20 ++++---
 src/cryptsetup_arg_list.h |   2 +
 src/cryptsetup_args.h     |   1 +
 src/utils_arg_names.h     |   1 +
 10 files changed, 234 insertions(+), 44 deletions(-)

-- 
2.43.0

