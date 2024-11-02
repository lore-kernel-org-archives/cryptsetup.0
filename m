Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7F71ABEB0
	for <cryptsetup@lists.linux.dev>; Sat,  2 Nov 2024 23:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730590483; cv=none; b=CcyEVZrxVkAV+zzMRzBfMNdDi21lkdrLqSR0bhCZZAk3kqmTBxBwbW5gFO1W7zaRZck1AyZd7j8V22GaYHatw9V9THxyzKs6j1RDTaj70PdOFpy3Fj0/WsXQa+ThyZ/jtUvO+Zpf9mC79a28G0GR6Ci2EKo7lzaq//+G1KL+CdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730590483; c=relaxed/simple;
	bh=0KCoqswfoWl/TIR/7maUaLkTVNghkbcM37s6VZ+r91M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hO9ASdibU5wJxAqiAo8MUrqoUAQ2opp1Tnnjq5HzdqXHil6IV3uHGDEQYw/lLbnNBGVfhccUvfknBQEuxivWwsPcui3wf0B0cV0yc2wGhNuKdllBCsr4Zju4JRpANMecTwxEApXKoL3+PWPcpgHLolbvu/rG6C+YZ3l+o16Ob0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jlhmwq5K; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jlhmwq5K"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d5aedd177so1927086f8f.1
        for <cryptsetup@lists.linux.dev>; Sat, 02 Nov 2024 16:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730590480; x=1731195280; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lFJEWWs8XpuIkSxD3CqecIe4R0FrV3HhsRYbOwj1Io8=;
        b=Jlhmwq5K2SOZ+/JCiqkmcyisaH5h7gOEFPFz5cB8VSNsAGGnGPCFMWpI99i2q1cJ3t
         mBVjU4nvJUjLK6FyDdYSC1+wDn/isRJDCepWcUTv5wZbyEft78ARVHva3ES/L+DE+FLI
         1aMe8S+OlQ92eah2789dX2f24467rhAYORhZw7rwW0DdFVQ3Airux6wKxIAOhpubGeDL
         f7EuVwq0sc6x8g6vynh+pst7HwrvCnqP1JiEmCy+uSAcAzfbuxV6s3LUH18upuGmS6zb
         v/aDOylqn6zSpXIBvJF0oY7Kk7ELGKHM5k9w8ncbtG5Xo82UBJdcVToFcxOS28kvPsUy
         n7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730590480; x=1731195280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFJEWWs8XpuIkSxD3CqecIe4R0FrV3HhsRYbOwj1Io8=;
        b=foOWrzQJPs/K0jsTQjQO9CbBBy1XGI06k+94PrQUolq39A8fA+kxfYU6j85ffUYzZq
         xGGj0Hg1IrxbKlAsualFQBW7y9ZNbnLMeIqY2tuIQlu8Q+6GfeXXrNnIaD/qviv6NFfe
         zvXZttXQujjWBqL4yWofZbTbZuGmHtwlwM5J9V0/ZSIWBK71eyco4eWCbMR5Ot74t1Af
         ytj4AllsRBGXHDYpuTFlBOkUCZMzprkw2Uyz+nIcj3wPDNgGh4nqdAigpHJjlAMxMzTi
         YAD1U20Rt/Hcy1bTMg9Mju0gfDxS4ROqiba5dEfS/9QW1pDoY8xYLF321I6i8/ZPwLHd
         gg0w==
X-Forwarded-Encrypted: i=1; AJvYcCU8fxrtQR6Bt3/ATs6y4whDIKe87Ddx1CIJ0uQnjnmtXPlVO4R+dV47S8p669h+YpaxR6CioNWy0OZ2@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3Hy6R7go+SuqiYn+8mVmvNnrpSQQC3y5hvO5Vuc0wOetKFGn1
	fgCh3mo30kTK6ssPXL01UxwoHizrNieuTJb0WiMYHlxGUeyTdcol0FAVvGtd
X-Google-Smtp-Source: AGHT+IGGLq2c3pN3/IT5d7Sl/panRZ3WdCR0Q2A7MJqB7lFinvcgVJWuKvH1SstcuNMtHj2yGxMfVw==
X-Received: by 2002:a5d:6d05:0:b0:37d:4cd5:fff2 with SMTP id ffacd0b85a97d-381be764d8fmr8354475f8f.6.1730590480182;
        Sat, 02 Nov 2024 16:34:40 -0700 (PDT)
Received: from [192.168.8.100] ([89.24.32.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e6b5sm9272944f8f.88.2024.11.02.16.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 16:34:39 -0700 (PDT)
Message-ID: <962b6cfb-d47e-4284-b044-91dd38858e0a@gmail.com>
Date: Sun, 3 Nov 2024 00:34:38 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: device-mapper: reload ioctl ... failed: No such file or directory
To: David J Iannucci <pelcgfrghczy@punchcutter.ml1.net>,
 cryptsetup@lists.linux.dev
References: <1730260948-20104-mlmmj-67cc752c@lists.linux.dev>
 <444a19f7-c557-4b7e-aad9-202a3f2e4876@app.fastmail.com>
 <1b63da83-8290-4d15-8f58-adf5ca6d903a@gmail.com>
 <12f16036-a407-4ca7-9708-1c0f751f5e5d@app.fastmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <12f16036-a407-4ca7-9708-1c0f751f5e5d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/24 11:53 PM, David J Iannucci wrote:
> On Wed, Oct 30, 2024, at 01:10, Milan Broz wrote:
...

>> I expect that you have device-mapper udev rules properly installed.
> 
> I'm not sure - how can I check this? This is a fairly bare-bones Gentoo
> install and I'm not a big expert on everything that I should be, so that
> might have slipped through the cracks.
> 
> But...! I just found something... it seems I am running a systemd-udevd,
> which would not have been my choice... I have taken steps to keep
> systemd completely off my machine, so this is a surprise. Will consult
> Gentoo forums about this.

It is ok, udev is part of systemd project now, but can run without system
(I have it on my testing non-systemd Gentoo too - it is expected.)

>> Is there anything in syslog?
> 
> This is what comes out in /var/log/messages:
> 
> Nov  2 16:31:36 linux kernel: loop0: detected capacity change from 0 to 209715200
> Nov  2 16:31:36 linux kernel: device-mapper: table: 254:0: crypt: Error allocating crypto tfm
> Nov  2 16:31:36 linux kernel: device-mapper: ioctl: error adding target to table

Ok, *this* is the issue. Some kernel module is perhaps missing or misconfigured.

According to log, aes-xts-plain64 should be your image cipher.

Do you have aes, xts (and ecb, which xts internally use) kernel crypto modules compiled
and available?

Does "cryptsetup benchmark --cipher aes-xts" work?

If so, please send me tcryptDump "cryptsetup tcryptDump <your image>".

> p.s. I note that simple reply on this list goes only to the sender
>       rather than back to the list, which is maybe the way the list
>       prefers it? Though in my experience most tech lists like to keep
>       this kind of discussion on the list so that more eyes are on
>       things, and solutions are documented, but if that's not the case
>       here, kindly let me know and I'll use simple reply to individuals
>       from now on.

Yes, please always copy reply to list (unless it contain some private info).
This is default config for maillist server, just use reply to all.

Milan

