Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293DF166313
	for <cryptsetup@lists.linux.dev>; Mon, 22 Jul 2024 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721636749; cv=none; b=p0MCMxM89MDPqCorj0EMZBZ117miJm55LXuReK9st/Y0wg3uD/O14mVkWHmh66PrUVpliRemm29qp+KwzCuSQSFPBQxXEbTQ8p+swHP0PlGPGEz3P8X1cV0TUx3BJoYb0PN+D3ETEM1sHQ94dGR/PXEgV2+fEdDXwifSFe7B8YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721636749; c=relaxed/simple;
	bh=0cjaMe5K30bfpnyuRWrMffFhzLrq588BBHL6QOIN2RQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WWnLUYERo8Ac9EJk3Fkx++0+wUEd96QwWaQ67m/Yv0I3+YJl4EDrEppihkBmljrexzlmTLAN5SUrjL1bfo5OjKAsxqZbVNfQliA/CsdBT3XWTDm250kCf6VMEEHbM9lPAhwvrcszjCjmDQ3kbr9Y5QvIwlZV5v+OEPGjktkOS4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuxaPgff; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuxaPgff"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a77c2d89af8so411708966b.2
        for <cryptsetup@lists.linux.dev>; Mon, 22 Jul 2024 01:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721636746; x=1722241546; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+vaC8z+wmMrBaQYISwpLQpYOvw+3eBbbRpEvFNHis0=;
        b=OuxaPgffxyxOCbTCIhm/R92RlxZQn9jTdjW61znHetr4uNJZI/PlYrgbj9NNuYBX6q
         bafpmFOkOkLAH1DbHgK/BuXpso9HXenJVnGAltCGbttpm9yYMtW3hytmKFdX+768F06g
         LT702IfJxLm31ELCCus1RJeftm2Z8rmfb6DbuiNgtTBRA8NpBPQYo3oy39H8GTr7uA6K
         uMjIL0fwRg+orgr4AdvaXTXXLicFILB4fcBFGIdzpy1u3fcLzfMX/Lw3yyssRCzT/riz
         PnDtdl8a58xVmDNjIlEHCpeOt1rRC5QJG25SW8FqI8Yai3beVKXHXEOfuR2fPt0SPbnK
         74zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721636746; x=1722241546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+vaC8z+wmMrBaQYISwpLQpYOvw+3eBbbRpEvFNHis0=;
        b=Jsb1w8+ZjZ9EVQaSvUoQ8Q1FGPfn+YDJRtvKPPQh+2yA9TB0hXw+oyBBox+gQUpcaG
         AQ7Ry4flTzbT2ZQ1qeil6fhzw7dQ8flOX1OINK8hhkeZIBmRO38uyM1+nZEU0vh25JGC
         HgFLyuH/TotjZBnZlH4vU/zqZHtY5D9BjLtK3ix+e2/FVZPfmIc6D5J6gpfRPZ+dtL2j
         BRPnRx+ZxsgclqHLX3gwtTIghEz2bJtojvkW+MSGOdZqsqju5dbsIRFQQlX7l0CCGQvF
         qqfIRyemOtp6PyfG4sYXEj4jKV33468CWOcCPGpZJc36CX+2MQzXs5zPGlid2eKfBeEr
         g/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNXiEk9TbudhM23H+BsPU8pV13eVClS2XkHXn3EZVoduf7xUXy/Vsh5P4VgHglT+MC4PbRz86V76bkjHetEcWjDupdLT8FyzFP7A==
X-Gm-Message-State: AOJu0YzIGThywXorX7gIS2czHa0ngCtWcFOSA4/In3B2aPka9HG9B1oM
	vFzjEKSciO3PxcYQAuQ5FHvAvASj0pV+1WbVNetSgdNyKTyRvgrjjPoB9A==
X-Google-Smtp-Source: AGHT+IGNhflR5rBUk12ZIhaha25GH1BIewci4sN3srsF2DYnew84XXUk1KuhNmmWR/1xSleK3w2zlg==
X-Received: by 2002:a17:907:3e1e:b0:a77:ae4b:7bf6 with SMTP id a640c23a62f3a-a7a4c4147aemr439893266b.54.1721636746170;
        Mon, 22 Jul 2024 01:25:46 -0700 (PDT)
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c922b3esm389222866b.184.2024.07.22.01.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 01:25:45 -0700 (PDT)
Message-ID: <95b76771-4356-4002-969a-c0ff1b3594a8@gmail.com>
Date: Mon, 22 Jul 2024 10:25:45 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cryptsetup and hardware accelerated AES-XTS
To: Maxim Fomin <maxim@fomin.one>, cryptsetup@lists.linux.dev
References: <LzHpD7N7NryfAL3OI3b2QBM6UuT5QZuCCjpgxI7WERzccWwpn26f5urbFY5P1dqmYHIz3KRYd4qCo9pIOQtVBO2gtjgp-cBHiUrlN0DTrSs=@fomin.one>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <LzHpD7N7NryfAL3OI3b2QBM6UuT5QZuCCjpgxI7WERzccWwpn26f5urbFY5P1dqmYHIz3KRYd4qCo9pIOQtVBO2gtjgp-cBHiUrlN0DTrSs=@fomin.one>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/24 2:15 PM, Maxim Fomin wrote:
> Recently linux kernel got[1] faster AES-XTS on modern x86_64 CPUs
> thanks to VAES and AVX-10/512. I decided to dig deeper into this
> issue and found the article[2] from 2020 stating that dm-crypt can be
> configured to use faster (synchronous and hardware accelerated)
> algorithms with 'capi:' prefix. Can cryptsetup be configured to ask
> dm-crypt to use hardware accelerated algorithms?

Hi,

TL;DR - you cannot use "capi" driver specification with cryptsetup.

As Eric said in other reply, it is up to the kernel to set priority
which driver is used in kernel. You can always blacklist some modules.


For the archive, some context below.

The "capi" format support in dm-crypt was introduced due to the support
for authenticated encryption where original cipher dm-crypt format cannot
be used.
It was actually my mistake that we allowed specification of specific
*driver* in dm-crypt mapping table - this is really not job for dm-crypt.

Currently, while dm-crypt allows that driver specification, cryptsetup
will reject it as it is possible security problem.
Quoting from the cryptsetup 2.7.0 release notes
https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/v2.7.0-ReleaseNotes


* Disallow the use of internal kernel crypto driver names in "capi"
   specification.

   The common way to specify cipher mode in cryptsetup is to use
   cipher-mode-iv notation (like aes-xts-plain64).
   With the introduction of authenticated ciphers, we also allow
   "capi:<spec>" notation that is directly used by dm-crypt
   (e.g., capi:xts(aes)-plain64).

   CAPI specification was never intended to be used directly in the LUKS
   header; unfortunately, the code allowed it until now.
   Devices with CAPI specification in metadata can no longer be activated;
   header repair is required.

   CAPI specification could allow attackers to change the cipher
   specification to enforce loading some specific kernel crypto driver
   (for example, load driver with known side-channel issues).
   This can be problematic, specifically in a cloud environment
   (modifying LUKS2 metadata in container image).

   Thanks to Jan Wichelmann, Luca Wilke, and Thomas Eisenbarth from
   University of Luebeck for noticing the problems with this code.

Thanks,
Milan
