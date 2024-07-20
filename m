Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159C4144D21
	for <cryptsetup@lists.linux.dev>; Sat, 20 Jul 2024 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721496978; cv=none; b=OZ/FSfUy3jaFas7L33gbcZHIesQ6nHOuQWukwB0b573Y6T1ss70wBqZ3kvf7sr0syqXTArKEwfx2rXqv7vFcBgG1Ix60RBZs4QwdrB4unqJXM+2WK+nHD2cH3ZuKB5GU3Pjbceq82ppEH3hpPnPNS+sxad8ZEc8qS4uw5Dr+KxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721496978; c=relaxed/simple;
	bh=1tteMJSsVqCr6b4J1/FUc9GH3+RGAOegpB0BL1soCyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTGDedgebv11LXwyHD8TpKiYFvD9Aayx/iMQ2b2U5CzQRBAKXyRjW9OCmN5KgqYNLz0rhrvbyi2bMcTbzP0YY6RlzGryWY7F23CFIDFgfHQe1E7bOPphQdj/c/AvnDSeno7XLe0Xb2DlYXRd68IrSf+W0Y+DDnlSMjZG73MHzRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JX12m+Dq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JX12m+Dq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C328C2BD10;
	Sat, 20 Jul 2024 17:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721496977;
	bh=1tteMJSsVqCr6b4J1/FUc9GH3+RGAOegpB0BL1soCyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JX12m+DqAxgFxfBiSSxUHvQjySYFNrTtDFiJPgpni8aTAYO6uyn+E5rfDd7QMoQmn
	 eypqXdZSZn/nH/kclXM7aa3i0EkMwpAHReKhuxRA9eXj9iz2ulO+ivyIaSo7Dl2Edq
	 d8QauHGiXOR1jljfNdFX7FPKRZ4s55gJ6OC/NvgFd75JETOXsFan+I40jkUAOZv+pT
	 Jz8t3i8wKIKHZXaJ5Hq4yXWHxq2w+5xj6cJrh+wyZh55uoJQXCev+zKWQThKoyaJg0
	 hNSVDPNqKdfc2AWmiQzbEYiHWGXj/tR0iDx500WJCEKBLyIo+8vaWb9XKV8S59h9Aq
	 b66JEx0uw5W5A==
Date: Sat, 20 Jul 2024 10:36:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Maxim Fomin <maxim@fomin.one>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Cryptsetup and hardware accelerated AES-XTS
Message-ID: <20240720173611.GA51708@sol.localdomain>
References: <LzHpD7N7NryfAL3OI3b2QBM6UuT5QZuCCjpgxI7WERzccWwpn26f5urbFY5P1dqmYHIz3KRYd4qCo9pIOQtVBO2gtjgp-cBHiUrlN0DTrSs=@fomin.one>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LzHpD7N7NryfAL3OI3b2QBM6UuT5QZuCCjpgxI7WERzccWwpn26f5urbFY5P1dqmYHIz3KRYd4qCo9pIOQtVBO2gtjgp-cBHiUrlN0DTrSs=@fomin.one>

On Sat, Jul 20, 2024 at 12:15:23PM +0000, Maxim Fomin wrote:
> Hi!
> 
> Recently linux kernel got[1] faster AES-XTS on modern x86_64 CPUs thanks to VAES and AVX-10/512. I decided to dig deeper into this issue and found the article[2] from 2020 stating that dm-crypt can be configured to use faster (synchronous and hardware accelerated) algorithms with 'capi:' prefix. Can cryptsetup be configured to ask dm-crypt to use hardware accelerated algorithms?
> 
> [1] https://lore.kernel.org/lkml/20240403004404.GC2576@sol.localdomain/T/#m83293b2699f9a5da04fc5780ee402191dace3926
> 
> [2] https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
> 
> Best regards,
> Maxim
> 

You don't need to use "capi:".  Just make sure CONFIG_CRYPTO_AES_NI_INTEL=y is
enabled in your kernel (which it already should have been since it was needed
for AES-NI acceleration before), and the new code will be used automatically if
your CPU supports it.

- Eric
