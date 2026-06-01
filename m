Received: from taslin.fdn.fr (taslin.fdn.fr [80.67.169.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC5138655E
	for <cryptsetup@lists.linux.dev>; Mon,  1 Jun 2026 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.67.169.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300225; cv=none; b=AB8+vwRDgZLBocNOObbDyzDSjUyNHEM2BWm4eqNfEa70jfwxutRm5oeGOJFBpyP9wmuVt2mLXjoSG5XKBER2K0TWQXJGR7XNfiOVXB6KvR9woI4bDoHqznSFPofJCWvn1cGINddkhAS1cd7yi8GDDnvsX0R/HuQeqEOsmTcPydI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300225; c=relaxed/simple;
	bh=7mB2dg8t6QjM7yFwKRBHgzueu2WKQ6OlJYqEpOv1PaM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E8cfTrQlGAA2TXR8lSy4ow8GVRVv+BFCEmbm7fJwpwWIIlibIOAiao+V05AyNYoNAjmmsKREMQnSWsLOCIiqGMr7VXgqAcYlJ9gT7Sxb5bq2Ul5IRDLM+Bxxc/FALcwW6BkpWIE1AqwT9wJ9ZZCDoYJPk5WVkVS2yzAiiAhI4FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=max.gautier.name; spf=pass smtp.mailfrom=max.gautier.name; dkim=pass (2048-bit key) header.d=max.gautier.name header.i=@max.gautier.name header.b=ksyY+Kz/; arc=none smtp.client-ip=80.67.169.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=max.gautier.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=max.gautier.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=max.gautier.name header.i=@max.gautier.name header.b="ksyY+Kz/"
Received: from localhost (unknown [IPv6:2a0c:e303:0:cc00:1237:b476:26f2:cbd0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by taslin.fdn.fr (Postfix) with ESMTPSA id D7C5B60242
	for <cryptsetup@lists.linux.dev>; Mon,  1 Jun 2026 09:50:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=max.gautier.name;
	s=fdn; t=1780300221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=dKTy8BewX0Jf1MPKhhcqf0KRkKsfaNHl2jO9D6Gv3bM=;
	b=ksyY+Kz/xKhBTNN2Mqf6I+zCIdK+3wLXswfZ2LQdpKcbEdYvSZnUv5KWNJiAK4MKKCGtHd
	EOtG60kSWC8f8B6EUTms6ht1Gn+BqxDpu/pUAWxA0x8hK23evijNmhjWUxTsVB8zg866+y
	T574jYvBs2tKwv9UBZL3msD6lFrNkxhx9Dog59qsp592zB1XDI1VIN3mJRJcnydB/Yig9T
	i+ra51MFiWa2d6VrcqN9o3wdALPXX2oj2jD+d1lnVs65WSeadRb7dANGPCJaVNgS/xO1PQ
	5hmdRrESMBWgmcI4ph42xLd7geIH6uSoCoi/8YR6IzcFEY1lHpl3EUzN71GnEA==
Date: Mon, 1 Jun 2026 09:50:19 +0200
From: Max Gautier <mg@max.gautier.name>
To: cryptsetup@lists.linux.dev
Subject: dm-integrity: estimate the size needed for separate integrity device
Message-ID: <ah05u91w9wfghC8_@framework>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I'm building a media server where I intend to use RAID10 on top of
dm-integrity (and cryptsetup on top of that, but that's not really
relevant, AFAIK). I plan to put the integrity tags of dm-integrity on my
NVME, to avoid some of the performance penalty. 

But I'm not sure what size each "integrity tags" partition should be,
depending on the data device.

I'm using this blog [1] as the base for the calculation, but I couldn't
find a reference for the calculation in the dm-integrity kernel
documentation, in cryptsetup wiki or in the integritysetup man page.

Is there a reference for calculating that size ? I'm fine looking at
some code, and it looks like the dm-integrity source[2] has some functions names
which could be helpful, but any pointers would help :)

Thanks !

[1]: https://blog.tty8.org/posts/2025-04-02-moving-dm-integrity-tags-off-the-hdd-to-speed-up-raid.html
[2]: https://codebrowser.dev/linux/linux/drivers/md/dm-integrity.c.html

-- 
Max Gautier
