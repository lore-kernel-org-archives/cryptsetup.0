Received: from bumble.maple.relay.mailchannels.net (bumble.maple.relay.mailchannels.net [23.83.214.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB407C
	for <cryptsetup@lists.linux.dev>; Thu, 22 Sep 2022 17:48:17 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2F060501357
	for <cryptsetup@lists.linux.dev>; Thu, 22 Sep 2022 17:40:17 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (unknown [127.0.0.6])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 59275501137
	for <cryptsetup@lists.linux.dev>; Thu, 22 Sep 2022 17:40:16 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1663868416; a=rsa-sha256;
	cv=none;
	b=6VvuHXDkKvJpcTjMjix0Oq0NBN6Z3g0vOiZykQ16JecpSim6WHl6FIcd4YKAX626c1d2PA
	xsQBFn35nGBvLaQe88nkkPMHvUKTQtjJfv4sCoMAhuZg/9xM56CHvqqaXGlcsGSfERjB60
	nQ+VPlsIG91xMprQMQifaW96HeqcKjA1UOxkPiqFViSdyZtR3om0Mz6YBjZ72MUKTF+xvR
	iCYkH5McwobEZ7KwdXJL1nmSOLy/hmgimcWjo0zI7xg6hLQwcVhV602YUK4Ev+0SgaHidD
	DZOE6umz4hnhM1VGZjkBj2a1yz1Agry4CwSXsvXtK1KtYC30uOREbEPTdBmxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1663868416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=klbvI08zAJPB1zOJa0E7/O7b4zkg1LzMHBgjJ8mz0Ak=;
	b=Qqun/4qr6EiYgIkTSxrmenux3JMcG3A/utdk3IIZlds38LfcvgCbS/QdB94b6oDVcNb9UD
	V+iF6YVqYyaZ9ExdSw9s53M0AAwPupSS6v8EzIfEeQqAqM62xXWJrsAp7S8rOq2EdZZ3m6
	pXykqQqHdUO4mLLpFoLKywgTocZBL68C5c3Rhx/D0OJWcvVI9QnZ1j5k9psdJDZi/nwL+I
	5p5C6QYZH5kY5NEVlTkhOCcTAf+UZ0lMsxRPgJHrAcDjreeiF8y3liXZBWIyst/LPnUkGb
	oFx5wMHATRJOmXnjBGK7jPcEwic4a8z3OYQQg90Rs+ZkcVBkKAGE1qamovlD7w==
ARC-Authentication-Results: i=1;
	rspamd-85d65fb7c-v9tzt;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Glossy-Cooperative: 127b610d0eb2c59b_1663868416853_1126877439
X-MC-Loop-Signature: 1663868416853:538134246
X-MC-Ingress-Time: 1663868416853
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.119.144.146 (trex/6.7.1);
	Thu, 22 Sep 2022 17:40:16 +0000
Received: from ppp-46-244-242-250.dynamic.mnet-online.de ([46.244.242.250]:33644 helo=heisenberg.fritz.box)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <calestyo@scientia.org>)
	id 1obQBI-0000TJ-Uv
	for cryptsetup@lists.linux.dev;
	Thu, 22 Sep 2022 17:40:14 +0000
Message-ID: <3c9bf07f1cb05f2cfb15adb184fbf161737a148e.camel@scientia.org>
Subject: [X]ChaCha20+Poly1305 usable?
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: cryptsetup@lists.linux.dev
Date: Thu, 22 Sep 2022 19:40:09 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0-2 
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AuthUser: calestyo@scientia.org

Hey there.

When using LUKS with integrity protection, there used to be that
problem that some of the available "well known" algos SHOULDN'T be used
because of security reasons, e.g.:

- --cipher aes-gcm-random --integrity aead
  =3D> nonce in the kernel's GCM only 96 bit, considered too small

- --cipher chacha20-random --integrity poly1305
  =3D> the same than above was used to be said, though when looking at:
     /proc/crypto:
     name         : chacha20
     driver       : chacha20-simd
     module       : chacha_x86_64
     priority     : 300
     refcnt       : 1
     selftest     : passed
     internal     : no
     type         : skcipher
     async        : no
     blocksize    : 1
     min keysize  : 32
     max keysize  : 32
     ivsize       : 16
		=3D> doesn't that mean the nonce is 16*8 =3D 128 bit,
                   which is the same than e.g. that of AEGIS128?
                   OTOH, linux/include/crypto/chacha.h defines
                   #define CHACHAPOLY_IV_SIZE	12
     chunksize    : 64
     walksize     : 64


But since quite a while now there's XChaCha20 in the kernel:
https://github.com/torvalds/linux/commit/de61d7ae5d3789dcba3749a418f76613fb=
ee8414
which should have a 192bits nonce.

Wouldn't that solve the issues with the too small nonce?

At least it seems I cannot create such a LUKS volume:
# cryptsetup --verbose --type luks2  --cipher xchacha20-random  --integrity=
 poly1305   luksFormat TEST ; echo $?
WARNING: Device TEST already contains a 'crypto_LUKS' superblock signature.
Cipher xchacha20-random (key size 256 bits) is not available.
Command failed with code -1 (wrong or missing parameters).


btw, does it make (security-wise) any sense to use ChaCha20 without
integrity? e.g.:
--cipher xchacha20-random
--cipher xchacha20-xts-random
seem to work, but
--cipher xchacha20-xts-plain64

doesn't.


Thanks,
Chris.

