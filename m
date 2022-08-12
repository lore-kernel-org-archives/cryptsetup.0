Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C00D138C
	for <cryptsetup@lists.linux.dev>; Fri, 12 Aug 2022 14:55:26 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id a8so1215986pjg.5
        for <cryptsetup@lists.linux.dev>; Fri, 12 Aug 2022 07:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=uwUSdyJAeWCGn3CVYROPzWP2ejFOgM4JcRbn4OZ6wTM=;
        b=IjIablpxeW2WX9HYbfuxwCzRV/afpDcokGMstcgDkF4i/rFHpRuuRoYgrtPttmPXHg
         4sjtNHKIzQj+OzMhRwlNqnXpbUoQlZL9Ex0yeBF9LwjRmRT11hOlNVm+0hf1M5XUq2eD
         GjjgkRFAzsYCtRo8Wq+knYrN5cXtrpJL9/PXHeCph78qowGjDc+AFZZtkqel8m/3M+JN
         aQLkaWOnnk9vMDQiLavCfQj+hYO70hTKHBUQz82kAQwiowkO4SH+wIkrxq749d5QWFB9
         hQIurS5SBHSsFwlnM3i6UYNFpu/R3e0QoBsN9O396JhilgtMnOOlrwLBD9HCrK6ZaQDX
         I0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=uwUSdyJAeWCGn3CVYROPzWP2ejFOgM4JcRbn4OZ6wTM=;
        b=gekk2r8lMVDO8No47ATLA99S4GaGIZi7hzlXP4XeURPvIS4sGOcFZFbzM7PpQW5T2y
         ybeFIi5z6M0E0P7ZX9IszJscO9JhLlIuoZzs/uy1kAgR/nSHD9VgA8WBCQVsE3CD204B
         bPaCbj8PJeSAXEfssky8tYH+E6Ay8VX5jfpjEA9GRDWr7sfcUpD4CN7tOfyMmlHFfilK
         MQepHpBWcMy8A70X7Z9EiSIuaI/hEFHM6tgi4UaNSo5AU95cH7dwnSz4bY3ISIJr164v
         1wmN4j9zyrIpNmCwSlDW9GSP9dOtYiXDtWds6giT0bSV6w67V0vAZB0MDzJ/BuUeX8tB
         FN4A==
X-Gm-Message-State: ACgBeo12tYov0Y5YOKw+JpOG1WxyRA8Zhuf1ZT0SoAbAHXHA8GR+Vlhq
	Zzvio/55tJzpfe5F8Jk4Fx1FkBKI5nQ0Xr9wpX4=
X-Google-Smtp-Source: AA6agR4kmFYvALMf/RbRqmyCnAngQpcfLkmHtHmu8+hG149w5kM3dIoPnLE+p/BXHhKk9VC6oqU8GPDZM0yb6ypWPWU=
X-Received: by 2002:a17:902:ea10:b0:16e:d88e:b14c with SMTP id
 s16-20020a170902ea1000b0016ed88eb14cmr4412492plg.25.1660316125649; Fri, 12
 Aug 2022 07:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACHosL9ri_XGPoLxsAb4vEnav1-w3B=YWCE1YidhRn-ONrW=fw@mail.gmail.com>
 <df769461-e347-9abd-7195-556e22f5d481@gmail.com> <CACHosL-VutFNrdARLWufPYRuBvYDD0bdTbR-yP2y31LAj+CYtw@mail.gmail.com>
 <dc3f57ca-e8ad-5e5d-e951-8589bb65604f@gmail.com>
In-Reply-To: <dc3f57ca-e8ad-5e5d-e951-8589bb65604f@gmail.com>
From: "doffloster@gmail.com" <doffloster@gmail.com>
Date: Fri, 12 Aug 2022 17:55:09 +0300
Message-ID: <CACHosL_H3TEP7Xf=rR7ztZ2unXxxR0fhUmXXvfYiRrV8NUkEaQ@mail.gmail.com>
Subject: Re: Bug: luksClose search LUKS header but it is detached
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Milan,

> Kernel has no information that detached header was used, so userspace
> always tries to initialize the context using header.

