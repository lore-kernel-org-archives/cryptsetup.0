Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41356D19
	for <cryptsetup@lists.linux.dev>; Tue, 24 Oct 2023 05:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWhTPABJ"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d9c66e70ebdso3771364276.2
        for <cryptsetup@lists.linux.dev>; Mon, 23 Oct 2023 22:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698124236; x=1698729036; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q0V4E2N3aaSe4ziLSGCxbTOYuNKh44RkWt5gDYZ+82w=;
        b=RWhTPABJACt1MzhrwRImpzULXgYszAfS8i0PAgdF/ZB5zYePYGkDuFLQuvwwFxR+HC
         eEKRdrEO8uTfp7dgmSZ0NsRZaGSuj/fmIEwW+9AlEQSQ/Ja5S7mw0Zyb0u7GGW/wsct0
         lyMKPD2+0OdIf7TWEBHBmg9R4gVsy+VL0i3pIJbabgREVwkhACGN3xKgmLwENEzlDXTU
         0J3Q9V8J7mNKxbBXWlQc3ubPlAzxAuveSD5QZjneP3fVfjsTowfbwRr3e5jbUiDq0Xn/
         R+sW/2SCpQPOLuArf1/IQ2mNBikzafFKXQ8SHaeRUoQ6g8pIY2b51GzLc0cAI7GeXr6D
         98ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698124236; x=1698729036;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q0V4E2N3aaSe4ziLSGCxbTOYuNKh44RkWt5gDYZ+82w=;
        b=k9fLTzpYjldVgu2CtuFXh16yQN3d+onwGjuxQ7JArgkja2eC7djVRgW8Wg1deBSIoy
         QKosf6dNzZGHI/hKKNiWVYNpnqsaMo7i48NOeUGXQ5KwmH4mCT7U1otedlMf4H0PVyvp
         SZObMJ7qa2/UaTpC3u8jT1u29SloN1Zhx5h4FDdlGj0qJFt4HJYZ3A74YAXC1Zj7iLyN
         p4XELz//EdPzVyxuv1vkMU9014pLM+CLxC9agwJSVNN1a1IqZrfhsowtWAca7sb4x3Ek
         s1FSAw2j/f3IAFf8SAgs5HFVQtsXKL2koPgneeCrRJrYJQX5eIP+GSvYBwdrgSqPfo/g
         JOqw==
X-Gm-Message-State: AOJu0YyD8u/J9SZxjWvmdnfP+/o3pytHKZwh4ZRv9M0SRJFYsRBCxQOz
	4iYLCFfJckF8AYU8phCZWoMu7yLTsAOKOD19NvdZprAVAVg=
X-Google-Smtp-Source: AGHT+IE5ivEYGQt2Elr0onCipi18Em1nADcCcP0SHVy0+luDSZLnMGcavZ3LN7gaAeHEIPxx4W2+vwHAI3KRs+rINDU=
X-Received: by 2002:a25:3205:0:b0:d9a:5021:4f34 with SMTP id
 y5-20020a253205000000b00d9a50214f34mr10669820yby.15.1698124236528; Mon, 23
 Oct 2023 22:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: John Smith <dingrite@gmail.com>
Date: Tue, 24 Oct 2023 05:10:32 +0000
Message-ID: <CA+5JoNqPHYVNKp+8LGj8tQtCfU4fK=GKOSgihfQko=_rCiLpGw@mail.gmail.com>
Subject: cryptsetup benchmark vs openssl speed, huge difference
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Is there a reason why the AES-XTS speed is vastly inferior to openssl?

cryptsetup benchmark
aes-xts        512b      2503.5 MiB/s      2514.3 MiB/s

openssl speed -evp aes-256-xts
type             16 bytes    64 bytes     256 bytes    1024 bytes
8192 bytes   16384 bytes
AES-256-XTS      633950.11k  2343011.04k  4795982.60k  6688253.60k
7698595.84k  7806526.67k

This is also borne out by the NVMe performance, or lack thereof.
