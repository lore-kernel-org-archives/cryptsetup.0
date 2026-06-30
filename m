Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E4F283FD9
	for <cryptsetup@lists.linux.dev>; Tue, 30 Jun 2026 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827497; cv=none; b=Xa7O89MoVHnNo67M0WDuqI86MpyiTWTxxYowO37HpCfXigiSQo4b/0FJenQNATFTVo3sDUbrDwFIvJji4sMNa1GA/JSFE3JSVisPEU4NCwajqiSI8ZFy07aDQnk6GY99SPjr1XZVkhPB9t4ckTXc/6AfU+ERtU5EXfpT16BOf64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827497; c=relaxed/simple;
	bh=uqJVIMui0MG+PiDHmswxTtyZNWEwKcxto6gz8CYIAMI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=I9Dy1o+7FQkp3vex4bIf6TUnKxF9GjS2vVNANdNEppp2ZoMP2EyaJzB8rJPOvkqlAjbbsYr+iIxVwGs2QLlKcLrfpsqSBt1CcQ0sDPaGTU7icfd4jDZBmc/50I262ZquJAr0UrthZiAsrk3lxZCjroB4V+KHvLcReK2N939HcaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com; spf=pass smtp.mailfrom=tutanota.com; dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b=4Zk6iq7Q; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutanota.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b="4Zk6iq7Q"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id 4BA8715666637
	for <cryptsetup@lists.linux.dev>; Tue, 30 Jun 2026 15:51:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782827494;
	s=s1; d=tutanota.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=LxgOICEtkcNyfUxAFmhA7ZBOFKIQ8T81fMGOiJ84IC4=;
	b=4Zk6iq7Q3+xpaPSyuUcV/szCynXRsmfXeYzs2ShGca/wOvxuZr3+kMwQqVcY1mAz
	6JUf2+Sba9cB8UnjOSpsm2MUcNUuFXKy68RKlRG4TZ+k+UQdgYkV8wHXjHNaDyQfZ/u
	Jhv6gP3jS017o135QRmCm5ggPEme3wRhnnANhNEshPszLerjXYCjKyeKlHkdoXLcf9g
	n01e/3M0qH55Ls+HsrHLIOKh+Utv7LDMUb/zonU7Z6ehBDfmSV8FJSR8NK69Na19uek
	P56EgDiO8EeCmqpCvpmGqR3RF87dkgdrHsYwX5gwXzCjTuaocFimJ53tFVtKsbflGGO
	/CT3rdOZeQ==
Date: Tue, 30 Jun 2026 15:51:34 +0200 (CEST)
From: cyper@tutanota.com
To: Arno Wagner <arno@wagner.name>
Cc: Milan Broz <gmazyland@gmail.com>,
	Cryptsetup <cryptsetup@lists.linux.dev>
Message-ID: <OwNn5ye--F-9@tutanota.com>
In-Reply-To: <akK8KlVr8s3ZHdvb@tansi.org>
References: <OwJ5x3r--N-9@tutanota.com> <eeba13d0-3337-4213-8751-53de0838c474@gmail.com> <akK8KlVr8s3ZHdvb@tansi.org>
Subject: Re: [feature] PQC KEM
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Feedback-ID: 01c31dc8a5d4d6751b6f6ac02a78e46dc8b122f05e0198c33d2725066fef6ebaf2fef8f8a5859fcd950990ed82c624bcd61f0c6ba63d9a3ddbf9efb21fe5671f4a:TurnOnPrivacy!:tutamail

PQC is not primary benefit, asymmetric key model is. I=E2=80=99m kinda curi=
ous about how such use case is valid.


29 Jun 2026 at 19:40 by wagner@arnowagner.info:

> On Mon, Jun 29, 2026 at 18:42:03 CEST, Milan Broz wrote:
>
>> On 6/29/26 6:27 PM, cyper@tutanota.com wrote:
>> > Interested in introducing a new LUKS2 "xwing" keyslot type unlocked by=
 an X-Wing
>> > post-quantum hybrid KEM (ML-KEM-768 + X25519, draft-connolly-cfrg-xwin=
g-kem)
>> > instead of a passphrase to encrypt the kek (volume key)?
>> >=20
>> > 1) asymmetric model won't shine in single user case but will be attrac=
tive in multiple user/image enrollment cases.
>> > 2) if per-device fresh wrapping key is desired
>> >=20
>> >=20
>> > I've implemented such keyslot type and tested.=C2=A0 But don't know if=
 the aforementioned two cases is worth discussion.
>>
>> This is typically something that should be done through LUKS2 external t=
oken while keeping keyslot
>> encryption as it is defined in LUKS. (Maybe you did it that way, no idea=
.)
>>
>> Anyway, what security issue this solves (except "it is PQC")?
>>
>
> That seems to be the key question.=20
>
> Also refer to https://www.cs.auckland.ac.nz/~pgut001/pubs/bollocks.pdf
>
> Arno
>
> --=20
> Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.nam=
e
> GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 97=
18
> ----
> A good decision is based on knowledge and not on numbers. -- Plato
>
> If it's in the news, don't worry about it.  The very definition of=20
> "news" is "something that hardly ever happens." -- Bruce Schneier
>

