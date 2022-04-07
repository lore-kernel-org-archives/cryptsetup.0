Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D668020E9
	for <cryptsetup@lists.linux.dev>; Thu,  7 Apr 2022 11:42:53 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id r25so2036361vsa.13
        for <cryptsetup@lists.linux.dev>; Thu, 07 Apr 2022 04:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=mV82LieCWCkGPQFnFzhp3Bl/IHOtgqCkUGBMXOYq80M=;
        b=EMKaRW0ZuDn06QnkpTEvRSrnbVTbkh4ByzFzXcm8759mEzs11d8rySAV2j0v8+2O22
         d7MRxPlmEu0UnBkoVksTOOcTmHTrXjJ9r17Jx9V098oxHuPoOCiOipSUFQPoefocXgBv
         Zrw55Pco4UJduK9vCaVD2GHzp6Kak/6nOrIdtAdqBwQs7ZXP0vEbEi3rq9LUg7xETult
         1puhyyaYFZ55cDRxTFnwAZwSJSg+Sl4Ovp0V36MoUcfSsUGE8++IQM9Efo6sxn2211Cv
         VMqT+ZfYZZy3E/JLtnwiy57WO0i1J3JudI5dx4XiqIm1IYIERgJUsPAh07jCqzVrWMse
         UeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=mV82LieCWCkGPQFnFzhp3Bl/IHOtgqCkUGBMXOYq80M=;
        b=ohAauYUhXXMQ0dOmEE3zOC8BtDwcE0pHvRAFbs7rI3NWQx+setgpNXLfohgT+FD8PY
         O8qbVwORMcu4/KSqKMT2wQwpNdCSQGGkyltGUkUERpuRrlb+TolKxXGmce3PWAFBxZ0S
         MDKSMIb7wuw5KtSeq3gcKnghjkGoPw0W2OArlN3vmNQkDeLqnszYRFGz7PIZM3reSRJv
         wtLj7vktsuliyQRk6Az6QHf06Y9ipc4KT6ErfHaT0wIhV+mCxFM1T+zKSludqWsZaFiM
         fKlFNcoC+M3W28PWvWpTJHDd8BbJpYITcKp+vmVvRM1V9i7l8j49noVGGcs43VaX5Hha
         AURA==
X-Gm-Message-State: AOAM531qpK7n06g+uMfVcsNevIW4iboZWQygN9dW0dxXGEx9p6hgvy//
	f+rRcI8bXmyq1JlhmFDSzqgECY9dHWDehkRaxpf2CaEMdFfqgCppb51JuA==
X-Google-Smtp-Source: ABdhPJxKUmfaBsNr7Wv1IxG/8O4ebni7h8LroMGp25egC48iBoUXK063fg0zyyNa18IhqmuXQsdE/e1w1NsGJgSqpcE=
X-Received: by 2002:a05:6102:41a6:b0:325:792f:a6cf with SMTP id
 cd38-20020a05610241a600b00325792fa6cfmr4621792vsb.34.1649331772770; Thu, 07
 Apr 2022 04:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAH4tiUt1_1B64=QgU7uXmnBZZw=4FYEHtN=rZcx-zANJSbaYSQ@mail.gmail.com>
 <b59b57b6-1468-1041-bdbd-ec9399329dd2@gmail.com>
In-Reply-To: <b59b57b6-1468-1041-bdbd-ec9399329dd2@gmail.com>
From: Jasper Surmont <surmontjasper@gmail.com>
Date: Thu, 7 Apr 2022 14:42:42 +0300
Message-ID: <CAH4tiUtK_faaxTW72Z2Y56j2FG6-VCju9LJPm8JDEUuNjenBYg@mail.gmail.com>
Subject: Re: dm-verity setup on loop device
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey,

Thanks, I didn't realise you also had to use the -r flag with dmsetup.

I've got a few more questions concerning dm-verity:

- dm-verity itself (not veritysetup or any userspace programs) expects
a full merkle tree to be built and the corresponding root hash to be
passed as an argument. I saw in the source code that the constructor
will verify the root hash using the sig if enabled, but does it also
check whether the root hash is correct concerning the hash tree? i.e.
Does it traverse the tree to check if the given root hash is correct?
I don't think so, but since there is quite a lot of code I might be
missing something.

- The documentation states: After instantiation, all hashes will be
verified on-demand during disk access. This means that the hashes will
be verified on every read to any block on the data device right?

- If the previous answer is yes; where is the actual verification of
the hashes done? I see a lot of functions with '_prefetch' and I know
what prefetch is, but it's all a bit confusing to me.

Thanks!
