Received: from dormouse.elm.relay.mailchannels.net (dormouse.elm.relay.mailchannels.net [23.83.212.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2387E0
	for <cryptsetup@lists.linux.dev>; Thu, 31 Mar 2022 20:49:26 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id CBE016A0556;
	Thu, 31 Mar 2022 19:32:14 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (unknown [127.0.0.6])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7BE246A055B;
	Thu, 31 Mar 2022 19:32:12 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1648755133; a=rsa-sha256;
	cv=none;
	b=YRbeH/4uN26m0j967YhniH2+wRm7ubJnBUyixkVBuVEI+2mPowHzxpOY+lRpAoHFL3i1RW
	Ri3bPJsIKedf5ntYC43iCDEGXZZC8zqGHHRs8hTyYsfTPh7C61BkOEzQYhxHOCA0U2LuFB
	pAVKPwid1HaW+RKThimKzhSwaYAo2mMF/fLI4cCPytjk6YlJl6LidGmpnBM9ytI5nM8eQH
	Tee27qATmHMRPk0AG9zOcg0WJEs4YI/voI9RaErh5JUNId4U+wgxARWWBUG3T9Zi41hLu2
	pjtAXEbnQaP2Yw8PYj0p6jkOlgh1AHpHMf4eUYKSyal07x/lWlYjP7eL7ZHFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1648755133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pfty3pHE6AboWVUTdB0k9VhW4J4dsSZ5SWrAVhi7vRI=;
	b=v/R27OMfD71U1l4xPaVlHobE7JKOOCovJTdReMdV6DMTP8dKNp2dpUETkhChAEo9NANhfn
	90VGI974j0j+lwcKnpspHIAd/2G4TaOYeBGDpnup/KSS4R4fxRvhpq/tSf+A5PjMtpRZ9U
	eW5JHChf3kGlEmBZnVsRPnBvEQ58dapW3f/Wx22Q+T88e2XMWbo5rrw1wKB+0GjrD+ZW3E
	01vlynCAZ2BAEy/ihE5kcWnGr+IEIuPR3clPW+2UiJJ/RgdQ3YCTN9GYJKfIGbIbn+4dHg
	uIAoGnAnxjzZ/jSuKWFwpKJbIVqlyvuSpQMH2NSUU0FCvXxrR27UHvgabBEz6Q==
ARC-Authentication-Results: i=1;
	rspamd-78f9fcf68b-xqx5x;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.101.255.144 (trex/6.7.1);
	Thu, 31 Mar 2022 19:32:14 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Scare-Average: 79659d3c0cc3c712_1648755134423_4021970587
X-MC-Loop-Signature: 1648755134423:2013195013
X-MC-Ingress-Time: 1648755134423
Received: from ppp-88-217-34-61.dynamic.mnet-online.de ([88.217.34.61]:60708 helo=heisenberg.fritz.box)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <calestyo@scientia.org>)
	id 1na0We-00075a-I6; Thu, 31 Mar 2022 19:32:10 +0000
Message-ID: <8583a15d8b2a72eebb72950a3cbf210bc74649d1.camel@scientia.org>
Subject: Re: [Question] Distinction responsibilities LUKS and dm-crypt
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: Surmont Jasper <jasper.surmont@aalto.fi>
Cc: cryptsetup@lists.linux.dev
Date: Thu, 31 Mar 2022 21:32:04 +0200
In-Reply-To: <PR3P192MB10874E4159B71C71097583B4F1E19@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
References: 
	<PR3P192MB1087C0EE38951D6391C3B1D5F1E19@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
	 <84342ede4702058fff1deb61f6c9108de8e6ddcd.camel@scientia.org>
	 <PR3P192MB10874E4159B71C71097583B4F1E19@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-2 
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AuthUser: calestyo@scientia.org

On Thu, 2022-03-31 at 18:56 +0000, Surmont Jasper wrote:
> So, would I be correct to write that the ability to have
> authenticated encryption depends on the underlying storage format
> (where eg LUKS1 does not support it, and LUKS2 does)?

Well practically (as of now), yes,... but that's more from an
engineering PoV.
You simply need some place where the integrity data is stored - with
cryptsetup+AEAD this is done within the LUKS2 container (not supported
with LUKS1)... but if you use dm-verity alone, there is no LUKS and the
integrity data is stored in an extra (hash_)device.


> You also mentioned encryption without LUKS has more pros than cons.

Oops,... I've meant the otherway round: it's in nearly all cases better
to use LUKS.


> so what are the main advantages of using something else than LUKS?

The "else" is only plain dm-dmcrypt devices (i.e. no meta-data stored
on disk)... unless you count 3rd party formats in like bitlocker.

Some people may say that with "plain" you get some level of plausible
deniability - i.e. you could say there is no encrypted data on the
device.
Whether that works out in practise is another question - I'd kinda
doubt that the <random evil country>-torturer would believe you, if
you'd insist that you've filled some good parts of your device with
seemingly random data just for the fun of it.

It may have some tiny advantages when using it for temporary devices
(like temporarily encrypted swap devices).


Cheers,
Chris.
