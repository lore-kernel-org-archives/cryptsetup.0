Received: from donkey.elm.relay.mailchannels.net (donkey.elm.relay.mailchannels.net [23.83.212.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2405CA6
	for <cryptsetup@lists.linux.dev>; Wed,  7 Sep 2022 16:11:25 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2A0234C30EC;
	Wed,  7 Sep 2022 16:03:18 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (unknown [127.0.0.6])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 43DAC4C3D55;
	Wed,  7 Sep 2022 16:03:17 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1662566597; a=rsa-sha256;
	cv=none;
	b=YcENIq9x8fE75iLYGN1+KYa7h7tRh9ph9Mcz5jku3L+d/xbWrlLx6wkdA9wf54OYDngr5Z
	rT+oj/IPyYpvyeauAJ1zls/2Ss5CtMVWvjP5yfcScaLR6gnxdgY5ME+2vm2k7tNAWiJRpp
	g2oMYavnD1KiK7tmGBGijuK8WiWEWSyei8TaigRZr3FIvIDWI8yvDto2H8zanOwwszQW1X
	dyX1koKNysRRraPrkXW0tJaIIL6MKe61SekFckYuUIXP+8dlfQNBch7eTY9YiyWr7HN3wM
	uoYeb5ohNjSqm4jB+PdMBdKSn3AyFAA//SCFgIK7hjyX++05FZBO0N7jsjSE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1662566597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJMdNnOongX8GdJU56EhuT/35K3ka6imgjNooYaDXDc=;
	b=X41RL1L/F1gfRHmCjddPjONtfrcnXWrtl1gk4Ai893h7qNcaLGW8lEcQo82OjijWWrMkGk
	vjOomAAlWF/+JPCP5uzMCQLxh3jX7eOqHq2m1B+gIqryogl/qtMMktK4cCVa0AQem5oj+d
	OyIWA6K5iGWCNdo1zccbwZbu9ZqIoH8REuW46V3+apOhfGgiCroQ7CKWoEV8gVyoj9kuRE
	SzXDhd4MGZI1dRb66mBz2ZFQG1DbEbil2F5HD/C8DBbj6uxwk1ulHFNYr4bFKZnBxJpef3
	nZ+w+BQxzRuk4ybLPtLOOP1fsYsDlKmdbbRmE7sfEZxUOoJL4TPtwyjL+fj34w==
ARC-Authentication-Results: i=1;
	rspamd-686945db84-lvkj2;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Name-Lettuce: 405f10501ddc6d0b_1662566597960_3196832889
X-MC-Loop-Signature: 1662566597960:3174248951
X-MC-Ingress-Time: 1662566597960
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.108.161.89 (trex/6.7.1);
	Wed, 07 Sep 2022 16:03:17 +0000
Received: from p54b6d828.dip0.t-ipconnect.de ([84.182.216.40]:54836 helo=heisenberg.fritz.box)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <calestyo@scientia.org>)
	id 1oVxWB-0002iS-1Z;
	Wed, 07 Sep 2022 16:03:15 +0000
Message-ID: <421c9a4d88161535ce20fc90b3b57199de77b478.camel@scientia.org>
Subject: Re: cryptsetup mistakenly includes newline character in passphrase
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: "doffloster@gmail.com" <doffloster@gmail.com>, cryptsetup@lists.linux.dev
Date: Wed, 07 Sep 2022 18:03:09 +0200
In-Reply-To: <CACHosL8qEEToama-927w8JciczidoeSPFM_a-SF5zWEVZUabLQ@mail.gmail.com>
References: 
	<CACHosL8qEEToama-927w8JciczidoeSPFM_a-SF5zWEVZUabLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.45.3-2 
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AuthUser: calestyo@scientia.org

Hey.

In your script, you create the volume via:
> printf "%s\n" "${PASSPHRASE}" | cryptsetup "${cmd_cryptsetup_params[@]}" =
--type=3Dluks2 luksFormat ${DEVP}5 -

With the "-" in the end meaning "read the key file from stdin"... so it
takes up everything presented (up to some compiled-in maximum).

There you have a trailing "\n" in the printf.


When opening you also read a keyfile from stdin, but you don't give a
trailing "\n":
> printf "%s" "${PASSPHRASE}" | cryptsetup --verbose --debug --key-file - o=
pen ${DEVP}5 debug_open


Cheers,
Chris.
