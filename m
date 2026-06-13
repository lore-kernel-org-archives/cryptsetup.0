Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46276125AA
	for <cryptsetup@lists.linux.dev>; Sat, 13 Jun 2026 01:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781314873; cv=none; b=i34vo6JCte4ZeMx45VTds1iLFiN93WpwVSBTf188qDduBLHRogMP110CFOuO8nGJ6QpxbG6fH93zvebNoYAWcGzV366ceoZicaXJb/jbBhNydt1iCg7+m5IXgqJtdDEbmSsJh7BKF4ZRby9v+KV40syGK4cpAWWVxic4IfW0+2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781314873; c=relaxed/simple;
	bh=hK7h4U1RDmJiaX8Zg1dxQZkBBNQ0yTKsu2OUV4U8n/I=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=RyURt0eOYmDZDpyoKw6NwhmuINQyjstN0YGz+EgC/HJkC60TP7HRv3MJCz4P0MaeSxFoHUjqfX4eaagtJsx3hy8ey06AXUctW1arv9imXC5fVBLIP+ug+YbgfIK/D7olK2SnGoVRC9FS+PFw+GbcKPniyuOcT/kx/AdgHdSB9jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com; spf=pass smtp.mailfrom=tutanota.com; dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b=UA/bz6Cw; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutanota.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b="UA/bz6Cw"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id B3A1114CFFB0F
	for <cryptsetup@lists.linux.dev>; Sat, 13 Jun 2026 03:32:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781314349;
	s=s1; d=tutanota.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=hK7h4U1RDmJiaX8Zg1dxQZkBBNQ0yTKsu2OUV4U8n/I=;
	b=UA/bz6Cwx0IgkORcMB899mdgL1CbceBzBfMG+lrq7Qh7nqLo19NLivUsrFS3l/22
	PgBkbKN9/4Hm5hIZ6lMty1wE2PUqlWQvLeVwZzwldru3YkNM3MR8yfXYZV+JTbWt6+x
	G8BLXJeXZuDyZLL/1rQn9o8UNyIG4flvAb5yWw0lRozBadeVWH90LBQb5iF0Crtrmj9
	n9kc2hitP/qglpCuXV1mBLVdz38WSv6YgYGpJRHnSrNBb4kD3mHUb58wsAMU+rbzHFB
	2LuH+CVTgm5VDci7Pt2iRsJ0+7kg3F3/pPWZeHh9cZvPm1TVRzBOhucL7mcvs2Wvoo5
	E0qq+SM6dw==
Date: Sat, 13 Jun 2026 03:32:29 +0200 (CEST)
From: Borden <borden_c@tutanota.com>
To: Cryptsetup <cryptsetup@lists.linux.dev>
Message-ID: <OuyYP0g--F-9@tutanota.com>
Subject: What does cryptsetup luksAddKey --new-key-description do?
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: 01860081bf58008fd8d0320d4bb6316e5e4961e4f91e2478b663adcef3724b3d54976dc41f0b2a26c03eae3bec7f4714cf205cada80020d14dd560b709983276f9:TurnOnPrivacy!:tutamail

I can't seem to figure this out through the usual means. `man cryptsetup-luksAddKey` says:

--new-key-description text : Set the key description in the keyring that will be used for new passphrase retrieval.

... which I assume is the kernel's keyring. Passing --new-key-description="Value" yields:
# Verifying key from keyslot 0, digest 0.
# Requesting key Value (user type)
# keyring_request_key_id failed with errno 126.
Failed to read passphrase from keyring.
# Rolling back in-memory LUKS2 json metadata.
# Releasing crypt device /home/me/dev.img context.
# Releasing device-mapper backend.
# Closing read only fd for /home/me/dev.img.
Command failed with code -1 (wrong or missing parameters).

luksAddKey works fine without --new-key-description. I'm trying to understand what this parameter does and how it should work. I'd also like to ask that the manpage be updated to explain this parameter a little more thoroughly. I'm not sure how I am supposed to know what I'm doing wrong with the documentation. AI said it should work, so there must be a problem with my bash or cryptsetup installation. Something's obviously missing.
