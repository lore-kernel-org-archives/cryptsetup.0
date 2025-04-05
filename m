Received: from mail-107166.simplelogin.co (mail-107166.simplelogin.co [79.135.107.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CAD14B96E
	for <cryptsetup@lists.linux.dev>; Sat,  5 Apr 2025 15:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=79.135.107.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743868080; cv=pass; b=Jr/ihDWaH7ln99h4AIrsrrF/bO8q2ODhkBIGm01GkgNSr+99w07ivZXDCdLrQNcgV2JjYth+EpX9eL85CjjXgQMRjk2dMFVWrgbhcwMjuPSakrtsaehCicXLrZ9/YjteK9VQy+efXo/2+GXeQBz5umMzir2v6ujc66Yt/sfK2oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743868080; c=relaxed/simple;
	bh=17/8CyxNTjuzq1TBEADRBH3fQSBLV+wgRJNoMhb/1gU=;
	h=Date:Subject:MIME-Version:Content-Type:From:To:Message-ID; b=AQMM9z/2q11AuC+d2dWWYG2ePDXzyN5Sn/jwlqPhDFJixTwiJsVLLkD4fD9y2vQZ9dk2wF7qsYAyJP9u8aa8YGDEW5Gvv2pWLXMA9BIV2ZuxM6Ys62jqn02k56pOdbW6nGZTVgWobugzKMtpzAYcFuJoS9uITj1m0+XqYodqT/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=passmail.net; spf=pass smtp.mailfrom=passmail.net; dkim=pass (1024-bit key) header.d=passmail.net header.i=@passmail.net header.b=xETN5jRI; arc=pass smtp.client-ip=79.135.107.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=passmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=passmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=passmail.net header.i=@passmail.net header.b="xETN5jRI"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1743867693;
	cv=none; b=h4XT9oOcEigeq5AvwYkDWj58DTDocGYL9DxUQpCJM2pX1sM9lsqEZ5MDoSqCqZMq+deTIvM6nhaJ024ocOfTeCSe29DPSfMheX0934+9eR5X6zVIgN6MZGMJxS8MTOGD9o8SuzwnMN3U7HwfM79NzpSf5UIUl1P2q+OA+lwzEe4NLyouG5LggwqrpNW3ujnu+7uRNwLTtyPiasrVAGpPVZEmK3LJZPhOBvKqv2XnZNKsu3gPRZg3xoDlkcCLLKucYp0LSruUMSpKEuA7MdMpPw8ypQ5WP5EU4sE+KHclViWVB9PtVurW9ZmxAsbz9rF8ejTwkg3j46DID3Yacyq+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1743867693; c=relaxed/simple;
	bh=17/8CyxNTjuzq1TBEADRBH3fQSBLV+wgRJNoMhb/1gU=;
	h=Date:Subject:From:To; b=BQqcDb0oKl3cd35jJ0SzhOKwoaEqGNFd6m23PHsYTjdyLBG0l5qy7PK/gRiiWbidB9rUYjo34uvziYiediHNJszMI3k1BurO1XYpbFFWMhd9glT4fP9ch2GmcduNuau3C6uQrik60+FW22rxQfJyBSqkEpkg2QJ0KYLUQrPvm7sGWjd8LpIR3gfEfioI5N26yOuWQhTPNOpccWhSH8BLvOkA3ja1aEKrrmFYVfvtElvB3vL/mFNzxH80sAOClACB7MNYh53kLmcKX8NravaqZy8BuDAHi8Jt34qylTE4U3aTAp3PhZ2+htje5XjfUDDwhRbsi/xT7NT125z2YpJklw==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=passmail.net;
	s=dkim; t=1743867693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=17/8CyxNTjuzq1TBEADRBH3fQSBLV+wgRJNoMhb/1gU=;
	b=xETN5jRIYPWDSdMnUO/CmFxSDX0xdQqL6hEzikMHk2ZO+0a1hbEKe+FXn5V0ntZ4TErUcV
	DG7PCnvby9PPelD4iZ/+Nl0gPYI5hGnCppy78TpkBlYdrEy3gObrHmTLdrolyu60OxM3Sh
	CcemPCTY69Lfc5OBzXXuX2TaRrWTq/c=
Date: Sat, 05 Apr 2025 15:41:26 +0000
Subject: Looking for LUKS GUI
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Oliver <oxid.oxidize842@passmail.net>
To: cryptsetup@lists.linux.dev
Message-ID: <174386769355.6.1636033258357958528.666033728@passmail.net>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 666033728
X-SimpleLogin-Want-Signing: yes

Hi

I am looking for good encryption local-only folder tool.

I took a look on LUKS but=E2=80=A6 I tried to find Linux GUI install guide,=
 but I can=E2=80=99t find it.

I run Linux Mint 22 Xia (Cinnamon)

Secondly, how really secure LUKS? I need to store some really important inf=
ormation (journalism) and in my situation it MUST be encrypted and treated =
as highly classified information. It is really important.

I am journalist, so this is highly important n

I really don=E2=80=99t have time to try everything myself, as if I will mes=
s something up, I will be in whole ocean of trouble.

