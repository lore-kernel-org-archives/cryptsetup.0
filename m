Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A350F16DEDD
	for <cryptsetup@lists.linux.dev>; Mon, 22 Jul 2024 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721662339; cv=none; b=urVynCzS4pBOqbV5fahjSXlNWUeyX74twceri5Zh09g9CY/BMJ1pjuga86y/rCuLHwbJmPI06tLin+Xu+n+EZxqZayRTOlUrb0RZ4WPvbAfnYHjBmeEuGZY2md3p+hSDn7tMZ9p0oKXV4fLHe84jDKRZ+qDorAwSgOxrUPIJquY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721662339; c=relaxed/simple;
	bh=yfXBiXgntTWNzwtGbhDpUiJICwxJ4zUEjuYlGDepjNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxmRB9Kc3HSZF+eCzIBEyVKymAyoQRiGFWh3XJoOpByUAe08zE/zQrHFjcWwmHpI8b+sgSF+giJSk22jFM8vnAFgY+ryIUXyamp0lbPKphczTxJzZaYPvO8XwLvFtA0TJP+xNnOWqi4SfRiRkbxihz//iizzk9G1LMrtK77sWlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdymABpP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdymABpP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C5CC116B1;
	Mon, 22 Jul 2024 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721662339;
	bh=yfXBiXgntTWNzwtGbhDpUiJICwxJ4zUEjuYlGDepjNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SdymABpPkbB7JeLpsUb20h+9bvNL5XvwIDP+T+l5A3JpWyWOZHKC2ekiWQ0Y+7jJF
	 h0nQ04CV5rJFA0j6qoAbKHtEA98CI6F1QdKqrEPWUHCUM3GA5qjhg4fjoGP+iyhQWt
	 kS2rKB/nKXXvCEpdTBNLjbMBhy4YKJFOw1Z8lePsVRNfxjzWYGvXNtAOdm0Ep7GzNw
	 +xMA+IBeB4ptda118olMQSp3vt4tALWQvl2/uzE1r4c5V1RzVSUY6Bssr3AfhrHA2I
	 ZghsdadoGexegtg3V6RMa5CW4NB8HPUZfftd9fBttaQeV/bmnOAeoILHSmQOyy6gnu
	 4eo0/I01IvlKg==
Date: Mon, 22 Jul 2024 08:32:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Maxim Fomin <maxim@fomin.one>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Cryptsetup and hardware accelerated AES-XTS
Message-ID: <20240722153217.GA1215@sol.localdomain>
References: <LzHpD7N7NryfAL3OI3b2QBM6UuT5QZuCCjpgxI7WERzccWwpn26f5urbFY5P1dqmYHIz3KRYd4qCo9pIOQtVBO2gtjgp-cBHiUrlN0DTrSs=@fomin.one>
 <20240720173611.GA51708@sol.localdomain>
 <KOXKGdgZv9MEFCpmK5MItFMeEE77NA2Wh2kmbbrFNGSlAovd2WUVNvDdY6972_nqYKJlmOZrV9SyIQLwp0h3YHtjMhYZp3BfhLsXVpsixG4=@fomin.one>
 <20240721155808.GA1224@sol.localdomain>
 <NgRPAWKstiL9VmiQ1m8_A-O7V4Znvo6vGMiYoOGFkjRZAFbLPDyM2tamk1XoMZidvlX5cfPZ34iL7adYTFumFFDS7tJkCacSD4pul7AYMzE=@fomin.one>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <NgRPAWKstiL9VmiQ1m8_A-O7V4Znvo6vGMiYoOGFkjRZAFbLPDyM2tamk1XoMZidvlX5cfPZ34iL7adYTFumFFDS7tJkCacSD4pul7AYMzE=@fomin.one>

On Mon, Jul 22, 2024 at 10:36:59AM +0000, Maxim Fomin wrote:
> 
> On Sunday, July 21st, 2024 at 4:58 PM, Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > 
> > 
> > On Sun, Jul 21, 2024 at 09:14:02AM +0000, Maxim Fomin wrote:
> > 
> > > On Saturday, July 20th, 2024 at 6:36 PM, Eric Biggers ebiggers@kernel.org wrote:
> > > 
> > > > On Sat, Jul 20, 2024 at 12:15:23PM +0000, Maxim Fomin wrote:
> > > > 
> > > > > Hi!
> > > > > 
> > > > > Recently linux kernel got[1] faster AES-XTS on modern x86_64 CPUs thanks to VAES and AVX-10/512. I decided to dig deeper into this issue and found the article[2] from 2020 stating that dm-crypt can be configured to use faster (synchronous and hardware accelerated) algorithms with 'capi:' prefix. Can cryptsetup be configured to ask dm-crypt to use hardware accelerated algorithms?
> > > > > 
> > > > > [1] https://lore.kernel.org/lkml/20240403004404.GC2576@sol.localdomain/T/#m83293b2699f9a5da04fc5780ee402191dace3926
> > > > > 
> > > > > [2] https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
> > > > > 
> > > > > Best regards,
> > > > > Maxim
> > > > 
> > > > You don't need to use "capi:". Just make sure CONFIG_CRYPTO_AES_NI_INTEL=y is
> > > > enabled in your kernel (which it already should have been since it was needed
> > > > for AES-NI acceleration before), and the new code will be used automatically if
> > > > your CPU supports it.
> > > > 
> > > > - Eric
> > > 
> > > I have heard that on some Intel CPUs AVX-512 is ignored (although it is
> > > supported) because of downclocking. I have rocketlake i5-11600K. How I can
> > > check which algorithm is actually used? How I can force cryptsetup/dm-crypt to
> > > enable AVX-512 version if it is not used?
> > 
> > 
> > The way to tell which AES-XTS implementation is used by default on a particular
> > system is to check /proc/crypto for which "xts(aes)" has the highest priority.
> 
> Does the priority property takes into account deprioritization of Ice Lake and
> Tiger Lake?

Yes.

> Btw, actual function can be noticed in 'perf' command output, which in my case
> confirms that indeed vaes-avx10-512 version is used.
> 
> > There is a way to change algorithm priorities to override the default, but there
> > isn't much reason to think that people would be able to make a better choice
> > than the kernel's default.
> 
> Default choice may be problematic because it is applied in every case and does
> not take into account option to disable downclocking and thermal limit on
> actual machine. Some BIOS versions allow to disable downclocking (called
> AVX512 ratio offset or similar).

Sure, but people who disable downclocking may not have fully tested their system
for stability when executing workloads that use 512-bit vectors extensively.
There's a very real risk of the system crashing during such workloads if the CPU
is using unsupported operating parameters.

> If this option is available and thermal limit is not applicable, then default
> kernel policy means some potential CPU frequency is lost. 

Note that in AES-XTS microbenchmarks on Ice Lake, there's a ~127% improvement
from moving from the old implementation to xts-aes-vaes-avx10_256, but only a
~11% further improvement from moving to xts-aes-vaes-avx10_512.  I.e., 512-bit
vectors provide little benefit on that CPU in the first place for AES-XTS...  So
why take on the risks of using them?

- Eric
