Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78AF3F411D
	for <cryptsetup@lists.linux.dev>; Tue, 16 Jun 2026 23:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781651402; cv=none; b=PMVjJfa9ymXaxZt66dH2H2/FXXyE/5sE456ajGEqInB5654PWuMcV/A7e3g0djBRqMIXIamQi3Y6nGS2S+fYWuLYBlMadeGS2/2VXngxpNE0UYw7HeSd0F4cIn8WL/c0OIH0C4i+FC0GOLSjsjTqnyyjpAbPBBJRYDgIDXsPtQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781651402; c=relaxed/simple;
	bh=6VsGmLswryEcGKbmT0Q2VJwjCCkjU1oQ+KEbQx4/Pt4=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=FJuAfrQlbd/JUyVPZQ51UvFOBph1zhLiCWJy/EzqzJUT/sGimLGjmliH2rPBjKCA9v6rJmAFYV78czGLBIBN5m/5hReMJSstjFk/WqSULSvzkF3mEEjFMpaKPpJh33Uoi6bG0JTVm7/uhbhFMN0gZwb+I9xDSiauOOUKXqW1HOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com; spf=pass smtp.mailfrom=tutanota.com; dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b=htKV7nUP; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutanota.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b="htKV7nUP"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id 7B6DB14EFAA1C
	for <cryptsetup@lists.linux.dev>; Wed, 17 Jun 2026 01:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781651393;
	s=s1; d=tutanota.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=6VsGmLswryEcGKbmT0Q2VJwjCCkjU1oQ+KEbQx4/Pt4=;
	b=htKV7nUPcqCM7uvBjUtZUdXLTCXqWZfn/lS3JAPHO4i0InNX3cbUAzUbtbxzBHy/
	P2cTSrgzegMFaAVZJB636pQU/7LpWGNhk/JoYMiicQp4y85URj1ncaSQVWLkAvLyM19
	uLQ1K3hfiD8dDpQ+f+2+bxEFOWIn7y7A1Pi2oN+yHzi4qBm11h224ZDVVkAyuGHBByR
	pT7XT53sQyWyMVrngR2CsUOU/fbzNVXR4nioUSf1fSPTzRiA+V+B7ieklWUFiiYmtk1
	7mYuVcwgVt8T5bteAulDejgGiJtCl/OOIWwxbm9e067PoyXy8o1QDhx6dgPdkUQ14QL
	yxdne2JqmA==
Date: Wed, 17 Jun 2026 01:09:53 +0200 (CEST)
From: Borden <borden_c@tutanota.com>
To: Cryptsetup <cryptsetup@lists.linux.dev>
Message-ID: <OvHgcxy--F-9@tutanota.com>
In-Reply-To: <488b1720-619f-475f-b5a8-2e6ca855b8b8@redhat.com>
References: <OuyYP0g--F-9@tutanota.com> <488b1720-619f-475f-b5a8-2e6ca855b8b8@redhat.com>
Subject: Re: What does cryptsetup luksAddKey --new-key-description do?
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: 01860081bf58008fd8d0320d4bb6316e5e4961e4f91e2478b663adcef3724b3d54976dc41f0b2a26c03eae3bec7f4714cf205cada80020d14dd560b709983276f9:TurnOnPrivacy!:tutamail




Jun 15, 2026, 05:33 by okozina@redhat.com:

> It reads a passphrase for a new keyslot from a kernel keyring key with the description provided as --new-key-desription value argument.
>
> I'll improve the man pages description to make it clear. Feel free to open new issue on > https://gitlab.com/cryptsetup/cryptsetup
>
Thank you. It was unclear that description refers specifically to the kernel keyring. I thought it might have been a LUKS label or something.

As long as this shows up in search results so you don't have to be bothered about this again, I'm happy.
