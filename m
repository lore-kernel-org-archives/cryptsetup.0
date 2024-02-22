Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48B8182D2
	for <cryptsetup@lists.linux.dev>; Thu, 22 Feb 2024 11:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708599882; cv=none; b=nHxOd6FsDgl9ABxMHSh9pXJJ69SXK2OSSzI6I8o49canpsVgv+Nb4sincDe4VzrdTEgGapGQ3AqqisID9PiPG8a7iMDkuzsp0FN+AuSRxEgTkcSmEC75ovA3733KveJnNX9tMiA1fgqxudWpt6dxEdaYpz9QyHDS37PCuSejkiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708599882; c=relaxed/simple;
	bh=Lc1+tVCiQNmurs7iTpWwoF9/0tMAKTmD4AIXqHKyGvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=F3MAtlqvJQs7FBsz2LySbRiqsdPRP0MF3q9MswsM9tESIZfHmdfF3iGLz6jVRnQmjnuyMiS1vHalva3CQMYfz1ZqIeql4LAqDzNmP4Epm8UGab79Sihc3aFp16geXckiXqKbAwJmR+vVQiUIZmv+g7xgwwlC0JUJvTH0uXtcrhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=afZdY3wr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="afZdY3wr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708599879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FwO7PjyT54Ss1NbFgQxZfxswUXbRjFRQ02xefRUojog=;
	b=afZdY3writIeidIbnN58Ky5xETzaWcK0seF1KKeM7pItFmxhQB1IfyDOvUob9BQ/1FdDmp
	QOPoUzAY0EAy3Imh3E9KOJHFoy9uD2JNa4CnHVTeFP4Kehjb/JKFXWDyOWTRo+6dDbtpol
	d6ZtYkG6abJ/XEPll9f4+nE7Z1Xs6S8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497--6rVBGfbP_yVc5LuKaTFWQ-1; Thu, 22 Feb 2024 06:04:37 -0500
X-MC-Unique: -6rVBGfbP_yVc5LuKaTFWQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33d8b4175dbso315790f8f.0
        for <cryptsetup@lists.linux.dev>; Thu, 22 Feb 2024 03:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708599875; x=1709204675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwO7PjyT54Ss1NbFgQxZfxswUXbRjFRQ02xefRUojog=;
        b=Dm8ykH4VqUKo5Hjvqo/WRfms/7pQ16pTh708T8mIZJSAMMRczcKNBBe++K5x8bRRTG
         n7THTL3NXYQ/ysZwmSlS9a0TO0y/7A5XIIJiN9jolXa9/r4KwF8D9J4GDamH+JGXFdQy
         5SoyNGgaJ4/3w+RcxoBAXh5x3twfaWohBxDvRvC17QsBsebgFwAvQ64TRsu7KZYAWdKu
         HDYWfwzKzKQRkgggcC8IlnXy85X4y/Fno7x9whURGocuzxampt0ebTzTQijEhn3/LBG+
         faxK+xSIMfLKNoE9YbSQt7wvezdXd1uIbeokqWtES9Wnk9YIerONH3Xz17O+cuIzYbm1
         /klQ==
X-Gm-Message-State: AOJu0YyhOcqs+YNBMIblgjGPyuSyFFU31r76/FqPeUIIc0HF32IbhvEO
	slzyzE/0JrKiASwt65GzP2j5Px3Ia/1ie8yiqcjXB6IQHT8Lqcs6Ax6S1UM8aJD+UGp4Bejia8c
	t/cfMC58wOHjbs1GbnbPtF0QgtYxNxI7d4hnzM/IxE7wuRnFGrcFslc+reZ5wEwpV/tsDedl4Tj
	pgpkYVfUCGWpwJ4pvjYE7oi/YRaICA3/DXtyKgzAgU
X-Received: by 2002:a5d:64a7:0:b0:33d:ed4:5c86 with SMTP id m7-20020a5d64a7000000b0033d0ed45c86mr19163056wrp.63.1708599875505;
        Thu, 22 Feb 2024 03:04:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpewoJ9W364Ff1KDBjA8Zc5ZjfiO23bT2uLmEKhAJPs3RUjlSAGAgHPKrynT7Ak7RCEfygdw==
