Received: from cross.elm.relay.mailchannels.net (cross.elm.relay.mailchannels.net [23.83.212.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019FDA4C
	for <cryptsetup@lists.linux.dev>; Thu, 31 Mar 2022 20:53:02 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C47A05A1244;
	Thu, 31 Mar 2022 18:30:09 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (unknown [127.0.0.6])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 309A75A0E55;
	Thu, 31 Mar 2022 18:30:07 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1648751409; a=rsa-sha256;
	cv=none;
	b=L4P6nrynZsz2vS2biifj+5jvSx28IaTzn9ZGN4ngPKi693SxwXUM09yXHqJMsxGDz/flsg
	b2VMzO8j1N77IkndZ48YglJGTjOvC5qK1qby732DqYyrumuVE93VARvBO7/9VuQOpKgrWH
	vg1g3U3zitcl2Q35oL4pWSbeSD/Sbv32zPed1f+hzzLbO2xoQKqMIYLYajbxCBN6E770tI
	GasoXjF6Qvn6nNHvO9byvYw9VHrobRKqzVt1RDVxMJMPAbEg2V9c6aNVqmurIv94tjMghV
	rKy9tEHoB/Un/iXxs+e7CC7Ep1SMdl7Qd+aX33Wz7DeNkv/JdA7DmoeDazO38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1648751409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vb93ul/dG+GfbBIHjdhy6E9BwbBgDv+8E+Iyfe6FFuo=;
	b=asLRT8kWmd3NlPfhSDKTS3OltKDPRFbZi+KyL/BxBW3kVPVGbF5F+t5ocZbLG/y0XKDgBF
	mGZE1wt6KcyKOQAkGHpu5C3FSw2qE28R4uVhbLNLaF+wmNwfltsls14gyXWqgvqCYVMF8l
	1ngRnJYeVDhsyPdh6eU+lH9w5l8unbwDfmnrIoiUi4l1pt3ZN5zJy9CxXQDaTWcfpkOszd
	hoJTjW/CwLDNKxQo06ZsHSNZjKGnFWsSXqqZkYNk9rFtI6Vpra7zC+DG5zYRqUBrn48TCX
	70A+qgl1wu/OzRIGDY1LtPuEMRXMvpB4tEov8bNtNSCV/nUngg9XPLEEJ2fOPw==
ARC-Authentication-Results: i=1;
	rspamd-78f9fcf68b-bngqg;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.101.255.144 (trex/6.7.1);
	Thu, 31 Mar 2022 18:30:09 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Decisive-Abiding: 285078e43da23878_1648751409363_225161502
X-MC-Loop-Signature: 1648751409362:620400233
X-MC-Ingress-Time: 1648751409362
Received: from ppp-88-217-34-61.dynamic.mnet-online.de ([88.217.34.61]:60706 helo=heisenberg.fritz.box)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <calestyo@scientia.org>)
	id 1nZzYZ-0002Ci-1r; Thu, 31 Mar 2022 18:30:05 +0000
Message-ID: <84342ede4702058fff1deb61f6c9108de8e6ddcd.camel@scientia.org>
Subject: Re: [Question] Distinction responsibilities LUKS and dm-crypt
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: Surmont Jasper <jasper.surmont@aalto.fi>, "cryptsetup@lists.linux.dev"
	 <cryptsetup@lists.linux.dev>
Date: Thu, 31 Mar 2022 20:29:59 +0200
In-Reply-To: <PR3P192MB1087C0EE38951D6391C3B1D5F1E19@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
References: 
	<PR3P192MB1087C0EE38951D6391C3B1D5F1E19@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
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

dm-crypt/dm-verity are the kernel drivers doing the actual encryption
verification.
As is e.g. md* for Linux DM software raid.


LUKS is a container format keeping data like encrypted keys or
integrity data... as well as space for some operations like device re-
encrypt.
As is the "mdadm container" (not sure whether this has an official
name... I mean the containers with version 0, 0.90, 1, 1.0, 1.1, 1.2)
for Linux DM software raid.

You could have e.g. encryption without LUKS (which has some pros and
"cons" - mostly pros, I'd say)... because one encrypted block maps
exactly to one decrypted block.
You can't have integrity protection/AEAD without a special disk format
OR extra device... as the integrity data needs to go somewhere.

cryptsetup/veritysetup are the userland tools allowing to manage the
above.
As mdadm would be for Linux DM software raid.


Cheers,
Chris.


On Thu, 2022-03-31 at 18:21 +0000, Surmont Jasper wrote:
> Dear, keep in mind I=E2=80=99m fairly new to Linux kernel development and
> similar, so my question might sound stupid.=C2=A0
> =C2=A0
> Reading through the documentation of both dm-crypt and LUKS,=20
> I understand that LUKS is a format specification=20
> to allow FDE, and that dm-crypt is a dm target which allows
> encryption / decryption of writes / reads to the block device.=C2=A0
>=20
> However, I'm unsure about
> what each of these now exactly provides (ie what are the
> responsibilities). In
> the slides =C2=A0(look link at the bottom) that the author (Milan Broz)
> made,
> it mentions that LUKS2 can also provide integrity protection (hence
> making the
> encryption authenticated). From this, and also reading the Luks1
> specification
> I think this is not possible in LUKS1. However, later in the slides
> it talks
> how dm-crypt allows for authenticated encryption. This is where I'm
> confused;
> do we assume we use LUKS2?=C2=A0
>=20
> I feel like I'm not really grasping the main function and
> responsibilities of both LUKS and dm-crypt.=C2=A0
> Thanks!=C2=A0
> =C2=A0
> Slides:
> https://archive.fosdem.org/2018/schedule/event/cryptsetup/attachments/sli=
des/2506/export/events/attachments/cryptsetup/slides/2506/fosdem18_cryptset=
up_aead.pdf
> =C2=A0
> =C2=A0
> Sincerely, Jasper Surmont =C2=A0
>=20

