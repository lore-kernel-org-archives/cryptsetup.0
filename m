Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C137C1AE875
	for <cryptsetup@lists.linux.dev>; Sat,  8 Feb 2025 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739007269; cv=none; b=LKCGsVITXP8f0lXEmWxrf6g345chj/BwCuh270TqbPEfmgf5X1zjwisCuhNVmrNZRUz8hc3n8K/ubYv6Af+uaMLNqz+khD5Mn/sIfcJ+rTlHMwYbah2jZmYQCTigUyKK35/+w3lrhZ8qvz6rT7Bx/m+KSD1Wy1wblYHGG/054TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739007269; c=relaxed/simple;
	bh=H2wfZp3QEVarKDwKJiV6dvMjg5KVpV1Uyg3tqBLdJPU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jAvGQsTbUdmuitV5W/2vibgvtJYTiFPfWyTavBLIrHMyp13+weLuvblAvcGQDa/1+UmeCfOhVRKYyS4YQW20pakFXIfxHXUKiqpwz7vgY/pEsVEzPyYyJnY8+wuWKyTM8x/HPGxVYnm6+EIfbXL/DklmtCEXEPfsICG77O6mlvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=SZUuiUXW; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="SZUuiUXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739007260; x=1739266460;
	bh=H2wfZp3QEVarKDwKJiV6dvMjg5KVpV1Uyg3tqBLdJPU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=SZUuiUXWn/JJJt+cpWN34HTD+5mWmqucDdBNydmvp5/eccx/A8NNGk6Nmweh916De
	 bIC+w238u9K5aDPtVhGEbE9ZHW++KKo+TR3iq60762z8zYZdCgkuTlncvahYe4gjSu
	 yZPSzysEZGO9VRsiOepIEClSD8SQ5IeaAtHKuhbq10vr0C441VV3RgWnusaXKvavqs
	 fnEJTuyQ6qpFUC3H6bB8jtXHosbmx6vnuB2lYONh1WwoInWnrUjCMuDdX13Afkojeo
	 +RL82nDiTlgX8IBgKf41Rgi1Hh+QAG2D+pT6bEC21rzMJo2+zu2A6Q6D7XwFYOaHll
	 iM+nyKYmTTy/Q==
Date: Sat, 08 Feb 2025 09:34:15 +0000
To: Milan Broz <gmazyland@gmail.com>
From: forbytten <emlister@proton.me>
Cc: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: Re: cryptsetup FAQ - clarification of loop device security guarantees
Message-ID: <gaLE38KYdv7cysRO9aqkiFBC-VT1TdrEBuHRKjKbkfJs7LRn05sAYnjNT57axl71wdkzru50calQ3nJpmeq2og2fx79ueVB4v1Xzzsk7BNk=@proton.me>
In-Reply-To: <2ae83c1d-4d1a-4fb6-a46c-0aaa1e024269@gmail.com>
References: <ECuOkqnIQPivTNgsB2kV-djutsXXEdcFpuE3OKiwaP2ypwzAyrp9kYt_jGMSYZ6jdEkhmIRvX6sSCLMaITA8IHEpDyA2U9K8HCNdEpCoQ0M=@proton.me> <2ae83c1d-4d1a-4fb6-a46c-0aaa1e024269@gmail.com>
Feedback-ID: 133470085:user:proton
X-Pm-Message-ID: e8541b57366663f36cc5bd91fccbc78755ce43f2
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks, Milan, for the prompt confirmation.

Regards,
forbytten


Sent with Proton Mail secure email.

On Friday, February 7th, 2025 at 2:08 AM, Milan Broz <gmazyland@gmail.com> =
wrote:

> On 2/6/25 10:04 AM, forbytten wrote:
>=20
> > Hi,
> >=20
> > In the cryptsetup FAQ, under "2.6 How do I use LUKS with a loop-device?=
" it states "This can be very handy for experiments". I am seeking clarific=
ation of whether the security "guarantees" of such use would still be suita=
ble for production use. I hypothesize they would be, due to:
>=20
>=20
> Loop devices just remap IOs, they are routinely allocated by cryptsetup i=
tself once you use an image (in file) instead of block device.
>=20
> > 2. I would expect the threat model of LUKS2/dm-crypt/aes-xts to include=
 the ability of a threat actor to take a block level image of a physical de=
vice and attack it offline, which would be equivalent to having a loop devi=
ce backing file?
>=20
>=20
> This is irrelevant to loop devices, you can always create an image and an=
alyze/attack it even without allocation of a loop device.
>=20
> Loop device is just a tool that maps a file to virtual block device, noth=
ing more.
>=20
> > 3. I would expect a loop device to behave identically to a block device=
 as far as LUKS2/dm-crypt are concerned.
>=20
>=20
> yes.
>=20
> Milan
