Received: from cyan.elm.relay.mailchannels.net (cyan.elm.relay.mailchannels.net [23.83.212.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B7E2036E0
	for <cryptsetup@lists.linux.dev>; Tue,  4 Mar 2025 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741094257; cv=pass; b=aGpCReqLSgT1dAJm52Fyw1uBlaQ98c9ZYd6zozqC7dSDauwsTJzF0RyQvtuPznv4w69U5XO9aWHJ3Ok1WVf5DHFmNCxO0AxGnbHCl9mk4OXzYDJ858kSF4itUkFaPS5rTmncJgWKx0LfGhWgQrNmutURIGO5B1uxbRfl+/i/qPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741094257; c=relaxed/simple;
	bh=mkhruDkfNBLYAyVeDQDz4233sqGBd9w2cPTVt1J0TgY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mSyBHMNmql+RD1jka2QgkYn8/283GuF2SVEY/G2+lhnug8oX0dNOIuGfuadbnrGaoojuSjddWMyNq2HRWWwduPTQDmnzcLQSQu7rFAp7F+AYsw3IfCOnKsQ3SHX96xV21EUFCA0r6twk58Kzok2NH42mEZPU/MX5ICVJIrRSoyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scientia.org; spf=pass smtp.mailfrom=scientia.org; arc=pass smtp.client-ip=23.83.212.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scientia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A79A7843208;
	Tue,  4 Mar 2025 13:07:50 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (trex-7.trex.outbound.svc.cluster.local [100.107.32.231])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id D9FD484151F;
	Tue,  4 Mar 2025 13:07:49 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1741093670; a=rsa-sha256;
	cv=none;
	b=YcqjxgO2wRZLqtFMS3ies8woTJyH+89yyG9j+tLtgq2apyLxTipvYAwgJBbpQuVp7RQ5s2
	OWcrOAjDBRNpv+dYDvlXfNfA+hV75E23QpoXhP5PsKpvZkHj8FDobapUu2pYfnvD35M0XX
	cJugjhAqOIc31KIdYtNXcKYRVHKp8lgVWRESzsVf5eII21wuItl5e/N4noYl/5Rvu0Hq+F
	h3fb2A2k59nt15AwXA2VU2zNh/acWiYy2hJ6Ut3r9ZKv9DqseJV4aObJX/8bqyGEpjmQ0u
	Nch9nP/RHE7Y0w+SueqOOFdtTADeiUewJLxF7yx/M97ncMTyIllkPIoY8iAMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1741093670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkhruDkfNBLYAyVeDQDz4233sqGBd9w2cPTVt1J0TgY=;
	b=2QNuvetJt/mCc/r4HkbNgsLFt1sBljm191qnXYddMfBWxIObkEM5DkYaRe9QsjuthRopDp
	X/4SPqX3p53DJnRwginhekXfPrJNGWcQFtCMzujXSO1g+yorbV6rEpoxcKpxWZWgPLCyCK
	4F9Ig4n2CXn214b171aUX6Z4DH44Y1FFKn+Sk+8dL/SLfMVhs1Kt8PYs8m6raObZQev0fU
	zzp9iJwDRN3SdaUeHqlUzdC0W4hgMomN7MWmX4JXWNB6y+u298Sdg1CdgQq/LfxTvZr9Eh
	snPpTmGujM1fksdTpz4PIVvLUPdVTQ5B9y/lOO7iwxC7lFzu3kgFUtRcjPFSzA==
ARC-Authentication-Results: i=1;
	rspamd-7878b47b55-kw26m;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Lettuce-Zesty: 55ae1cbf340f6c9a_1741093670494_1697438835
X-MC-Loop-Signature: 1741093670494:816416399
X-MC-Ingress-Time: 1741093670494
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.32.231 (trex/7.0.2);
	Tue, 04 Mar 2025 13:07:50 +0000
Received: from p5090fbbd.dip0.t-ipconnect.de ([80.144.251.189]:65041 helo=heisenberg.fritz.box)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <calestyo@scientia.org>)
	id 1tpRzx-00000006Aja-0WbK;
	Tue, 04 Mar 2025 13:07:48 +0000
Message-ID: <8e675198233bd0fa461bd66fafcd37506f5e20c9.camel@scientia.org>
Subject: Re: Boot with encrypted disk but only with USB Stick
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: Dirk Nichterwitz <dnichterwitz@m4com.de>, cryptsetup@lists.linux.dev
Date: Tue, 04 Mar 2025 14:07:47 +0100
In-Reply-To: <01a001db8cee$fc0f5550$f42dfff0$@m4com.de>
References: <01a001db8cee$fc0f5550$f42dfff0$@m4com.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.3-1 
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-AuthUser: calestyo@scientia.org

Hey.


On Tue, 2025-03-04 at 11:19 +0100, Dirk Nichterwitz wrote:
> I addes a
> keyfile on a usb stick and this works to boot automaticaly when
> plugged in .
> But ist her a way to configure the system to only boot with stick ?
> because
> if i unplug the stick the system ask f=C3=BCr passphrase.
>=20
> But i want a system only works with stick and no way to do a other
> boot.

Not sure what exactly you want:


You can simply install your bootloader, kernel and initramfs on the USB
stick (along with any keys needed for decryption).

Most BIOSes/UEFIs support booting from USB.

That way, an attacker cannot mess with these parts, which would
otherwise be completely open.
Of course a powerful enough attacker could still replace your firmware.
And of course this only makes sense if you then keep your USB stick
with you "all the time".


Or do you want to continue to boot from your regular storage drive, but
simply get no passphrase prompt in case the stick is not present?


Cheers
Chris.
