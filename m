Received: from toucan.tulip.relay.mailchannels.net (toucan.tulip.relay.mailchannels.net [23.83.218.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981DF3AC0F4
	for <cryptsetup@lists.linux.dev>; Wed,  8 Jul 2026 01:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.218.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783472995; cv=none; b=TFFoHefGC1MNLFy371iyC+Uz4zeLYRFiU8pZUVxsDg//d6OYgVK3O9gwni9l+sMySp7A7Nju829EEQpwkltFhtI+vG0yY6UMLogX1Ihur5jpLGKVxKZEfEI5uNEf7N4jEgbz7CE5YmNO/qbkxLrm/UF9d0OWdOXymJDDhfVwABM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783472995; c=relaxed/simple;
	bh=HOeQ/YQZ42oztbITSPxmypbU9jNg6YrCA424ifUjGtI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uk6rtmTldngYxVvCHZeFx6PtASR1OQa7B/nuy7CmAAD2vJZurG+TbDIEkLDFEO0fSZtw5NOnUn/xl0W/FbNEZb5rQ6AV+7Dk1HwN5dZuZhkZOlQpqvIBNEm8eFGk0pPhngl7mDCBcvK+O25FpyJL8lyP6PqNLs98/0Hc04YXczw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scientia.org; spf=pass smtp.mailfrom=scientia.org; arc=none smtp.client-ip=23.83.218.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scientia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 45853462573;
	Wed, 08 Jul 2026 01:01:41 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (100-99-12-141.trex-nlb.outbound.svc.cluster.local [100.99.12.141])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6D970462403;
	Wed, 08 Jul 2026 01:01:40 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Coil-Illustrious: 5210bd4d748c61a3_1783472501160_2933258972
X-MC-Loop-Signature: 1783472501160:573452517
X-MC-Ingress-Time: 1783472501160
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.12.141 (trex/8.0.2);
	Wed, 08 Jul 2026 01:01:41 +0000
Received: from p5b0ed87c.dip0.t-ipconnect.de ([91.14.216.124]:59373 helo=heisenberg.fritz.box)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <calestyo@scientia.org>)
	id 1whGfT-0000000EQpf-1WRy;
	Wed, 08 Jul 2026 01:01:38 +0000
Message-ID: <6a08a0e2917091ed5256bf5098d78a5d5735414c.camel@scientia.org>
Subject: Re: cryptsetup 2.8.7-rc1
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: cryptsetup development <cryptsetup@lists.linux.dev>
Cc: Milan Broz <gmazyland@gmail.com>
Date: Wed, 08 Jul 2026 03:01:37 +0200
In-Reply-To: <dac6de42-1409-477b-ae57-5766c28b5c22@gmail.com>
References: <5551ed2a-be50-49fe-af21-a78f8abe0315@gmail.com>
	 <7989d6080792b67d7fac3ac9db863e280376a9e5.camel@scientia.org>
	 <dac6de42-1409-477b-ae57-5766c28b5c22@gmail.com>
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

Hey Milan.


On Tue, 2026-06-30 at 07:46 +0200, Milan Broz wrote:
> There is an ongoing effort to provide "crippled" af_alg, but I do no
> think
> it is a quite sensible approach. But if it lands in kernel, we adapt
> to it.

Do you by chance have any idea whether this would help with respect to
Serpent and Twofish?


> The interface cannot be completely removed (I hope the promise to not
> break userspace still holds).

Well, removing these algos would already kinda do so, wouldn't it? I
mean I can understand if things shall be cleaned up and if for example
drivers for decade old hardware is removed, but these alogs aren't
broken or completely outdated.


> Anyway, AF_ALG s is already marked as deprecated.
> I am sure kernel people underestimated how many people using it.
> Anyway, I gave up discussions in kernel lists, it is still a very
> toxic environment.

FYI, I've posted[0] to linux-crypto, bringing up the concern of "lost"
algorithms and that this may actually affect users.

So let's hope for some hopefully positive input from there.


> The whole point of this exercise was to prepare for people disabling
> AF_ALG themselves.
> We had already fallback, so it is used for everything now.

You mean cryptsetup has a fallback?

At least when I blacklist af_alg before, opening a dm-crypt device with
serpent-xts-plain64 failed (as expected).


> Depend how you use it, but if it is for LUKS, we can now fallback to
> old
> temporary dm-crypt mapping even for LUKS2, you just need to be root.

This I don't quite understand, I'm afraid.

I do use it with LUKS, so should Serpent/Twofish still continue the
work then, I mean even if AF_ALG were to be removed completely?


> For OpenSSL, it can be extended by providers and it should not be too
> complicated
> to write provider for Twofish and Serpent.

Maybe not for a crypto expert and cryptsetup maintainer... ;-P

And while I might be able to hack something together, I'm not really
a=C2=A0crypto developer, and given the nature of the subject, it feels
rather stupid trying to do so - a home-brew provider might look as if
it would work, but still have security flaws.


> Libgcrypt backend should support all of these, but definitely we do
> not want to switch to it by default.

Well and I wouldn't want to deviate from Debian's packaging anyway...=20


Unrelated topic...

Any news on [1] and apart from the questions therein in particular the
availability of usable AEAD algos?
When I just skimmed through linux/crypto/ I noticed that chacha.c seems
to contain XChaCha support... which IIRC uses a 192bit nonce and should
thus hopefully be secure enough for drive encryption?

But even if that were available for cryptsetup/dm-crypt, it would still
be nice to have alternatives, like in particular one with AES?
Well, I don't really know how e.g. AES256 compares security with to
[X]ChaCha20, AES has at least most likely seen far more crypto analysis
than the latter?
Any chance to lobby the kernel crypo folks to add a GCM mode with
larger nonce?

I mean cryptsetup has all that nice integrity support... but I guess no
one is really using it, given that all available algos/modes were
recommended against because of the too small nonce.


Thanks,
Chris.



[0] https://lore.kernel.org/linux-crypto/27816cc353731e8e5484adad7d0fc44777=
7727d8.camel@scientia.org/T/#u
[1] https://gitlab.com/cryptsetup/cryptsetup/-/work_items/668
