Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688887B
	for <cryptsetup@lists.linux.dev>; Tue, 12 Apr 2022 09:38:39 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id bc42so8777912vkb.12
        for <cryptsetup@lists.linux.dev>; Tue, 12 Apr 2022 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=HTB4mHmpX4t9YFtWFU1z5wLFKYZEPn6exTgWelHA+/E=;
        b=n4nYdLUNuQDZGHhosKOApZp6hFm+C0j5xQQ70In56k7+WXI4NWiTazd0LtP8REuXWw
         NFBsPTBWhL5slaIc+9p66OkX5jzaOFVAyDvfdBZRyzlfNEfvuCL7L/WnQudDyuuXvvdi
         sVMetfm/Bi+4r/DCAnfAwRlFW+kq2dDk3J7bJLyKz2qcl6ePU5jnXpOH1vR6Z7Pbjzcv
         8LHyd69NDpshunpAOIJXSmyZVxZQDBG9jmkpW7usZY7VPb5d7e0d88yYUf/K8DVJPQ/2
         tfLoNSWamDaPyVrZIYFNMZrzuTfLrm+7VhHx/K7RqU+baACWgPQu0vfz+qFAv17c6KNg
         uUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=HTB4mHmpX4t9YFtWFU1z5wLFKYZEPn6exTgWelHA+/E=;
        b=J/e68sytduSDo61k5ffdewqN6TinBTFvcrJnB6MwoV/0+SRPeIWATHacUHFJm/BzBv
         QJvxKmfnGIo6AVDIXSY6Hq8lQlPXon01b7/w5Kp9EZ0+UlgEjZiamC86M1dDp2aXaIyg
         c96Ld6+D3KzGZsCnYCND5QwKHQysso1LNsiq80kxY9w7A3rlLJ3iMSr+9zjXNAkMa2i0
         RQG/JOswqw1bEJki0W0NvYRT1sPJ8YbRjzjK5tCj1oQPmuVpHD+WfvHTP12xQrnrGimD
         QeG5TRsKxVRTKriLnX5R/XhUkJZO/NuBWpT7MlqN27TImNdw5rW1k9g+FvEe5nR3dF7z
         J5pA==
X-Gm-Message-State: AOAM533DK6iPX4xZS2u2cS1/FDmPXiwIgzCVEDOpuq7e3WrGwr0a+KNc
	T2zGiP+ki4TKIXTPhYitzG/Nw3gajxQr/+aBdVneYaI1pxnOoCQXBvY=
X-Google-Smtp-Source: ABdhPJyn+d/kpgW8avLlxT1Wm7babaUOmfVcm61lme6jnAUkxQgKcVJmZau/OVx/QUB1isIMl52R1SDFgyVZRBJykJk=
X-Received: by 2002:a05:6122:9a9:b0:345:62da:2ce9 with SMTP id
 g41-20020a05612209a900b0034562da2ce9mr3825161vkd.39.1649756318183; Tue, 12
 Apr 2022 02:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jasper Surmont <surmontjasper@gmail.com>
Date: Tue, 12 Apr 2022 12:38:27 +0300
Message-ID: <CAH4tiUts6MVKNv6RVQhPD3fSGruZo=iYpeY1XrbMs-rUx7TLFw@mail.gmail.com>
Subject: dm-verity design question
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey,

After going through the dm-verity source code for a while I think I
kind of figured out the general design; on a read:
1. Multiple possible problems get checked like alignment, out of range
etc. Also variables get set based on the request
2. The request is prefetched to the cache
3. The actual integrity check is done when the bio ends (bi_end_io
points to verity_end_io which submits the work to verify digest etc

If this is correct, I have 2 questions:
1. What is the main benefit of prefetching here? We know the remapped
request is going to be executed very soon, so I don't really see why
we prefetch.
2. In verity_end_io(...), we only submit the work to verify the digest
if FEC is enabled. Why? Can't we check integrity without using FEC?

I hope my questions are clear.

Thanks a lot!

Sincerely, Jasper Surmont
