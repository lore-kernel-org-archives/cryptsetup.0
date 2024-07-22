Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBED23DE
	for <cryptsetup@lists.linux.dev>; Mon, 22 Jul 2024 10:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721644641; cv=none; b=lgky+TYKv4L9XOCHxFooL94UPqBWFMNNrrraeAfIRC3ijPTzNRAoNf2WCLaQFD1QeOxRn3KBzzPthHgBgW81XYFR1tlFQPXHt9ipTTo2/EiNNS4XOeFUEOI0TzISjvg3FtGep17IvDl1CxWvDOjOsoJijnD4sHG+1/shOIbsOTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721644641; c=relaxed/simple;
	bh=fK9bwzoKCVVFSYQrN4rZlaWwYrMGakw2ncxA5M2F92g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=reQrnMJCIwF/MsmD7pCnJea/wTokB6f6eL6quiX+q5EmRzbEa3yF8RqaWu82zhjA3vsyi7x4QCZ1pKv6//rH7VYG+0NNYSbWvmA1SFzN7dg1ZaGeaf0FQSz4ZCyI0cgdcON214NwMMFc8X6Sno4MnpgykTo5bJcsWciGKpazXB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fomin.one; spf=pass smtp.mailfrom=fomin.one; dkim=pass (2048-bit key) header.d=fomin.one header.i=@fomin.one header.b=Jv/3D7PG; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fomin.one
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fomin.one
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fomin.one header.i=@fomin.one header.b="Jv/3D7PG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fomin.one;
	s=protonmail2; t=1721644628; x=1721903828;
	bh=fK9bwzoKCVVFSYQrN4rZlaWwYrMGakw2ncxA5M2F92g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Jv/3D7PGrV3aRK6l4zrnwh+vcU2xAnM3jWT7tYNMoJoQep80ejwaJZYtHfB5kuXE2
	 eQAd/5Ta4SkDIuul/nfbpuV2PVuSJw1m5yFn1aFjJLM8ysYTVG6bOBCPugGs5ggrhj
	 7cTfIhYWga67oQuGWyWK3FWGpPuutuV0F01M73edDqS5kiBJyH59a9N8wCwYU7oRtu
	 JA7quHnRFKYdmE6K0f/u31AdjSnoP9UpaQxqG7p1x+oNrDhCAg9n9OGxRxNVS3xVmn
	 J0i/Ra0VBB4FkDgHDdTVtRxVZ1gkCcLWu1LDLmXiNkvSrZvgS2PADVhZ3u1S5Kklvb
	 9AXZcxdpLqjBQ==
Date: Mon, 22 Jul 2024 10:36:59 +0000
To: Eric Biggers <ebiggers@kernel.org>
From: Maxim Fomin <maxim@fomin.one>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Cryptsetup and hardware accelerated AES-XTS
Message-ID: <NgRPAWKstiL9VmiQ1m8_A-O7V4Znvo6vGMiYoOGFkjRZAFbLPDyM2tamk1XoMZidvlX5cfPZ34iL7adYTFumFFDS7tJkCacSD4pul7AYMzE=@fomin.one>
In-Reply-To: <20240721155808.GA1224@sol.localdomain>
References: <LzHpD7N7NryfAL3OI3b2QBM6UuT5QZuCCjpgxI7WERzccWwpn26f5urbFY5P1dqmYHIz3KRYd4qCo9pIOQtVBO2gtjgp-cBHiUrlN0DTrSs=@fomin.one> <20240720173611.GA51708@sol.localdomain> <KOXKGdgZv9MEFCpmK5MItFMeEE77NA2Wh2kmbbrFNGSlAovd2WUVNvDdY6972_nqYKJlmOZrV9SyIQLwp0h3YHtjMhYZp3BfhLsXVpsixG4=@fomin.one> <20240721155808.GA1224@sol.localdomain>
Feedback-ID: 10594471:user:proton
X-Pm-Message-ID: 96ebd43d235195bdadc6e309608aaae84c6c3948
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Sunday, July 21st, 2024 at 4:58 PM, Eric Biggers <ebiggers@kernel.org> w=
rote:

>=20
>=20
> On Sun, Jul 21, 2024 at 09:14:02AM +0000, Maxim Fomin wrote:
>=20
> > On Saturday, July 20th, 2024 at 6:36 PM, Eric Biggers ebiggers@kernel.o=
rg wrote:
> >=20
> > > On Sat, Jul 20, 2024 at 12:15:23PM +0000, Maxim Fomin wrote:
> > >=20
> > > > Hi!
> > > >=20
> > > > Recently linux kernel got[1] faster AES-XTS on modern x86_64 CPUs t=
hanks to VAES and AVX-10/512. I decided to dig deeper into this issue and f=
ound the article[2] from 2020 stating that dm-crypt can be configured to us=
e faster (synchronous and hardware accelerated) algorithms with 'capi:' pre=
fix. Can cryptsetup be configured to ask dm-crypt to use hardware accelerat=
ed algorithms?
> > > >=20
> > > > [1] https://lore.kernel.org/lkml/20240403004404.GC2576@sol.localdom=
ain/T/#m83293b2699f9a5da04fc5780ee402191dace3926
> > > >=20
> > > > [2] https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
> > > >=20
> > > > Best regards,
> > > > Maxim
> > >=20
> > > You don't need to use "capi:". Just make sure CONFIG_CRYPTO_AES_NI_IN=
TEL=3Dy is
> > > enabled in your kernel (which it already should have been since it wa=
s needed
> > > for AES-NI acceleration before), and the new code will be used automa=
tically if
> > > your CPU supports it.
> > >=20
> > > - Eric
> >=20
> > I have heard that on some Intel CPUs AVX-512 is ignored (although it is
> > supported) because of downclocking. I have rocketlake i5-11600K. How I =
can
> > check which algorithm is actually used? How I can force cryptsetup/dm-c=
rypt to
> > enable AVX-512 version if it is not used?
>=20
>=20
> The way to tell which AES-XTS implementation is used by default on a part=
icular
> system is to check /proc/crypto for which "xts(aes)" has the highest prio=
rity.

Does the priority property takes into account deprioritization of Ice Lake =
and Tiger Lake?
Btw, actual function can be noticed in 'perf' command output, which in my c=
ase confirms that indeed vaes-avx10-512 version is used.

> There is a way to change algorithm priorities to override the default, bu=
t there
> isn't much reason to think that people would be able to make a better cho=
ice
> than the kernel's default.

Default choice may be problematic because it is applied in every case and d=
oes not take into account option to disable downclocking and thermal limit =
on actual machine. Some BIOS versions allow to disable downclocking (called=
 AVX512 ratio offset or similar). If this option is available and thermal l=
imit is not applicable, then default kernel policy means some potential CPU=
 frequency is lost.=20

> The implementation that uses 512-bit vectors
> (xts-aes-vaes-avx10_512) is only deprioritized on Ice Lake and Tiger Lake=
, so it
> won't happen on your system anyway as it uses Rocket Lake. On CPUs where =
the
> deprioritization of xts-aes-vaes-avx10_512 does happen, there is a reason=
 for
> it, and it is only 512-bit vectors that are disabled, not AVX-512 entirel=
y.
>=20
> - Eric

Thanks for clarification. Just for reference - this setting currently resid=
es at arch/x86/crypto/aesni-intel_glue.c and can be moved somewhere else as=
 is written in the patch.

Best regards,
Maxim
