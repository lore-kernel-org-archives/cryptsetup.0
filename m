Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C277EA9
	for <cryptsetup@lists.linux.dev>; Thu,  5 Oct 2023 02:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b="mEFzRH/x"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutanota.com
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
	by w1.tutanota.de (Postfix) with ESMTP id C2021FA0224
	for <cryptsetup@lists.linux.dev>; Thu,  5 Oct 2023 02:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696471527;
	s=s1; d=tutanota.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=+U+ivx2n+VNeQPZbuNJFuJkvk/O28kKczzre8XFLYVo=;
	b=mEFzRH/xnrhcmZouUbIrzBn0z9f+NhmdvM6s59Jx6W40jjcV1SI4PdmOTpGGQArf
	8YI993a/f9X5+mdtdvq29EAdofmcAWHXMwZRKedqwtkjAb/vtGlSqURLYgCg0B2Kr17
	GCsa0UgbgcJJSm8RE3shIrVlEQBUlcDDOfiSczLfuPd5OOvTIAjbUHAwnJQFJ2Y5s+z
	t5Kg1tWKM1qjBISy3Jlq2Ol3C9YjDpfPtUe39krkXb8c2RAg1aBaleRZH2tOiK/+/ad
	eqPqsN4/hzCmsRgejTrNqHwU1u6jMU5hXQBMb6b+iw/ALXH3VNh+s6F4gYjNUU6SdbO
	7Fb2ssHuEA==
Date: Thu, 5 Oct 2023 04:05:27 +0200 (CEST)
From: charlesfdotz@tutanota.com
To: Cryptsetup <cryptsetup@lists.linux.dev>
Message-ID: <Nfx_Hmi--3-9@tutanota.com>
Subject: Feature Request: "Fake Trim"
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

I would like to request a feature regarding luks volumes. I had wanted to post this to your gitlab but they want a credit card and phone number (?!) to sign up. I hope doing this via the mailing list is OK.

I would like to request that a new mount option be added for luks volumes that when enabled would allow the luks volume to accept trim requests regardless of the underlying hardware and then to simply write zeros to the sectors that are trimmed. This might seem like an odd request but there are a few situations where I think it would be useful.

The first is that currently it is just not feasible using luks on top of an SMR drive if it doesn't support trim. Currently an SMR drive if left untrimmed while using an encrypted volume will have performance falls off a cliff permanently after enough data is written to it. For drives with trim support this obviously isn't an issue but at first glance drives that do not support trim would seem to be worthless. Fortunately most drives that don't support trim are smart enough to "time" a sector if it gets filled with zeros (you can find several accounts of people "refreshing" their drives by simply dd'ing them from /dev/zero). Obviously you can't do that if there's a luks volume on the drive because it won't actually write zeros to the disk but if my "fake trim" request were implemented it would solve the issue. This would make proper encryption possible on a large subset of previously unusable drives.

The second situation is using a luks volume on a virtual machine disk. Often time the VM disk will either be compressed or a sparse file but if encrypted with luks once all the space has been written there is no way to reclaim space. I'm aware some virtual disks support "normal" trim but I believe this would still be useful in some cases.

Sincerely,
Chuck

p.s. I figure most of you already know why SMR drives don't play nicely with encrypted volumes so I glossed over it but I can elaborate if you'd like. Thank you.
