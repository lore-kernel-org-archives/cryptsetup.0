Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB34635
	for <cryptsetup@lists.linux.dev>; Fri, 11 Oct 2024 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630504; cv=none; b=ZR9hxs/n9EgkTuU0Y5/aU+FsCfabhSSGeYyPKByOIrKF6z1I1UYpNUjOPiwYVdq+jcMU4wV7HcKcFFC0lampxjseqWPj9E3mPz/HevWZuDThV7XCSRYTbznoKR/juWJQRqrJYyB8VnH1itFVtQy8XQaA/ZjDEgGeCp+3Q9WuDZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630504; c=relaxed/simple;
	bh=ntk+MHPG+QA3TP/1Ev/1XV2HbWjyVq9Ybt7lbKgaYsg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=EfyZZQBsaB/8PpTwbYdqG19g++XgKK+DwH+L7AgPbC1rCM6xHfAHh9TMV5Uhyn78+6W+hq2S3lnWnMq/Kqeqx7jzsg6kNaEGXuS3EKoFkK5SmVyoTg/D+m5n2tmVp0ep0+V76neBBPWf8jRfxTN9/A4AEbNk4bi8ztnzMSeEgCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEQbby+f; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEQbby+f"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a83562f9be9so209728066b.0
        for <cryptsetup@lists.linux.dev>; Fri, 11 Oct 2024 00:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728630500; x=1729235300; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eywVYX8Gi7f+f5c0e5z1bVac7Uj/dXzvsc8qg7Iysko=;
        b=aEQbby+fMqNCP7vS8fbaguZ1o2eOYhBRtOdnXEJvpWCXucQ5eM6t11+w9zl8rLwDvA
         dTKHc9ifq0TKObIWNreyZjNP3r0Jkkqcs1J9ufChm/0aET01ByxfAg5k4hjESwa+iNV9
         pg+J1CzJvtU1aCW70tQj9ro88/aRuJ6e1BsssTT6yOj+coym5Q5yiXo+1ZVtPY5e3IsH
         OHD5e/yJVeJvTOwQt+K4ntE7WvX+B4DDkEJlfzLLG4+VNgcdV4eVctoKQTdIOemo3gXk
         pRLPUg/4fKfbteBjH6l43QJ/gfkkKRAV96f4rK4f7x952/dvvfIXK9htIL1hlrG5gzJ2
         3U0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728630500; x=1729235300;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eywVYX8Gi7f+f5c0e5z1bVac7Uj/dXzvsc8qg7Iysko=;
        b=sGLc+vhdt8ZNMk/+Q7yVGw676JZzLKejiq4ME8lrFoljjGkuU0bnsGP2E+ZB+leQl/
         Ng56Gr1RPRwTajYzITiY0XT+jE3rIrHmXm52u0nZg1hizSE7PP4Fbtb5VQuWbPC8SuLE
         5TAz5XS6QQiOY4rWJlxY1t1YFApwLLpKfaKWRpI2nSFpJ76k/5kZJgiHiASdo5fNIp13
         rg2GX5NiLG+8hyLG+g5Dnd0i73u71kIqp5a0oG8LJlRItWITAMoqeolwvV2SCJLB6WCz
         QuWVf0SLF32npdKahdPXzYzRCbs8WMv8Ox7RX0OLVhKbcZgoVSE2mkAvrq90W/2ASGEM
         HwyA==
X-Gm-Message-State: AOJu0Yz6OW7qHZOALj9bUSX60N8vr5RcwHmVgFyWXTcZqrnbVVEuCxHm
	WMf3HOGMF+MDP+mjj58r7eqIco/qwquzu1YJZBgPlz1JPiYoYT6gh+PxVWDj
X-Google-Smtp-Source: AGHT+IGmJZ/fYegKj8P/OCOOVugQPcPnuNPWGv/dL0TQDph7dsEGy/K9HseI3lFzFocNg9whFnpjJw==
X-Received: by 2002:a17:907:c895:b0:a99:627e:37d0 with SMTP id a640c23a62f3a-a99b95a477amr128592766b.25.1728630500399;
        Fri, 11 Oct 2024 00:08:20 -0700 (PDT)
Received: from ?IPV6:2001:4c4e:1121:1c00:6a48:4fbd:c71a:3c33? (20014C4E11211C006A484FBDC71A3C33.dsl.pool.telekom.hu. [2001:4c4e:1121:1c00:6a48:4fbd:c71a:3c33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80dc18csm177963866b.156.2024.10.11.00.08.19
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 00:08:19 -0700 (PDT)
Message-ID: <32be1215-bcab-425b-99cd-3adc26590b14@gmail.com>
Date: Fri, 11 Oct 2024 09:08:18 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: hu
To: cryptsetup@lists.linux.dev
From: =?UTF-8?Q?Kiss_Istv=C3=A1n?= <keraform@gmail.com>
Subject: Issues with LUKS Password Management Options
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Developers,

I would like to bring to your attention an issue regarding the password 
management of LUKS-encrypted volumes. Currently, the LUKS password 
prompt offers three options for remembering the password, with the 
default setting being to remember the password until logout. However, I 
rarely turn off my computer, and I often keep it in standby mode for 
weeks. As a result, the LUKS-encrypted volume remains unlocked for 
extended periods, which is not ideal from a security perspective.

Every time, I have to manually ensure that the password is only stored 
temporarily (forgotten immediately), which can be inconvenient and is 
easy to overlook. I believe it would be helpful if users had the option 
to set "forget the password immediately" as the default behavior, 
perhaps through a simple checkbox, avoiding unnecessary compromises 
between convenience and security.

I would like to ask if such a change is planned for the future or if you 
have any suggestions on how this can be more efficiently handled with 
the current system configuration.

Thank you for your attention, and I look forward to your response.

Best regards,
     István Kiss

