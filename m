Received: from fossa.birch.relay.mailchannels.net (fossa.birch.relay.mailchannels.net [23.83.209.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29A415A9
	for <cryptsetup@lists.linux.dev>; Mon,  7 Nov 2022 03:00:05 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 70465261848;
	Sun,  6 Nov 2022 22:29:33 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (unknown [127.0.0.6])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4A27326177E;
	Sun,  6 Nov 2022 22:29:32 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1667773772; a=rsa-sha256;
	cv=none;
	b=BDEMyvdPPg2Un3rXt4Cumivl+KTIZFTEYT9bmxJCjaIr7YlVMBOU9xwSwM2hmX0dkRSxLZ
	w/T1lyLGbk0fh9pbqtWocLXfB8FtOTnXk0/Ppspfw9q5Z6RBWIE4YkKxJJyTo9MPbkj4W1
	DzKHtq/DiWLVYFVs/lwPWwf5sCIIZ8DlKvl/k5FiIIf8UoCBXuslDb34jkhO/yTtQPB6Jc
	JJHtuaqzV0dX/r7Z/2TuEFoLY1x3bjgHsTl3lmAJFb5h92Pe7lTp8LrOX2Mkxv4Vg1TcCR
	jzPZC/G7T+xqwfO8gH6By/G3dUoyso2pm/7PPyXygfwo4SZzribiRCEC9mF2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1667773772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQiSY1YsqlFImJw1opmqF1Itw+Qp9ksPPTEM3jANilo=;
	b=Ki2yBFoLxdDCA5blEybLci4J/l1JAW+IBjFtxH3gDUoOtjs79DobuObETS/yPC2R3TdeW0
	ugG+W5uAKEbClAIwRci+faHTOAnLqwd6/FIHzeBtFq7uPa5+7UyuXKDQEqhGaTfqWn0HcD
	0jg+OUFqmStVrQYttDTZ9XxRYxz/jtqVV1nXOvygWWbehOaIoWH/oCbFY1Yy2eIlWBiF+M
	a+3DYZ5Ah4iWRQcVRLD8FiAjrkoarNYAY6bJCI8HhCGI6qCh5KPKWEcqw7P4J02KxsyC55
	FMhwi51w9LB/Pz84SsqUmaPC1cpIbRfzY9kLnMUQgjlJS3BTOEfs42K28d8I5g==
ARC-Authentication-Results: i=1;
	rspamd-5cb65d95c4-sqctg;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Daffy-Soft: 75ff90fb145a9e8b_1667773773075_367862014
X-MC-Loop-Signature: 1667773773074:1379847301
X-MC-Ingress-Time: 1667773773074
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.103.24.77 (trex/6.7.1);
	Sun, 06 Nov 2022 22:29:33 +0000
Received: from ppp-46-244-255-15.dynamic.mnet-online.de ([46.244.255.15]:37570 helo=heisenberg.fritz.box)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <calestyo@scientia.org>)
	id 1oro8s-0003bU-NI;
	Sun, 06 Nov 2022 22:29:30 +0000
Message-ID: <8d3fb689060b6fa5fa831d7662d2bbe34f7e1b01.camel@scientia.org>
Subject: Re: mapping with --readonly option
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: Arno Wagner <arno@wagner.name>, Fourhundred Thecat <400thecat@gmx.ch>
Cc: cryptsetup@lists.linux.dev
Date: Sun, 06 Nov 2022 23:29:24 +0100
In-Reply-To: <20221106221547.GA6476@tansi.org>
References: <0e25bcff-4cc7-5416-90fe-0a3f630688c9@gmx.ch>
	 <20221106221547.GA6476@tansi.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-1 
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AuthUser: calestyo@scientia.org

On Sun, 2022-11-06 at 23:15 +0100, Arno Wagner wrote:
> You probably should mount it as readonly instead.

A -o ro filesystem mount is not necessarily actually read-only, the fs
itself may still change its own contents... e.g. journal or log tree
replays.


Cheers,
Chris.
