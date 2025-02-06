Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77781225798
	for <cryptsetup@lists.linux.dev>; Thu,  6 Feb 2025 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832663; cv=none; b=FLuIAxDc9/ng8mkSqTb72GdwNP7qas6QumoWun6QQP81nyl59YZCnM5mzKz9dZwi+1zE4bn0GBNHd+udPs0GQIgZMxbolYpBvJt123z9WRWTGuYweqBeQVX43mn9Jr3m4T1/BVHNEwTqIcZaRWBZgw2gMM3rCR3FWT5Btk0EAmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832663; c=relaxed/simple;
	bh=JrLflwCeqt1CVGBuJsWL4dKolrT01KVjMWCHKMaKa70=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=iByPaCj46O60UmdNqADk+/gYXQzm2SHd6VWI7MsF5+Wa6MEIZT9ho3uGoWwUTs3u0gBTRdR/lScMX7ZSgk4URduvIfORWV8uHKMrZ+vUH7YEiWaa1uFaHYgqLXj9UHVCK0agfe66epP7DaoC5M8gLNaWDe1KOEnIBO0wOcHYdr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=STc67ios; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="STc67ios"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ea2qmpjxgvan5dikt2524m6w7e.protonmail; t=1738832649; x=1739091849;
	bh=JrLflwCeqt1CVGBuJsWL4dKolrT01KVjMWCHKMaKa70=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=STc67ios0kyhcX1ykF+pf5WYtQ5klyIRz+7HJQJLU85oGVj8SKLCv7LobeU3nXUhG
	 S7jczzCr2m7Mv7jqZxYCnxyKk7SntRdMI//Qxm83RkyjQQFCrr5doh727KWUdV31Te
	 mAsis5rO5A3GVpCZTet76Y8xlD43VRVTx5wTFKmW4pizmvshprEJSJfoGSq9besfs6
	 wL2RVS7bbwI0D9avUeGx/+0GOU6NeZ8bByYMiZ4VMRDj/v2BUjy02v1qbA9nq2hpc7
	 iPT4/+vgroVbzKntcqBtO+6g8jHY8LfNLue+R40Sob7cep0d204lqvd5Z3gsp4VeG0
	 a2+X8a6R8qs/Q==
Date: Thu, 06 Feb 2025 09:04:02 +0000
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
From: forbytten <emlister@proton.me>
Subject: cryptsetup FAQ - clarification of loop device security guarantees
Message-ID: <ECuOkqnIQPivTNgsB2kV-djutsXXEdcFpuE3OKiwaP2ypwzAyrp9kYt_jGMSYZ6jdEkhmIRvX6sSCLMaITA8IHEpDyA2U9K8HCNdEpCoQ0M=@proton.me>
Feedback-ID: 133470085:user:proton
X-Pm-Message-ID: 2fc97cecfea15073dc818b2a2d12346927ee1c05
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

In the cryptsetup FAQ, under "2.6 How do I use LUKS with a loop-device?" it=
 states "This can be very handy for experiments". I am seeking clarificatio=
n of whether the security "guarantees" of such use would still be suitable =
for production use. I hypothesize they would be, due to:

1. Arno Wagner, FAQ maintainer, seemed to suggest that "high security" use =
cases are feasible, albeit that was in 2016: https://lore.kernel.org/dm-cry=
pt/20160403235729.GA12686@tansi.org/

2. I would expect the threat model of LUKS2/dm-crypt/aes-xts to include the=
 ability of a threat actor to take a block level image of a physical device=
 and attack it offline, which would be equivalent to having a loop device b=
acking file?

3. I would expect a loop device to behave identically to a block device as =
far as LUKS2/dm-crypt are concerned.

Regards,
forbytten




Sent with Proton Mail secure email.
