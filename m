Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94992E62A4
	for <cryptsetup@lists.linux.dev>; Fri, 10 Jul 2026 17:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783704441; cv=none; b=MD+/Q5ILqZvz4RaaCiVtWC+4uVjtGMq6XbrR7563YZ44LK5BgStt7p66PBkekk8LfKG8vm919v6gEgdfSWR2G5286gKcE5AlHnruN9/PtWbAg/PjUiOd+TlYEHOwS3xdDn+1IRKIbKe8uFX/EuSQ7M0MwbNkk36ztb4fjiPKUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783704441; c=relaxed/simple;
	bh=xBB8lAJcuIx1R2TKHhDv0Jk5XM4QvT633+4M3JL0O7w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uuei85hhQjKF4l4FYtS3LJnq24K/caqa0eOqfpdnvNEjpN1lvj0Zmc4jg2OmqTA2ntnKa8iWZuJarJ+itn2R/RRsomi5NkFu6Os6QkwMh0TA+2HLkIJTZIHe/QzSCt5Sb4kqr2VKZH1f4rOCSlMZpUm1PeOD82i9QLwjZQ1r2+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=evolvis.org; spf=pass smtp.mailfrom=evolvis.org; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=evolvis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=evolvis.org
Received: from x61p.mirbsd.org (p5b2babb5.dip0.t-ipconnect.de [91.43.171.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id D8F8010018A;
	Fri, 10 Jul 2026 17:27:17 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id 7D525142716; Fri, 10 Jul 2026 19:27:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id 789E8142715;
	Fri, 10 Jul 2026 19:27:17 +0200 (CEST)
Date: Fri, 10 Jul 2026 19:27:17 +0200 (CEST)
From: Thorsten Glaser <tg@evolvis.org>
To: Max Gautier <mg@max.gautier.name>
cc: cryptsetup@lists.linux.dev
Subject: Re: dm-integrity: estimate the size needed for separate integrity
 device
In-Reply-To: <ah05u91w9wfghC8_@framework>
Message-ID: <0eac0c5e-7e2f-a934-8967-8dd9b70a7898@evolvis.org>
References: <ah05u91w9wfghC8_@framework>
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

Hi Ma,

>But I'm not sure what size each "integrity tags" partition should be,
>depending on the data device.

I=E2=80=99ve wondered the same.

I extracted some code from the Linux 5.10 kernel (as that=E2=80=99s what I=
=E2=80=99m
using on bullseye) to estimate that, once for an already created
split-setup device (if you create it too large and want to shrink)
and once before creating.

It assumes defaults for most parameters, but it does support tag size
and sectors per block. Use at your own risk.

https://codeberg.org/mirabilos/useful-scripts/src/branch/master/integrityse=
tup

Thankfully, the kernel refuses to set up the device if the partition
is too small, so you can test.

Here=E2=80=99s to hoping newer kernels/cryptsetup versions don=E2=80=99t br=
eak it ;)

bye,
//mirabilos
--=20
FWIW, I'm quite impressed with mksh interactively. I thought it was much
*much* more bare bones. But it turns out it beats the living hell out of
ksh93 in that respect. I'd even consider it for my daily use if I hadn't
wasted half my life on my zsh setup. :-) -- Frank Terbeck in #!/bin/mksh
