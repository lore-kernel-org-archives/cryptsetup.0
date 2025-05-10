Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C9C1CAA9C
	for <cryptsetup@lists.linux.dev>; Sat, 10 May 2025 15:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746892290; cv=none; b=lRhBvQs1DfGj06H3RIociy5WGwnmTwoeEhOiC/29T5jC7csMI79z0F1wFLQRlTGbRWmGFkjcWsmLKO4jkfPgkM9iFPqP6yUtof7FAtmSdKO04ocf3Ac6afOojSmI+WnNwDSZXwHzlFofkYydrPaAFK8B4ix7s+U1VyLFyiC7Fz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746892290; c=relaxed/simple;
	bh=5HfM/ANG9r2hzJu7b9559951UYbhNsJy8jcko3kwTOs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KWmGTM37YSORBi4WlzaPTzvW7nyudcT2RzJ5MmpkALVwEHQMESddTMNDbE8Nh6dTGmssf2AVkx4LqFlMJhSpUW84zSC0mX5nC0+GNrQ4oqwbzA04YBsVxgDxe6/3ZD/OpbDoHUSxe29GpkKf7aDrqr/QSPdXcuiac69TXcYTOrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=np+v1Fo8; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="np+v1Fo8"
Received: from localhost.localdomain (localhost [127.0.0.1])
	by shakotay.alphanet.ch (Postfix) with ESMTP id E43E612416D7
	for <cryptsetup@lists.linux.dev>; Sat, 10 May 2025 17:51:24 +0200 (CEST)
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 1E0A51240A7C
	for <cryptsetup@lists.linux.dev>; Sat, 10 May 2025 17:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1746892277; bh=5HfM/ANG9r2hzJu7b9559951UYbhNsJy8jcko3kwTOs=;
	h=Date:From:To:Subject:From;
	b=np+v1Fo8hV/fjlYWimN6TF6o/oPYfof+aOPjm79qdxOw1v3N4CLdFD8MPWMWR1um9
	 Kr7NLaAwew9DoYHbzNvvIM/ZfdouDzUmYarFhTNfikL7rmQGgwqPXkhILco7Uw3Doe
	 D5qbIGf2pOqotzEPtpSpP+wWIWsvKaScHrEcSSV4HSCC9NETf6mh4DOnsiHsun97ih
	 n/xhFBGr+5Y2SR5AELDyq/FM4gBEiVdX3XxiaXOCm6dczON69pSL5zXHkqyGEcy9JX
	 o+JBBIweWsxbfwZgwfAr0GD9lhVoO5Gn8VYlwTlPROmnq3SvvyCnzrheV0EiOA6tZJ
	 NW5QnolbiYUNw==
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 0E2A576CA27; Sat, 10 May 2025 17:51:17 +0200 (CEST)
Date: Sat, 10 May 2025 17:51:17 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: cryptsetup@lists.linux.dev
Subject: Equivalent of --integrity-recalculate
Message-ID: <aB919cDdLQfSsb0V@alphanet.ch>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

If you create a cryptsetup/luks device with integrity with:

   cryptsetup luksFormat -q --type luks2 --integrity hmac-sha256 $dev

and then open it:

   cryptsetup open $dev backup-copy

you then get, according to lsblk, two additional devices:

   - backup-copy (the transparently decrypted/encrypting volume)

   - backup-copy_dif (the integrity device)

(which is similar, AFAIK, as when you use dm-integrity with LVM)

If you create an integrity device separately, you get a

   integritysetup --integrity-recalculate open $dev integrity

command which allows to recalculate the integrity blocks.

I don't think cryptsetup has this option (*); is there a way to
do it anyway?  Or maybe remove the backup-copy_dif and
re-add it?

Thank you for any pointer.

(*) it looks there is a feature request pending
       https://gitlab.com/cryptsetup/cryptsetup/-/issues/854
