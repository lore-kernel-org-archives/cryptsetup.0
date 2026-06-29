Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304BF349AFF
	for <cryptsetup@lists.linux.dev>; Mon, 29 Jun 2026 17:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782755446; cv=none; b=BWHksdQKW02xwv26QuVJcHFDqUuOzfZzBYm8UB1G9L/SO+CMheMYEBw4MutojFEiKRZxEWyXNLw8YufyQo+tUhKathVgPG6Na7d9cp+7ayS0mXFrl2vgivonkbGWD4WoAAUARnOukEjQ1GqCvGjFs03i3dr8XIB5bwP2Bxao3mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782755446; c=relaxed/simple;
	bh=AaoOSbWmnKJDBGUrSTnKf9jiXg6u0SE6aMxtf9nVp/U=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=mpdbXePneq3BCH/6xCVx2nU6424COiU7uTj2L+b8dWk+6+P+ZM/WNwUOaabGDa4Ac1+pJSQDBEHdOMSEOSI/OL1NSKBjBvLPdSjelXj5BQ9g3O/idsdZP/Q8o8b3UzJ84rmXjPhZS3Rn1LBPcq5wCQHiKrYzXexspTl5v3QNi9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com; spf=pass smtp.mailfrom=tutanota.com; dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b=W+1+FEmD; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutanota.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b="W+1+FEmD"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id 37E5A155F1D6A
	for <cryptsetup@lists.linux.dev>; Mon, 29 Jun 2026 19:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782755443;
	s=s1; d=tutanota.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=AaoOSbWmnKJDBGUrSTnKf9jiXg6u0SE6aMxtf9nVp/U=;
	b=W+1+FEmDo4We+VGXW2kjLvtKSe96IZ87AnwBeYoa1Y9Xcjed3MsIjdxYpmKbyTUM
	bq/tRySv7u9EoveQRMfOxSh6AY9AdTt88SKd5GtpLoRuq579tWLakWPaxlKIPCUTl7G
	hq+tZ+mbcL5jFalrRNzzR9c0/2nqdik6Rf9FFsmMH9MJdLXs26y33nQhYYbpkA2v3cK
	t6Et6pSVpA+bubx/yL2jFdEoZfOysa79atEb9qNG8Rv3elLO0qEfSXydXNeVrwIc7/+
	tk4nFT6Roj++VJ6xIf+Maqr26TuJe1/yPWfkznqDUGqpN0pT5YBb2jCyt9VWd3xCiQ4
	RYw3yFlJHg==
Date: Mon, 29 Jun 2026 19:50:43 +0200 (CEST)
From: cyper@tutanota.com
To: Milan Broz <gmazyland@gmail.com>
Cc: Cryptsetup <cryptsetup@lists.linux.dev>
Message-ID: <OwJVFO9--F-9@tutanota.com>
In-Reply-To: <eeba13d0-3337-4213-8751-53de0838c474@gmail.com>
References: <OwJ5x3r--N-9@tutanota.com> <eeba13d0-3337-4213-8751-53de0838c474@gmail.com>
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

Avoid low-entropy passphrase. (I am aware of key file which is yet another =
passphase pass to pbkdf)
Avoid pbkdf cause the default one argon2 is not fips compliant.
Enable public recipient access.

29 Jun 2026 at 17:42 by gmazyland@gmail.com:

> On 6/29/26 6:27 PM, cyper@tutanota.com wrote:
>
>> Interested in introducing a new LUKS2 "xwing" keyslot type unlocked by a=
n X-Wing
>> post-quantum hybrid KEM (ML-KEM-768 + X25519, draft-connolly-cfrg-xwing-=
kem)
>> instead of a passphrase to encrypt the kek (volume key)?
>>
>> 1) asymmetric model won't shine in single user case but will be attracti=
ve in multiple user/image enrollment cases.
>> 2) if per-device fresh wrapping key is desired
>>
>>
>> I've implemented such keyslot type and tested.=C2=A0 But don't know if t=
he aforementioned two cases is worth discussion.
>>
>
> This is typically something that should be done through LUKS2 external to=
ken while keeping keyslot
> encryption as it is defined in LUKS. (Maybe you did it that way, no idea.=
)
>
> Anyway, what security issue this solves (except "it is PQC")?
>
> Milan
>

