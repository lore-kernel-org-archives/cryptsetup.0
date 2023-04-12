Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A7A17C3
	for <cryptsetup@lists.linux.dev>; Wed, 12 Apr 2023 06:19:54 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-632384298b3so5075494b3a.0
        for <cryptsetup@lists.linux.dev>; Tue, 11 Apr 2023 23:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681280394; x=1683872394;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XVh54cOUnDO9XdRRZaYwjocjn2dehDOHNKXPnV7ItIA=;
        b=d9qLONaO+rNpJYFaePOkl924nIgtNx0jgYmiDteQpxJJeJKutkPcoNsNoVG71hZZ/d
         kWS5I8iN3GVpL6EHD9Q/lz1hTEbPMF9eTBAbCUm7A1CFDJ6OBWkd2iOFuHvxGFGr34Js
         2WX1Kk+8h3HPeyISg+jYeNK3CVVom9orX9JnHgwYLsPtc9KoOPXuAr0VQTOjJTE98VGs
         Is6EOUSJPZTZ+qw3l+THNNu6F8EGaiwCXDNdyFhqsR7diIZIb4veSgXwV/5l0DdkO/DU
         jnuFcQIaT5YU8c12TQE5nN2ElLqMXlJSpfmivmt9oFsciYqDjG8rI+WJArmyt7DpZVO9
         3bDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681280394; x=1683872394;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVh54cOUnDO9XdRRZaYwjocjn2dehDOHNKXPnV7ItIA=;
        b=NtCRzu62mLtoZCNQ009ypu2KFGomXQ2sG5JANzDr775dUWqvQRW3zgq67Jr/5JUWop
         oXXSD8He2Aq0PyauXnF+/k4RffThacDvvAoxQPwKvWQe9XAudO/IzhcrLLUyxJmbVOvL
         4/4BBY7KUnwrO3WnIeakJAGJNnDiwcuG4tMZW8EfB49UKVXM3BdiIKud9m2XHwNhvW7Z
         lxEjuxVoysftbw4MYRqkiIOTaJYOlHiZC53KDWIxoPHv/YDVSbPwrFOvabu+BK0gpCsx
         BQy1NrG3qxhSRzAMPqRSAOFl3Yzc3otXeoXbQ1Eg9tAnE0cC3yagJbE7U5btLrgg7VHj
         mICA==
X-Gm-Message-State: AAQBX9egmKuo78dikwm3kj+9ndsiSpc68fnmzl7OSq0/IahzlvgB1Sgo
	QCtiHVeY+nnquzBapD68eOqYBBW6tWlJnI/8BmIeii32XrS6VMue
X-Google-Smtp-Source: AKy350YQO9Y/9TeelhVY89mClkPSWe0VYBHBe/bXZFUDS2wv07gWdcFWqtAaQaFQonlfOIN9Io9B0fOk09mxZI4rgNE=
X-Received: by 2002:a05:6a00:22c2:b0:636:d095:1a8 with SMTP id
 f2-20020a056a0022c200b00636d09501a8mr841127pfj.0.1681280393771; Tue, 11 Apr
 2023 23:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: ARAVINTHKUMAR JAYAPRAKASAM <aravinthkumarj1@gmail.com>
Date: Wed, 12 Apr 2023 11:49:17 +0530
Message-ID: <CAFsAJjiZZtTJC5ZsqEEMjDMKFG7beFvFU8N5yRFGQfdf=KOCYg@mail.gmail.com>
Subject: i.MX6DL dm-verity support on Yocto build
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello Team,
We are working on an imx6dl sabresd board with Yocto Linux 5.15
version. We would like to use the dm-verity feature, but we haven't
found proper steps to do so.
Could you please guide us on the proper steps to enable the dm-verity
feature on our board?


Regards,
Aravinthkumar,
Mb:8508139500.
