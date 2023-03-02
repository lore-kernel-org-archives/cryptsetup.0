Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5B26FCC
	for <cryptsetup@lists.linux.dev>; Thu,  2 Mar 2023 20:35:04 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id w23so660685qtn.6
        for <cryptsetup@lists.linux.dev>; Thu, 02 Mar 2023 12:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677789303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jYwc+Zk6Z2HW7fxMDOQ6WGWbLJy3zo+/UbXtcgfEVLw=;
        b=UI1jLPMUnnRtqA8KFuWQMS+hci1wyrHdsu9ZYnk7hQmwct2B9H8IcfHsMRO1PMA6Cb
         8NQXIjNtOq+aHIn8NtkSiTrkEAVpCzu0Wv+7xCD/K3cSK/pzAcRbVfhQf+imRjNborWz
         nPAj/Zwy1KrW79CzpNOKBFTwgKP2AVsMj5kUsy0hXuRBJI6tkuzCS56T2snTb/l02IS8
         DYpSMQnE4u3tIq8sWml1OQdd7rwF3oGkTbff/X7Mw/BunhZZ5cfvmL/vQmOYYBdmacfG
         FNcwHEY+1024iRsGoHxy840oaUKtbMS2ahW+MD3R2VPuTOe8hx+KKDHCrTL4i7xamDee
         QrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677789303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYwc+Zk6Z2HW7fxMDOQ6WGWbLJy3zo+/UbXtcgfEVLw=;
        b=FPSyKVfNEqufzoHCSA5eEvOUaTqFrY+dYY5apHpEwlsFpja24vfEIAmb88Gvf/5BSL
         ci6Ui1kHzzjJMAvXExsx+m9xQJ38ecA5PS7AyWT5A8FAPgR+oyUOE0/42OHXBIp9fgKo
         jaH78mJQe6ygQG8GUomh4DABru5NYIhEjNN3uQ+E9iOnB6r858LlTM2cgbgRfRNcVwSz
         Fv8tKmf4LVIuZl6vbsRosQidmU/Hai4B0QelARXA4uXzp9jP7YMz9pzFUxNSes9JKxHn
         fnsVVHvrK2x/i0ZkTbyvlPF8Tb0DQdVRlaNvg/1BxnAQXxx1VMePN2VRuUD0Y1vjWZIp
         Ilng==
X-Gm-Message-State: AO0yUKXofuF+kSYCRUO1kM9Vk5vLnCwybcUv/3W0SiYYQyuy2Fm0FzAe
	EwDeyZ+6z9sQdOP7IdqUfsrMiNdUwlK6VV5YlmU=
X-Google-Smtp-Source: AK7set+zpJ7lLzRe83BKffsxdv5osgK7R3EFZg4Jj0PhFxgvhxD+f4kYfsKoxtUClPk81LcfZKYr/vIIk4Vj49x2ezs=
X-Received: by 2002:ac8:66d1:0:b0:3b8:68fb:2b03 with SMTP id
 m17-20020ac866d1000000b003b868fb2b03mr3084729qtp.7.1677789303050; Thu, 02 Mar
 2023 12:35:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD-Ua_hj1hkymLbyEyT-eNyCj_naiqHqg7nr3nos8tp9XCERDg@mail.gmail.com>
 <64fc6294-ca5e-f7a9-302f-63b09d569586@gmail.com> <CAD-Ua_h2GDZexz=DC3YA88nO-OhXKyGp1v2D6rWvHHQVwtCgFw@mail.gmail.com>
 <3b08eace-b038-bab1-4f65-f9c322dc90a4@gmail.com>
