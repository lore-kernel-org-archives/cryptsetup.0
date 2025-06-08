Received: from router.bayer.uni.cx (ip-89-102-24-34.bb.vodafone.cz [89.102.24.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181303D544
	for <cryptsetup@lists.linux.dev>; Sun,  8 Jun 2025 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.102.24.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749381765; cv=none; b=rIBhOp5lnFiembgAJA9Do/QMbLy58H7vkBsI8eOn1HYPaRirCVmj0HMrhMjuu5exmjV37+s9Kgzl0YvFI6Mxxu3Mkk+gF/czowge3+GPCsNTX6hHhTtkONTjyhMZA45xW6ZqeY727UyS5VCz/PmsZB5hQJPywNWpdVGk3XSglR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749381765; c=relaxed/simple;
	bh=pV0XuL427lkD8H0LmVYuGJa98XuNWuW2K1yZQFquE54=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L5VMZIhvuhQ9rGVPjyJjvz7OCiS4LK5INswG5rf4shJK8B+Vmk4h3ANL4zMlqslty5knhyUqg8abG1A2PhhmVa3+SGvA2Rw5tu1cpxGWQr86iNkuIBOV+GZMQbRzKV9dCINNGfDEzwCh7kZt7PpqIWkS0eidvy/x4qlbclomdbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=atlas.cz; spf=fail smtp.mailfrom=atlas.cz; arc=none smtp.client-ip=89.102.24.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=atlas.cz
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atlas.cz
Received: from album.bayer.uni.cx (album.bayer.uni.cx [IPv6:2001:470:993c:1:5246:5dff:fe8e:a186])
	by router.bayer.uni.cx (Postfix) with SMTP id CEB5EAE5AE
	for <cryptsetup@lists.linux.dev>; Sun, 08 Jun 2025 13:13:32 +0200 (CEST)
Received: by album.bayer.uni.cx (sSMTP sendmail emulation); Sun, 08 Jun 2025 13:13:32 +0200
Date: Sun, 8 Jun 2025 13:13:32 +0200
From: Petr Pisar <petr.pisar@atlas.cz>
To: cryptsetup@lists.linux.dev
Subject: " (inline hw tags)" is not internationalized
Message-ID: <aEVwXNQ0OcZkE6Bn@album.bayer.uni.cx>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="usOI4a2G/zs9PjUx"
Content-Disposition: inline


--usOI4a2G/zs9PjUx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

when translating cryptsetup 2.8.0-rc0 I found that " (inline hw tags)" message
at src/integritysetup.c:214 is not internationalized. Please pass that string
to _() macro.

-- Petr

--usOI4a2G/zs9PjUx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE4/QvzhVoMKgDWObpT9GuwzZa978FAmhFcFwACgkQT9GuwzZa
978+0g/+NaQj46e9Fkiy9szbJIu/ydHY2FoQPLSpEyeCw3tSayUMPjC8vfV8ae7d
WD54FDpxPZJRZHUi3pVu9iRl0R0j0hGq+pCMAoJcvc3AyLnrs5zeyH6DG0zBIXc+
u+2lfVfB8gTnBmeqO+G5TPZ/+yMeDeyQcWEbvqGNNeXOdlv9WXV9VSEtXPzgSxpV
vy1BZhjMwvvWV1LI+ZiLrhgsoO9H/0eRqPV1MYjuz5133z8LhxDTHyG45i+2z/Co
WvDMFpy3FJYb6iaKwah2gyElByuIOpHB5LbuiHlVvWUETa45vmAvZjxsrmJzzB24
C+ZBYxi2rJs1FVJkvOkKbZCw/2aDbIqm+miGwwf64msr04ea2x7kwRdOhpuUPhlM
qRPbYd72Z9gBnq6Ff7nMrLqPWwoRtlvf3Fm13NIaMAm/queXvKduIjKYJp7gPZON
FnW0DPn4qmD6+h9f4qtYbfy81eZc9uW7OlJ3XrtV28MwmuOZS405gddgTxiyDZuu
Dx6Ks/EySfqp0RjTla5MQfo4nI1GDh1ybc7wL0kAdqmeJJBXWI796HX8rmgs/v5Z
QZ8yucrr+AU4pJaDfYJXHkfmvH22Jnx+T8ZMBd6X6kgWJ0hL9mBMBVkfjaoQXMSD
f+037e6Bc22lTizAorRPAIoOLKKgbyxnwbcI3AWPZKnskDTlC+4=
=in7b
-----END PGP SIGNATURE-----

--usOI4a2G/zs9PjUx--
