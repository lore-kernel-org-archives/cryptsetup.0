Received: from taslin.fdn.fr (taslin.fdn.fr [80.67.169.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A677F38F248
	for <cryptsetup@lists.linux.dev>; Mon,  8 Jun 2026 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.67.169.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902337; cv=none; b=hgghhnfyxvALyc4F4nHOBEm927FmB8AG4j1aT9+rmpmKhmkkB3fhAuKKdYtjaYI/pzUFkMyL7deVhvCJNrXcPjjpnGgIv0+kS1RnZziqBgY9lPKM+4csoHbuXEHC8/v/QDwOp1B7UfnIeKuJS6M6YYniv8Kflm31vDurh05d3KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902337; c=relaxed/simple;
	bh=wryhcKfvcOT5R+kT9Q02gRr2/Gaf+Ipi9tkcWbUgdvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n58f80CR37hoqnkpggwzlbPcqBDVhNifcmkHeYEJ63ZJ9HdwrqBaEZTxHjErmMpxh7fDszB05aUWnIT1alXG8536PUP5kNxxUqu6Oy3vhU2UECgqxVI/G5ce527o78bmxm/vF01zXmCUCNjQDzCMaHkoMPmq6QTX7rllLFyLOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=max.gautier.name; spf=pass smtp.mailfrom=max.gautier.name; dkim=pass (2048-bit key) header.d=max.gautier.name header.i=@max.gautier.name header.b=QwBEKxoA; arc=none smtp.client-ip=80.67.169.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=max.gautier.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=max.gautier.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=max.gautier.name header.i=@max.gautier.name header.b="QwBEKxoA"
Received: from localhost (unknown [IPv6:2a0c:e303:0:cc00:6620:5d40:535b:7cea])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by taslin.fdn.fr (Postfix) with ESMTPSA id 77B2A6023A;
	Mon,  8 Jun 2026 09:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=max.gautier.name;
	s=fdn; t=1780902328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tv+67LmhDR8Z4JJ0WYkKERKpllhdzJD1gV8rZsJN7SA=;
	b=QwBEKxoA0NT9mk3L1EK4dEUUKSjct+tknhQVfcj7FiW6+2XLK4MBplAd24GGg+WYIFP8d3
	xBsPe/6ar5INbrFBc3eW7rReeKulHnyPVDQcA3GbeP0t1PIu80KzFLhN2Awsr6L4wL5PrR
	49Rfl8uLFDeDXr0YTBjoTiE9wPPYf1X9+JDY9MxlN88uVXYchHp35FTrpNLQrBhqH/dyRv
	l7sE72YSPRrI4eZY2QOME4E5DP4fwBg8luhK9JcUi1UVU3EmUD8Q3Lr7e9Nv0eSySo766w
	m2CrtkqVk+Z+D3h0C0EBP/yQ5ibPW44O51ALExLoXGun/Ho6Gl/BhsLSDWwNHw==
Date: Mon, 8 Jun 2026 09:05:27 +0200
From: Max Gautier <mg@max.gautier.name>
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: dm-integrity: estimate the size needed for separate integrity
 device
Message-ID: <aiZpt6MeB-QmmsfB@framework>
References: <ah05u91w9wfghC8_@framework>
 <20e7ea6e-1583-4274-a243-05e52f206a18@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20e7ea6e-1583-4274-a243-05e52f206a18@gmail.com>

On Sun, Jun 07, 2026 at 03:08:41PM +0200, Milan Broz wrote:

> ...
> Actually, integritysetup should check device size before activation...

I don't know about activation, but at least format does some kind of
check (delegated to the kernel, maybe ?): I used trial and errors to
confirm the calculation (running `integritysetup format` resizing the
metadata device between each attempts) and by resizing below a certain
threshold, I obtained every time a error.

I did not write it down (the error message) but it didn't hint to the
size of the metadata device at all, it was only clear because I only
changed the size between two attempts.

-- 
Max Gautier
