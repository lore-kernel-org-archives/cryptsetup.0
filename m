Received: from hera.malbolge.net (hera.malbolge.net [185.232.68.32])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AF57488
	for <cryptsetup@lists.linux.dev>; Wed,  7 Jun 2023 10:02:59 +0000 (UTC)
Received: from hermes.malbolge.net (hermes.malbolge.net [192.168.123.201])
	by hera.malbolge.net (Postfix) with ESMTP id 7F0507C767E;
	Wed,  7 Jun 2023 12:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=malbolge.net;
	s=hera; t=1686132177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=puoXPpdxJRMloEgeFqLBY76wtJoXmOL4X7bJECfsock=;
	b=hHuzEVWvGvWPoUJOVFhS/1jkvhB1FLYSuuX1ILYqNytqnpPvQzHYrlkmilF925EImbYNNt
	pkHjR7exiquPELmE2eIHiDgUWEJup7YUG0Le6vHScKi1c3EBtBzRdxPbVQZRnYEiCXk+Ah
	eBmnIdduzR0xQ1OhtFqgSPqAAL7WgXg=
Received: from moon (unknown [77.188.40.162])
	by hermes.malbolge.net (Postfix) with ESMTPSA id CE636426D63;
	Wed,  7 Jun 2023 12:02:56 +0200 (CEST)
Date: Wed, 7 Jun 2023 12:03:31 +0200
From: bugcounterism@malbolge.net
To: cryptsetup@lists.linux.dev
Cc: Arno Wagner <wagner@arnowagner.info>, Arno Wagner <arno@wagner.name>
Subject: Re: Wiping disk vs. initializing container
Message-ID: <20230607120331.2125480b@moon>
In-Reply-To: <20230607033038.GA26586@tansi.org>
References: <20230606230850.630aa048@moon>
	<20230607033038.GA26586@tansi.org>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 7 Jun 2023 05:30:38 +0200
schrieb Arno Wagner <wagner@arnowagner.info>:

> If it is crypto-grade randomness, yes.
> But note that Section 5.3 may still be faster.

I see.

Now I have some follow-up questions:

1. Would `cat /dev/urandom > /dev/sdX` give me crypto-grade randomness?

2. Is initializing a LUKS container with zeroes equivalent to filling a
   whole drive with crypto-grade random data if the LUKS container
   spans the whole disk?

3. The FAQ says:

     If the target was in use previously, it is a good idea to wipe it
     before creating the LUKS container in order to remove any trace of
     old file systems and data.

   So, isn't just filling the whole disk with random data before setting
   up the LUKS container the simplest solution if you want to a) destroy
   old data reliably, b) put the disk into a clean state, and c) make
   sure that parts of the LUKS container that have not been written to
   cannot be distinguished from those that have?

4. Should new hard disks that have not been used previously also be
   filled with random data in order to achieve c)?


Thanks
Michael