Is it possible to store all the LUKS header information in the linux
kernel - after that the "open" operation completed successfully?
That LUKS header would be associated with the opened device (for
example, the kernel would know that "/dev/mapper/data_crypt" has a
LUKS header stored in the kernel.)

> That said, it should not scan for header if there is no space for
> it (IOW data offset is 0 - there is no reserved space on data device
> for header; only detached header exists; data device is fully used).
> If this is happening, it is a bug. (I'll check it.)

From that paragraph, I understand the following:
cryptsetup behavior during luksClose (as I've shown in my first email)
shouldn't happen, because that the LUKS header is detached, but we've
seen cryptsetup scanning for the header in offset zero which contains
data.
As can be seen from the log file that I sent in the first email:
> # Trying to read primary LUKS2 header at offset 0x0.

Thanks,
David.

On Thu, Aug 11, 2022 at 9:42 AM Milan Broz <gmazyland@gmail.com> wrote:
>
> On 10/08/2022 14:51, doffloster@gmail.com wrote:
> > Hi Milan,
> >
> > I appreciate your quick response.
> >
> > Here is my reply:
> >
> >> No, this is expected. But for close (deactivation) it proceeds even
> >> if it does not find the detached header.
> >
> > Why would cryptsetup seek the detached header in the device?
> > Wouldn't it be better for cryptsetup to use the '--header' flag?
>
> Kernel has no information that detached header was used, so userspace
> always tries to initialize the context using header.
>
> Close was, for a long time, an exception, the device was just teared down
> without checking context.
> But we already have use cases where we need full initialized context
> even on close (check that header has correct UUID referenced in kernel etc).
>
> That said, it should not scan for header if there is no space for
> it (IOW data offset is 0 - there is no reserved space on data device
> for header; only detached header exists; data device is fully used).
> If this is happening, it is a bug. (I'll check it.)
>
> >> The reason is that even close need some information from the header
> >> (for example UUID).
> >
> > Doesn't the linux kernel store this kind of information?
>
> Yes, but it need to be compared against the header, not the kernel.
> (Imagine that you need to check password before tearing down the device
> - not the current situation, but we already have a need for it in the future).
>
> >> Is there any functional problem with this or it just looks strange?
> >
> > There isn't any issue.
> > I just noticed an unexpected behavior and thought that I should report about it.
>
> We can easily add option that will not check the header on close, but
> if it is no real problem, I would better keep it as all actions basically
> works the same.
>
> Thanks,
> Milan
>
>
> >
> > Best regards,
> > David.
> >
> >
> > On Wed, Aug 10, 2022 at 9:58 AM Milan Broz <gmazyland@gmail.com> wrote:
> >>
> >> On 09/08/2022 23:53, doffloster@gmail.com wrote:
> >>> Hi all,
> >>>
> >>> I noticed that cryptsetup LUKS extensions is searching for a LUKS
> >>> header in the device.
> >>> This is expected when the LUKS header should be in the device.
> >>> But I used a detached LUKS header, so I wasn't expecting to see
> >>> cryptsetup searching for the LUKS header in the device.
> >>>
> >>> You can see that in the log file "log.txt" - in the URL:
> >>> https://drive.google.com/file/d/1DcrpklgE75oE5znAxHAlp9CPikkYbVq1/view?usp=sharing
> >>>
> >>> You may notice that I used a "--header" flag, but I also tried without
> >>> it - still, cryptsetup behaved the same.
> >>>
> >>> The incriminating lines from the attached log are as follows:
> >>
> >> ...
> >>> Do you consider it to be a bug?
> >>
> >> Hi,
> >>
> >> No, this is expected. But for close (deactivation) it proceeds even
> >> if it does not find the detached header.
> >>
> >> The reason is that even close need some information from the header
> >> (for example UUID).
> >>
> >> Is there any functional problem with this or it just looks strange?
> >>
> >> If it is problem, you can always use low-level access through
> >> "dmsetup remove <device>" here, but it can keeps some underlying device
> >> active (for LUKS2 this is used only for integrity protected devices).
> >>
> >> Milan
> >>
> >>
