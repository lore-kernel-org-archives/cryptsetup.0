Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C2A8C00
	for <cryptsetup@lists.linux.dev>; Thu,  9 Feb 2023 15:01:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 4728032003D3;
	Thu,  9 Feb 2023 10:01:27 -0500 (EST)
Received: from imap42 ([10.202.2.92])
  by compute3.internal (MEProxy); Thu, 09 Feb 2023 10:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=djsp.eu; h=cc:cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1675954886; x=1676041286; bh=bu+1Ihu8L8
	UbIpd2x7t0Xhsd7+Hn7Ap0euIWGpW/jMs=; b=gVQMZs2F7PwMU3tRnpnVgmMgqC
	meC0KRMzDmHUpRZFHxL4R+Tp7k/WnVEwkG8gl9WLoaqrc2qJ4BLjeYdeep+6sAMB
	gWYlfXLMV8X0p7kUZYuywRw8Zf2Qw2Kopo4c9M6cG/qj6SoqO0DRM16pmvWKvW8h
	bMMSsWh/iHTA63fz7loX8GnxHOcj9NnLr9u/wX6WFRNBmFE64Qa2axCKUFfH/uqB
	3EZ4uzb+d3wT4KBNCdBH9sxKNRz58R4kLUu25/eRx/XZoT0Hb1utRzAbekrwUu1X
	ENiRx14vFMlJTeq5t5+LtJwXqmhqsK39TKWvN46ZxLDvJ7tMZTV2ni4gpLcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1675954886; x=1676041286; bh=bu+1Ihu8L8UbIpd2x7t0Xhsd7+Hn
	7Ap0euIWGpW/jMs=; b=ed/J2nB9xISpVoLfk7tuvhJRNc8Nu+VzRs2EX16QSlTM
	mGKeVffoafrX1lxbcSTMhTKlQvCjS3n3B2jwnkCzJCvv+tC4bIgdolcNfoUXG1oO
	0m/I+JK69fBJZE9Q2+odVrmA0v7ViLulfNghgvMSGhJgVPnWy1Z+jT3vn9z0IjyB
	GUNQkSmbUw7+gbDRmjfK1D8n29RmJtIVB+9PqMqmZCyWxcHckgmBJ7+O1GNTpqwn
	OQv5+EXRLEIjIVDl1deBsVyx3fkWnxA/RuwzFlr4OZclr0eVAkBF/NAzaqs36OPa
	n3zdJQMZHdfkNik/P7IlYC4gHQrOyQ9W+Q3TUq1Mvg==
X-ME-Sender: <xms:xgrlYx2ywCUxeHhfa_iyaaAOwYDGRDzpYQUEHXROND4vVXfD3UTYbA>
    <xme:xgrlY4EAxNN0U9mL4Tp98RS3v8mJZrcjbs9VXmh-vo4PrHRMfjGm-CAg3g7uGQvCP
    vFYCMB-_TayoA5VKRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehfedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderreejnecuhfhrohhmpeffrghv
    ihguucflohgrqhhuvohnucfuhhhouhhrrggsihcurfhorhgtvghluceouggrvhhiugesug
    hjshhprdgvuheqnecuggftrfgrthhtvghrnhepleekudeuleeiveekieeiudejtdfhjeeu
    hedufefgudetjefgudeghfeuvedtfffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggrvhhiugesughjshhprdgvuh
X-ME-Proxy: <xmx:xgrlYx51NI9Cah5uvHwU21h3DpG7NFpgOa3ReDReV-EpxZPrCtt87g>
    <xmx:xgrlY-09GlsMU5-E348IKYbS4ajAH6XiITUeTwGxpynTBF_98JqQ8g>
    <xmx:xgrlY0EQjzbHomr1DMMwjpZOpukEdW4Qb1NLoV1To7I02AuTrgmc6g>
    <xmx:xgrlY3xi_antzN_DAVVXLC49E6Rs9v9PO3GVHLM8sxBWg8FR1ruzyQ>
Feedback-ID: i2d09444b:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 60BA4BC007C; Thu,  9 Feb 2023 10:01:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <d30a4af6-8a91-42ea-973d-f16f1f361023@app.fastmail.com>
In-Reply-To: <20230209040200.GA3642@tansi.org>
References: <aec223f2-34f1-45ca-83a4-024e66490ee5@app.fastmail.com>
 <20230209040200.GA3642@tansi.org>
Date: Thu, 09 Feb 2023 16:01:06 +0100
From: =?UTF-8?Q?David_Joaqu=C3=ADn_Shourabi_Porcel?= <david@djsp.eu>
To: "Arno Wagner" <arno@wagner.name>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Filling a device with random data
Content-Type: text/plain

Thank you for your answer, Arno :). I benchmarked both methods and share my results in case they are of use to someone.

On my system, dm-crypt in its default configuration (AES in XTS mode with two 256 bit keys) is about ten times as fast as /dev/urandom:

```
$ dd if=/dev/urandom of=/dev/null status=progress
4819285504 bytes (4,8 GB, 4,5 GiB) copied, 12 s, 402 MB/s^C
9708379+0 records in
9708378+0 records out
4970689536 bytes (5,0 GB, 4,6 GiB) copied, 12,379 s, 402 MB/s

$ cryptsetup benchmark --cipher=aes-xts-plain64 --key-size=512
# Tests are approximate using memory only (no storage IO).
# Algorithm |       Key |      Encryption |      Decryption
    aes-xts        512b      4749,3 MiB/s      4622,4 MiB/s
```

/dev/urandom also provides data at a lower rate when multiple processes read from it simultaneously; dm-crypt did not seem to slow down. This might be worth considering if several drives or partitions are to be filled with random data in parallel. On the other hand, /dev/urandom is much faster than any of the devices I will be preparing for encryption.

Kind regards,

David J. Shourabi Porcel
