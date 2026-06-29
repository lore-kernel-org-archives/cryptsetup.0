Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6490C42189A
	for <cryptsetup@lists.linux.dev>; Mon, 29 Jun 2026 16:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750470; cv=none; b=ORfAhGXEx5Dyq89gmOXSVeMMSz8RRKsP7Ap3Dp00kLK7PykIbWNovuYjHjS8O6a+tMh/ERkW4PGE9BJxmKrgjagas/kSgSplNaZqshqrMRz2330EZs+xnZVNNFSGA/+qgZlk0nTSY0kQuseJ+HrJBU8BvnTsNfnFWW/EKEXdayg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750470; c=relaxed/simple;
	bh=4h6OEmLAJvR//Tj7sqQK4oGGzTfQ7tjwHCwqVeTGMn0=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=ADhLpep4AW1nacbHvajJEzxUdSnxBKG70HzbBg/elFC0kgr6bpi+XK6aCj0/ZUX82JfH9KoOhbOI2dCEyDS3zPmqBGaSYFx/G5SiCvnkN6PKsdgmLEeWpzHCWxe3gpfPjEZhSKnMPgiJ5Zi/GsFeUgy/3IFeevaXqfUe3m6Jr4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com; spf=pass smtp.mailfrom=tutanota.com; dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b=ZRlJjK1Z; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutanota.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b="ZRlJjK1Z"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id E055D155E66EC
	for <cryptsetup@lists.linux.dev>; Mon, 29 Jun 2026 18:27:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782750461;
	s=s1; d=tutanota.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=4h6OEmLAJvR//Tj7sqQK4oGGzTfQ7tjwHCwqVeTGMn0=;
	b=ZRlJjK1ZHr5YgIukYBwmNyQCZ9DpSV3it0C91avEQmFPRbjgm65jlGeXb+w7m272
	4dAOc2CiT+vZNt/1749ZB0W/AzZYgSd9hqqVYZeM4WcQlJq1wBNkk+MTSdnABSNS0iG
	FpbZ6zgbO8G6bYbu+iSKMnHs1+69CEz5lnW53iay7kMYamcGFn7t8/7IsPomeehHBnk
	xqNa8IUnwZw34Dpt6Q2f+57j8xHVfR2PQX7Gm3Qs4Y3L/VdNVQK20Jdgxhp6tgRwPk/
	NwUB5A5xDHbSYclmRaxjLQbxEElzO75cq9un3R2Uz1toG+PvgGf616aUU8QQ/kI+A3D
	FKV2cPVegA==
Date: Mon, 29 Jun 2026 18:27:41 +0200 (CEST)
From: cyper@tutanota.com
To: Cryptsetup <cryptsetup@lists.linux.dev>
Message-ID: <OwJ5x3r--N-9@tutanota.com>
Subject: [feature] PQC KEM
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Feedback-ID: 01c31dc8a5d4d6751b6f6ac02a78e46dc8b122f05e0198c33d2725066fef6ebaf2fef8f8a5859fcd950990ed82c624bcd61f0c6ba63d9a3ddbf9efb21fe5671f4a:TurnOnPrivacy!:tutamail

Interested in introducing a new LUKS2 "xwing" keyslot type unlocked by an X=
-Wing
post-quantum hybrid KEM (ML-KEM-768 + X25519, draft-connolly-cfrg-xwing-kem=
)
instead of a passphrase to encrypt the kek (volume key)?

1) asymmetric model won't shine in single user case but will be attractive =
in multiple user/image enrollment cases.
2) if per-device fresh wrapping key is desired


I've implemented such keyslot type and tested.=C2=A0 But don't know if the =
aforementioned two cases is worth discussion.

Kind regards,
Alan
