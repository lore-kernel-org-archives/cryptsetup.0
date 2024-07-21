Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3898F5B
	for <cryptsetup@lists.linux.dev>; Sun, 21 Jul 2024 15:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721577490; cv=none; b=eFFn3jiTTALAvVPgo3QRNqoBmRKtU5uWdj4NN/F/mvU84iVWHRGW+BkObzTN5S325oYT5JEov1sEP1vWQrHK+f15DbCF5rOu9v/DiCo2L2N9gtIfF0uX2tIMpkB7vDJO5CNDd4r0s7WN3EQaWr8Gy2XYMDtUe42LU31jwoMA6cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721577490; c=relaxed/simple;
	bh=isJiPpCIu5AkojVdMmLwPRHDYh5QQ+SuDRncmKb6JA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGCoiX2BjdV7+LhwswFutrsLUuEpaLVDru6gx+TaxiZIhPsZgASI+XhZK4y8pRxsCeSQJ0DTaPx+CHzni//Vk56YYqD8M/NOXu9N3BjRr7jvLfbmH6Js0QtbtbMfMoWeGe8tLEs5eQSEK6Dr2jXeqv1vC5MDxfiPlPzV+dc3O4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/9gtA6r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/9gtA6r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10051C116B1;
	Sun, 21 Jul 2024 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721577490;
	bh=isJiPpCIu5AkojVdMmLwPRHDYh5QQ+SuDRncmKb6JA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/9gtA6rMMpcpwU9QMcLcTTE4GwIHCSr0Tc/IaS0xlSP9MCSWYPdH1xAZvYFa4cBo
	 yPMLlvILnGpGHsToT9gFkO2iL8tDphLGQrM8d3wCO50ItWQVZMYdxaTZJ3xaYucoIV
	 YBQyM5jNmkxG3DBm2+OSoX0K/Kf7+alm0dwzA+jEgyemiu5rijo5uojjssut78NbZp
	 maIbk5wlnNxxkL+LmwPYzZRP5mbMp4tUD/dkdP/1NbNJSdZRyGfGi4Y9IcanQJI8/Z
	 n3vWXLQACdcyRr5hhCRdu8I6tSzJJysRQexMCs3Dr9b4AYBI+5f+Z0x7yi6ID1Hdty
	 D4p5Xq61uGqBA==
Date: Sun, 21 Jul 2024 08:58:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Maxim Fomin <maxim@fomin.one>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Cryptsetup and hardware accelerated AES-XTS
Message-ID: <20240721155808.GA1224@sol.localdomain>
References: <LzHpD7N7NryfAL3OI3b2QBM6UuT5QZuCCjpgxI7WERzccWwpn26f5urbFY5P1dqmYHIz3KRYd4qCo9pIOQtVBO2gtjgp-cBHiUrlN0DTrSs=@fomin.one>
 <20240720173611.GA51708@sol.localdomain>
 <KOXKGdgZv9MEFCpmK5MItFMeEE77NA2Wh2kmbbrFNGSlAovd2WUVNvDdY6972_nqYKJlmOZrV9SyIQLwp0h3YHtjMhYZp3BfhLsXVpsixG4=@fomin.one>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <KOXKGdgZv9MEFCpmK5MItFMeEE77NA2Wh2kmbbrFNGSlAovd2WUVNvDdY6972_nqYKJlmOZrV9SyIQLwp0h3YHtjMhYZp3BfhLsXVpsixG4=@fomin.one>

On Sun, Jul 21, 2024 at 09:14:02AM +0000, Maxim Fomin wrote:
> 
> On Saturday, July 20th, 2024 at 6:36 PM, Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > 
> > 
> > On Sat, Jul 20, 2024 at 12:15:23PM +0000, Maxim Fomin wrote:
> > 
> > > Hi!
> > > 
> > > Recently linux kernel got[1] faster AES-XTS on modern x86_64 CPUs thanks to VAES and AVX-10/512. I decided to dig deeper into this issue and found the article[2] from 2020 stating that dm-crypt can be configured to use faster (synchronous and hardware accelerated) algorithms with 'capi:' prefix. Can cryptsetup be configured to ask dm-crypt to use hardware accelerated algorithms?
> > > 
> > > [1] https://lore.kernel.org/lkml/20240403004404.GC2576@sol.localdomain/T/#m83293b2699f9a5da04fc5780ee402191dace3926
> > > 
> > > [2] https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
> > > 
> > > Best regards,
> > > Maxim
> > 
> > 
> > You don't need to use "capi:". Just make sure CONFIG_CRYPTO_AES_NI_INTEL=y is
> > enabled in your kernel (which it already should have been since it was needed
> > for AES-NI acceleration before), and the new code will be used automatically if
> > your CPU supports it.
> > 
> > - Eric
> 
> I have heard that on some Intel CPUs AVX-512 is ignored (although it is
> supported) because of downclocking. I have rocketlake i5-11600K. How I can
> check which algorithm is actually used? How I can force cryptsetup/dm-crypt to
> enable AVX-512 version if it is not used?
> 

The way to tell which AES-XTS implementation is used by default on a particular
system is to check /proc/crypto for which "xts(aes)" has the highest priority.
There is a way to change algorithm priorities to override the default, but there
isn't much reason to think that people would be able to make a better choice
than the kernel's default.  The implementation that uses 512-bit vectors
(xts-aes-vaes-avx10_512) is only deprioritized on Ice Lake and Tiger Lake, so it
won't happen on your system anyway as it uses Rocket Lake.  On CPUs where the
deprioritization of xts-aes-vaes-avx10_512 does happen, there is a reason for
it, and it is only 512-bit vectors that are disabled, *not* AVX-512 entirely.

- Eric
