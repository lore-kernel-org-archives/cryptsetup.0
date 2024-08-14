Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD58818C910
	for <cryptsetup@lists.linux.dev>; Wed, 14 Aug 2024 20:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.136.2.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723667596; cv=none; b=G2ALe4GM1rJF+sXLH5RuvWG5USVp3loTxhQD0YuXEmgMORNr6KBuxFX2CbZNfSMxpnno/cG3bnLFOYhJff9yScEoCsy38Nq1WTzoP0K9APEbjr7sFhR1N8zU1aXlH1FwBLJlRSZ4FgTCgm0PLKH3E3HZ6umNNLYoleM+5qaGaPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723667596; c=relaxed/simple;
	bh=xvKr1UrnxYYJKirDkfpSsINBTsVDWOyu2E2gacK1g9g=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzIqt+ZKZExXDWdoJ+uU3QLsL+1rz2WUEM28rjxhpKnrNItyyugJktW1eGf74VmQyM8Nf0PcD9gHwW6P0M69CLTxNhHOp3jATG889fqj2vRxJos929kcHzNouKMFJIpxSVV1yRq56ZAjF5mpIRBJeBB6d3aaBPry5YkEhTfgpBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net; spf=pass smtp.mailfrom=ewoof.net; arc=none smtp.client-ip=79.136.2.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewoof.net
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 68B5D3F78D
	for <cryptsetup@lists.linux.dev>; Wed, 14 Aug 2024 22:24:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: 1.544
X-Spam-Level: *
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXtSQRJYmvKB for <cryptsetup@lists.linux.dev>;
	Wed, 14 Aug 2024 22:24:31 +0200 (CEST)
Received: 
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 3770A3F222
	for <cryptsetup@lists.linux.dev>; Wed, 14 Aug 2024 22:24:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id D0BCC1D00178
	for <cryptsetup@lists.linux.dev>; Wed, 14 Aug 2024 22:24:30 +0200 (CEST)
Date: Wed, 14 Aug 2024 20:24:29 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: LUKS, and removing unwanted volumes/containers
Message-ID: <daaf38a6-96bd-4cdb-96a2-de69e8b16326@home.arpa>
References: <172364598019.7.4053799827848884304.405662839@slmail.me>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172364598019.7.4053799827848884304.405662839@slmail.me>

On 14 Aug 2024 14:32 +0000, from iam.frightful278@slmail.me:
> i installed luckyLUKS GUI app on my linux,

I'm quite certain that this is very much the wrong place to get help
with that. There's probably a mailing list, web forum, or something
similar for user questions for that project; you should start there if
you want support for that tool specifically.

That said:


> if anyone knows a good basic, step by step tutorial, intro to LUKS,
> i'd likely benefit.. what i found on utube didn't help so much, as
> well as the sites i found.

It's not strictly a step by step tutorial, but a good starting point
would likely be to sit down with a cup of your favorite beverage and
read through the cryptsetup FAQ[1].

It almost certainly won't answer every question you might have, but
you will very likely be in a _much_ better position to ask good
questions having read through it. Question 2.1 _is_ a step-by-step
description of how to set up a LUKS container using cryptsetup and
putting a file system on it.

[1]: https://gitlab.com/cryptsetup/cryptsetup/-/wikis/FrequentlyAskedQuestions

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

