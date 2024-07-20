Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4C3D51C
	for <cryptsetup@lists.linux.dev>; Sat, 20 Jul 2024 12:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721477744; cv=none; b=kqlmrTHiRAfMVHtugrsHeTqvZZ2OJ3fh4WWRGZGAsWWR8ClupgZ12Qt4xzpZfexiBAhLRyFB+eOt3TkFCUs6gxhIi8PPWmXBI19p37VGYK+oLgOZ31zoV58YLKrmTP3J/IwSgOD3vk1oCvJ1Q3Nt5AmncpYzq0u/Tr2y+eTniO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721477744; c=relaxed/simple;
	bh=yHbc2Kveb1ulU3JALGfLJ6VlVrOxkaHUSk7ZyQ29PLU=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=uzEXiAy7d8vnU75bOLt5NsPStqtS65+NEV4b7LRNZls0J5CgSqhUg/G/9CHE5IDD5orVU/rY8Edrp+QxRPG+8MCILb9NMuPP8CgRw3AOsbPgMSAdVV9vF2BnvN0CqIpu2VmeBkl9YxSXFx1o/pZKoJfYu90szTzmngnRI4rhUck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fomin.one; spf=pass smtp.mailfrom=fomin.one; dkim=pass (2048-bit key) header.d=fomin.one header.i=@fomin.one header.b=Hj7dPx+5; arc=none smtp.client-ip=185.70.40.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fomin.one
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fomin.one
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fomin.one header.i=@fomin.one header.b="Hj7dPx+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fomin.one;
	s=protonmail2; t=1721477727; x=1721736927;
	bh=yHbc2Kveb1ulU3JALGfLJ6VlVrOxkaHUSk7ZyQ29PLU=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Hj7dPx+5D+38jNRhfrddZwZn5D+TZOvi29FMyboVBisCdhg8Q1308l1C8DO0gRTB6
	 BeFXkLWSDA63EZ8kHmYUZrEGEXRP2gvM0i7acFx5qNB77FkI/bjW0yqROrY0RDQnM7
	 PrJHZUWF3FF8PzUkcr0jSvCNEO5lMHPtEl+wJqW6wjsdvrIhkNpymUgW2Fu0dbkJNN
	 ZSfk9MfDfKOpLGkS0GHXUtZpuce+5vMl2N01XZE4O6X/xRk2CqYPW7zXjdxo7+3UyR
	 u5unb0bL7GsnILELH253Op511z7o5B7wOhxyOxmO56ND0CZutFw0jIOtsJvX7U82MB
	 Iu3F7kUtF+LHA==
Date: Sat, 20 Jul 2024 12:15:23 +0000
To: cryptsetup@lists.linux.dev
From: Maxim Fomin <maxim@fomin.one>
Subject: Cryptsetup and hardware accelerated AES-XTS
Message-ID: <LzHpD7N7NryfAL3OI3b2QBM6UuT5QZuCCjpgxI7WERzccWwpn26f5urbFY5P1dqmYHIz3KRYd4qCo9pIOQtVBO2gtjgp-cBHiUrlN0DTrSs=@fomin.one>
Feedback-ID: 10594471:user:proton
X-Pm-Message-ID: a3671347e6ba8e7fb0f546b2c4fc3573ff95bb2b
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

Recently linux kernel got[1] faster AES-XTS on modern x86_64 CPUs thanks to=
 VAES and AVX-10/512. I decided to dig deeper into this issue and found the=
 article[2] from 2020 stating that dm-crypt can be configured to use faster=
 (synchronous and hardware accelerated) algorithms with 'capi:' prefix. Can=
 cryptsetup be configured to ask dm-crypt to use hardware accelerated algor=
ithms?

[1] https://lore.kernel.org/lkml/20240403004404.GC2576@sol.localdomain/T/#m=
83293b2699f9a5da04fc5780ee402191dace3926

[2] https://blog.cloudflare.com/speeding-up-linux-disk-encryption/

Best regards,
Maxim
