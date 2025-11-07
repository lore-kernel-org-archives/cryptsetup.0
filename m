Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A26A3016EB
	for <cryptsetup@lists.linux.dev>; Fri,  7 Nov 2025 09:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762508278; cv=none; b=aPq3f57ZSWnoNI3aJ9FI+/TyJ7YBUtlimApoHEBGqzD7CtC31VNH6wSnb48ZnU0JlqUyA0F/P+cm4te9GIRAK1XqeS5DqgIzdnzUrR2fDtMTmSgGbsqq03PQgi2Y8AGyJ+CQLIIj+wHxR23+trmZ6tZreA0DHNhVsidtFT3l6l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762508278; c=relaxed/simple;
	bh=m3QTVGURJL4exPHwDN0KSRrDRBBfHE/MF4suzSd9H6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=p2KW0mMXEf7/17yuPNzJ3oLiSUIj+RcaarIah04NWtCH05bGDm7ESp600r5iILVTaX6zX0X5UIkOmmpr3GHmy6Rs+NLYOBJI5UuI+jNJS/Q5geaP1Qv1edF3A3oUu3Oq9U7cJxbGRLlSzTNqOqF/upA7jWAYdDRRdQnwXhaxRaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEVOCCnU; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEVOCCnU"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b727f330dd2so78088066b.2
        for <cryptsetup@lists.linux.dev>; Fri, 07 Nov 2025 01:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762508275; x=1763113075; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oQaI8+vTMB3gijTWTTTaGk8swPCnsK/wm+fYxk1fC7k=;
        b=OEVOCCnUAwEjlSRL2svn8K2gFbNwtgnq8o7Cy7rqbqnRaVoJp87THcUnoiupNlXARk
         98n/vB03U4c5mnYH2H0ed2vHbON2vPGra7Y61iIdPw5VGwsESKHXGXvLjK1Qk48vCPgl
         vdZppLtaB4fbyZLhTxzAzVE2fzB2NTT9T+Ma2hr4jX3wb4csscNx4M2iZZUYvEaYvKDQ
         wodawQas9fSbjVZ9+7nIMtPSDvssfXBhk3sK1TdsQbzyooQdygye9gsut5P0XruNRf3Y
         k39t+mjSkag06KL4stRuwveOhND9/oYpJhmQnv+9Lzt4WvB4AOaaHRB8pQOsGG1rLkm9
         jpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508275; x=1763113075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQaI8+vTMB3gijTWTTTaGk8swPCnsK/wm+fYxk1fC7k=;
        b=ZYBHHLtCxR5wl21v4IVACzxnAM+T+zU/xcPXVVSdVL0SPXJxrTtKd6rO7mWYSjo3yl
         igM0C5R+MEyUKhKh0vztXK4u2A+2xgqO5KXtmzA2YeO3bdXKzQsdD58UFQ2LeppDgXV3
         nsZGxW7sjVlv6fLkNhzTYWeiVNn5pcQesu5arJ08mwkzrAe1Wlqqd9ibR2j1Qj400vrX
         QfU58Si/0fVcnOOMxOzwu0ykmlKaO2yaQro9fJ8Okl2mofNeYGcHvZkl7ZJUQGcCmS+F
         2QGERTeMZx2j53lTMc4NNEJgJp8s6lyx/+2JSD9xVzkMwlf2KOTgWLjhEjbU/nvWTpCa
         Qykg==
X-Forwarded-Encrypted: i=1; AJvYcCXRVMwVZ33GMg2LRi+nvu9fk4i+xvVHuCaPjxbiUUNjntbR+cD86tvXHAZX7lIaXJvKyyvoefZx1zmE@lists.linux.dev
X-Gm-Message-State: AOJu0YyVLqm/vyHJeegU/pbvfcx8lpadxeUEyGxZHOUznjRDrH64d1Ik
	xyCnag9pK7Bq1p/KEk7EmAQcrKQpFaHH3lAqgN9up/j7C8aGZz0ZcLB5
X-Gm-Gg: ASbGnctWePPNscHCP4q6bt4VaOkiO12of3KPsArNla4l1snOi44s6E88jlpDU8tN2eA
	1UwikbqLcL7advUHOsq/wz9IDd5edqZSyIMSVAmx9O6wKNe1EhEIE12vQGZlbQHH7tDii9qzIXY
	GJX27qGYMk8NIjjUSIOF0gKOfbB8G0KL0owd1OJlb9ZpKtxKH71PM4Jj+AqYamuOC9Oqob9ZsA+
	ieR7LpBkqkqVRVxWsWZMBxxrX1LZ623MXcJvw3vn+mM0olb57HigVhmgIjcw2VJKZO5AyqBN2zF
	AX5CixhLrlbP2ZiTYmilABNnWJudWptRyFeLjJxaXdx7vHaUl5dHjwI1IMAW88MmJU+6favU4CS
	VHIjP/cIiiK4/lEU7k3K6y2REZzMWiyHxG7LwmyIgsEoVfVO8XNbnb9Djb2k4+6cfIZIHYILhKI
	2emOSwmqILMed6TuKF/g4u2bVafgRT1QMkDFR/
X-Google-Smtp-Source: AGHT+IFRnSNu9/NqvPT+KHwWVW6EIn/oXYcw903o4DO+uoRaXB67qIu26FZkFhrjLCt2i33/YX6M3A==
X-Received: by 2002:a17:907:7f2a:b0:b40:8954:a8a9 with SMTP id a640c23a62f3a-b72c0ae3b30mr225403466b.34.1762508274419;
        Fri, 07 Nov 2025 01:37:54 -0800 (PST)
Received: from [192.168.2.12] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d3c0sm199078266b.36.2025.11.07.01.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 01:37:53 -0800 (PST)
Message-ID: <a4061a7a-c3f5-42a9-8c06-4b85ea94699b@gmail.com>
Date: Fri, 7 Nov 2025 10:37:53 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question about FAQ 5.21: "Why is there no "Nuke-Option"?"
To: techmetx11 <techmetx11@disroot.org>, cryptsetup@lists.linux.dev
References: <ycc43yz54ybgnal5t3rcment6vjvanalx2g2z6rly4wxxpietn@nn222ctnfqaz>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <ycc43yz54ybgnal5t3rcment6vjvanalx2g2z6rly4wxxpietn@nn222ctnfqaz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/25 3:38 PM, techmetx11 wrote:
> The outer configuration can have keyslots for the hardware security
> chips, to decrypt the inner configuration (which includes the keyslot
> parameters for the duress password and the normal password, and other
> LUKS parameters). Not only does this make it so that wiping the
> HSM/TPM/etc. permanently destroys any chance of decrypting the inner
> configuration and thus the rest of the hard drive, this may also make it
> hard to determine if the hard drive is "booby-trapped" just from reading
> the LUKS header.
> 
> Why was not such a design considered for this kind of setup? (if it wasn't
> due to complexity). Computers have advanced so far after
> (persumably) this FAQ entry was written

Cryptsetup never communicates directly with TPM or HSM; it only provides
space for storing metadata through LUKS2.

Integration with TPM is handled in systemd-cryptsetup; it is not part
of the cryptsetup project, but rather a subsystem within systemd.

Moreover, such data-destruction options are not user-friendly; there will
be many users who do not understand the concept and will wipe data by mistake.

If you want it, you can easily implement it through some external tool.

The nuke option will never be supported directly by libcryptsetup.
If you disagree, do not use LUKS. It is your choice.

Milan

