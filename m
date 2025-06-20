Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca [69.165.217.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C65D218AAB
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 20:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.165.217.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750453115; cv=none; b=fWZW0NPbyI3QHu8rVCquRg2EjI5s8hKg2JU1KicFCVe81n8drQoLgEo8bI6j7u1sT3oBl6b4OIoPkRiZEQ1ebExjTWptJGmxjxYApE4/vg5v/XabejpPYF/oPwVZ4qikgz0cCwsAdUoqqlGYxo33JPxLHGT1090KSv76HPT+IfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750453115; c=relaxed/simple;
	bh=1a1U9yEgLBxa8epaCyazoKou+7VwXW0Chi3GmK9dn1c=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ON5SB7752/W8xpTZdgvxAYUh/dQc6iRlPPtTfb/AswRkA7hJb6gjq6GQ984SV05HvU1BRhRSR4g1yANf7W65b9Dq/i/7NKzhgM3omiYjjP91p2njNlq4yPAm3vXqvkgflX2b0fkW0x92PEH/Sr1NM1hZOjzqy59qyCM22RcpCMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlinx.bc.ca; spf=fail smtp.mailfrom=interlinx.bc.ca; arc=none smtp.client-ip=69.165.217.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlinx.bc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=interlinx.bc.ca
Received: from dummy.faircode.eu (unknown [10.75.24.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by server.interlinx.bc.ca (Postfix) with ESMTPSA id ABF0F3039A;
	Fri, 20 Jun 2025 16:58:32 -0400 (EDT)
Date: Fri, 20 Jun 2025 16:58:16 -0400 (EDT)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
To: =?UTF-8?Q?Michael_Kj=C3=B6rling?= <152cc69a347e@ewoof.net>
Cc: cryptsetup@lists.linux.dev
Message-ID: <e497a57c-d678-48a1-aab2-2663b728c0a5@interlinx.bc.ca>
In-Reply-To: <70be44da-a130-407e-b529-d6e7ee820b1e@home.arpa>
References: <202506191557.55JFvYQZ004708@server.novatec-inc.com> <70be44da-a130-407e-b529-d6e7ee820b1e@home.arpa>
Subject: Re: Using Windows and bitlocker
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <e497a57c-d678-48a1-aab2-2663b728c0a5@interlinx.bc.ca>

Jun. 19, 2025 5:53:07 p.m. Michael Kj=C3=B6rling <152cc69a347e@ewoof.net>:
> Microsoft's Bitlocker, LUKS on Linux, VeraCrypt, and others are
> examples of _full-disk encryption_ (FDE) solutions.

So while that is a common use-case, a full-disk (to encrypt) in the Linux c=
ontext at least is just a block device.=C2=A0 Block devices don't have to b=
e full disks though. They can be any of many partial disk abstractions whet=
her that is partitions, LVM LVs, etc.

> Full-disk encryption is mainly about protecting _data at rest_. The
> typical example is if someone steals a laptop, or an external storage
> device used to hold backups. (It's also useful in other situations, of
> course.)

Indeed.=C2=A0 Again, the common example/use-case.=C2=A0 But I think there c=
an be others.

I have occaisionally consdered a hybrid approach.

Imagine that I have data that I want encrypted at rest.=C2=A0 But I also do=
n't want it mounted at boot because I want system boots to be succesful whe=
n unattended.=C2=A0 But I also don't want to "stash" the decryption key on =
the machine so that boots can happen unattended.=C2=A0 So what I really wan=
t is this encrypted-at-rest data to be (decrypted and) mounted on demand, l=
ike with autofs.

Further I imagine that each user authorized to decrypt the data has their o=
wn key (for revocation purposes) for the decryption.=C2=A0 A key that decry=
pts the master key for them.=C2=A0 I think LUKS already has this concept as=
 "slots" doesn't it?

As I imagine this system, it reminds me roughly of how Kerberos works with =
users having a password to obtain a ticket-granting-ticket which then allow=
s them to obtain crypto credentials for various services on various systems=
 in the network.=C2=A0 A "key to obtain a key" kind of system.

This system I imagine also doesn't allow other users (such as root) access =
to the mounted data because it's mounted encrypted and is only available un=
-encrypted to the users that have keys for it.

This might all be very pie-in-the-sky thinking and not actually even techni=
cally be possible.=C2=A0 It's something I have somewhat-often imagined havi=
ng.

Cheers,
b.
