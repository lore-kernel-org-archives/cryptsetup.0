Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AC51FA1
	for <cryptsetup@lists.linux.dev>; Tue, 15 Mar 2022 16:45:42 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id bt26so34045304lfb.3
        for <cryptsetup@lists.linux.dev>; Tue, 15 Mar 2022 09:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorremedies-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=1fxvnt3leYPHgtqdvqieYaHtHiHiQhBIY9UBuXVtPdM=;
        b=JABsLW1dcEj3cqARN4yvIAGH1zj+PcfwzDV0mUF1dIgM17iiuBLK70zaylPTyudjzh
         sDKFLJSlEjKgP49kkk+n54jE9ylGYzeNJOJYc4nMXbcQVXRzG6o0wSoPO8dSPc8zqA+0
         g1p92gw5Wv/f8n8xOOLqtO81I5T1qeMaXK0tLM5lPBrEPjMp6oiu1eycVZAFZk3H9peR
         jKet1cIkI6FrHK7FrHpHH9/6coLUPopDzn65Snd5hy62dgkCEehKyJjxn5TMUAW8f3kH
         6FspKLf8SZjrmgJlNwwZ2GSlGgwZP9t/OKTXu5/3aKB7h1wvJRylzA7HFdPpAqATQJv+
         8bYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1fxvnt3leYPHgtqdvqieYaHtHiHiQhBIY9UBuXVtPdM=;
        b=Uy+ZjyfkJeetH/j5gxx9vMeEXeMnhE0RZ9hELYtTFVChHEFfNw2wI9sJVRen4QMNDw
         gLQG2BvzKW7x7B9laeCVx6LasQxoOVW+URNdwM/QfG37E3dYHMMyDEhBmHVokcFTGo48
         Jt8CSOC8HLtBsQjZdNdKr95dScIFwbJ8PQRAc4feqgFW4j3G7TieMrfWlMDOD2n8pMHL
         cxmFkY9/Jcv4pULGKsQLldZ2x5ZeJ2bpJZUB1OkfDsrndREz6462QVGRAk8+kI0dJpl2
         llx21WQJxWdg2fQ0Jwgr3k4t3pm+kfQSUa0CMhU9fzlCJ/csYxHObswU+SWDkBnsxvof
         uh8g==
X-Gm-Message-State: AOAM533nRVpQkdeCz9JJMk+EVAIkmYinLsbYpEDj+pzsz0zp+/hTeZU4
	ReX1qA/30qOLFSU3hKNdR1flHkwlL6VSnXy400i+E3CJpfbZE2XYk1w=
X-Google-Smtp-Source: ABdhPJzKqF07SXwtkvi1QtkGot4uAHC2nxLxraeJ9qAJHXTvwk07bis85kZuf/MFBlcEI0hw5p52BzCE0pTjnskXgtU=
X-Received: by 2002:a05:6512:104a:b0:448:46f1:776c with SMTP id
 c10-20020a056512104a00b0044846f1776cmr17475137lfb.473.1647362739698; Tue, 15
 Mar 2022 09:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chris Murphy <lists@colorremedies.com>
Date: Tue, 15 Mar 2022 10:45:23 -0600
Message-ID: <CAJCQCtSRe-nip3a6m+hzccXMYyKTP3AzPmAbHgnVPFJPLbdfCA@mail.gmail.com>
Subject: Bitlocker resize
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm curious how Linux distro installers should go about supporting the
increasingly common case of Bitlocker enabled by default.

Is the Bitlocker format similar to LUKS in that the ciphertext volume
size is inferred from the underlying partition size?

I see in bitlkDump results of a Bitlocker volume there's no apparent
reference to its size so I'm thinking it might be conceptually the
same as LUKS, in which case the installer workflow would be the same
as LUKS. I know that cryptsetup doesn't support modifying a Bitlocker
header, but maybe it's not necessary?

pseudocode:
cryptsetup open /dev/ $name
ntfsresize --size $size /dev/mapper/$name
cryptsetup close $name
libfdisk/parted (resize the partition, create a new one in free space, etc)

Thanks,

-- 
Chris Murphy
