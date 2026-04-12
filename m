Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214E1212548
	for <cryptsetup@lists.linux.dev>; Sun, 12 Apr 2026 08:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775983230; cv=none; b=VXVdGcPGvhYtWIdaZ41GUbjRW71JYw41RUmXVnwmFWtR5DnacPLTc6teRFMdVysPZBxpV0bFeUG6hWDh3pFl0G2SH7OkyTdwvf+rHDX6QzEXLpLebXppaBERLBtLmlxqs4OMypfj8GulviRS+AEzMIM7NUK769JelRm30ylH42s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775983230; c=relaxed/simple;
	bh=IWlv8qplL2S4ZUbTR2ToWgn7u0RFgcsKHW2QJgCTHJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgHOKevkfAP+Mu0QMAJ42kmP9yAXiVnzbX8ewK+hKnCTvchFrLP6P7axGx+Z2MF1uPXYTLcwF23XZU5ESJAWRnDZd/9J76nxs4E3RI32FvXI6GrK+wfXxcexPxpQA0PdW0r0SBlgCoClvmlN53mSAZIwC1/H9lFmRPQ8cZcU35w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEkeHni5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEkeHni5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfd96354aso1971788f8f.1
        for <cryptsetup@lists.linux.dev>; Sun, 12 Apr 2026 01:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775983227; x=1776588027; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=38qRrUkgDyzd3TacH9iMLOL0Pc0N9a3/hslz38Vuhtk=;
        b=gEkeHni50mSzadx/PXWCVXdYNBvyawfwTFfLL1JH8KiTcerEvg0WF5fXm6EWWGyAh/
         cYEDxFHTuFsMOl8qQQQ+f8Q856OXpxAuyh3/9PL5+gIbzMrK9rVZqn23MNfeLhVJnmIL
         0J+RhlwOvq5vHAtXbc1+/RTm9kSfArgRsgKBq/kt6qT86Z6d4AltjEgstzILOCsAfkhk
         nmKVj9LSMytyHetYomscYDQ7LkKJ2niHg+O2F+Sbv09B1iI3JlyAehu98oMMmv5vL8kj
         6D8VhNlXMdddoKm8S2ermiFhSZAS3Behj2A9FHApgkJujZjX0KSt4S0HlbxWAaVBo89S
         mMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775983227; x=1776588027;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38qRrUkgDyzd3TacH9iMLOL0Pc0N9a3/hslz38Vuhtk=;
        b=na1Vw9CJVPcCf+Y4MdQlXIvh/Pcs1tFKV3bq8a/Obd68rdZVGzC8hfN8pKH+1cZPHf
         CMMVMyGRKNFW+oR7tiNPO5b6y5j/oYuYAsySEh5rkFqXeSYeat2twLPAkpO4QSI16Skw
         uK76ZLJxyg4oJAHSwNp0y1SgLmB+w0jjLUWtwu7ozW+W3eTRLs5TTd7rG8dco4bSRPYU
         9dypoZmDSEAa+f4ruTamSE1ck83WwZA4BmGw/tDdr9C5c33vzPxFsfHmWnGgPjuzB736
         Lu3oc5RoF1MYxTAmbxgEJHBRPYWzKyc7Txe413l2lPt8oNeAJk6RyXRBR/A4DGh5xDqU
         Jfew==
X-Gm-Message-State: AOJu0YwxoW0A/rGluPuENvwydVQparxxpe9ZdPpMyof7xNwpAKr7FlpX
	n4PvbxgP9sMLN/T01A6qWyFdVQ5l/10gynW6Cr/WLe92Itn3AXmFIr/9
X-Gm-Gg: AeBDieuodK2FmzrvsHy6h2McTsHcNKKXbW7pjtNIG/jpBjTyOL9bWaV1CI3+cKBN18G
	vDS6t/KSt/wD4UzHjByWc+tFY+rvLwHcTP1Nks/JEAnmnYDgUmJm0ufn2/nVuMkMgXjuVT3ExY6
	gB4ttL9xrv4Bv1NFyXJ1tTaaluFWlsxuorxaHVvdgpU8+KEJLHBV/ycyNJdK6J+2Y6yxWnLTcgs
	VL7FDfIroLo2XmJAvGzKUZsviNAPXj7JxgO7S5DdGhB76ijwx89KFFp4qg7zTEI9yyTgbKKFoMK
	rS+GrG9ihShfWH9HOilYoQiNE06ke9crXpbZD97KPziwq1FPZH092lWMq0WdRftHY966sYBCEIF
	bPQCpz/XDtyZd8YuEuDDhEV9B3r8ab3oaVA6M9oadhdOlpiwt/1GbER/DAbVgA0ZKPq/j5wABNH
	HORK+jmkp7lXFlt1DGb7rAjhG2WywbBAQMpKpZ55wZRuCI7z2WnuVPG2QGV6iW92cnUA==
X-Received: by 2002:a05:6000:25c4:b0:439:c299:4d8f with SMTP id ffacd0b85a97d-43d64271215mr14464823f8f.17.1775983227153;
        Sun, 12 Apr 2026 01:40:27 -0700 (PDT)
Received: from [192.168.8.102] (78-80-97-77.customers.tmcz.cz. [78.80.97.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e469ddsm22708951f8f.17.2026.04.12.01.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 01:40:26 -0700 (PDT)
Message-ID: <9855efa5-b11b-41bb-b6e9-74675011630f@gmail.com>
Date: Sun, 12 Apr 2026 10:40:24 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to use a keyfile
To: j4ck32 <j4ck32@gmail.com>
Cc: cryptsetup@lists.linux.dev
References: <CA+vw=V+c4SP+dPwY6oYk=V+QQS=797XuqSRan8N5vSSFwvN8aw@mail.gmail.com>
 <42b530ab-3f92-4aae-9714-076dbccaf0f0@gmail.com>
 <CA+vw=VJc1Oh1v379uaJzSXPsfn_Mr5NmXFSwpaAOi0g+GMmS+A@mail.gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <CA+vw=VJc1Oh1v379uaJzSXPsfn_Mr5NmXFSwpaAOi0g+GMmS+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/26 10:09 AM, j4ck32 wrote:
> memtest86 immediately failed...
> I did multiple test runs and determined one of the two modules failed.
> So I removed the faulty module...
> Now my system accepts the original key-file again.
> And adding new key-files works again.
> 
> Am Sa., 11. Apr. 2026 um 23:21 Uhr schrieb Milan Broz <gmazyland@gmail.com>:
>> This should work. Could you try to add "--pbkdf pbkdf2" for luksAddKey?
> 
> I skipped that. Now that the issue is fixed.
> 
> So using a key-file uses more memory than a passphrase?

No, a keyfile is processed the same way as passphrases.
But your previous passphrase (keyslot 0) used less memory.

With PBKDF2, the memory footprint is even smaller, just a few kilobytes.

It is only about probability & luck - passphrase could fail the same way.
Argon2 KDF is just a quite good memory pressure test :)

Milan

