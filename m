Received: from zepto.billmerriam.com (zepto.billmerriam.com [71.19.150.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DA023E25A
	for <cryptsetup@lists.linux.dev>; Mon, 26 May 2025 17:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.19.150.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748280145; cv=none; b=h1qW1NxUobND/8Jq6eA5WJHf74y2+8LuxUDc85tKbeVYuiMexHC3fmpNP6+wT9FecgHNAQV0P+v9jrkVHWJVDRuTog+hH/n7pTCfAn+I7RHMbIKjscWaqWMbOpGaHVIauRoSkOyogdOF1aA3FSLUsPCo59t3YmPpVAM+MKDk1EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748280145; c=relaxed/simple;
	bh=FHxPWCurfrB1UVR9ATp4YdIiZ/+9k1sZoQR5qp+c0hc=;
	h=Message-ID:Subject:From:To:In-Reply-To:References:Content-Type:
	 MIME-Version:Date; b=OOoDHssbsMARq5/8M8qtG+zDqagqbMQcbLLucUa4YV2lQP7jaXl7wnjMhhT5TYDFpoRppliLTkdG0MvcYbAtZZMLOq52gOwn9Cb4+6vgD2KS1cW07/NGbBHnIdDOnwCK6t+/UbfBZEAOcXzzvdIlXcB/W8l1I+y0Qjgw0C9mGAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=billmerriam.com; spf=pass smtp.mailfrom=billmerriam.com; dkim=pass (1024-bit key) header.d=billmerriam.com header.i=@billmerriam.com header.b=K0bq9x6d; dkim=pass (1024-bit key) header.d=billmerriam.com header.i=@billmerriam.com header.b=wquzLsvH; arc=none smtp.client-ip=71.19.150.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=billmerriam.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=billmerriam.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=billmerriam.com header.i=@billmerriam.com header.b="K0bq9x6d";
	dkim=pass (1024-bit key) header.d=billmerriam.com header.i=@billmerriam.com header.b="wquzLsvH"
Received: from localhost (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "zepto.billmerriam.com", Issuer "R11" (not verified))
	by zepto.billmerriam.com (Postfix) with ESMTPS id B26FF11BCD94;
	Mon, 26 May 2025 13:14:37 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=billmerriam.com;
	s=default; t=1748279677;
	bh=FHxPWCurfrB1UVR9ATp4YdIiZ/+9k1sZoQR5qp+c0hc=;
	h=Subject:From:To:In-Reply-To:References:Date;
	b=K0bq9x6diSlhHsE6jC7KZSim0zbITo+DqLw/dpSDuTjxlEjeuN5SGXKRBnega+HBM
	 jjbFhh+e2SeF1UqhvCgTWjdpOvqDV8R1ae65twlXiHde8mfXp2ibpeHIRWRUCEeE+2
	 BgNjVePa1nqqRYVIdXR+vaJQayflyIdViPTijE/M=
X-Virus-Scanned: amavis at billmerriam.com
Received: from zepto.billmerriam.com ([127.0.0.1]) (using TLS with cipher TLS_AES_256_GCM_SHA384)
 by localhost (zepto.billmerriam.com [127.0.0.1]) (amavis, port 10024)
 with ESMTPS id 4RV3j7VvxlnR; Mon, 26 May 2025 13:14:01 -0400 (EDT)
Received: from giga.billmerriam.com (unknown [192.168.1.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "centi.billmerriam.com", Issuer "Bill Merriam CA" (not verified))
	by zepto.billmerriam.com (Postfix) with ESMTPS id 96F1711BCD8D;
	Mon, 26 May 2025 13:13:59 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=billmerriam.com;
	s=default; t=1748279640;
	bh=FHxPWCurfrB1UVR9ATp4YdIiZ/+9k1sZoQR5qp+c0hc=;
	h=Subject:From:To:In-Reply-To:References:Date;
	b=wquzLsvHmCSwvVee95U25B+uAmVIxML7Bf0M1CmECJGuDabolvcemuDouIGOz+j0/
	 5ApN87kdt+VdCcaFMlcS/1zekNwrwKT8OddULzUy7rkzd/RtJ2DE+DOF6YKKqGrSgF
	 oLGX88Q7Q18Eqs0cHtspJlIl4A4Pb4sFUoS1rmPI=
Received: from [192.168.1.129] (unknown [192.168.1.129])
	by giga.billmerriam.com (Postfix) with ESMTP id 2C5CB7205;
	Mon, 26 May 2025 13:14:01 -0400 (EDT)
Message-ID: <47354dc28e0149e8b29c8c7a8b6465ebb5ff1d07.camel@billmerriam.com>
Subject: Re: Looking for LUKS GUI
From: Bill Merriam <lists@billmerriam.com>
To: Michael =?ISO-8859-1?Q?Kj=F6rling?= <152cc69a347e@ewoof.net>, 
	cryptsetup@lists.linux.dev
In-Reply-To: <01aeab8b-341b-4930-bd3e-becf9a42f907@home.arpa>
References: <174386769355.6.1636033258357958528.666033728@passmail.net>
	 <174387014408.7.5961259197743680938.666080459@aleeas.com>
	 <01aeab8b-341b-4930-bd3e-becf9a42f907@home.arpa>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 09 May 2025 20:17:49 -0400
User-Agent: Evolution 3.56.1 (by Flathub.org) 

I have never used qubes-os but my understanding is that it intends to
provide a secure environment without the loopholes you have mentioned.

btw, I use LUKS encryption with a Yubico Bio key so decryption requires
a password and a pin and a thumb print.  I hope this prevents someone
with a key logger from getting access but I can't be sure.  The Yubikey
emits FIDO2 credentials that LUKS uses for the decryption key.

I will write up the process I use and send it to the list so others can
criticize it or benefit from it.

Bill

On Sat, 2025-04-05 at 17:47 +0000, Michael Kj=C3=B6rling wrote:
> On 5 Apr 2025 16:22 +0000, from darek.hisc@aleeas.com=C2=A0(Darek Hisc):
> > > I tried to find Linux GUI install guide, but I can=E2=80=99t find it.
> >=20
> > Try ZuluCrypt https://github.com/mhogomchungu/zuluCrypt
>=20
> I'm not familiar with ZuluCrypt (looks like it's just a front-end for
> creating and mounting encrypted block devices?) but keep in mind that
> temporary files can be left scattered around the file system,
> particularly in places like /tmp, ~/.cache, ~/.local/state and
> ~/.local/tmp.
>=20
> The minimum for a situation like you describe should probably be:
>=20
> - LUKS for full-disk encryption at the system level _including_ the
> =C2=A0 boot loader and kernel
> - Optionally separate encryption of different projects' data
> - Different, _unrelated_ passphrases for each such container
> - Use tmpfs for /tmp
> - Use encrypted swap with an ephemeral encryption key
> - A drop-by-default firewall configuration
> - Always make sure you are running up-to-date software, and be
> =C2=A0 _extremely_ restrictive about installing from third-party
> =C2=A0 repositories
> - Strong, unique passwords/passphrases _everywhere_
> - Maintain physical control of the hardware (so that an adversary
> =C2=A0 can't, for example, plug in a flush-with-the-port USB key logger
> =C2=A0 while you are out for lunch)
>=20
> Your system might already be configured to do some of this;
> especially
> the last is not about software at all; and this mailing list is the
> wrong place to go into depth on how to set it all up. My point is
> that
> although LUKS and full-disk encryption can be an important component,
> _just_ LUKS (especially if used only for select data) probably won't
> be enough especially if an adversary is able to image the storage.
>=20
> For passwords and passphrases, I have a web page at
> <https://michael.kjorling.se/password-tips/> which is pretty much
> what
> it says on the tin. It's meant to be applicable to and _actionable_
> by
> the general public; I basically wrote it because I grew tired of
> having to repeat it. :-)
>=20
>=20
> > > how really secure LUKS?
> >=20
> > TLDR: This is a golden standard for Linux for many years to encrypt
> > FDE (whole disk) in all Linux distributions I know.
> > To encrypt files, use ZuluCrypt or VeraCrypt (create containers for
> > files).
>=20
> Unless you go out of your way to do otherwise, LUKS (via cryptsetup)
> uses well-understood industry-standard algorithms, and also includes
> techniques to make adversarial key recovery more difficult. (For
> example, the "anti-forensic stripes" or AF stripes in the LUKS header
> means that even a partially overwritten LUKS header is essentially
> useless for gaining access to the contents of the container it is
> associated with, often _even if_ you know a valid passphrase.
> Exceptions to this exist, but they are highly specific.)
>=20
> Essentially, if a LUKS container created with modern defaults uses a
> strong passphrase, then even for a highly resourceful adversary, it
> is
> believed to be computationally infeasible to gain access to the
> contents of that container _without_ actually somehow knowing a valid
> passphrase.
>=20
> Note all the caveats in that sentence, because they _are_ important.
>=20
> There _is_ a possibility that a weakness would be found in, say,
> Argon2 or AES-XTS which would change the security assumptions
> underlying LUKS; but personally, I would consider that unlikely, and
> if it were to happen, you certainly won't be alone in being in
> trouble
> with regards to data confidentiality.
>=20
> https://xkcd.com/538/=C2=A0applies.
