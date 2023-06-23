Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC838F5D
	for <cryptsetup@lists.linux.dev>; Fri, 23 Jun 2023 14:02:06 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-668704a5b5bso487922b3a.0
        for <cryptsetup@lists.linux.dev>; Fri, 23 Jun 2023 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687528926; x=1690120926;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YkVuSDR9DTpfPY4MEg4H1pXy5e4c3SzJl5YnFagaJSU=;
        b=DVhqURF5fnmPxOblhI/7sFWBwp6DneKhJbz7aGkneTE5nRDG6foV2MVn/OYAuHTvMe
         xOoNSdiplWMY2d4AZ1p248+02pjQuxWcWC36hHdCvHzhBwsjHiF3pwjGS/iSvRtQB2P4
         7VKVNU1YkFGSUJ3OOvAXOIrOFxzitJp4uACvn93znTK67pqBRwWsCDHTbPPsIdAqBViv
         2d0iPq6rc6RfcKN056NUc8x7VrBQJowiQl2gO9h2YuxEcjtxXnB4tGAXsGHri+ENDXgd
         0WdrIAeDkDE/ZdkBuxo+9DkC6WCEAvUzMPNatDdewh/h21Fw8ikWRKASGrYFJPgSz7C1
         ysng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687528926; x=1690120926;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YkVuSDR9DTpfPY4MEg4H1pXy5e4c3SzJl5YnFagaJSU=;
        b=j3a5IPi3z25o8jua94eIQVrrmyKaLOUou5vS0nP+C4W6BN4pjsyrdZHbKY5ALwT+jd
         seZP0EaoSbAFoTtpFuGG0iBQZ94+Sfu3hpXIQ1wm33A81TwGTKX6aASd32Y7rdlbMKyn
         7FcYsUjfE8gtwlWlSCRoYE0Fk9qBpF4ArzFDU6XAjIEMbW0xCKLMlG2mM84G5DBqHzb+
         1O9EBIAZuF5p5lpAsEzvsOsdr9C+qIdcceiOiUzcJd5Bzyi5MUBTOrZD4oTpB1YVCZyI
         16XxkvywKq55v0SRFx223zKi2Of0YiedpzM8ofIP9jokkVl77iilUMMuX0LbQFhRSrpd
         l9tg==
X-Gm-Message-State: AC+VfDxl3w6WxfR7fwkSzr92P0CwsPTlRgaC8wnMxTbkQSQetqNgtSJf
	UmFMgZlY7KEopRGN/C0+5ZtevMde2asOi2h5XteH/1Nw6KO2Sg==
X-Google-Smtp-Source: ACHHUZ5334E82Gef5iJpJ3i+TOi2JFCDu42iRzvksfUG59tikRFBPrPBLkr3Iq7j1qi3fRw8rTSJ+/R/SOm1EGonyu0=
X-Received: by 2002:a17:90a:c7cc:b0:261:636:e101 with SMTP id
 gf12-20020a17090ac7cc00b002610636e101mr6430533pjb.11.1687528925166; Fri, 23
 Jun 2023 07:02:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rishi Dhupar <rishid@gmail.com>
Date: Fri, 23 Jun 2023 10:01:29 -0400
Message-ID: <CAJbs9BHP=bu37WAEM_ztReiFUP+rNUVLnPWBdNOmRzjW8Kb_OA@mail.gmail.com>
Subject: Bypass kdf step with LUKS2
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I have an unusual request. Is there any way to skip the PBKDF2 step
when a device is being formatted with LUKS2 or an additional slot is
being added?

Here's why I'm asking: I am using a high entropy 256-bit key as my
keyfile and the KDF step is unnecessary and does not improve my
security profile. If I am managing thousands of devices and want to
rotate the passphrases on them, this KDF step is becoming the major
bottleneck in performance.

Thanks
