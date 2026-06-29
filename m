Received: from hamster.birch.relay.mailchannels.net (hamster.birch.relay.mailchannels.net [23.83.209.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D13B52EE
	for <cryptsetup@lists.linux.dev>; Mon, 29 Jun 2026 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.209.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769961; cv=none; b=iX7zWdmX+RjF3Tebv6VMQFdSlY9cSiI28ONtXoqz+1TKnye1LYY/vEH5kUN7wDPWQwqv16BsRl0CSKUO1aYoCb66HhJZaYvffUhoHJ4+2zgXjPt1NtJD+VItYv8ZmKwg27IlINj+yu8DSZ958t5pmZxvdxMcDNM6zU4PJR6VZ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769961; c=relaxed/simple;
	bh=dOa3T9is7fIjxtuDNxpj2QVpUmVzetlwSAl6fWwsr0w=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ov3ptogohNaa3AojcQ2MH3xZl3G4042zas/5eWZU1okfH7w0FU5hZ565H4sgzyAEtO94HyRLE6lQ608Gx4TbJENjRPp58GPvNmIoyY9Q6YrrsU+g9TZqnBhsB9owh9I3nAY9f96O6ohoUoHJXLwmhk83kgetfKUb2d5twSeKpwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scientia.org; spf=pass smtp.mailfrom=scientia.org; arc=none smtp.client-ip=23.83.209.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scientia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 56475402FF9
	for <cryptsetup@lists.linux.dev>; Mon, 29 Jun 2026 21:43:39 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (trex-green-7.trex.outbound.svc.cluster.local [100.99.154.198])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3A892402FEE
	for <cryptsetup@lists.linux.dev>; Mon, 29 Jun 2026 21:43:38 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Cure-Descriptive: 457c23242596f314_1782769419121_1306718913
X-MC-Loop-Signature: 1782769419121:3075727366
X-MC-Ingress-Time: 1782769419120
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.154.198 (trex/7.1.5);
	Mon, 29 Jun 2026 21:43:39 +0000
Received: from p5090f0bd.dip0.t-ipconnect.de ([80.144.240.189]:63576 helo=heisenberg.fritz.box)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <calestyo@scientia.org>)
	id 1weJlQ-0000000H7tX-3Bfd
	for cryptsetup@lists.linux.dev;
	Mon, 29 Jun 2026 21:43:36 +0000
Message-ID: <7989d6080792b67d7fac3ac9db863e280376a9e5.camel@scientia.org>
Subject: Re: cryptsetup 2.8.7-rc1
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: cryptsetup development <cryptsetup@lists.linux.dev>
Date: Mon, 29 Jun 2026 23:43:35 +0200
In-Reply-To: <5551ed2a-be50-49fe-af21-a78f8abe0315@gmail.com>
References: <5551ed2a-be50-49fe-af21-a78f8abe0315@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-AuthUser: calestyo@scientia.org

Hey.

On Mon, 2026-06-29 at 22:32 +0200, Milan Broz wrote:
>  Also, ciphers like Serpent or
> =C2=A0=C2=A0 Twofish (in XTS mode) are missing from several userspace
> libraries.

Uff... bummer. I use both in some special cases.


Uhm, can I somehow verify this in advance (ideally by actually
testing)?

I'm using Debian's cryptsetup packages, which (AFAICS) use OpenSSL as
backend, which (AFAICS) supports neither serpent, nor twofish.

Are there any alternatives to keep those running?


Cheers,
Chris.
