Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150DA27281D
	for <cryptsetup@lists.linux.dev>; Thu, 29 Jan 2026 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700074; cv=none; b=Uf45cmZzhyR5uUWICzHYmff+T+UKgZIreP1N/I5HyILLppYTpwK+MGt61ZRuZl3g8Je7KpNLJT9oTcGabqDDuuPvzcaFnLW0mxOhINQCXsK/3LmY7/VLmNXMIp8B48ihvm6loerPFA5UHrDzCUwjjZg6Zk6DneotbwNosvu3324=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700074; c=relaxed/simple;
	bh=wbCF1ES5FrRr9jC8oKSP3NJYOwdaNVs+5ni8ZkAJTgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lv/r9jYXBGiOy8GXtA2GEXrIvGo+hUbShQkMTiyXw1FeEyfPIF4k5VtFEmUhHkTeQCTtqX/FXwdCV8JcIBGj/Izb+V4z61ix4xuaBcEM0TH9h/wmiE7LS5Tb99ncL4GCvMeLDEi09bESaS3v/ccE2U2Lrc18jzVnxN8VYN+A2sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmsCto6K; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmsCto6K"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4807068eacbso9468905e9.2
        for <cryptsetup@lists.linux.dev>; Thu, 29 Jan 2026 07:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769700071; x=1770304871; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YwBPPAh53nA/RcOES2i9oLErL3UtQLfooAO/GP18Vn8=;
        b=XmsCto6KJ5z0M+nqH479PLRAXZ4B8IyBZFKfJkPKOjhKu/oOsfTlLCC7nOkHwjvNZS
         tzoV8sXyQ6tdC/hdF+gCX1jgrTEHvxia7bZR9lClft8qYQx922lge6MszkIdFJVkD3hI
         /SZjGznFBJjEKNw3hHlqn2oEj95pKgFhSgFHK5Wo4/S3CWLOG7mgYPWPKUFz4wkCp7Lx
         zt4/iLZ71s5yNjGvOb/jjmcaxKXIfaeI4Tlw+kjt/6LYR44IPvwU3KtkpcDrICUYOAU4
         PBtQ0zhSvCFA0CgYzG5L/yaqB5v/x0IECgkhCqqqhhboLyrWkXw7jOttVwSCPAqo6Wgf
         PLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769700071; x=1770304871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwBPPAh53nA/RcOES2i9oLErL3UtQLfooAO/GP18Vn8=;
        b=jXEb7SlJaVy7mHeoFKhw9XlhdwkzXGz82+Q854UNvOR/DjM3rfaBOaE7ZFHtJ+/dnB
         dz5ZffdaNkPPvtS0ZbfjCWDt7sULs/LRBoZ6Ky79jUGaPo20HsDaZ4wlFJIGUpR/NJEP
         795zwnJrZ5ytZn7fdQrxohP9ZAtHyeXchmU4GduwjFZTLUkNDx1Yvt3KAZPoieEiOnc1
         MT23+OoWAGYcgLlpnkXQd4Cjz/NqUsm76k1cW5OHMi1HaG+wrLkcOqzljSMS1giEdxVJ
         e/i5qyAZemAqgmu3PhkCNEm1ylTbN60fzBWJ2MJoxxMM2vCEfcgtw89vpK5zc2Zqoyye
         3/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWaGMTxL5KCDYsN9DGNVjZ/Jg6Y1sEpnXf4Tdjgphh23PInVJmLcsvtQD6n06Jz8P0hzDh+wrGjP4+r@lists.linux.dev
X-Gm-Message-State: AOJu0YyLY41tTSkxilY7O39ucbu3TKqv6opBBChLJOOvdILtJ6YEkQsY
	ADr5OseGtCGZQZ/WO9Q4Qzmqk5yVJwXcWpWvB6aC4fgQ/Y1kPiAOUSnTa7W5UKQa
X-Gm-Gg: AZuq6aI2gbMhrEXkvHEMOjtm3lIB6z7IbLiB/sny4kG3U/Q7pYHyTZIWz83hlTeyqDz
	caPtWX/Ef8tIF9sssWcYcDOyliYYN+6md/GnLkRENC9lq5hxH2xNRSC1KqXXr26NO4zrigk7AHM
	dGPmgrWw9TTJX0AOAqZpaDmLozAKY1WOiTWqHhmcITgI/OdLkm81TgjazffrK3lIppSORalscUY
	cSEYMIiYEe2JVpzTXBjHPYjV2LmNyAMQhRsJVCgpUJYtqyNqYByGRw0nCDVEjf1rL4qJnHGCKIG
	YkX8QU+XN/8nUoci/rSOXfJqC4nWuXcYSkiABZZ96RCrT+aUuw+zDS3CV4ayXRXerIfAn5bpP+Y
	m/M46TQW0w7FaguKfK6dFKxi/4o9jgDHWFJNUYRp+ULx0zARIiuFpxga/mAWXf82mJdipGo8EOw
	6S/AMlYSrf5GkllRwQtZg8rZ9pvEH0odJ+88TT
X-Received: by 2002:a05:600c:190a:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-48069c6993amr135744615e9.24.1769700071154;
        Thu, 29 Jan 2026 07:21:11 -0800 (PST)
Received: from [192.168.2.14] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-481a5e1b21fsm6345535e9.17.2026.01.29.07.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 07:21:10 -0800 (PST)
Message-ID: <b24e4cfd-03a6-423b-9be7-543500798a98@gmail.com>
Date: Thu, 29 Jan 2026 16:21:09 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: LUKS breaks When using fido key with pin
To: Alistair MacCallum <amaccallum@rosen-nxt.com>,
 "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
References: <ZRH2PF6D297230325546A167E9072E447698B9EA@ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <ZRH2PF6D297230325546A167E9072E447698B9EA@ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/26 3:48 PM, Alistair MacCallum wrote:
> I'm having an issue getting my fido key to work with LUKs, at boot it prompts me for the pin and user presence twice then fails instead of falling back to the password that's available. I have the same issue across 3 different laptops and 3 different Yubikeys. I'm also able to reproduce it on a clean install. If I set it up without the PIN it works as expected, it's only with the PIN that it fails.

This activation logic is run by systemd utils (or other wrappers above cryptsetup), so the best would be to ask in systemd forum or list.

Also, 2.7.0 is old versions we no longer support upstream, so it would be better reporting this to Ubuntu (if they still support it).

Milan

> 
> System Details
> - Ubuntu Server 24.03
> - Using dracut instead of initramfs
> - FIDO key is a Yubikey 5C NFC
> - Crypttab, udev rules and dracut conf I assume are correct as the fido key works if enrolled without a PIN
> - cryptsetup v2.7.0
> - libfido2-1 v1.14.0
> 
> 
> The command used to enroll the key was
> 
> sudo systemd-cryptenroll /dev/nvme0n1p3 --fido2-device=auto --fido2-with-client-pin=no --fido2-with-user-presence=yes
> 
> Any help would be greatly appreciated!
> 
> 
> Kind Regards,
> Alistair MacCallum
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 

