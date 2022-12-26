Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DEE3233
	for <cryptsetup@lists.linux.dev>; Mon, 26 Dec 2022 20:11:06 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-3e45d25de97so160391957b3.6
        for <cryptsetup@lists.linux.dev>; Mon, 26 Dec 2022 12:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/fCtg5mEZujGsWNlB5vRYBttvruMtsEK+IQUstihMU=;
        b=K/ImYK8iRUSyeZLCsrR5Hr9j1S7ytEM+t929kKZybHXKKBtqYiDMHoShFqJAq+T/Qf
         mQiSNEXgox4H3aNmb2TFQO5WVN/AZXW2lf26fRgHB2NyCVgi/7qjM6pYtw1ffOEUJMyg
         QH3K6R6B/h97mngY7BsVm6e8kUyu8C/ms78zh6+AoLytkL5730/tTjp15PwDYY1IHmys
         zVVAjlP+aPvFzUi7p8Fycsmn3C2UsEnB8buSJleN7CQd5FWI5ExfEfa0G6mJuHeFbkDx
         9UfPIa9VjCllkdhjPMMWVbmc1CQ8XLVCEjWlWkEuceTBBd5gJQ8cP/7YBnqCTrT3Bx2u
         T0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/fCtg5mEZujGsWNlB5vRYBttvruMtsEK+IQUstihMU=;
        b=gdDTLTY+xgHpsCJyuaL82IP39v+ForZeHWO3RhQOLabSnCwutZMk1IW66CgYXCaSqC
         3Cz8KYssQo7LQrQMXLL1V3hCg1I3Sy4oYAYCazd4BaeN4/zHhmx6TkF9ymzn6ZHa8+xn
         fn4TtaWFswBmF/+zIVd3ebFrbiDXL8M8wUtI5bRzg+9kYE9yG/hY0Y+sfL8Ss1BN5c4m
         vXRKamgfUsZbRqhoIO6gmMxKri+uLPAkPrihPywN5UqRX9PT3Z+EH0ANvPuco+jVSxsC
         eNDZCAtGx6X1HhtFDwBeBR1MECZC3iyTcFLiiVlV+UPda9UfMQ1r1QjFmS/JFq4jME7E
         m3Aw==
X-Gm-Message-State: AFqh2krvTE65LZVJu8WlpndVl5jKX+4B5jX2fA99ennnYNtiAaKe0DQ6
	vtdnWQR7lsIbxxTQTfp8M18+Blf9mW2igRsVvFocC/99vTM=
X-Google-Smtp-Source: AMrXdXuTS81ZhlLIq1lhaDA5yOgNWTRcZibD8K4TCM870APjmMQzsmtCZ11ccdbXLaxrXpeMd94NWKSuvAL55TuvmLY=
X-Received: by 2002:a0d:f644:0:b0:40e:fa56:82ee with SMTP id
 g65-20020a0df644000000b0040efa5682eemr1509180ywf.343.1672085465378; Mon, 26
 Dec 2022 12:11:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+5JoNqEPTTCAppS8EFDwBVtkfK8f_xWhf3ZYE+9bAQRNca4aw@mail.gmail.com>
 <611ca3db-6278-6e3b-5df7-0739e47cbfaa@gmail.com>
In-Reply-To: <611ca3db-6278-6e3b-5df7-0739e47cbfaa@gmail.com>
From: John Smith <dingrite@gmail.com>
Date: Mon, 26 Dec 2022 20:10:38 +0000
Message-ID: <CA+5JoNp5PF+43AqbYHnjern792b=LYJtAEheFynEU8mRmw0Vxw@mail.gmail.com>
Subject: Re: Are the keys of mounted encrypted disks secured during reboot?
To: Milan Broz <gmazyland@gmail.com>, cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I'm asking about when a regular shutdown/reboot/suspend-to-disk is
issued. In most cases the rootfs volume is not unmounted because that
would require a pivot_root to a special initrd/ramdisk-rootfs just for
powering off.
So that would mean the device isn't deactivated via cryptsetup -
because that would fail.
In that case, when the kernel is preparing to reboot/poweroff, will it
wipe the keys or just leave them there vulnerable to cold boot or
forensics?

On Mon, Dec 26, 2022 at 7:42 PM Milan Broz <gmazyland@gmail.com> wrote:
>
> On 12/26/22 20:13, John Smith wrote:
> > During the course of proper shutdown/reboot/suspend-to-disk, does the
> > kernel securely erase (or at least free memory of - as it pertains to
> > init_on_free=1) encryption keys of all dmcrypt/luks systems which
> > remained mounted?
>
> If the device is properly deactivated, then keys are always wiped.
>
> (Actually, with LUKS2, dm-crypt no longer keeps own copy of the key, it
> is stored in kernel keyring only for activation and then, obviously, in kernel
> crypto where is is directly used for encryption. So if it is not
> deactivated, it is responsibility of these subsystems to wipe it on reboot.)
>
> For suspend to ram, it is more complicated - there is a way how to wipe key
> and freeze device temporarily (see luksSuspend), but I do no think many systems
> actually use it. Debian has cryptsetup-suspend that can do this AFAIK.
>
> For suspend to disk, the memory should be written to encrypted device.
> (And RAM contents disappears after some short time with no power anyway.)
>
> Milan
