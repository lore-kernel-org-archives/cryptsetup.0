Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B872A92D
	for <cryptsetup@lists.linux.dev>; Tue, 31 Jan 2023 19:27:12 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so13262877wma.1
        for <cryptsetup@lists.linux.dev>; Tue, 31 Jan 2023 11:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8joPWH9VkNgdK+Hr2cGlKuURL1OOYzF4Q3itwS+5lkg=;
        b=KmbJh/AdQRhp6+YFOG8hOO3yvrhguWiWoK0VEdHyf+oE5TR8ruLJ5UiV9Ang5lA2pM
         xduMGoFCk1ezKwzL1tr+kREno9V14z2lE9NwLk9YC+vn0LkfAR1RQNCK7CReBfV59EDj
         bEGYjN92DUjxRX+83jfaqt21nryJ6xNkGZUX5Hwt+NDfjmZ08oifVK3ydxpfxmgR6YRt
         fybOVMlSkpuBhCAJoGPSplX8AKh/GeA/HnYcQDaLWBGhSnINl7gLGxBVJh4gMGf76Xph
         DABEz0HMsM18yCS1qb1vIQwYe1LpTM2LwwDup7VNd1B60RoeTjQc6ngTGdWUy62zAlSG
         nSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8joPWH9VkNgdK+Hr2cGlKuURL1OOYzF4Q3itwS+5lkg=;
        b=me7ubiaj7sicyYtKhb+9fvEhSe0IZUEByjS+rJSgOlESWF61cE1cEZhBbDfCg5UgB+
         xbH6uEB35u8Jeon5/NWFwIWosSm5CeApUT0P12qqoksh453q1x8GTC46Z+n/V6+ZLwQ9
         N3qjGySWOT8iqGD2H+a5FqK6KThvnGvTuBpO0i5QdaV+JpuoP6IqhQ7C5vOPrgcL3ixr
         +UDsCKVYFeB20i9mww6YotvaR/hG0wIgjcOuwevumaAijTKw2qLOsb/hPUMl8frLzblh
         aC1SzRam5N1LIE2KBHnIwXM8OExjAPYTK7ZIzgDN4cJkmw6xJ4jKgZBMZyHIbeiIal15
         86Ug==
X-Gm-Message-State: AO0yUKVZO4TnlyIaBi2AUS0QlQEb3b7EbQ96s3wDjFCUADgVm+4ifeui
	qJUb4aUkTkV4zFrwi04uo/LakjoTo1whnsNpC5LUSjAABlF3og==
X-Google-Smtp-Source: AK7set92AgTJDNYH2xibtpMlrnf5xCRwKRQaJWpVyjezD7vgHRL3vjs1SqicAdbnh69zF9Uz/0NU3bQgJg5Cq0scqzQ=
X-Received: by 2002:a05:600c:3148:b0:3dc:5302:ad5 with SMTP id
 h8-20020a05600c314800b003dc53020ad5mr576363wmo.101.1675193230490; Tue, 31 Jan
 2023 11:27:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+Tk8fwf2tH=ZWrpH=hn0NoKM8U-sWDnm6MUZUYV-JLLHozP_Q@mail.gmail.com>
 <CA+Tk8fz25r7ZMcqiLAHCb--Wpya8i8bkotaKv9R0wMEpdJYESA@mail.gmail.com> <af24f4dd-0394-3336-6a73-c1db990e30e4@gmail.com>
In-Reply-To: <af24f4dd-0394-3336-6a73-c1db990e30e4@gmail.com>
From: Ciprian Craciun <ciprian.craciun@gmail.com>
Date: Tue, 31 Jan 2023 21:26:34 +0200
Message-ID: <CA+Tk8fxyT9M7tOKocYBLocRVXmCoL2wkH3FqqZeYJQM5VPRCfw@mail.gmail.com>
Subject: Re: Creating detached dm-integrity hashes for existing disk
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

(Please keep me in CC, as I'm not subscribed to the mailing list.)


On Tue, Nov 22, 2022 at 3:34 PM Milan Broz <gmazyland@gmail.com> wrote:
> There still can be some bugs (mainly for bitmap mode that is very rarely used;
> better test it in internal hash mode).


I am interested in the bitmap mode because I want the drive to behave
as "write-through", and I care more about writes reaching the data
disk, than computing the integrity.  In my case the integrity is only
an afterthought, or optional, and I want to be able to just remove it
and use the underlying data disk directly without losing any writes.

If I understand correctly, with journaled mode the data is first
written to the journal, hashed, and then written to the data disk.
Thus if something happens with the metadata disk, the data disk could
have some writes missing.

Are there any serious disadvantages in using bitmap mode vs journaled mode?

Thanks,
Ciprian.
