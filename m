Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB92349CD0
	for <cryptsetup@lists.linux.dev>; Tue,  2 Jun 2026 11:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400498; cv=none; b=pgmXX3CKcauhwYN/q1suj0U14HgaMtaF94f5PFg57+ThlGnhLVwKUCs+zl+lQMFVLSe/jwaKE2hYJ94h4d6gE5JQODsBgAYchW02feWqYD8wNBc+AQOHxHAjJTYBF499V6UdQP/Gf6mGKmapIEK9ZnXB8Skoj2q0oiJROVWeRvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400498; c=relaxed/simple;
	bh=4FFYdnFmSH3ICT8GCX0NCVWz/tWJvOXW4j4b6RPinSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=MeLna/8EEZtJAtOlu6C//yZujlxmYAYlUGBBPVv8cTgJc4X3442lQWQIXYd8UucE9GqThhXV4tVnGfRuqxkt3uJm07UjEB44aKwCvXGyOGnGHhax9CjnTcH1ikczYE6odwnY8IxAFKrsQSpc1nUdNjCk97AWV8y7BgC6N+rpr3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3166n3g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3166n3g"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490ac357c55so19049475e9.1
        for <cryptsetup@lists.linux.dev>; Tue, 02 Jun 2026 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400493; x=1781005293; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OTO+8+zSsxJQkemDOGZAe6wyzWsnill3RBEUtkNA/Os=;
        b=o3166n3gTr4hJI/IEF2dXuVcM38Kj6z7R8oi3ICYnBf3fDPom70qJOanOy0+Ijquei
         8r/q0vtr4iu0B/af4GdJJ4AK4u9zJf7VFTgOuYZPLjQoaiP86iKKuL7q/wYPn1+O9jQr
         gOadqnjpYh+u2MkmOZjKKnVOTQh6syV82af2DHK30MgQU/cq0wzZnSxFwKfLvdcllstI
         SHNlkQgm1/LI5IhIvT1J1cpHXFAQHbbWwCULFFaBl1GC2zH4gOzJ2dtLfcBhMZNv3ykT
         dgURrfr2WRSlm7BdSfYhjUismXmvEwPS5cBugz1s9pT9U3AwiLMkXWm8eiJKHzziryB+
         fdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400493; x=1781005293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTO+8+zSsxJQkemDOGZAe6wyzWsnill3RBEUtkNA/Os=;
        b=oU91il+0xCwW7UiU6/uCcTPyKxoG1OIAdgg9tDBrQRU+YdopVSr4LBnLgU1sVz1xuO
         0DQn6uwaiBVCGczz2/TiyE3vtmy7jwltVEauDrpmCtVWxM+MmMNDe6BJDVBHePseJcmf
         wmVxk349jeobdIic76dD3F8ZXBTJgB7ZTxR6bKlyIgINiK6FhOeXcgmAyDWQOi1n4Ts7
         7OxVu95VKREGwWOYbvYbidRwend/IFAPKRXxf8XrST4dPM8qFR9mHq62tW4I6XY7azlQ
         /imsEIVuF8T5DQ2JRVrE53pCjcRKSUXBfZHD5Z1RBqyRnwMh3ocaWQuyNsqxvbDM3aSK
         +8rQ==
X-Gm-Message-State: AOJu0Yz9ycHbVsjltCrn57sWznL1ySN6SQjWz0lFH6OMsT0lUg9RpCiG
	0qYCkoatVcaMUWJXb65r/Hjin3h9kcSriJNi1oItyc10tpxuxWY2VnYZ8shDAg==
X-Gm-Gg: Acq92OEtfjY80KaPGO4FW9xIVsBGHHNhlfTzackDI+Lg36YDfnMidU8WWBdwqE6O49x
	/+NEg8IMYZ1SP5Ls/pgTp05V5UzskTXd6I+3waBMDP3yQHxNVf4PdGVNkRV1G0dGr9Dap5T9TE5
	b9TAitCIqS92TMoVF2jFcY+nvQzduesq8oCkFYgFZE47g9EzKbxpZb5DGMJR6Y1ND6HZS6tnoMY
	CML0UkgRdBnCeEfk+q+IRiyL6xUxruIhtq7Wm2riuOsdu5MPsvScscXN7gE6djVep96mhvlKg9Q
	shhYFvOHZLwqEhKNkBHoeo4PUUa8D/85tbM2KYRWjlrKr24eS8r4Ftwctyx3Hf+Exw0nM+oPq2G
	xw7XmBwPX7r/Nzgc9tUiuPm4bXyvY0Adl8x1wjtvCawmtbFs1COoNGPxYnTWLLVzfOcoh43IfH9
	bC+EQNEVfiK00fGcpL127gnHV7x7FZwu2pkI5cCCk=
X-Received: by 2002:a05:600c:524c:b0:490:52c0:744c with SMTP id 5b1f17b1804b1-490b0885319mr73694615e9.20.1780400492500;
        Tue, 02 Jun 2026 04:41:32 -0700 (PDT)
Received: from [192.168.1.220] ([176.74.141.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a04e2sm29549599f8f.1.2026.06.02.04.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:41:32 -0700 (PDT)
Message-ID: <6251d03b-d923-4d64-87a3-1e5aa13c5e94@gmail.com>
Date: Tue, 2 Jun 2026 13:41:31 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add mbedtls to PKGMODULES
To: Anton Lundin <glance@ac2.se>
References: <20260601203701.1740656-1-glance@ac2.se>
Content-Language: en-US
Cc: cryptsetup development <cryptsetup@lists.linux.dev>
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <20260601203701.1740656-1-glance@ac2.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I added the patch to MR for review
https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/931

Thanks,
Milan

On 6/1/26 10:37 PM, Anton Lundin wrote:
> When cryptsetup is built with --with-crypto_backend=mbedtls, the
> pkg-config file for libcryptsetup should include mbedtls.
> ---
>   configure.ac | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configure.ac b/configure.ac
> index 52ddf11b..260b0ab6 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -741,6 +741,7 @@ case $with_crypto_backend in
>   	openssl) PKGMODULES="$PKGMODULES openssl" ;;
>   	nss)     PKGMODULES="$PKGMODULES nss" ;;
>   	nettle)  PKGMODULES="$PKGMODULES nettle" ;;
> +	mbedtls) PKGMODULES="$PKGMODULES mbedtls" ;;
>   esac
>   if test "x$enable_libargon2" = "xyes"; then
>   	PKGMODULES="$PKGMODULES libargon2"

