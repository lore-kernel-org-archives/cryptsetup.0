Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6B379D0
	for <cryptsetup@lists.linux.dev>; Wed,  8 Feb 2023 21:10:16 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id AE0615C01FA
	for <cryptsetup@lists.linux.dev>; Wed,  8 Feb 2023 16:10:15 -0500 (EST)
Received: from imap42 ([10.202.2.92])
  by compute3.internal (MEProxy); Wed, 08 Feb 2023 16:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=djsp.eu; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1675890615; x=1675977015; bh=GgaZqnsNJY4nfepppHdcYUhvUGOVVO42WN1
	ISAKA4u0=; b=o2ESgUNLuMVNdJWM+6yE8kkknfNGbHBDXTYaitq89zMGh2IwLmx
	b8dKLIybGA9OdYkZOBmYivFtewYTsDLpGyQ5jGERHui6DEBYDQviCGFU8LVSjRw8
	JZROsUVsDqtsrRnUqIE+9GhdE6zdbiQB9Dg2S9nHb7sE+Yy5vCr8CfR26z950+qr
	nVV9kYB4O6K8KbTM2Co6B7Sl6tjnVfhbczH+YdaqkLuYsIiTv6OtRsoUCKx4eIAE
	5QjYF8BLP+Fe8v+Del9dxUlq2vYFpBHU/fKf8cx/8av9+/2B0MbiU5Gr0mEPjwUS
	AA9Qmi7UiG8dPPnTc+lhdsym1hpAf3XHz1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1675890615; x=
	1675977015; bh=GgaZqnsNJY4nfepppHdcYUhvUGOVVO42WN1ISAKA4u0=; b=E
	ZqtNhd2GKoq6DSIxaW8cpGp/wHG7Budk8swrqHs1uHG6rAdD6gIt4zR4UhLymJj8
	XMDJV+04cyrckZ433lAhlp8RgD/qfEUEoaaTQzUmYWmnNlKpWQaERcsaztzv/uzR
	3epANDA901/xtaEweKpKg6LvBezJX2cOiOKmfV3Kax8U2EZ8aXmAhQooZHt2X0RR
	S+0jUkXA9nO8e7imM913Bt2gNgQn5Vt0SVsk+IApCTaxAef1SqhMUjyAviPPEY4d
	jLYl0Qze+WaKJQvDvUNs1nfDmBVGJ5JDaWOzPG/hMKsC8WOxdW1p0UcRWaNd59b9
	rYdAS6vddkXKIzG3asBXw==
X-ME-Sender: <xms:tw_kY8SDfAYJG6WeH0aKascguMuq3tT_YT2oNVD7gOp-pVhg5ZcFxA>
    <xme:tw_kY5xODFq3YblxUGX91rbmZIRtRXgaToidnAwr8-2a4hwiwM510AjMCuFFtP7j0
    4dcvzlxBSkrr-uJ8sE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehuddgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erreejnecuhfhrohhmpeffrghvihguucflohgrqhhuvohnucfuhhhouhhrrggsihcurfho
    rhgtvghluceouggrvhhiugesughjshhprdgvuheqnecuggftrfgrthhtvghrnhepueevte
    efhfdvgfffudethfekkedvffdvgeefieeiiedvhfekfeelleehieevhfeknecuffhomhgr
    ihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegurghvihgusegujhhsphdrvghu
X-ME-Proxy: <xmx:tw_kY534DR3mMY0gfeFRoZRzixtnJNPf62WULqVGlfvbifD594aqkQ>
    <xmx:tw_kYwBV74c8dbBUDtA9KysUT_rFpaqaismlbT5P7DvHyFS6D73k6A>
    <xmx:tw_kY1j1iH8IrbaiEf4j2TmYxDGGBqhHnnkoxlFKKLFIsFax5ewO7Q>
    <xmx:tw_kYwsjiH9fAA-0Fx4vw1y84753WO7wgeMVNe-sBeVU7zLh8YrokA>
Feedback-ID: i2d09444b:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 33B10BC0078; Wed,  8 Feb 2023 16:10:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <aec223f2-34f1-45ca-83a4-024e66490ee5@app.fastmail.com>
Date: Wed, 08 Feb 2023 22:09:54 +0100
From: =?UTF-8?Q?David_Joaqu=C3=ADn_Shourabi_Porcel?= <david@djsp.eu>
To: cryptsetup@lists.linux.dev
Subject: Filling a device with random data
Content-Type: text/plain

Hey there :)

Section 2.19 of the [FAQ][1] explains how to fill devices with random data using dm-crypt: cryptsetup opens a plain mapping, zeros are written to it and it is closed. If LUKS is set up on the device afterwards, this translates to the following commands:

```
cryptsetup open --type=plain --key-file=/dev/urandom -- /dev/foo temporary
dd if=/dev/zero of=/dev/mapper/temporary
cryptsetup close -- temporary
cryptsetup luksFormat -- /dev/foo
cryptsetup open -- /dev/foo bar
# mkfs / pvcreate -- /dev/mapper/bar
```

I would like to skip the first mapping and shorten the procedure as follows:

```
cryptsetup luksFormat -- /dev/foo
cryptsetup open -- /dev/foo bar
dd if=/dev/zero of=/dev/mapper/bar
# mkfs / pvcreate -- /dev/mapper/bar
```

Does filling a device with random data under a separate dm-crypt mapping offer any security benefit?

Kind regards,

David J. Shourabi Porcel


[1]: https://gitlab.com/cryptsetup/cryptsetup/-/wikis/FrequentlyAskedQuestions
