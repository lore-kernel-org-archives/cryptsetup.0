Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED90D37DAA3
	for <cryptsetup@lists.linux.dev>; Tue, 14 Jul 2026 11:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027439; cv=none; b=ei5M9U8eMjRDJBldicDTZxb5fBcUY3MNLy4mGu0u2SZf73zjwlCeVdSctT1Wyjy9IqzAH+qOIclJE9Mvx3CobpuOu93VuMqdd319dYETW46JWLCjJ4aUZ3pfd+IlyceqNUb6SncCzwB/XriLG2yf9a7K1n50zZgR//19FI/pK9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027439; c=relaxed/simple;
	bh=P2DXZrsst/zYmLOF2qww1PajYwnUTIz5jJAD8i0qqVo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kM0zdTTxI/HhnAzZOFHUYwW6iOgzUzqZNjlrfA7c8U99rKXLo9zWRBStSNGvKG1v3gsdBWQ9WMPVIXf9NDQm7lCJr5p4cAKT5Hc7nx1xpAoDUZ7w9Rkqg/eBzLoXal3EDl+2VyAXR2nPFte+B67deTAmCgPgw+KNR7ytBsbhMFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=johan.melkonyan1@web.de header.b=LUwqaSBp; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=johan.melkonyan1@web.de header.b="LUwqaSBp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784027434; x=1784632234; i=johan.melkonyan1@web.de;
	bh=P2DXZrsst/zYmLOF2qww1PajYwnUTIz5jJAD8i0qqVo=;
	h=X-UI-Sender-Class:From:In-Reply-To:References:MIME-Version:Date:
	 Message-ID:Subject:To:Cc:Content-Type:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LUwqaSBpEayMSxYC9kYDcfny6iCB92L+VVrAP78xX34CCQuD/lvFYAdzzX7JcDE2
	 RYdRhoa9FOKj7HtFpvpmAKGygfWpUDe40HafVS1Q8RI9iHqKgduFQ/rDXc1042CdN
	 ce8P8RzxnZ43mJ+EOhFCmXpc5oUX5AGqCpPQiinZopj6y4gXIcYZLJakKG6PnL6Ke
	 nKv9CFseaa0h594Hojb96eby1b9Fxcnw3ehlAB/CcMcp09pR2Zfu16+Ooen7Ylw8X
	 1ZOcqHmmtGrW1WwJYXWM0scg1uJ5N2WvHEtAfWysdVy1HZy/X6tLtLofjEPeAy/K+
	 YmeSGN0LozSDxD8DPg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MxYXF-1wzRzf1OZ7-00r2d6 for
 <cryptsetup@lists.linux.dev>; Tue, 14 Jul 2026 13:10:34 +0200
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664d4478a64so5302134d50.3
        for <cryptsetup@lists.linux.dev>; Tue, 14 Jul 2026 04:10:34 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzc8CGGbbzOE5uLikoPvtrKtK5ByyEQYgZJtg0lctwSUgZBBtsn
	KJFlnN/duIHzyBIbmEXTrQSqs/tk5bcoj338GncizezqQqlAKDt9iEzelbktGom1A7fCdk96ZJl
	yOKOMqwZPMqbkSUJ/BGXxzpY7xozg6OE=
X-Received: by 2002:a05:690e:4881:10b0:664:cc3f:e2c with SMTP id
 956f58d0204a3-667d7ac40cemr6750313d50.27.1784027433130; Tue, 14 Jul 2026
 04:10:33 -0700 (PDT)
Received: from 374364070962 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jul 2026 04:10:32 -0700
Received: from 374364070962 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jul 2026 04:10:32 -0700
From: oSumAtrIX <johan.melkonyan1@web.de>
In-Reply-To: <96c530a1-d27a-4c27-86c0-04ac3abfef22@redhat.com>
References: <CAK+fmzxEkGy+8X9BAwFKyU415Z4xm2uHfL+yaah-U1Rkw9YDYA@mail.gmail.com>
 <96c530a1-d27a-4c27-86c0-04ac3abfef22@redhat.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: FlowCrypt_Android_1.6.4
Date: Tue, 14 Jul 2026 04:10:32 -0700
X-Gmail-Original-Message-ID: <CAK+fmzxwSgHcYw5FL-8RV4SBUyb6stzsdm_DaWURvOsfRnv3Dw@mail.gmail.com>
X-Gm-Features: AUfX_mx3UHKZJcnVSYidoQ19lddOhlmbTgKnE7-gVLRkrg4NeSvsq9uMvuCBtc4
Message-ID: <CAK+fmzxwSgHcYw5FL-8RV4SBUyb6stzsdm_DaWURvOsfRnv3Dw@mail.gmail.com>
Subject: Re: Derive encryption key from PIN
To: okozina@redhat.com
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:qJn93tguOWI5mJEeVvcLFGqdcU9mo6A3tF1B4sZ8RqD5+I1vHmf
 g38dHkz+VpphFhWOsyl7P40iBMVr0TUTM236X+Jd4dssoVHLxrpPmiy0vtyAvTtggZM1ypY
 QZj5BSzCO43lXLhWvm3d25iN3joEFvTqqUtxCvtdVFYIbSjakSnWIHvUVf35WUmD2jmfweL
 dlr0h9cyVu2PvIDo4rhnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JIkR+n5TdCQ=;pPxonTK4LOw4rvT5bV7pY+h9NBT
 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

Hi,

> What do we talk about? systemd-tpm2 cryptsetup plugin? IIUCT it uses
> secret stored in TPM2 to get LUKS2 keyslot passphrase or KEK. The KEK
> later enter KDF to derive keyslot encryption key. And the keyslot
> contains encrypted volume key (MEK).
>
> Or, there's some other plugin or application that seals the actual
> volume key?!
>
> If there's something that could be improved in systemd-tmp2 plugin,
> please open RFE on systemd. They maintain the plugins for cryptsetup.
>
> Best regards
> O.

Please note that I have limited knowledge regarding the infrastructure
of LUKS or cryptsetup. Therefore, I would appreciate guidance on the
appropriate contact for my issue.

My understanding is that TPM+PIN authentication does not
cryptographically utilize the PIN. Instead, the PIN serves as a TPM
policy to seal the key. In contrast, BitLocker incorporates the PIN
into the cryptographic derivation of the decryption key. With
cryptsetup, the PIN's function is limited to sealing or saving a
secret. Consequently, within a threat model where the TPM is
compromised, the decryption key could be derived in plaintext without
the PIN, as the PIN merely acts as an access policy within the TPM.
The referenced paper demonstrates that BitLocker, however, uses the
PIN for key derivation. A specific KDF in BitLocker relies on both the
secret stored in the TPM and the PIN used to seal that secret, thus
making the final decryption key cryptographically dependent on the
PIN.

Regards,
Ohan Melkonyan
