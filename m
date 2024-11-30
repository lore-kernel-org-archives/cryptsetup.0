Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE01192598
	for <cryptsetup@lists.linux.dev>; Sat, 30 Nov 2024 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732985153; cv=none; b=S21ufZw/gXsUQIdGFAABlRh0KHZ1S1dDUV77jcUSRRpXd54GTKeyMCpjSDP6oiYoiWn3n+aqNXsaAeAaodXcxIFRWj1yUmrBsrGn6IVTdJo7lrw2i6not3fwAvtqV43BAWPLiYySs1KIuFPBeZ41ZcT36xzYD/fy1b4Vq8Pwp+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732985153; c=relaxed/simple;
	bh=o8xElPTKpmfBUYECItdFEy+2xIlMUbPYTIrr4LzIrJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uQ0I5b8jZXYM0cjn9FXyNtGjvfdK4Pets7wfiZABecxu0BP8sSp6oWbCQvkBVvBD0Nnd4dnKFt2CnvYp/ig7vvGlVhd+gugpxfqClKi5ZEJoOqQZwTIOVBzN/JZkpozqVXCU1gHMwse+oSPN1F5DK/7MUfI0hRilrGcJC4MF3Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSUBs7/P; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSUBs7/P"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385dfb168cbso993071f8f.1
        for <cryptsetup@lists.linux.dev>; Sat, 30 Nov 2024 08:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732985150; x=1733589950; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o8xElPTKpmfBUYECItdFEy+2xIlMUbPYTIrr4LzIrJ0=;
        b=dSUBs7/PGV5M9Z8LjQ6rL5ZEfWIRF0HYbdE2XvprDoffqq8ruBnF7QaPm8uScf1Q77
         MztpcSdrKOHRvDW5CNTeFamK2dMFOKLBPHLoa47lUerV9KEPbuTlkFhddRcS54KxWj5n
         gFRqYKP0jAbVGupjPMVNqd19ma34Cwz6CAo/xQ2Mx46SrYLLgK7B9jZIWSy4gkQG0qf8
         ZGbNz/1ECX/lTC7y0o6IVAfHtYa8/GsmfLYxld+H3jQsqJpOV3UGAFE6c4mgEdLP/Yay
         bnpIOFw0kqEEucjcoINSpfYbGYwL3WMsWPvg9Aw31dM6hOLAPB5lGUl4vHvG6szaTZaB
         F9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732985150; x=1733589950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8xElPTKpmfBUYECItdFEy+2xIlMUbPYTIrr4LzIrJ0=;
        b=hIW2K9/OQWfOIJ4rqU5dhHKYF+yQQDTUaOamDz7oBbes4znhC87R/CM2KlGT/c1jzh
         qbYkpRBwKArYG/zIVjHmWO/WbS5tW3mossTMPtmCKEqbvP83k9GIHD3gSc9UMqHxUFAo
         lMEEPjUaeKUf2TXZqQnu8Ui4ayoolfAsVAYS7SZiC1zKB7yBSMgKIyaYBM+ktryuleEO
         weMwrME331Wvo/suM5k2gjKqPqIhh+u8uPLNhGM+FQKEGNvSS1erMSwu+bF1hUnxze2+
         LLBHqVH4Q2bUMrY0PQ0IozmKRoq7l6GVqMVD9UK/uxu0gesgkFQER4bEvgCTXd3O9LWp
         DTig==
X-Forwarded-Encrypted: i=1; AJvYcCX0Bd7jjqTR2FrP5p6bL5B2RZdYaTweOcrq4X6xXR3mliE3CnPXWRbiAE5iFxwpQXIV45t2V+ZK1mte@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5qQwIqVbHH7Zn3GgRZzi2+p4o7um5Mo7qJ8IArwbvk18PMNi7
	8yfdzOP/CDoI+ptimV8lShSCHQxrLWw2c6Zvi/MAJWYBKalF6Fa/
X-Gm-Gg: ASbGncu4BBQAHd/Ez2Pwgt8E2EqT2xd6sFwoEi63DTJ0/QU78A/bKWrr46LE+KbTqJN
	i7k+a9Cu2n2ncZeysT6ccU77U/f3+o3IUy97uJ3XqS9PgO7RFEh6b2CEAl2dYj4pugoN6m4KkEZ
	haM2TedXzt1SKoz4xWkl06oCaC3FdVIIS50GcqEMLO9ZsrPjdxwfzUTDqFsinN+z1P1aVZqzLXk
	h/jhlgiYvWWKdZ/c3t1aNMMrpQ/sIHfcJ1nG0k6l2+VsXsOmo1j1FYY3RzAoocw244k0hokmAc=
X-Google-Smtp-Source: AGHT+IFRXe7Coa8jsxzQKvEpTczqXyJPqWSE9D5t9a28qHMck4MLBiD0jrH8oM0j5gIkdvVRQEH5DA==
X-Received: by 2002:a05:6000:2cd:b0:382:4485:2db2 with SMTP id ffacd0b85a97d-385c6eb8d9emr15552459f8f.1.1732985150015;
        Sat, 30 Nov 2024 08:45:50 -0800 (PST)
Received: from [192.168.2.30] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa763c50sm121414055e9.12.2024.11.30.08.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 08:45:49 -0800 (PST)
Message-ID: <65f3cf0c-e421-40d4-affe-e757fa68f6c9@gmail.com>
Date: Sat, 30 Nov 2024 17:45:48 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: echo "pass" piped to sudo tee cryptsetup luksOpen overwritten
 LUKS partition
To: Rafal Babinicz <babiniczr@gmail.com>, cryptsetup@lists.linux.dev
References: <CANbVO27bAb9E+Vt6k1J4VGSj18aY950Lq=ZqucBDJbfO4NLThQ@mail.gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <CANbVO27bAb9E+Vt6k1J4VGSj18aY950Lq=ZqucBDJbfO4NLThQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/24 2:36 PM, Rafal Babinicz wrote:
> During disk replacement I rendered my old LUKS encrypted disk unrecognized (my verbatim shell history attached).

You just discovered why LUKS header backup is kind of useful.

> TL:DR can I revert what I did there? Especially that line:
> $ echo "passphrase" | sudo tee cryptsetup luksOpen /dev/sdb3 enc

So this is the tee command what overwritten the header, not cryptsetup.

That said, you perhaps overwrote only 48 bytes.

Try this:

# create a fake container
truncate -s 16M fake.img

# format it with the same cipher you had in your image (password is not important)
echo | cryptsetup luksFormat --type luks1 --cipher aes-xts-plain64 fake.img

# replace these 48 bytes (it contain magic, version and cipher only)
dd if=fake.img of=luksheaderdamage.img bs=48 count=1 conv=notrunc

Now the image is LUKS1 gain, try you password.

The one you provided is not correct, so either you redacted it or something else happened.

BTW with LUKS2 format this would be fixed automatically as there is backup header.

Milan

