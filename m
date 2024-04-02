Received: from a2i461.smtp2go.com (a2i461.smtp2go.com [103.47.205.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C974205F
	for <cryptsetup@lists.linux.dev>; Tue,  2 Apr 2024 23:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.47.205.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712100027; cv=none; b=p8J6j5p9DpdLUhMSBR6mD6WuDrDVh5u7v1oVBhq62VI5ij/R7VCTOH7aZ9lGFxjvT5xYLF+LM9n81iu1WKl8Y6YiOnAUsWgpcXRzd4jpxREosrIhx1b8wEs5PFbVhHZWQls+GVbxY0w/MMkF2uoALd5S1UPlcdSVHHFGVU5XK+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712100027; c=relaxed/simple;
	bh=04msEAA7OY+gonemcohOjAVol2e+nYWDINs5wAXHZ7g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=X8ehyaaE43HJoMujKwbWEnYfJKq24HB7UkP6MVNiAg3OKCdDMnk/Ic1TBJFvkskyRUUMWPn6cCGwz9bv0NLp4r6Mz0Wof8nhulFC5FOBfxa4N7AcW567k867cq8bBQF6ZO99s1tlVoRpxoPo12gwkvc28GsZyqB7vj7UIfr+eKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atlief.com; spf=pass smtp.mailfrom=smtp2go.atlief.com; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=z19sMkoy; dkim=pass (2048-bit key) header.d=atlief.com header.i=@atlief.com header.b=ev5rU0SW; arc=none smtp.client-ip=103.47.205.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atlief.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smtp2go.atlief.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="z19sMkoy";
	dkim=pass (2048-bit key) header.d=atlief.com header.i=@atlief.com header.b="ev5rU0SW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mij4i0.a1-4.dyn; x=1712100923; h=Feedback-ID:
	X-Smtpcorp-Track:To:Message-Id:Date:From:Subject:Reply-To:Sender:
	List-Unsubscribe; bh=04msEAA7OY+gonemcohOjAVol2e+nYWDINs5wAXHZ7g=; b=z19sMkoy
	M2/bCmWG6ddzkoKvmXex23IGRQhTRu6zqu198YpEpLxHir8530srGoh+8W4Y+utzOUPkgUsnjDSFo
	oVBxGluYCJMKZypft1HprNTxCAXdIJY2v/KOdz35cUyXx2kBpprynY3oI6IKooC71Hvn/d/daQPoc
	AKfEQHi9+2J7SOJLoJYs/Ozy0lkmF+w0yWF5fzNASJDynd9b43S+eKbQFjaMUP5JFeFREnnbQEKpz
	CCAqcPTiscowWzyrzqL/6fsY4lqeyAzS3lf5QTF8GAY9kDPd7z2jRsEQVbDpqGa8CJbdGEZTFe4Y3
	gIaIksGm9c6paaRwMs+knLehkg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlief.com;
 i=@atlief.com; q=dns/txt; s=s864594; t=1712100023; h=from : subject :
 to : message-id : date;
 bh=04msEAA7OY+gonemcohOjAVol2e+nYWDINs5wAXHZ7g=;
 b=ev5rU0SWRLys09CyhQN9b43GBE+N9sEk+fqbjZx4mYQZTu+OyeC67nweuLfiTLw3EV6Ph
 4NW6H1o5WFzWkJkvpLR167zr2T3yz4MZ9y7tahCSVXAdbHUk9acTqVJuG/rqkfOHuCaSETY
 td+ttdRAxXIWoV2PDqf2G7p1MDV0P1xJR0z9E9SiYzfiqeEvQ9KjiaJmMLsBbR0gPUwviLd
 dovh4VtaW6geJHmNDFd6+SafbWCbA9wBefhoyosxf8g/avM7GlNLJAGhrp1lPUYBHSaGzX6
 +P5CFijQMSFrnNtlZKV+bWQwxMM/SBFEqXBIEFoNkmspAw5VEZb9Y1hfPOsg==
Received: from [10.45.79.71] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <public@atlief.com>)
 id 1rrnQQ-pH9SI2-VA; Tue, 02 Apr 2024 23:20:18 +0000
Received: from [10.136.244.98] (helo=p.atl.red) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96.1-S2G) (envelope-from <public@atlief.com>)
 id 1rrnQQ-Dv7F6u-0w; Tue, 02 Apr 2024 23:20:18 +0000
