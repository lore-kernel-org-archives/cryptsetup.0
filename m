Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9A419ABDE
	for <cryptsetup@lists.linux.dev>; Sun, 11 May 2025 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746951945; cv=none; b=Q4mk1XJk5rlqNioc4T7H07P0zME5cfl1AbXOcGEhRa7AgVzxBYXlAqxHwDv357xxPSSi/b/YPqn4FLonYbUKKew5xJbk2dBmTFht3z65eLZqXlOQb9gd5BY1lJy0mXCypGzly7MnpSrNZ2FfCBD0M0Q8EKF7e1mkJAwjcRYl6Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746951945; c=relaxed/simple;
	bh=atPHtknnq5rr/OTF85rFAOZS3fh1C/jYSS6CYFPkAhY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1LTeEqcF5HsF1geEee/DvaOhzBy3M1Mc1fM+Z5L4X/Z9tRqd7zKj0VtMaD2i1hBfpsZYuyrNWo7uBXkKMsbCY1vANpM8UbpkBTeraZ8sXqesa5xw8d05/fXtKEhrWNuRuX9D0zSebWPB9tuQRjm8krf7YNXrmw8ReJfKE4ry1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=Yv0IMB3H; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="Yv0IMB3H"
Received: from localhost.localdomain (localhost [127.0.0.1])
	by shakotay.alphanet.ch (Postfix) with ESMTP id 6F64C124177B
	for <cryptsetup@lists.linux.dev>; Sun, 11 May 2025 10:25:38 +0200 (CEST)
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id D92A3124117A
	for <cryptsetup@lists.linux.dev>; Sun, 11 May 2025 10:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1746951930; bh=atPHtknnq5rr/OTF85rFAOZS3fh1C/jYSS6CYFPkAhY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Yv0IMB3H5mNIrG/BJRo1Zev4UKhGSum8OMUG6RZpKUYXgTV6zaOezrRuA/WB2xChE
	 1n2j9dC45Hqu3Q4ObgflIRL/GrFp+d0VKgbgl3w99G3+z3zHSOWD/ceJ6uvU40GK09
	 +H/HHMslRzQFvaLqZckEHEi5UKzFsKnKKG0mepOSxlHm5kbpMKmAIO9a8CCpf+6Pah
	 beNydHHVP2m/R6Zef2Z2F7fyj6eogBLNWVmAXquEjOMX3x584RuyzU8ppJgdNcyeai
	 E9EQ6nYddnfV8+ThIWTttZjhThEDYU6XFSgAtQvFM1XfjCZmw8E2DagN23T7kROks+
	 nSF/CdicTfyxw==
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id C2F4876CA4F; Sun, 11 May 2025 10:25:30 +0200 (CEST)
Date: Sun, 11 May 2025 10:25:30 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: cryptsetup@lists.linux.dev
Subject: Disabling integrity metadata verification (was: Equivalent of
 --integrity-recalculate)
Message-ID: <aCBe+mX7P2zI4Te7@alphanet.ch>
References: <aB919cDdLQfSsb0V@alphanet.ch>
 <f2c3da09-bd41-427d-8e96-61d3a4a80397@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2c3da09-bd41-427d-8e96-61d3a4a80397@gmail.com>

Hello,

Thank you for this insight:

On Sat, May 10, 2025 at 06:18:18PM +0200, Milan Broz wrote:
> Note, for integritysetup you use dm-integrity, for cryptsetup
> dm-integrity only provides metadata space, AEAD encrypton
> is performed in dm-crypt above.

So, if I understand well, integrity with cryptsetup is implemented with a HMAC
that needs cleartext data (just before encryption) and produce hashed-signed
integrity data that protects against tampering and is not fixable by an
attacker (resistant to voluntary corruption).

Where if I create a dm-integrity layer with a luks crypted volume on top, I get
integrity, but an attacker can modify the crypted data and the hash easily
(only resistant to accidental corruption).

Now, another question: assuming the metadata space is corrupted, but I know
that the crypted space is not, is it possible to ignore the metadata altogether
(to not produce read errors)?

Thank you.
