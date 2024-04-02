Received: from a2i461.smtp2go.com (a2i461.smtp2go.com [103.47.205.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A31DDA8
	for <cryptsetup@lists.linux.dev>; Tue,  2 Apr 2024 02:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.47.205.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712024135; cv=none; b=jVxrcFbzO1BGl09olJDCNU2wMoB/d9M4T594sLpQWUysaos/eNW8mZ6z3nB4rNM6v44riRzGa7p/BQlkUcz/5v6G0umwaZLOhE/MhRt3SVky3hqE1jgjJ6fTqRTuNSKjnG8FKhs1MNUo/Z6PtofULlw2/tZkbNVGJrnA0KbmAPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712024135; c=relaxed/simple;
	bh=asf0NCWOqFjsZI3/3Wlm7jZURE1zZQglH4+pCAL4KCY=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=n/fro9ysfXMxKfMiCUV8nsbY2pkkxAwMJloIFpi6ATHoW1CmBytzoQOAe1FWANV1J8T13LnGaqf7MLCvRv/v7zjvi4aiYrRlzN1lr5NJI4dgSoBF/ZsmYTjKqtP3YIa96gmf3wswVGO+jmQn1veq10G6KM5kFIjrD/WkMzMFtgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atlief.com; spf=pass smtp.mailfrom=smtp2go.atlief.com; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=TqzviCjG; dkim=pass (2048-bit key) header.d=atlief.com header.i=@atlief.com header.b=fDj2a2Sj; arc=none smtp.client-ip=103.47.205.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atlief.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smtp2go.atlief.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="TqzviCjG";
	dkim=pass (2048-bit key) header.d=atlief.com header.i=@atlief.com header.b="fDj2a2Sj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mij4i0.a1-4.dyn; x=1712025031; h=Feedback-ID:
	X-Smtpcorp-Track:To:Date:Message-Id:Subject:From:Reply-To:Sender:
	List-Unsubscribe; bh=asf0NCWOqFjsZI3/3Wlm7jZURE1zZQglH4+pCAL4KCY=; b=TqzviCjG
	bzVSkX7j71g9nbRsqtVNouNMFLFCqjJ+uO96dzFNJDVRW/VZyeWCULpWvANAfenlqHMSpIuESd3QA
	MUz9GYFJbtrBMRmSnF27NPFX6deUzRzNkNCvYH4+1nOtFuNvou0evbZQfcH2tTyO8XwnjHN52imut
	FPb1jGjjHJYJESqz8pG8MyYvQ7E5xwFs+s29elciUA3Wp3RX0ct+quE1cxrVDABkhlW6qa9gLbbAY
	kGWwx84EO8eMDi3FYdx+XjWAPnkbrImGMPsqbAyABQqoUgCZWhR61im0eu0N5tn9r0Lb5XCMvCTol
	6KxRPGwZuOmaIoI4vaWfkMWh7g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlief.com;
 i=@atlief.com; q=dns/txt; s=s864594; t=1712024131; h=from : subject :
 to : message-id : date;
 bh=asf0NCWOqFjsZI3/3Wlm7jZURE1zZQglH4+pCAL4KCY=;
 b=fDj2a2Sjg9ovM6KyNlhF5VUCxWtS1Ud9ttgCHhN/67Ept0cSxRlQHggaAM4Imv8S+1m3Q
 Lb/3U1MCHzgaBcVvO0+3zaL/uNb73KgMVKiJuzPGhklFTLyFOght51fi5+39CRO3SHnAGHO
 ZxrbqMiDXN3DDAsQ6R2xyb7it7ZYqaeXTyNhjCblZjIqosknL9tsoPwx/NsnyrmzThI7WWY
 vI3TCnPmHcccxoHQBkPr6F/UqBmbLqS8g06CnNv5PrSePGm1e4eyO2/QJk5NScW1bWCz7D7
 0DcYhGqOROEiByLI9kMGWgOft7ktZgy4h4wjDNB6moYOd1+tzjT+d5e7V49Q==
Received: from [10.45.79.71] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <public@atlief.com>)
 id 1rrTgP-pH9Tlz-Ls
 for cryptsetup@lists.linux.dev; Tue, 02 Apr 2024 02:15:29 +0000
Received: from [10.136.244.98] (helo=p.atl.red) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96.1-S2G) (envelope-from <public@atlief.com>)
 id 1rrTgP-Dv0GLP-00 for cryptsetup@lists.linux.dev;
 Tue, 02 Apr 2024 02:15:29 +0000
Received: from smtpclient.apple (unknown
 [IPv6:2607:fea8:21c:de9a:85f:fcf2:b3f:611a])
 by p.atl.red (Postfix) with ESMTPSA id CF7172DA023
 for <cryptsetup@lists.linux.dev>; Mon,  1 Apr 2024 22:15:26 -0400 (EDT)
From: Alex Lieflander <public@atlief.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.8\))
Subject: Authenticated Encryption with external Data Integrity Fields
Message-Id: <22FA1250-CE63-4289-90F3-D2256762E5D0@atlief.com>
Date: Mon, 1 Apr 2024 22:15:23 -0400
To: cryptsetup@lists.linux.dev
X-Mailer: Apple Mail (2.3696.120.41.1.8)
X-Smtpcorp-Track: 1rrTgeDv0GLe00.C4pjU_sTNKE9Y
Feedback-ID: 864594m:864594aXAbgdT:864594sWcJ98OfTJ
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

Hello,

I=E2=80=99m trying to add authenticated encryption to my setup, but =
I=E2=80=99m having trouble to configure some of the parameters. I know =
that `cryptsetup` with --integrity only supports some of the options =
that `integritysetup` does, so I=E2=80=99m wondering if I could instead =
create the integrity layer myself and tell `cryptsetup` to pass down its =
integrity tags (like it does with the --integrity option).

If that isn=E2=80=99t currently possible, are there any plans to add =
that feature in the future? It could also be used to take advantage of =
physical hardware with T10/DIF support. Alternatively, are there any =
future plans to support using a separate device for the integrity tags =
like `integritysetup` can with --data-device?

Thanks,
Alex Lieflander=
