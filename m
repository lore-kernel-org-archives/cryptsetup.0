Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2F3182BC
	for <cryptsetup@lists.linux.dev>; Sun, 11 May 2025 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746989175; cv=none; b=CrH0tsTaCzvcF5HDWPmg3ssBOYE/LuZ3awdW7QKxmdNcwY8Wz5iO0riMMMxEvNdEZHYzzSS31orhNlibngaMFI2n+UGsGXaG/IdOo0v2rvipIS4f/gwNjwTNyifKQlR3Bw5Zdj3MqmyHR5E4Ub0lmk4qnlFHS+QJR2y0asBchjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746989175; c=relaxed/simple;
	bh=zktidn1w3NKHxRJ5kdf29Yh5e9TnpcYgquB0ntzAsvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Onzwvw8l3D1ww23w+3ifGEHiZ+Z9OYTPLN7O+3H7XdxWl13HmHdOWRkkbM0zB4c8Ih1KRR/nGvZ5B/kK1dWyfiDNYwF9wnYmhrPfhvW9NjSGJwq2gtWFpJTrQgfrEnDDfnBub6TPRavEf6/aIc98PtQX7qnNgWYgjZW5ci+TgxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5Fe0tqA; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5Fe0tqA"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so1877094f8f.0
        for <cryptsetup@lists.linux.dev>; Sun, 11 May 2025 11:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746989172; x=1747593972; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vB3cis/0Umh++wKwKZq7Eb3mrhT3WI0d5Hc1tvhBC/U=;
        b=E5Fe0tqAa0x3haopSJs3vg1E+TAOGshQUj8gBjjhWMg/DQWfbg4U85DoE5G2QXWyyr
         fNv/PcFtRr+usmElGPGsFM77rId+T7pAXsyWhVwhqUTIIfJVokdcTD5sLzHFRfWA+4bJ
         0Zx3nn/pAq5SPVII2RphaNnjhMDj82YGLV4VAxWUaGdI/W6LnCQeFuyJg7Xc6UDlR/zR
         EZpQCPNa7sG1ETKRlbvUM+jQ1e3Q6OiVE0lA+Aa8hrkuE7IQJh0P7bEyFVStfPGBv6sF
         h1pxHntMOctf3JLYgvkoSWoNWpJaopARPzBHDlwDRm+mthlZp2gSNsJ/mlxGxI7ZdH8O
         n+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746989172; x=1747593972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vB3cis/0Umh++wKwKZq7Eb3mrhT3WI0d5Hc1tvhBC/U=;
        b=JjM4ab6XpjceUpWwQjI4caY4+feksSSv6NzcIR7Q6I3q/IjpZu0xFjnQ0QZtDqPlej
         nyxv4mzexd3IXD3bmUfZuVyyyiYCtgfXm/VmJswVjBm4TEnAsqpDi5brLWJX6IYR7sih
         PhCqSCyWQHKIXUWns4BUp1I1QZO0pcMdtiti9Cq9WWDTSiTvTQchndLbiwtCxtIzDYyk
         4c0xIbBTVrjoa09E4+rQ3bLGMcym/OHI5yKYECezhZyqnKJFyScmCHPbLfvtIIn9NtYU
         7b+jixVQs6CRbTUwQKY/xKSCGPUFdBBXQiWzi9Sz5KzIRcN2wQOsfvVTF6GMvf0cFB8J
         tiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9RQfrq5cHjRkyWj3Gc9FD1lV9/ZI5bwkT6Sx9CfsAc1p8p80nMyv/Xzsl7zakVINqMvlCJvW+YjK1@lists.linux.dev
X-Gm-Message-State: AOJu0YzmOuFgXuAkcZF5WXWC5Xt3/eh21z75iTcQiXvWC45geN0mqZly
	/PHhNy4KlPcEDgB23/1ubNm1l/lcrj1PPkoNLUcN1XcVcK/twZDZ9AQZhQ==
