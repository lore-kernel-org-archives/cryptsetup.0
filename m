Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F391156D3
	for <cryptsetup@lists.linux.dev>; Sun,  3 Dec 2023 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTDjQQBv"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a18b478e4e9so457859866b.1
        for <cryptsetup@lists.linux.dev>; Sun, 03 Dec 2023 06:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701613890; x=1702218690; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rSC8UPjSwFuNoaPLYaTwKWXiV9qkr9zCLmAMLDd6AX8=;
        b=cTDjQQBvq0FMW5xfu4fIXYFvK8nBWBkqnHFOazAwBLconTV41Hdhj9lYjJUCu084d1
         8qVbn4aOiiKEfpmCNSrrVzIgj7lenjgUS/38c0Sp1TrRrdRo6ErOJbnP1uGBMZpD4IKO
         7uG5v7wPNrqdZJOIa3k7AVNELcjnzwbk23Lk88gKaoYGCYdRzExAtJ/VUatHIaUMIKIr
         QtICStFuzXAyU+9mAtTUJDHiz+97R0PVg9Z7V0jPCOqUwK3zIADat0MyGumPOPIUYU+y
         sX7m8nk4oJbqWhX8Cy8M004liSrOZEFhkFM3DQ5AAWxezzShLDJg3iynraJcvs5AKDWb
         4G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701613890; x=1702218690;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rSC8UPjSwFuNoaPLYaTwKWXiV9qkr9zCLmAMLDd6AX8=;
        b=ZRk43nyGcLNq2Wv5FiExro7UafrD9kPfQjUid+uQTIzyx1N8Pw7g9W7zLPhhpn0i7E
         WESndTVvGdWOTkM+LklCsjGHbRbWOh0aoBuhw9sYQqpia2duADR/dZGLWppSX/BkPg9O
         gOTfXPDqGj85HyF9KPWXjbJwkLhXQsqg7o0Oj46co71duA6jhNVIwXxjZdJq0EnqWSb5
         R6f/tRX9fYmN3tojNUs4q4HwFVPbIs9GV3waAMhFT0lASrlrw7EyXAWJXINoQ2aHxjVR
         YQ/6PuKHm0fLWzPumiD1eo9G99M8iM81M7wh7trbaZnhoosT0W3dZJYSov3ryiFk2J24
         iDsQ==
X-Gm-Message-State: AOJu0Yw1rho+VlA8BDfmJnv3dAnwgiGUBl+GJaOk0q2E4KS3+lvMpuL4
	KfujSlaty/TuBRIyABUlEjyaiboAYuGPLpjBOY59peU3hPU09g==
X-Google-Smtp-Source: AGHT+IGhY7zI5c5kUhfiyYCgaWLbBQZA2DBwqzzD9QIAcexd/xyZVLTdwFg2fuFcPRD8+CYp7zrucCbwswqwK5NsgQg=
X-Received: by 2002:a17:907:6d17:b0:a19:a1ba:da56 with SMTP id
 sa23-20020a1709076d1700b00a19a1bada56mr2682286ejc.125.1701613889601; Sun, 03
 Dec 2023 06:31:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: LRS <vianellov@gmail.com>
Date: Sun, 3 Dec 2023 15:31:09 +0100
Message-ID: <CAFKOM5mU9M2qdfyU4sOYgfJe4anQ+uB80Wcs3GYRbD7L0=av4w@mail.gmail.com>
Subject: Question about journal integrity / encryption
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I tried to create a volume with the following command:

cryptsetup luksFormat --type luks2 /dev/sdb --cipher aes-xts-plain64
--integrity hmac-sha256


If I see the json header of Luks2 i see the following part:

"integrity": {
        "type": "hmac(sha256)",
        "journal_encryption": "none",
        "journal_integrity": "none"
      }
    }

in which I understand that the journal is not encrypted, isn't this a
security issue? Is it possible to encrypt it somehow?
