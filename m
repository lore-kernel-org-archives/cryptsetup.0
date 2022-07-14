Received: from dog.birch.relay.mailchannels.net (dog.birch.relay.mailchannels.net [23.83.209.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826F2192
	for <cryptsetup@lists.linux.dev>; Thu, 14 Jul 2022 00:37:39 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E48D0122776;
	Thu, 14 Jul 2022 00:32:21 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (unknown [127.0.0.6])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3BEC8122A69;
	Thu, 14 Jul 2022 00:32:21 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1657758741; a=rsa-sha256;
	cv=none;
	b=eXMMA9Gzl7pnHjZp9bu7cxqI2g20eeGv1LxBK6Qb76kmOmgQaCeZ0P7PJcBsDWHcK+9qkg
	HrOy2SoIEkqoaK1BjnJidcKl3f6SnU0zHk2y7k/0ZMepuClCeKtortv7UCaq4+sebBa4Qn
	m19o/0MDXoIw0RFt9Ri7c3P80VvmTPAfavTFewV/x/4Aw+vD1VEsw7of0Vb1zaBI0Zpz3D
	6g0N6gt1OjpKVDr+qrdzx1qAcU5BSvJ0Qvq+rD2FY1A1qZrZRf8wvLH67AecnE/3Wc7ddP
	QUIi38G09PKSBqI30sAIagpe5RmvsaaQacoCffQscMBPIWzQ515vMfgeaUiivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1657758741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qzPxw79EevcoVH2+v9sJ3j/w/eaPpUYk2265qaALxs=;
	b=jOF8NfwoloP1JiivlS0/+dZpH/Pp2stXKxmDHQR7OsgakMzsGuJzmWzd2KMHmXxzqCPqRT
	wQQbVkQEDMvxLfYxj6fQk/hPbmiQS9FDNjKPafLilnOfmfmNmH0nsKEjmyN6sAoDsFh1vc
	xbOPcFjuqsCZmrO0OPUVM3xM2mEYrqrKDDhvaROOYBGRSVsmyxL7BbTOuhjHpqSG+P9m2c
	4Bi2AblGJ40MwmkWF/xmb/slcsvc/Z92tNjl/1VcldjfpicStZaOeBzrTXoDAlSh3DpzNc
	iS6dKowjxUYmsYWH3GKujs31w97FL1kkPPalFn+tUvYJSZHPNlJr2QQ+vAtEKQ==
ARC-Authentication-Results: i=1;
	rspamd-674ffb986c-lzblc;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Callous-Stop: 415640c13b22cdfa_1657758741703_1435971840
X-MC-Loop-Signature: 1657758741703:1046687132
X-MC-Ingress-Time: 1657758741703
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.112.55.242 (trex/6.7.1);
	Thu, 14 Jul 2022 00:32:21 +0000
Received: from ppp-46-244-253-243.dynamic.mnet-online.de ([46.244.253.243]:41462 helo=heisenberg.fritz.box)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <calestyo@scientia.org>)
	id 1oBmm7-0004xV-V5;
	Thu, 14 Jul 2022 00:32:19 +0000
Message-ID: <9f62149c7102a0d4b54ad00aa3ac619124dbe432.camel@scientia.org>
Subject: Re: I want to decrypt mi PC
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: =?ISO-8859-1?Q?Mois=E9s?= Pineda <mois.mp8@gmail.com>, 
	cryptsetup@lists.linux.dev
Date: Thu, 14 Jul 2022 02:32:13 +0200
In-Reply-To: <CAOwzBqg4UGQOhDGDDFHXDh-aAdMfOJnLhoDZLFpAYNfZ6GsvGA@mail.gmail.com>
References: 
	<CAOwzBqg4UGQOhDGDDFHXDh-aAdMfOJnLhoDZLFpAYNfZ6GsvGA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3-1 
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AuthUser: calestyo@scientia.org

Hey.

See cryptsetup-reencrypt=E2=80=99s --decrypt option.

Be sure to have made a backup in case something wents wrong.


Cheers,
Chris.