X-Gm-Gg: ASbGncs0JntwNhRqrOVyNNKzhuFNlpJBY29FOiowQ84M/5RNR1p37alm73KpJ+yzZFo
	zYxGHlz4vJ8EeGo67mVICOQTKTMAWXCKl9WZVIqJcrm0PUerzeR3+WK61GV7k8RF57OyGkp74l5
	K7l2oD9l9FdaehLg96Z3zmnItO3ZUTQpyRRIrft3ktzdc8B4wK/k/OK4YEQx1nDvvU5NIh+9Y1c
	dsLq45mJRKqOKVMZw0SxpT7vMjQa+05Xu7Dyok24Db0t0jQyds2dg2dd9uZQk/x+n+vHrOOcqq8
	3tG22vJJqejHzcHYrBPgjCStr+McBrC3F0FWiXoupJZCN32ELfnGnCR7wV9LVpuFY/o+Ff61aco
	0
X-Google-Smtp-Source: AGHT+IHAWLfKCymmnddQuvZ43otYKNIukw7VjPuw7wgheAc6eCuFbQJJKttj5IVtYHx7+ONO1s6CUA==
X-Received: by 2002:a5d:59a8:0:b0:3a0:831c:dff6 with SMTP id ffacd0b85a97d-3a1f643115bmr8607445f8f.18.1746989172191;
        Sun, 11 May 2025 11:46:12 -0700 (PDT)
Received: from [192.168.2.23] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebd75sm10131083f8f.34.2025.05.11.11.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 11:46:11 -0700 (PDT)
Message-ID: <b5ec8625-f589-40ad-9a87-88c027a4e6f9@gmail.com>
Date: Sun, 11 May 2025 20:46:11 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Disabling integrity metadata verification
To: Marc SCHAEFER <schaefer@alphanet.ch>, cryptsetup@lists.linux.dev
References: <aB919cDdLQfSsb0V@alphanet.ch>
 <f2c3da09-bd41-427d-8e96-61d3a4a80397@gmail.com>
 <aCBe+mX7P2zI4Te7@alphanet.ch>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <aCBe+mX7P2zI4Te7@alphanet.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 5/11/25 10:25 AM, Marc SCHAEFER wrote:
...
> So, if I understand well, integrity with cryptsetup is implemented with a HMAC
> that needs cleartext data (just before encryption) and produce hashed-signed
> integrity data that protects against tampering and is not fixable by an
> attacker (resistant to voluntary corruption).

Cryptsetup (dm-crypt) always use AEAD (authenticated encryption).

Simplified, this can be constructed two ways

  - it is "true" AEAD algorithm (like AEGIS) with one key. You cannot separate
authenticated tag calculation here.

- it is constructed as combination of length-preserving cipher (AES-XTS) and
authentication tag (HMAC). It uses two independent keys in this case.
While we use kernel AEAD interface, it can be split and the authentication
tag verification ignored.

So you can ignore authentication tag in the second option, but you cannot "fix"
it without knowledge of the key.

> Where if I create a dm-integrity layer with a luks crypted volume on top, I get
> integrity, but an attacker can modify the crypted data and the hash easily
> (only resistant to accidental corruption).

I am not sure I understand what you mean. there is always dm-integrity, but
in the case of AEAD it provides only storage, dm-crypt performs both encryption
and authentication.

Stacking dm-crypt with length-preserving encryption over standalone dm-integrity
with HMAC over ciphertext (produced by dm-crypt above) does not make much sense,
but authentication tag still cannot be modified by attacker as HMAC is keyed algorithm.

Use of non-keyed algorithms for integrity protection (xxhash, CRC or plain hash) does
not much sense in combination with encryption, but it can be useful for triggering
recovery in RAID in the case of random data corruption.

> Now, another question: assuming the metadata space is corrupted, but I know
> that the crypted space is not, is it possible to ignore the metadata altogether
> (to not produce read errors)?

It depends, see above - it can be done only in the second option.
Cryptsetup does not support it, but in some related issue I already explained the trick.

Milan

