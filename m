Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3442F1A262D
	for <cryptsetup@lists.linux.dev>; Sat,  9 Nov 2024 23:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731195228; cv=none; b=LN5e/gAUpYbRv+ZH6TcqPNdRsIUJkpWSyEINSM5/taydfaxaJNxoGCI3l5zeGVGNYEdoj11cJiQQQQ6Z1EoLpNH6e3nq6GDAC9GeYU03I6QzfUh4+eCngge0QYkQzdlJxlhbRJUR4+EqDM/B/77RcudWYPqH0IcSrkwc1wNRlE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731195228; c=relaxed/simple;
	bh=wuHz7mresQbOjkXgNrDmjoXb2DJj1joAsITytTsiN08=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KTlJ2P2p6qHNSnfm94ISB+HY7qqdPqOtTtj/wPmE1228JJNK/F8/D3IKar3OjyjsBUTR4AVVtuADBdrJtc5p8fQ6RNLq10aJ7F8Lb/iwimH5PSVChyjseLjAC9GvVRvpDOHQvel4mKW8euaz4XW4+apL5sOE1tdurmI2OKeHGNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=punchcutter.ml1.net; spf=pass smtp.mailfrom=punchcutter.ml1.net; dkim=pass (2048-bit key) header.d=ml1.net header.i=@ml1.net header.b=DoHfsWS8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bE6fTuT3; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=punchcutter.ml1.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=punchcutter.ml1.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ml1.net header.i=@ml1.net header.b="DoHfsWS8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bE6fTuT3"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 17BCC1140110
	for <cryptsetup@lists.linux.dev>; Sat,  9 Nov 2024 18:33:44 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-10.internal (MEProxy); Sat, 09 Nov 2024 18:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ml1.net; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1731195224;
	 x=1731281624; bh=86D5mMdIvYfMM/UjuChx7yFkrScjEx6zkJoOs+qbJhs=; b=
	DoHfsWS8Jtk7w+ZZaxzYaU6DiM81fre2f1Evx7M/tQeqTmddr0KoB3ldE8fHU4YF
	FyBnIqYqU3szsn4BGEzoA3FV+D5P4kR1zNKNQe1PFUpfjyrHhVRC/Bum8ePWxpCo
	vwbgKELeoKHzswKqsTCkFYpCoCZl8TmWhmrJpAPOl6L4hS0pVt68TJdoxq5DrxSE
	OeldPwOb052QC7S/ZUsxXqfyU60wSmeVaOnyJGa6Xsy+ZMC12+RZH+Kfbpm+Xk98
	WgxkZK6iRUYfdnOVULzVAQmx9Vd8KXjTcScVAkiAOsJtzozm312DCThGh6wXUcnL
	QQ33XXYF2Spwdh69dCbivw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1731195224; x=1731281624; bh=8
	6D5mMdIvYfMM/UjuChx7yFkrScjEx6zkJoOs+qbJhs=; b=bE6fTuT3dJw1BKnKG
	ITT7RTr63A8eHIUdb1jhDUuF1vjHrdM0x9Zkx8/nmF9l7fJpXROorU/qietDIxCQ
	Ov9+VWnxsxx8VqmOhXsZ8Wd8t/xOy7DhPl7muHWdEcbLadBV+Gwpnjsk2CTUXvNx
	BmcAXg3DNTh24Nc0IIqM0l0Qs/HZD7qYnFLp8HBi0hC5yzj6bh/Ge1NX3Ih5n+wu
	XW7r6HUkz909wEkMYBMtsgLMZsBhg3Rb9tEChMSVH5iAzYDjCc7nrI44dAT3UvJM
	sDshfhIVlX7r2empN9kJ/ZrxHRfXs8iCil0azm+k5nsQgyge+wSoQknkjrcPHmWP
	eH1mw==
