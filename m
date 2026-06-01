Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4783F1AD1
	for <cryptsetup@lists.linux.dev>; Mon,  1 Jun 2026 20:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.239.18.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346831; cv=none; b=l7B0P4JCxP56ekuT21e4ivtSWAE2UmMtNqSN4PQU8pTOQpSDTUhTA84qdvUMpbDWKtf00suKcw+t5PjC+sq0TOhzsF0XWCEcan2B2WHN8B9NWEVdeI5pK8U+LPUp1xUqzegYPOB43K3OYTsb0uWHqpzH17S2kAP5LtkW7YHGKTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346831; c=relaxed/simple;
	bh=ty3b/pAPFH6o4HfDlNzvuzDoa8pE7P5YfW4zgFwAEOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=II+XHg8rBusJytPDOUoETIsElo0ndB9pcZIQ2xkdWBk/cfnuBYwp/7KUGIpf3j/bCiDmRVDyOGCnkL9rFo0kAUX7VevRXSs+LYyLdIF5lLB6HZgxE1hvJKHz511NH5oR2Hxev9DHwYGmOjwKUIvquZUOGnl5V/oW9VsSSyMkztw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ac2.se; spf=pass smtp.mailfrom=accum.se; dkim=pass (1024-bit key) header.d=ac2.se header.i=@ac2.se header.b=LZsyMMz9; arc=none smtp.client-ip=130.239.18.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ac2.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=accum.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ac2.se header.i=@ac2.se header.b="LZsyMMz9"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id AF59444B91;
	Mon,  1 Jun 2026 22:37:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ac2.se; s=default;
	t=1780346223; bh=ty3b/pAPFH6o4HfDlNzvuzDoa8pE7P5YfW4zgFwAEOI=;
	h=From:To:Cc:Subject:Date:From;
	b=LZsyMMz9bjT6NfbUm1xh9lZV1heBKYmyveZ5Y2gAd1Rvxr2b9VrTw6l9gDdumr/hC
	 X/9H0sH0W4cPesfCuV1LnZRghuv/UUBO/JZWmiJSSWJcGBYM+c0FRVjICtB9JEokxF
	 4NDzJm/TijSVZN6WJF60EkdKw7GStguPsWPCk4U8=
Received: from suiko.ac2.se (suiko.ac2.se [IPv6:2001:6b0:e:2018::162])
	by mail.acc.umu.se (Postfix) with ESMTP id 21A0244B90;
	Mon,  1 Jun 2026 22:37:03 +0200 (CEST)
Received: by suiko.ac2.se (Postfix, from userid 24471)
	id 1200C42B4B; Mon,  1 Jun 2026 22:37:03 +0200 (CEST)
From: Anton Lundin <glance@ac2.se>
To: cryptsetup@lists.linux.dev
Cc: Anton Lundin <glance@ac2.se>
Subject: [PATCH] Add mbedtls to PKGMODULES
Date: Mon,  1 Jun 2026 22:37:01 +0200
Message-ID: <20260601203701.1740656-1-glance@ac2.se>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When cryptsetup is built with --with-crypto_backend=mbedtls, the
pkg-config file for libcryptsetup should include mbedtls.
---
 configure.ac | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure.ac b/configure.ac
index 52ddf11b..260b0ab6 100644
--- a/configure.ac
+++ b/configure.ac
@@ -741,6 +741,7 @@ case $with_crypto_backend in
 	openssl) PKGMODULES="$PKGMODULES openssl" ;;
 	nss)     PKGMODULES="$PKGMODULES nss" ;;
 	nettle)  PKGMODULES="$PKGMODULES nettle" ;;
+	mbedtls) PKGMODULES="$PKGMODULES mbedtls" ;;
 esac
 if test "x$enable_libargon2" = "xyes"; then
 	PKGMODULES="$PKGMODULES libargon2"
-- 
2.47.3

