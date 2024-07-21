Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2EDD502
	for <cryptsetup@lists.linux.dev>; Sun, 21 Jul 2024 09:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721553266; cv=none; b=b5mUnbNsqBhfV+7VCnOROyEdkEzvo/jRL4Yjz1rSaoWG6hbrzK4raoEaewRvCIM/617HjNiKNBerFatDAnh55YIBCC9elXa7TvvndsPOq47ZOokit2rSTlv1SrGMduriyifngj2ZypM/6Py5I0At5ZqnwrnVyUj8JHVRu1Wb17c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721553266; c=relaxed/simple;
	bh=bw3kcsmk3UpIwbWqh10b9n6FhuF7I5IhbFAtxB0m9UA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TEkOv0P9lVtFuGtU3Dqvpit/MeoPiqACaU2/8SOK8X89lIQoa6e7jD2wgszCIdGnl0z2HElPJ3wB+p5gwPIapLW7n6VaQkuxLI6ngCzyFVykG3gPkHUy4lyn4PEJVgEiRRYZ1Uz/aDhJzzBPrXLu+C9oOSipAR7XXYYYqTeVRk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fomin.one; spf=pass smtp.mailfrom=fomin.one; dkim=pass (2048-bit key) header.d=fomin.one header.i=@fomin.one header.b=TuM5hUjl; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fomin.one
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fomin.one
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fomin.one header.i=@fomin.one header.b="TuM5hUjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fomin.one;
	s=protonmail2; t=1721553245; x=1721812445;
	bh=bw3kcsmk3UpIwbWqh10b9n6FhuF7I5IhbFAtxB0m9UA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TuM5hUjl7cXx/DBofqKRLCRKNnMI3hIDs+vmMt6qwe11HDCorg0HpfUtN+H0cEfq/
	 8wh+sVtEkbbCqcljyTaMTe+cnM62Xz0M3grvYyqp9btVT4ARMzLCuZV04H4H4ZtOxP
	 Kyx7sXV2X4v9Llb1DpScEKBYIoGdAxJwOLRqRq7DEX8z4mi9Q8v1FgpC4acyP9LmJK
	 M/0t6ekZ9BunWD7/QUchjXxyuv1NeLCE3kG5ik8xBQfwuAFQaQmSi/zKZ95XB5/+7E
	 28vFM7ATe+mR0dlV50pS4otMiwrQvbx/c5rPL0wq7vO4TBglvUSyC1JxaQu6wZyEqt
	 JIVBl2+DFBBKA==
Date: Sun, 21 Jul 2024 09:14:02 +0000
To: Eric Biggers <ebiggers@kernel.org>
From: Maxim Fomin <maxim@fomin.one>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Cryptsetup and hardware accelerated AES-XTS
Message-ID: <KOXKGdgZv9MEFCpmK5MItFMeEE77NA2Wh2kmbbrFNGSlAovd2WUVNvDdY6972_nqYKJlmOZrV9SyIQLwp0h3YHtjMhYZp3BfhLsXVpsixG4=@fomin.one>
In-Reply-To: <20240720173611.GA51708@sol.localdomain>
References: <LzHpD7N7NryfAL3OI3b2QBM6UuT5QZuCCjpgxI7WERzccWwpn26f5urbFY5P1dqmYHIz3KRYd4qCo9pIOQtVBO2gtjgp-cBHiUrlN0DTrSs=@fomin.one> <20240720173611.GA51708@sol.localdomain>
Feedback-ID: 10594471:user:proton
X-Pm-Message-ID: e0043c745efaaec61b32b526bccdb110d855a4e2
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Saturday, July 20th, 2024 at 6:36 PM, Eric Biggers <ebiggers@kernel.org>=
 wrote:

>=20
>=20
> On Sat, Jul 20, 2024 at 12:15:23PM +0000, Maxim Fomin wrote:
>=20
> > Hi!
> >=20
> > Recently linux kernel got[1] faster AES-XTS on modern x86_64 CPUs thank=
s to VAES and AVX-10/512. I decided to dig deeper into this issue and found=
 the article[2] from 2020 stating that dm-crypt can be configured to use fa=
ster (synchronous and hardware accelerated) algorithms with 'capi:' prefix.=
 Can cryptsetup be configured to ask dm-crypt to use hardware accelerated a=
lgorithms?
> >=20
> > [1] https://lore.kernel.org/lkml/20240403004404.GC2576@sol.localdomain/=
T/#m83293b2699f9a5da04fc5780ee402191dace3926
> >=20
> > [2] https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
> >=20
> > Best regards,
> > Maxim
>=20
>=20
> You don't need to use "capi:". Just make sure CONFIG_CRYPTO_AES_NI_INTEL=
=3Dy is
> enabled in your kernel (which it already should have been since it was ne=
eded
> for AES-NI acceleration before), and the new code will be used automatica=
lly if
> your CPU supports it.
>=20
> - Eric

I have heard that on some Intel CPUs AVX-512 is ignored (although it is sup=
ported) because of downclocking. I have rocketlake i5-11600K. How I can che=
ck which algorithm is actually used? How I can force cryptsetup/dm-crypt to=
 enable AVX-512 version if it is not used?

Best regards,
Maxim

