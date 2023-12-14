Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33BD56458
	for <cryptsetup@lists.linux.dev>; Thu, 14 Dec 2023 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsyrMg1g"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a1db6c63028so957772366b.2
        for <cryptsetup@lists.linux.dev>; Thu, 14 Dec 2023 07:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702569215; x=1703174015; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zWEBHBb/PBWOBdGjxW2jzTKU+DWLGgWLBf4wd9cuc5E=;
        b=WsyrMg1gx3P3dO+1XJBHY064KC1aokTm8ZZtqeci0KKcr5FBMJJeMUrmk4L705/Ehq
         MYfx0QuJYG68K3PC4zuLpAtdyOaucRGDoktEKrL+8jsqUUBQtbZp/ojQjFyeigYOVqgS
         QFAx7flKcacouMEtuhbL3xG+9gEp2RVQM+BUHC3FcTeRgpr48J+M2tKa1SJ0dIjGrNNV
         7Muew4nbSKuLsx4LqCXO5O25+sZjsfv+o02K3zZQnCTG+5JsC5nh1xB7ZfgA9Oisixja
         v5EyD73rx69AzJzh1VP/0U+/69IFPZBbR7cXiS+LlfR0BUxgZC8pZBTBrg41nwO0DYQV
         VTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569215; x=1703174015;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWEBHBb/PBWOBdGjxW2jzTKU+DWLGgWLBf4wd9cuc5E=;
        b=q8fSk936K6jYV9vxlpmpjxFdHaZ3Or+jiNMe1ObZzCbF3rgZHMstAZM7CI9UwrzH9J
         5sXrxCBPl1HwAm1BocfY4lx5Vd32MCI9sRVBfy8DsWOSYB/d+UWWmwIhE/CmioSiBe5B
         CCFiPdfj0ws/SC6T2k2LU3sHCLASwRsCDOyubmq9Cqt0Ap92Qtsj0s+LSCtnS8ujANlk
         sMauFPQKpSzck5mpBNiK7o+LpUI4SRYjAhWAG9pMvStgawbzfwUq/B5PzxDIcxjl2fFz
         2jbAyU8ZBwFdvTuHeVyKQMTk15a80O+V2dZXbG2zKgsT0Dw7VW0C5V0ztCY0xZOr9iD/
         AsRw==
X-Gm-Message-State: AOJu0YzO+nSxfz8cDYWA8td+dBjgJyC0W7CPm02xKoER4ScRGZx/JTMM
	EhUxUWFJ8bZSbL0ugK84028CtdaWJImk62FREPnVXHmBsaVibcPzeol1Vw==
X-Google-Smtp-Source: AGHT+IGlJOpSYWPjTsT3zzvV8OwOcUE0tF66E5Y+pA1/XqjxZTMBtpIvXTGqPFQQXrIUFNkmDMeEAz52nRSsUFp0SLQ=
X-Received: by 2002:a17:907:9623:b0:a18:8d66:b3a5 with SMTP id
 gb35-20020a170907962300b00a188d66b3a5mr5804330ejc.36.1702569214958; Thu, 14
 Dec 2023 07:53:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: LRS <vianellov@gmail.com>
Date: Thu, 14 Dec 2023 16:53:09 +0100
Message-ID: <CAFKOM5kA=u04d9WxH8r-1dhpFQh3bVvAHy1SJ176Ub-igJq7CA@mail.gmail.com>
Subject: cryptsetup boot with integrity
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

is there a general guide which describes how to set up correctly a os
boot with dm-integrity + dm-crypt (authenticated encryption)?
