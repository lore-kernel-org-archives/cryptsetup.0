Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca [69.165.217.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD33D2356BA
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.165.217.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750452426; cv=none; b=guM2y2gABf983M7ZVIO4OwP9hCDnFEnkJvazJ7Vz+vaaoVB8kTPPJFOxEvKbVBXjDeskieaymr5v5WKxKKoPza98oXnVfWXQ8hSfxQ5V3PJsqNxAoMiPlMdEL6kpsPB+xPW8XSqK6WeZYaKSgQ5cM3kEgmkhFR3bv/J4Y95L2lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750452426; c=relaxed/simple;
	bh=Hl5EZVPILEhjtL8PWRxj8qQ/XCQHdBPUzz1o4acGdHU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=OIavZWJh7KCvPYt8Vp1UQmd6k6z/aVKiG7Ja15yEibRpXsizQgBJOFk8Vwz5vZ0BgYeK1sKThJ/FzxXHl2tokxwX+OT3pprqfp7T9jnNsUQsH77puDzglWkLEwgr45yVGfM4F5XWqBVqnRwlGETACjcZHsTa4B4tDCwdv8j5uLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlinx.bc.ca; spf=fail smtp.mailfrom=interlinx.bc.ca; arc=none smtp.client-ip=69.165.217.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlinx.bc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=interlinx.bc.ca
Received: from dummy.faircode.eu (unknown [10.75.24.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by server.interlinx.bc.ca (Postfix) with ESMTPSA id 0CFF13039A;
	Fri, 20 Jun 2025 16:39:50 -0400 (EDT)
Date: Fri, 20 Jun 2025 16:39:31 -0400 (EDT)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
To: Mark Foley <mfoley@novatec-inc.com>
Cc: cryptsetup@lists.linux.dev
Message-ID: <ca0e266e-fd81-47a5-9417-58d490e390c5@interlinx.bc.ca>
In-Reply-To: <202506192255.55JMt0n4027293@server.novatec-inc.com>
References: <202506191557.55JFvYQZ004708@server.novatec-inc.com> <70be44da-a130-407e-b529-d6e7ee820b1e@home.arpa> <202506192255.55JMt0n4027293@server.novatec-inc.com>
Subject: Re: Using Windows and bitlocker
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <ca0e266e-fd81-47a5-9417-58d490e390c5@interlinx.bc.ca>

Jun. 19, 2025 6:55:59 p.m. Mark Foley <mfoley@novatec-inc.com>:
>
> The reason I am investigating this is because our insurer recommended tha=
t we
> encrypt the sensitive data on this Samba share.

Ahhhh.=C2=A0 "Recipe-book compliance".=C2=A0 I feel for ya.=C2=A0 It sounds=
 like you are dealing with beauracrats that are just recommending/requiring=
 things that they probably know nothing about, but it's out of a recipe boo=
k some "consultant" gave them and told them they should be requiring.=C2=A0=
 And they are doing it completely ignorant of your situation or context.=C2=
=A0 You are sadly a "tick-box" victim.=C2=A0 Completely unsurprising from t=
he insurance industry.=C2=A0 Sadly.

Even more sadly, when you need to make a claim for something that has absol=
utely nothing to do with encrypting data-at-rest, they will ask you if you =
had at-rest encryption and when you say no, (even though your situation may=
 have no real world requirement for at-rest encryption) they will deny your=
 claim because you didn't tick an irrelevant tick box.=C2=A0 Insurance comp=
anies are the worst.

Cheers,
b.