Received: from smtpclient.apple (unknown [192.168.6.235])
 by p.atl.red (Postfix) with ESMTPSA id D620E2DF792;
 Tue,  2 Apr 2024 19:20:15 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.8\))
Subject: Re: Authenticated Encryption with external Data Integrity Fields
From: Alex Lieflander <public@atlief.com>
In-Reply-To: <cc8e19fe-339d-418c-ac9a-846d22a369bb@gmail.com>
Date: Tue, 2 Apr 2024 19:20:14 -0400
Cc: cryptsetup@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A5880CF-7D20-4686-9638-FA584FBC9EC1@atlief.com>
References: <22FA1250-CE63-4289-90F3-D2256762E5D0@atlief.com>
 <cc8e19fe-339d-418c-ac9a-846d22a369bb@gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.8)
X-Smtpcorp-Track: 1rrnQQDv7F6I0w.DHKwjaeg6sM8P
Feedback-ID: 864594m:864594aXAbgdT:864594sX-h4i-ywn
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

Hello,

Thanks for the response.

> On Apr 2, 2024, at 6:52 AM, Milan Broz wrote:
> Hi,
>> On 4/2/24 4:15 AM, Alex Lieflander wrote:
>> Hello,
>> I=E2=80=99m trying to add authenticated encryption to my setup, but =
I=E2=80=99m
>> having trouble to configure some of the parameters. I know that
>> `cryptsetup` with --integrity only supports some of the options that
>> `integritysetup` does, so I=E2=80=99m wondering if I could instead =
create the
>> integrity layer myself and tell `cryptsetup` to pass down its
>> integrity tags (like it does with the --integrity option).
>=20
> No, you cannot do that. Authenticated encryption through dm-crypt
> (with dm-integrity proividend only additional per-sector space) can
> be configured only with LUKS2 and cryptsetup.
>=20
> But the AEAD algorithm configuration for LUKS2 will need some update.
> What is missing for your config?

Just for context, I have a 24TB RAID5 backed by 6x4TB CMR HDDs, and 2 =
individual SSDs. It=E2=80=99s all consumer-grade hardware, so the =
performance is just adequate. In my testing, `integritysetup` yields =
very poor performance unless I specify a separate --data-device and use =
--integrity-bitmap-mode. I=E2=80=99ve tried tweaking all other =
parameters, but so far I haven=E2=80=99t found any other combination =
with sufficient performance.

So currently my biggest concern is just improving performance, and the =
best/only way to do that seems to be with a separate --data-device (or =
to a lesser extent a very large --interleave-sectors). I also think =
being able to add/use integrity protection while =E2=80=9Cpreserving =
length=E2=80=9D (on the protected device) would be really useful.

>> If that isn=E2=80=99t currently possible, are there any plans to add =
that
>> feature in the future?
>=20
> No, this is not planned. But see below.
>=20
>> It could also be used to take advantage of physical hardware with =
T10/DIF support.
>=20
> Existing hw formats usually only supports 512 + 8 bytes sector, this =
is not enough for AEAD.
>=20
> But NVMe drives can be configured to actually support other per-sector =
additional space.
> IMO this feature is currently available only to "enterprise" storage I =
do not have access to.
>=20
> But once such configuration is reliable and available on some generic =
NVMe drives, I definitely
> want to add support for it (IOW replace dm-integrity by this hw-only =
solution - this was actually
> long-term plan; dm-integrity was originally only proof-of-concept.)
>=20
>> Alternatively, are there any
>> future plans to support using a separate device for the integrity
>> tags like `integritysetup` can with --data-device?
>=20
> No. We already support detached LUKS2 header, with separate device for =
integrity
> tags this means maintaining 3 separate devices, this would create too =
complex scenario.

Fair enough. I=E2=80=99m happy to wing it when it comes to integrity =
because the stakes are pretty low, but I know better than to try =
implementing any encryption myself. I figure that if I leave the =
dm-crypt portion alone, then the dm-integrity portion can be hacky and =
precarious.

> The long-term plan should head to hw backed support mentioned above, =
that would also
> increase performance as it removes the need for dm-integrity journal.
>=20
> Milan


Alex=