In-Reply-To: <3b08eace-b038-bab1-4f65-f9c322dc90a4@gmail.com>
From: Lars Francke <lars.francke@gmail.com>
Date: Thu, 2 Mar 2023 21:34:26 +0100
Message-ID: <CAD-Ua_j_AR4BJWJPXs9Lv+qO1-c33M59UPg_1_XQdB60s0MEXg@mail.gmail.com>
Subject: Re: cryptsetup - No key available with passphrase
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 2, 2023 at 5:41 PM Milan Broz <gmazyland@gmail.com> wrote:
>
> On 3/2/23 17:23, Lars Francke wrote:
> > Milan,
> >
> > thank you for the quick reply. I did try that but unfortunately:
> >
> > root@archiso ~ # echo 'a' | cryptsetup luksFormat /dev/nvme0n1p5
> > WARNING: Device /dev/nvme0n1p5 already contains a 'crypto_LUKS'
> > superblock signature.
> > root@archiso ~ # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot
> > No key available with this passphrase.
> >
> >
> > I also just used the `echo` method to make it easier to replicate.
> > The same happens when I just press "a" on my keyboard and hit enter.
> >
> > What makes it even weirder is that it did work _once_:
>
> Did you deactivate the device once it succeeded?

I have to admit that I'm also not entirely sure what you mean by
"deactivate" in this case.
But probably not then :)

I did a new test:
1. cat /dev/zero | wcs > /dev/nvme0n1p5 (this actually gave a kernel
error after writing 500GB / unable to handle page fault for address
..... but I'm going to assume that this is unrelated for now as I
assume cryptsetup doesn't care about something 500GB down the line
when opening)
2. wipefs /dev/nvme0n1p5 -> Empty
3. cryptsetup luksFormat /dev/nvme0n1p5 -> Manually hit the "a" key
followed by enter, verify a second time. All good
4. # wipefs /dev/nvme0n1p5
DEVICE    OFFSET TYPE        UUID                                 LABEL
nvme0n1p5 0x0    crypto_LUKS 695c4fc2-9d95-4460-b9cd-9933803d176b
nvme0n1p5 0x4000 crypto_LUKS 695c4fc2-9d95-4460-b9cd-9933803d176b

From all I read it is normal to have two signatures (secondary)

5. cryptsetup luksOpen, manually press "a" and the same error "No key
available with this passphrase"

I honestly don't understand what the problem could be. All of this did
work last week and it did work _once_ earlier today for some reason.
I checked smartctl to make sure that the hard drive is not reporting
any errors and it doesn't

I also tried this with an Ubuntu USB stick now which has cryptsetup 2.5.0

Can you think of _anything_ else to try? I'm a bit desperate :)

Thank you,
Lars


> Anyway, it should work as I described. Maybe you should wipe the
> signature before format with "wipefs -a /dev/nvme0n1p5" (but it should
> overwrite it anyway or print error).
>
> You can also use --test-passphrase to luksOpen to avoid activation.
>
> Milan
>
> >
> > # echo 'a' | cryptsetup luksFormat /dev/nvme0n1p5
> > WARNING: Device /dev/nvme0n1p5 already contains a 'crypto_LUKS'
> > superblock signature.
> > # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot
> >
> > I'm at a loss but will now read the section in the man page that you
> > referred to.
>
>
>
> >
> > Thanks again,
> > Lars
> > On Thu, Mar 2, 2023 at 4:01 PM Milan Broz <gmazyland@gmail.com> wrote:
> >>
> >> On 3/2/23 15:03, Lars Francke wrote:
> >>> Hello,
> >>>
> >>> I am trying to setup LUKS (and I've done it like this in the past,
> >>> like...two weeks ago and it just stopped working) and am running into
> >>> the following issue:
> >>>
> >>> root@archiso ~ # echo 'a' | cryptsetup  luksFormat --batch-mode /dev/nvme0n1p5 -
> >>> root@archiso ~ # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot -
> >>> No key available with this passphrase.
> >>
> >> This is just a little bit confusing handling of end-of-line if used with "-"
> >> (see section "Passphrase processing for LUKS" in man cryptsetup).
> >>
> >> The first command will create passphrase "a\n" (including \n !) while the second
> >> command will process only "a" (you can to use --key-file=- there for luksOpen,
> >> it has different syntax.)
> >>
> >> But just do not use "-" here, cryptsetup will do what needed automatically.
> >> Also batch mode is implicit if it detects pipe input, so just use:
> >>
> >> # echo 'a' | cryptsetup luksFormat /dev/nvme0n1p5
> >> # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot
> >>
> >> and it should work as expected (password will be "a").
> >>
> >> Milan
