Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA90833993
	for <cryptsetup@lists.linux.dev>; Sun,  5 Oct 2025 14:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759676371; cv=none; b=BPD7xbEQbrCQUzqyijjk9SkcstvZlTmbqUJVkX10w2Jss6VSxfj+sjwyGy0828+dNFzQS+sh01CqEIMmcXOBUO6Nyv4UWYqEpzgJ+X1jdUHw+8pxSM8dH0eh/MYDoe9FJ0kmvjF4isQayb9ZCNuqn7GEX6r9Jb1z+nKqmb8O20k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759676371; c=relaxed/simple;
	bh=lG+gq6Ei5Ji+d4lYiK04mGhMkbvT6vRmjcfE5qrs1Xw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnUYFOHTwABnq99ZuqcZG4H1mtNtCjTN3E1Af2TsaCfBq1GFZPDxY/nqPNqlEwwMFCQHcX6kBx6KDiMX5GgKilCcuT8u951SdRvMH96R6s05fSdFap9pskqU/bHbKFRwSAandWINmcKWGqTTQEQ5sNz6m/YX+v6RD1vEgcsZyF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=OoE42III; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="OoE42III"
Received: from localhost.localdomain (localhost [127.0.0.1])
	by shakotay.alphanet.ch (Postfix) with ESMTP id 16E093044EB5
	for <cryptsetup@lists.linux.dev>; Sun,  5 Oct 2025 16:59:19 +0200 (CEST)
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 6D9693041AAD
	for <cryptsetup@lists.linux.dev>; Sun,  5 Oct 2025 16:59:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1759676354; bh=lG+gq6Ei5Ji+d4lYiK04mGhMkbvT6vRmjcfE5qrs1Xw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=OoE42IIIW2oOmMtxBWVpZdqfueF4Dy4zD4/kuEQinDAijK2WLYLwJKB/gnQZcMC6T
	 BT3X3yvh4V4RLSNQd2WKHlMyxF4pqNHwPoH8O2dvtKC9dzaSm4APzAiUYXhxRVttsy
	 PmHaszDE5lnPBmOxcUgRdKKiLlA/Pz7AxpJdFmR9edT2vB1z2BMNwUwkV/FOVhOwlK
	 1HPYSysPX2oc2UjQ8dj6hvArK9gtMPseX2Ddoi6LRnT/8XiYj0mF2wcphQecJ0yv2T
	 fgfQm9XBbKPL4qjaHLyiQMjO8tL/EV6tzZ+gx6K2ET8EvyZUGAKYJgxtLZYJesLqS9
	 oyhKFksGhg3hA==
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 67BB076CA27; Sun,  5 Oct 2025 16:59:14 +0200 (CEST)
Date: Sun, 5 Oct 2025 16:59:14 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: cryptsetup@lists.linux.dev
Subject: Re: known issue with specific kernel releases and snapshots on LVM
 on md RAID integrity devices
Message-ID: <aOKHwjBZKdqGXj5m@alphanet.ch>
References: <aN/lO3XNKyrinSz5@alphanet.ch>
 <f71c3ee6-4c31-418e-a141-f941b22b8f5c@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f71c3ee6-4c31-418e-a141-f941b22b8f5c@gmail.com>

Hello and thank you for your ideas,

On Sat, Oct 04, 2025 at 08:34:26PM +0200, Milan Broz wrote:
> > Do you see anything peculiar with this?
> I do not see anything special, just checksum errors that can be caused by many things.

Indeed.

> I would start with checking hardware, specifically reseat RAM modules and cables,
> check and run some extensive memory and other system tests etc.

I did extensive memory checks before, and I did them again, found nothing
(memtest86, long kernel compilation loops). What I find peculiar is that in
most cases, both RAID1 mirrors had an integrity error at the same blocks:
especially knowing that each RAID1 mirror is, in this case, over its own
dm-integrity device.

But maybe I am mistaken, and there is some optimisation which makes both
dm-integrity devices recognize the original block to be written is shared
between the two device and it is optimized by dm-integrity to be calculated
only once?  If yes, then a simple RAM corruption would explain this issue.

> Check system logs, there could be something that precedes this issue.

No, there was nothing, I get logcheck summaries for this system and there
was no I/O error or anything before this.  I also monitor temperatures,
and there were quite ok just before and during the issues.

Locating the issue more closely I determined which LV contained errors (the
errors, except the correcte one, were always at the same addresses), then
checked all the files from the LV (*) (as errors were on both R1 copies, it
should have shown something), and the error is only seen when reading the raw
device LV, but not in the files theselves.  This also explain why the
initial error was on a snapshot (that is temporary, quickly deleted).

I thus wrote a big new file filling the LV fs, no error, then re-read the raw
LV volume without errors. I am now running a md raidcheck again, that should
tell me if the dm-integrity CRCs are now written correctly on both
devices.

Another question: does --enable-discard really work?  Looking at the
documentation, I am not sure it really works with crc32 and bitmap
integrity mode, do you have a final answer?  If you have no idea,
I will do some tests on a spare system to see what combination
of options really does discard (I am not sure how to test this,
presumably NVMs have a namespace-full percentage, not sure
it's really reliable). Do you have any suggestion?

Thank you and have a nice week.

(*) simple read, then backup comparison for the files that don't
    change.
