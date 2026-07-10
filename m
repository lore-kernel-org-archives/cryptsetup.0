Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A2E25B09D
	for <cryptsetup@lists.linux.dev>; Fri, 10 Jul 2026 18:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783707405; cv=none; b=ALwyHZGL68KzaIPy0aDglmJcPJAVI4FXWG2KGF6JQ7aad8hD+Pv8eFidhbbIWZCIDbm4grxAmwpwpBbkws8XZVIERQNjnq3g+nXMv/CqfSGv9zdHRGzAsoFwHoXbKgK0jLIVAGcVwoFGBr7ZXcASSMRIIm3nI0DpC9T9xD0zDMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783707405; c=relaxed/simple;
	bh=eC+pp5VtQgPxLHkflTbj4R8L2aDKMOunxn6WZNe6CrE=;
	h=Date:From:To:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Dsi1cTqa4VekuEDQaTNOuzqfC+/zS8ORSzD9ni2g+vScHXFfFyzxn8BbB9kZRvwNI9Hr+2amm5mCL/fMpZTaO8HIf0KbzEmbNE+ilwLUTMlYBkG+Ujbi/uzBOMjWsFqBtT2cASUeW1A0+LHhWpAo974BhTomdNc/PD+OGT5v97E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=evolvis.org; spf=pass smtp.mailfrom=evolvis.org; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=evolvis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=evolvis.org
Received: from x61p.mirbsd.org (p5b2babb5.dip0.t-ipconnect.de [91.43.171.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id 2E0A010018A
	for <cryptsetup@lists.linux.dev>; Fri, 10 Jul 2026 18:16:41 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id C624C142715; Fri, 10 Jul 2026 20:16:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id C0168140129
	for <cryptsetup@lists.linux.dev>; Fri, 10 Jul 2026 20:16:40 +0200 (CEST)
Date: Fri, 10 Jul 2026 20:16:40 +0200 (CEST)
From: Thorsten Glaser <tg@evolvis.org>
To: cryptsetup@lists.linux.dev
Subject: Re: 4K sector size, cryptswap, with/-out dm-integrity?
In-Reply-To: <91244f91-7fdd-780f-8860-dfa7e784b7dc@evolvis.org>
Message-ID: <91d38f35-20fd-3beb-64bb-7adae716af92@evolvis.org>
References: <91244f91-7fdd-780f-8860-dfa7e784b7dc@evolvis.org>
x-ms-reactions: disallow
Content-Language: ksh-Latn-DE-u-ca-iso8601-co-POSIX-kk-false-em-text-rg-denw-tz-utc-va-posix, de-DE-1901-u-ca-iso8601-co-POSIX-kk-false-em-text-rg-denw-tz-utc-va-posix, de-Latf-DE-1901-u-ca-iso8601-co-POSIX-kk-false-em-text-rg-denw-tz-utc-va-posix, en-GB-u-ca-iso8601-fw-mon-hc-h23-co-POSIX-kk-false-cu-eur-em-text-rg-denw-ms-metric-mu-celsius-tz-utc-va-posix, und-Zsym-u-ca-iso8601-fw-mon-hc-h23-co-POSIX-kk-false-cu-eur-em-text-rg-denw-ms-metric-mu-celsius-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 10 Jul 2026, Thorsten Glaser wrote:

>If so, under the same circumstances as above? (Either 4K logical
>device (which I seem to not have) or 4K integritysetup with journal
>(also on 512/4K or 512/512 devices?) or MAYBE 512/4K devices?)

I just saw in the other thread that encrypted swap on dm-integrity
in J (journal) mode may be not safe.

So for encrypted swap over RAID-1 over dm-integrity, I=E2=80=99d need to
have a separate RAID device and the dm-integrity below that in a
different mode (is B safe for swap and does B allow this to work
with 512/4K devices?).

Questions over questions,
//mirabilos, who=E2=80=99ll have to repartition a few hosts=E2=80=A6
--=20
[16:04:33] bkix: "veni vidi violini"
[16:04:45] bkix: "ich kam, sah und vergeigte"...
