Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F47C126F0A
	for <cryptsetup@lists.linux.dev>; Mon, 22 Sep 2025 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758562174; cv=none; b=rywvUVIyeNzHsKB+gLmOCMfKpozVt+P50XzYg01zd3EHUW+0e3YWeS+3wQykDmtd3OHGg/49+CwFG0zEa4KQGBY8EIKXEs96HNseExzXDhN1bk4/hgxGz8jmGcnVsSLJiSmJd4POsRvvrAlC3GcLpGZOvTxjLQwdzV+PWzCdvQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758562174; c=relaxed/simple;
	bh=GzXz0MvBotpAjT1HhDYokcFhv7CBmTu4tU6TBG+PmOI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=PJbtj87rKI7GqfoUFVWHyYjvDG672AP057NW90Hdp1Oy5EaxNX5gS+062oSwrJaQZ36PHHMW/swdadF0tSMmaLPkCHtrepjlhF0hJyqzI74g3cPgZEPO5VGJ/7T9zLc7NGVgGO1c+1Z2Nn0f3ISZ532eN5AD2ZOVCWuOX8dUXYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cocaine.ninja; spf=pass smtp.mailfrom=cocaine.ninja; dkim=pass (2048-bit key) header.d=cocaine.ninja header.i=@cocaine.ninja header.b=k4RM3Tqm; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cocaine.ninja
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cocaine.ninja
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cocaine.ninja header.i=@cocaine.ninja header.b="k4RM3Tqm"
Date: Mon, 22 Sep 2025 19:29:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cocaine.ninja;
	s=mail; t=1758562161;
	bh=GzXz0MvBotpAjT1HhDYokcFhv7CBmTu4tU6TBG+PmOI=;
	h=Date:From:To:Subject:From;
	b=k4RM3TqmHR2SMYOI4ZoC2slc+NzEcBAzatdnUAt4vG7Rwh/oRvgoAODSUd+qPFjmR
	 Q/p8sroH47jhYR85+RDReA5/8GiR9i+6W6saxoHZM4bbGIeGdw6gDMSHBE3022VQF6
	 qQcAuj3/HxZT3wkMX4iw49yOcpG1O2LIS9TuZqEIxomuRc6PceqagjA2de6OfK+jg7
	 a82gcryRQhhVqlHG3s/nuVch8gLxXPEQ548OgxQYR+NE2xswvCOR8F1hAfGl5Szpgw
	 GO33mgLN+amR5vPuZFoYD9NNUdMS0IWpfu1l2KXAnKqxMhOXBaxVCYJge8iPuX/tat
	 DnAhhom46LWTg==
From: Vladimir Ivanovich <aj63g5u0@cocaine.ninja>
To: cryptsetup@lists.linux.dev
Subject: luks ssd idea
Message-ID: <20250922192919.4d4b3992@desktop>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

hello

luks default is disable ssd trim-discard command because leaks unused
blocks

what if shuffle data, maybe another mapper device, to leak less info?

fpe(n, key, i) = format preserving encryption, domain {0...n}
roll(n, offset, i) = (i + offset) % n

block_out = fpe(DISK_SIZE / BLOCK_SIZE, hkdf(LUKS_SHUFFLEBLOCK,
masterkey), block_in) page_out = roll(BLOCK_SIZE / PAGE_SIZE,
hash(hkdf(LUKS_SHUFFLEINDEX, masterkey) + block_in) % (BLOCK_SIZE /
PAGE_SIZE), page_in)

sorry for bad english, what you guys think of my proposal
