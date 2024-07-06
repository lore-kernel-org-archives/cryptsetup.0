Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D58B23BE
	for <cryptsetup@lists.linux.dev>; Sat,  6 Jul 2024 19:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720294319; cv=none; b=hVOpV6cUfH10wotq0S3NuDr5vqLUra2LYCVmBZCIdsGgFv7wIRgAdx26KrHgd7Pi4lxUCQXCoJ+hv3tb5wZDzMxs7YFx0xYrrwzulCVnFPCXvQtJ/PvhnPVN6DF4ffor81WIFb20azKykh8gMU14dICJvcXSvWuWbBY/WU00rTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720294319; c=relaxed/simple;
	bh=NA/31B4nWJ+s8k4Q76NxBkDq67Oq8y1H+tMpbdNnJdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qtmsOa7X75Vuezwl2uV9H5PtaUw3+yX4SC1bkS2TQAsT+AGwJ+OsyQqPzRP3B/7sCiDvAllGLsDvdcHIZ/PZyYZaz7mdYdClcDRvrLLz0s0q4+Pn2TeCoLGgoS2gfW2o44s7/1kMVUiKkdsGq/Zkel5q7xDf9gBR0t665m9enEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvT1VAqC; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvT1VAqC"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57cf8880f95so3453191a12.3
        for <cryptsetup@lists.linux.dev>; Sat, 06 Jul 2024 12:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720294316; x=1720899116; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VZuaDTDjn9vfmbw34ru7RTvpswoJBk8SJrBYHfMAPzE=;
        b=jvT1VAqCq3TGpb3IdRZV1W6sHWVQ7cLTgJTtN4MgFnr2CUA0BWWlKpEkRRR1fy16sH
         BxFdw5CBC01TMgymMRKAETwdrs523Af3/Uc2KUOu1OG0nby/9D7PAPwKgHoWcRm4WHlE
         //W23F/PSnUAdbIq/W8RXTDv7ekaxy/Chjh1JeQL8Hzhkgueayc9Yg9Hrog1/Hk0G9UQ
         pKQ2XxJdmopo5ryLWwCinV4bNw8CexLoHVTcYEkJeN3BA4eLyD3UJd8H8uJJ/BXOJ4a/
         e9JAcloZQJMPKs4HXh51qJkv0H3FBm0K9C3V5fyOnyC5FoZZfiz0esOu5cFfNI/xx4pu
         trRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720294316; x=1720899116;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZuaDTDjn9vfmbw34ru7RTvpswoJBk8SJrBYHfMAPzE=;
        b=UXsBP4DTTrpljHQC2wuKqMFxmPGNvHFCTJEkDcCNxDTS5HtsYoslu1wsPJh78Ud0OK
         BOpFg73mVO0nGp57vb9fjkGqi0Wjw1hm4WzFOY1y/W6fwk6gwZmdfdl3/ltp195eQyq/
         zEk5KMl1mkd9urjWb69AaR7bcYpgRmg/oE4Wagz6KKi+0w017h5FUf0kKaRL6e2H5er/
         h/pQ2PusjpxFRUXCQMg2igl5I2/xqRfTj1t5y0bMsCjQRIB5VaahcrSP2WK1YKeFAoZ3
         5yCYYsdUkDWSrJyGlxeEBBaI6GQgnEII3I+RFnR8O6rFiUI3H1K9vaRiKTvXRNsGbTFF
         oihg==
X-Forwarded-Encrypted: i=1; AJvYcCWmdw0y7DkBgQSTTaJXV8EYB5LxE15iarw6lAmZfCkpLYrUwsL3c5bXA2pv1ZrUJcPbxLdjpb/Tc797Jbw/RialpNpwbJHOaUBilQ==
X-Gm-Message-State: AOJu0YwK/2JyBTkpz8ZvdRXRY0gJKWASn5mWmLei1crCx1b86uvb8OHq
	kMGOoIKO0dHeQ+QbARf5IjdjVCMTzFMPb0EEDOsdb0nImXCjT64PzJOTLQ==
X-Google-Smtp-Source: AGHT+IGI2W+aIbHatBVYgh65uuiGhiLo7Gc/uH10m0F0JHq6MRiyvkxhfi9173Am5hy8Me3mnfHXAg==
X-Received: by 2002:a05:6402:84d:b0:585:5c4d:f840 with SMTP id 4fb4d7f45d1cf-58e5c8269b8mr4451543a12.30.1720294315484;
        Sat, 06 Jul 2024 12:31:55 -0700 (PDT)
Received: from [192.168.8.101] (89-24-52-227.nat.epc.tmcz.cz. [89.24.52.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58bffed021esm5780719a12.89.2024.07.06.12.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 12:31:54 -0700 (PDT)
Message-ID: <aef46d3a-82f0-4b02-be43-d53f2bc9b45a@gmail.com>
Date: Sat, 6 Jul 2024 21:31:53 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Interaction between OPAL drives, LUKS and TRIM/discard
To: neitsab <neitsab@esrevart.net>, cryptsetup@lists.linux.dev
References: <1254eca3-84b0-4202-8ac1-fbb5214a5aa5@esrevart.net>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <1254eca3-84b0-4202-8ac1-fbb5214a5aa5@esrevart.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 7/5/24 3:34 PM, neitsab wrote:
> I have been trying out the new OPAL support on the root drive for a new
> Arch Linux install (using a Samsung 980 Pro and --hw-opal-only): to my
> surprise it worked flawlessly and I could boot from my OPAL-encrypted,
> LUKS-managed SED. I really wanted to thank you for adding this support
> to cryptsetup: it's a whole world of improved usability and integration
> compared with sedutils.
> 
> After the fact I wanted to add discard support to my LUKS container so I
> ran:
> 
> ```
> cryptsetup refresh --allow-discards --persistent /dev/nvme0n1p2 root

(There should be only name (test) not device. Open takes the device param.)

> Enter passphrase for /dev/nvme0n1p2:
> Unsupported parameters on device root.
> ```

If you use --hw-only, there is no sw encryption layer (only a dm linear
mapping to isolate locking range) and so discard are not blocked.

IOW with sw+hw encryption (--hw-opal) it works as normal LUKS2 device
(discards need to be enabled), with hw OPAL only (--hw-opal-only) there
is no way to disable discards.

You can always check which device in storage stack blocks/allows discards
with lsblk, for example here it is with discards enabled (--hw-opal):

# lsblk -D /dev/nvme0n1
NAME    DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO
nvme0n1        0      512B       2T         0
└─test         0      512B       2T         0

This is with discards blocked on dm-crypt device (discard max size -> 0)

# lsblk -D /dev/nvme0n1
NAME    DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO
nvme0n1        0      512B       2T         0
└─test         0      512B       0B         0


...

> This made me wonder about the interaction between hardware-only OPAL,
> LUKS and TRIM/discard. In the hardware-only OPAL encrypted case, I guess
> there are no barriers to discards being sent to the drive. Is that why
> --allow-discards is an "unsupported parameter" and fstrim works by default?

yes, but it is a little but confusing. maybe a better error description
would help too.

> If so, do you think it's something that could be added to the docs, a
> bit like there is a warning about incompatibility with --tcrypt-hidden
> so as to warn users there is no need to try that?

yes, we should add some note to documentation, you can create an issue
for the cryptsetup project, if you want.


Thanks,
Milan
