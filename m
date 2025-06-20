Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1F31FBEA6
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 18:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750445943; cv=none; b=Kfe3VOpdr547O+Jtl4krVmlAnWKZCcZ3C/jgwPjEIzCUjr74s1sPqGcm0AP/CDS2ijCcihOCCQV48evtcIg/WA/lVlLpyFE1VzDD6kL63Lm+KQP9ywDFzGBALNAkkbMHPHKwH2jmgc1pybFJuEvNxUQoPOi1KRcNTS3tq5mH7lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750445943; c=relaxed/simple;
	bh=8QewAdWpVWxPx1CHeUygo0c2m1SDi6AcbQpnoFPOnqs=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=KS6iZonF4INjtDDRog/AX90VjEk6DsQSpwLrHMdnmIBYZnUTUyzDJu/E66Vqzqf9UQrIl40zd0w+2ZCF9CqFG0WGDBFJlvA5kLlAAAfrIEFA2LOZv9VUip9FS+QA4pAUcCf68tw2W9+jmqv+cNkH1wnWYYU0capgaNFk4nCzHPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=eEPr0/Ue; arc=none smtp.client-ip=109.224.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="eEPr0/Ue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=6a74xw2qqfgb3ipkfprylrt77e.protonmail; t=1750445932; x=1750705132;
	bh=DnkgvjP87TNYngZxoic7++EBNmdJDYQh3uu2BGrIIfs=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eEPr0/Ue2/4tNkua/6pcwKpImQiXRF9risKa/ntOtwIV26xI/FXumrnUr4Vrz3G2F
	 js7pt7GDZBP3kvJCNjdA8W44hemVK0L6Q273rS1HKHLUc06+L6lNYpQ1gScEoK28ed
	 frSEWsW5Cif3irTXcA1kFYVju8I6XUIgd1JdgVy1oj4rmWe36NaDUWeVhJnUa1mIpF
	 4AuffKy72My2vQkWRvNInFiHjbX88zwkg0u1O5yzlWBRCYbzr/LM2nzkMR6uYAZPrE
	 CQCSdi3svMxc20Kk+xdeiYKVthDWkRiiVy05mpNFZS4njjHwwEt+mjXT7+y+Irxrf2
	 zDGebeQEYf8yg==
Date: Fri, 20 Jun 2025 18:58:48 +0000
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
From: improve9406@proton.me
Subject: Luks encrpted disk with a blake2b checksumed btrfs fs is better than cryptsetup --integrity option ??
Message-ID: <s2jv1MM1-zykYSRK4j97B_Oz8nW5eHLcm4JTd55UqrAJOVkrvsFhD274SNM_XsvedduP9LKWtjJdGNl5ZGd9b2eh9ihW4j4-2xMGlbJpBs8=@proton.me>
Feedback-ID: 132508452:user:proton
X-Pm-Message-ID: 953fc05284d2f623348b152d5bf508faf3925d34
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Here is a quote from the dev in the gitlab issue :

> If you are using AES-XTS and a cryptographic hash for the checksum (such =
as SHA2 or Blake2b), this should (barring filesystem bugs) provide integrit=
y protection.  In fact, it will provide vastly stronger protection than dm-=
integrity can, because it does protect against replay attacks due to the Co=
W nature of the filesystem: my understanding (which could be mistaken!) is =
that the whole filesystem is a Merkle tree rooted at the superblock.  At le=
ast theoretically, dm-crypt + ZFS or BTRFS + SHA-2 or Blake2b hashes should=
 be safe against an outright malicious block device.  By =E2=80=9Cshould=
=E2=80=9D, I mean that I would consider it to be a security vulnerability i=
f the attacker could do anything other than roll the entire device back to =
an earlier version.  Of course, the ZFS, BTRFS, and dm-crypt developers may=
 disagree