X-Received: by 2002:a5d:64a7:0:b0:33d:ed4:5c86 with SMTP id m7-20020a5d64a7000000b0033d0ed45c86mr19163031wrp.63.1708599875005;
        Thu, 22 Feb 2024 03:04:35 -0800 (PST)
Received: from [10.43.17.4] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id k1-20020adfe3c1000000b0033afc81fc00sm19854958wrm.41.2024.02.22.03.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 03:04:34 -0800 (PST)
Message-ID: <764b4743-a61f-4e95-af07-d53c1e842e64@redhat.com>
Date: Thu, 22 Feb 2024 12:04:33 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to resume decryption on LUKS1 in-place
To: cryptsetup@lists.linux.dev
References: <cd29a952-c9ce-4aa0-8903-a79c325824f0@gmx.co.uk>
Cc: xndr <xanda@gmx.co.uk>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
In-Reply-To: <cd29a952-c9ce-4aa0-8903-a79c325824f0@gmx.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 21/02/2024 18:22, xndr wrote:
> 
> We followed the steps here on the Arch Linux wiki by converting from
> LUKS2 to LUKS1:-
> 
> https://wiki.archlinux.org/title/Removing_system_encryption#Decrypting_LUKS2_devices_in-place

While I greatly appreciate what Archlinux community does for 
documentation effort this particular hint is quite unfortunate. The hint 
has mistaken the cause and the effect of a dangerous experimentation and 
on top of all, it is outdated (as advertised under section 1.3 heading).

1) Up to (including) 2.4.3 LUKS2 clearly did not support decryption with 
LUKS2 header put in the beginning of data device (regular LUKS2 device). 
Someone tried to force
cryptsetup utility to bypass the limitation by making header device and 
data device the same via cmd line parameters. There was a bug that could 
not detect such dangerous case and initiated decryption anyway. We have 
patched the bug out ASAP. It definitely did not destroyed data but 
decrypted data in-palce at the original data offset (which is not user 
friendly and that's why it was not support from cli).

2) Since 2.5.0 you can decrypt LUKS2 device by specifying a file where 
LUKS2 header is migrated for the decryption to be possible. See man page 
cryptsetup-reencrypt, LUKS2 decryption examples section.

I'll suggest edit to the wiki mentioned above.

> 
> Unfortunately the device suffered an IO error at about 85% after issuing
> the final command:-

If you have suffered IO error due to HW issue the best thing you can do 
now is copy all data to a new device first (by dd utility for example) 
and try to finish the operation on the healthy device.

> 
> cryptsetup-reencrypt --decrypt /dev/sda3

If you have downconverted the device to LUKS1 before the decryption
you'd need to pass the original device UUID via --uuid parameter. LUKS1 
decryption uses files LUKS-<UUID>.[|log|org|new] to track the progress 
and to safe tempory LUKS1 headers. Look for those file in work directory 
from what you have initiated the operation. See cryptsetup-reencrypt man 
page, --uuid option.

But again, migrate your data to a healthy device first, provided the IO 
error had originated in a HW issue.

Also I'd recommend to update the cryptsetup package. The 
cryptsetup-reencrypt binary was replaced fully by "cryptsetup reencrypt" 
command (also for LUKS1) in 2.5.0 release in Jul '22.

> 
>   From the man pages it might seem that the process can be resumed by
> using the command:-
> 
> cryptsetup reencrypt --resume-only --header
> luks2-hdr-file /dev/encrypted_device

That's for LUKS2 only.

> 
> However it seems qualified by being a LUKS2 only facility. Should this
> command still work on LUKS1 or is the process (if there's one at all)
> different.
> 
> Available are copies of the headers (LUKS 1 & 2) in text and binary form
> and what appears to be a log generated during decryption.

If you have converted LUKS2 to LUKS1 before the decryption as the wiki 
suggests there should be only LUKS1 related logs and header backups.

> 
> Any counsel greatly appreciated - thank you.
> 
> 

Kind regards
O.