X-ME-Sender: <xms:V_EvZ-8UOTfK7K__R1CwiLfHz0-Ma5Bi45kn3wz_3IB_V7TVs_pQwg>
    <xme:V_EvZ-u_ZqJyeICmJNIllbc0ah30EmGvbkmiew8mSwUdVjzXullyh6xdggXyjMS0U
    -HFeYRFa6ZY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtdelgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecuofgrihhlucfuphhrihhngh
    culdeftddmnecujfgurhepofggfffhvffkjghfufgtgfesthejredtredttdenucfhrhho
    mhepfdffrghvihguucflucfkrghnnhhutggtihdfuceophgvlhgtghhfrhhghhgtiiihse
    hpuhhntghhtghuthhtvghrrdhmlhdurdhnvghtqeenucggtffrrghtthgvrhhnpeegffel
    feffkeeuhffgteethedujefgudeuteduleegfefgjeeghedtfedtfeeigeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghltghgfhhrghhh
    tgiihiesphhunhgthhgtuhhtthgvrhdrmhhluddrnhgvthdpnhgspghrtghpthhtohepud
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghrhihpthhsvghtuhhpsehlihhs
    thhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:V_EvZ0AxMSQYqx-TZ1QdOUMO1SJVX38DyL-2XVBWO4YR6XSi_M6nhw>
    <xmx:V_EvZ2fkFMfqM5QjeOSjDpLxsLOzf0lvUqHjab3WUR00qAdGMUnzQA>
    <xmx:V_EvZzOOUabIliOCJVSl9GYt_HYflUgdaHsb1FJ41_6sJuTMtje5qg>
    <xmx:V_EvZwn6ZejMWVDN7fFeWko59ekYtSL5G6P6n_KbPG3vPgfdNE-AkA>
    <xmx:WPEvZ1U2ez5dKVlJ1sFguprM42RNirRoB2Eg4onRS-sqRcjOviT8SfDR>
Feedback-ID: i5bfa418f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CE06F1C20066; Sat,  9 Nov 2024 18:33:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 09 Nov 2024 16:31:47 -0700
From: "David J Iannucci" <pelcgfrghczy@punchcutter.ml1.net>
To: cryptsetup@lists.linux.dev
Message-Id: <b4893f23-50ea-4bc6-84a2-05a3d7e19d62@app.fastmail.com>
In-Reply-To: <962b6cfb-d47e-4284-b044-91dd38858e0a@gmail.com>
References: <1730260948-20104-mlmmj-67cc752c@lists.linux.dev>
 <444a19f7-c557-4b7e-aad9-202a3f2e4876@app.fastmail.com>
 <1b63da83-8290-4d15-8f58-adf5ca6d903a@gmail.com>
 <12f16036-a407-4ca7-9708-1c0f751f5e5d@app.fastmail.com>
 <962b6cfb-d47e-4284-b044-91dd38858e0a@gmail.com>
Subject: Re: device-mapper: reload ioctl ... failed: No such file or directory
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Nov 2, 2024, at 17:34, Milan Broz wrote:
>> Nov  2 16:31:36 linux kernel: loop0: detected capacity change from 0 to 209715200
>> Nov  2 16:31:36 linux kernel: device-mapper: table: 254:0: crypt: Error allocating crypto tfm
>> Nov  2 16:31:36 linux kernel: device-mapper: ioctl: error adding target to table
>
> Ok, *this* is the issue. Some kernel module is perhaps missing or misconfigured.
>
> According to log, aes-xts-plain64 should be your image cipher.
>
> Do you have aes, xts (and ecb, which xts internally use) kernel crypto
> modules compiled and available?

Apparently I didn't. I added those modules to my kernel, and then I was
able to open the volume, no problem. Thanks much :=)

> Does "cryptsetup benchmark --cipher aes-xts" work?

It does now!

I was putting together a new message here to ask for help with yet
another old TC volume, but I eventually figured out that I had the
wrong passphrase, and found that passphrase, so we're all good :=}
Seems strange to me that if the passphrase doesn't work, that it
doesn't simply tell you that... or maybe there's something about the
decrypting process that means that even cryptsetup can't necessarily
tell the difference between a wrong phrase and some other problem....
Anyway, no worries.

Thanks again,
Dave
