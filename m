Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBD036F917
	for <cryptsetup@lists.linux.dev>; Tue, 14 Jul 2026 10:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026680; cv=none; b=cBXxjBwCsDYDQtRiXA3Y6i3hbm5IiEWt6VVKYEpfO4HQHIJC7a7NUWXA218SjYhyPC7HYPWZ2BSlsIo1Z2pek8B8PrUDoxJ+CwLDUjQT0f+6w1S3fV8vwFSpPWs6oSctWrnpss15CQFavyV4Y2iAS/Z97zsontSae0Ymn+MuOhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026680; c=relaxed/simple;
	bh=eV8k+0IBovNLaCDBpclsvo5KxXNYtOUZe9qAc15c8H0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nJAKo0WI99sq+U/RKenudVjRoUxTDG+leFZ9flC0IiqlPZ1KB7hqyRJdEPE689ykaCov/0dAXLd/gyTZbczeSnie44e1LThlMzA5Sig8j2/rJAWwrzF7B8meBcrE9BZQx/j5UyBORQzSvD2rqp9bU+6845CfLngfejk4acmwNBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QnqyAkZl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QnqyAkZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784026677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xKJAo0vSWVWyOSx916/GZU0JAgiHuUQ9FS8ZJImqNbk=;
	b=QnqyAkZlxim3+2yMKv7ymk0o3H3Zule9kT52j451+rz7uy48/ySzdObMimv8hlvAue02mQ
	zLhfpnfGOf8y+fXaLLmMLTV+KKA1hJeI0ztjtPoLD+MVNPyL5QTzPlIBGPpU+hYuQPGr5K
	jvidYRJsqJM6LpcnXRIfoj7UGBBpKy4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-yXbQakhuOV6CG4YTj9s3hQ-1; Tue, 14 Jul 2026 06:57:56 -0400
X-MC-Unique: yXbQakhuOV6CG4YTj9s3hQ-1
X-Mimecast-MFC-AGG-ID: yXbQakhuOV6CG4YTj9s3hQ_1784026675
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso32470245e9.2
        for <cryptsetup@lists.linux.dev>; Tue, 14 Jul 2026 03:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784026675; x=1784631475;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKJAo0vSWVWyOSx916/GZU0JAgiHuUQ9FS8ZJImqNbk=;
        b=F7v4CeTUdIc19H3TwBJznPx2Uf/ng7RPiJXF4vwW/bJNlakfMFHKy7MVcvlhT+2SBy
         P7iTrF5pO+bp8oL4aWpQTcBP0M/PX8inz6+k6ydJ+uUSjwN3O7ivpXe1ozaAQfCTtcwn
         KcY2mUUx4jrET54STtYTSJ4lXluI0DRH3FCXcB0D7Dr1kO92KhNMod0l4AN9scAydVNX
         6V6+6njlhmB8lbHjE8J81HZvIYHBl/vUa5bMLr/OEp6eGp9AyqbHWGuvpvnaQMsUSvhK
         BoJ2plNAP+bgHE0IwabaPBoTNmZtKmhE3HLvnfhokmC3y8lONGN7ytiZKIHF945Nq2Ez
         x7DA==
X-Forwarded-Encrypted: i=1; AHgh+RqOyxlbil1bUxwQMDrNKqxhTpW2H9pKscWB2HDn+KjGAaID/SeYrcyMUqICiz24gh8rOMIY21dj91bL@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ4gej3kkqUNIOecbRhahgdV6cECbJK3s+EExYfMgkwTOOL+IU
	+0vCE7m6iqn0o7+NpWC4p+2MplSqkFVY/VuXnAeZni1jTsMJxb+OgFvUmoXQOCRa8vMRdfkFF/x
	vRIUmEZplCubHpXnWyo3TCT5d3uKybj/R8tJD376iJV59tha84KPK3uyK6EXJeEFEwu2Y2A==
X-Gm-Gg: AfdE7cnMySCsu9CCZhbE3v0U5blcUSbQX2Jmh3S2ihkji/JacLapRYLfBFSKAO3h1s2
	pQuTOiHg4LcWgxunO+lVAEAHnlUItK+E3AuIasENaR9rp8/FhqNJakoypN7ThZjvYhQqk6YYsac
	u0aoUkQEDIdaL+v2yPn9aZHQOKf559VNqGDBlJz+BrmOAHScZ0H4yhSFLtuO0tmykw+ywx9+Hlb
	CXyRxq9Lb3Eu7Rm73j+a12jYHili07K2VuRiAFnfYWuaFuSXMcFFCGDrT1l3CZh7u5F4mNfubfV
	gSOAww9GwauDDAQYyaOM6bqJRpuBE8goMSwCeVCuaovQ23KKMq/tXdx4TiU7hok7zKNCGLzSn/b
	Y
X-Received: by 2002:a05:600c:1d06:b0:494:6baa:ccef with SMTP id 5b1f17b1804b1-4946baacd33mr46615385e9.11.1784026674673;
        Tue, 14 Jul 2026 03:57:54 -0700 (PDT)
X-Received: by 2002:a05:600c:1d06:b0:494:6baa:ccef with SMTP id 5b1f17b1804b1-4946baacd33mr46615235e9.11.1784026674267;
        Tue, 14 Jul 2026 03:57:54 -0700 (PDT)
Received: from [10.43.17.192] ([213.175.46.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49506a1fbcesm70000135e9.0.2026.07.14.03.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 03:57:53 -0700 (PDT)
Message-ID: <96c530a1-d27a-4c27-86c0-04ac3abfef22@redhat.com>
Date: Tue, 14 Jul 2026 12:57:52 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Derive encryption key from PIN
To: oSumAtrIX <johan.melkonyan1@web.de>, cryptsetup@lists.linux.dev
References: <CAK+fmzxEkGy+8X9BAwFKyU415Z4xm2uHfL+yaah-U1Rkw9YDYA@mail.gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
In-Reply-To: <CAK+fmzxEkGy+8X9BAwFKyU415Z4xm2uHfL+yaah-U1Rkw9YDYA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IxdHgGN1g2Yb-4oXPKSpstzB1zB25sPqKb_Kh_kFPfY_1784026675
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/07/2026 12:27, oSumAtrIX wrote:
> Hello,
> 
> I found this email in the README of the cryptsetup GitLab repository.
> 
> I am reaching out because I noticed that the PIN used to unseal the
> decryption key from the TPM is not used to derive the decryption key.
> The PIN is merely used as a policy, when it can also function in a
> cryptographic context. The sealed key can further be encrypted with
> the PIN, so that even a full compromise of the TPM including the
> sealed key does not reveal the decryption key in cleartext. According
> to
> https://www.sstic.org/media/SSTIC2011/SSTIC-actes/bitlocker/SSTIC2011-Slides-bitlocker-bordes.pdf
> BitLocker implements a KDF from the TPM PIN, but it seems to be
> missing in LUKS.

What do we talk about? systemd-tpm2 cryptsetup plugin? IIUCT it uses 
secret stored in TPM2 to get LUKS2 keyslot passphrase or KEK. The KEK 
later enter KDF to derive keyslot encryption key. And the keyslot 
contains encrypted volume key (MEK).

Or, there's some other plugin or application that seals the actual 
volume key?!

If there's something that could be improved in systemd-tmp2 plugin, 
please open RFE on systemd. They maintain the plugins for cryptsetup.

Best regards
O.

