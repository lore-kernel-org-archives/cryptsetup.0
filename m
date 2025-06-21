Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2E0173
	for <cryptsetup@lists.linux.dev>; Sat, 21 Jun 2025 01:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750467674; cv=none; b=ehOfVI2DeL3X4o4RyheDxizhDjvwp7fOzZ6g5Zk3EWcvQfHRDFWIRyGGYOh/VCpka7wCmV/cOvmJwn4obN1fexM1bH+GK4l72fIok9fesSygctBb+gDniPleWMsua+nd8LDka7+aZuD370gb4WYB46uI9jpmjtlvbyaxvbX0h2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750467674; c=relaxed/simple;
	bh=OxGJ4gyj9Umv+DzAdclEm10QeOEJO7b/WcYCiCXRiMQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hkh/5XIzAK5BmExY/5/WFGwyd7HL2k4jVY4Zi/N69NeJPh640fharsLXJTHKJAMnXpf5tqK5cwelT+qgkjI5TELrOm3YzgiDiWX2iLjEIotvZl6QCQCMlTYUbIP/ibCslxgJjJaY96Ee6AkhUqkFA2FSTxDvTKYHTVQKSAPC/dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=QI6uFSyw; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="QI6uFSyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=rge3sveztjdojeimb3hrx7vohu.protonmail; t=1750467661; x=1750726861;
	bh=OxGJ4gyj9Umv+DzAdclEm10QeOEJO7b/WcYCiCXRiMQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QI6uFSywImSRE1TAiAtKjxRE2TjlDci6ryx+eVDcedYaV4hl5Ngy8wMuu4QH09cbf
	 j3OCCKy0xe58/QsJXW+23T5xLcsU9Jf7ylG7Pc1mnuDXU/bT96k3A5aS/qsq7kmzEP
	 t4a08Yq/l/3ae3KwfPPuYzHSfiI86YrHqjHWUEBU5dgdpcYAo2RYJU+C5ds+z7SiKY
	 OjkUt5TGc8w4bGbnemrZ4V2DcN1t8PhjUYH0kL9q156CylOkGqaA9bYXiPkhnTkfMu
	 W2h69JFpy9tdRSRFmXf34pp5+UtStsReu6ePdSe9dnb7I4LsT1PY8RnzlhUEB1V2XM
	 BFZIjip6TePYQ==
Date: Sat, 21 Jun 2025 01:00:59 +0000
To: "152cc69a347e@ewoof.net" <152cc69a347e@ewoof.net>
From: improve9406@proton.me
Cc: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: Re: Luks encrpted disk with a blake2b checksumed btrfs fs is better than cryptsetup --integrity option ??
Message-ID: <mgSc6uy14OafaW2gT2fCv2_N3N7EorwkBWx3sx5tzaQciRteVO6ZQ_esalKPkOMEb5NhpOR6-ebSH5mwBbHG0MXWSmesEDhqmYBb-edIdBY=@proton.me>
Feedback-ID: 132508452:user:proton
X-Pm-Message-ID: 7a5c8353960bc10431c500e7d16d35d23cf35a61
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I guess to protect from what AEAD protects from , mainly offline bit flipin=
g tampering & possible replay attacks.


