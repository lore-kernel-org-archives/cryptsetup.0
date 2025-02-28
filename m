Received: from mail-107160.simplelogin.co (mail-107160.simplelogin.co [79.135.107.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAC31ABED9
	for <cryptsetup@lists.linux.dev>; Fri, 28 Feb 2025 22:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=79.135.107.160
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740781322; cv=pass; b=DbWiLDD9mBUDvmEDvRobOwqTJAwwxfgYKGxHrU1pNn6BYgAoWiN88GH9bLesxFM+K/HZ4ap1y+R7R1sBn8f76Wgu/uvEOwgRpwqathNx/NyYS0jmAfoyUnhfXPGIWDHgcGqWkkxwiplVf69fEj9NQHWC21G7mZH3CrBRVknfghc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740781322; c=relaxed/simple;
	bh=mrSvhZewWBuq50nMcQqPKnO/3KgLKst9IdSDVS1v+Xs=;
	h=Date:Subject:In-Reply-To:MIME-Version:Content-Type:From:To:
	 Message-ID:References; b=feddb3eMUmc+lGghibdg6zgzYz0hk+GBvIanq47OEAuXF3XjqQ1ctGEASK+i2HSCWXYMkzBj3KUky+2vtFUVmqITTZQf/Sc1QCiHwNW/EiNrUrE3UqTMzog/gM7AeLOQ+lxxoB4LOkrYV1OaWZWb6HLRDHboKr6QvGOoH1D+I8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aleeas.com; spf=pass smtp.mailfrom=aleeas.com; dkim=pass (1024-bit key) header.d=aleeas.com header.i=@aleeas.com header.b=skcEE7TZ; arc=pass smtp.client-ip=79.135.107.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aleeas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aleeas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aleeas.com header.i=@aleeas.com header.b="skcEE7TZ"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1740780792;
	cv=none; b=nvLz3Saw4LFK66A6Q/EocIi/dqWXxaYmOw2hM3M+GHgVbJhxd3ekNWDayD03QCF0tvlUN33M5vV2KOCIOZ0/ZEgo4pYBCDDh9dPAENe8veL47vK49dIA7qh+ElGQGWNWOStBeJ6H89AlIAv/h5H6W/TnyUjdCLUeSevZj8rVHHgEy0g3DRPt7VV4Cp4/HOR4EJMmuJA98Nw3nVgGv9bel+IDCX3wZYS6k+/CEwWG9PjsZHqohqyleFQRz7/bVlGeRa4m4Gsi9Cps/XDfdoWOPO1dqg/yBZHE5wyhUhAcyx8Rf6cYkOSDwA8b1pvLfwlIRywev0m8kd1NSheVlsgTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1740780792; c=relaxed/simple;
	bh=mrSvhZewWBuq50nMcQqPKnO/3KgLKst9IdSDVS1v+Xs=;
	h=Date:Subject:In-Reply-To:From:To:References; b=gkFeylq9g2EQbUv+863lx8w1LzKn/dDIO6jW5+6PIXzsdSeNFc5K4zbTKmC2toelFhQliftXB0M1BzFSTqRLpPu1GgNE+QtJ8xKK84KcMr7uB5X6IqhK7KJl4RdYZpEl++GTuea5ecyYFtBdDRDmMseUOhVMcUCCUSF8Vp++PE5nR288GsW5RIl7WS45bMuyzVcFUEMYjHsKm/h37O353RAivPLae2/Clfyq/3MjmAYITrvvQkcylrk08mQEKKINnVIlugZ3eN06yDND5ydjEWu2GAnJNureufHzcUwFFnMNOXrWMOAvRJc1drukBB+KwwF3pSUuFNe6VuM9H6HyzQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aleeas.com; s=dkim;
	t=1740780791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mrSvhZewWBuq50nMcQqPKnO/3KgLKst9IdSDVS1v+Xs=;
	b=skcEE7TZTlEDbW8YOSwa6lzJMjdjw0sgnUysQbotBos/z9Hxd7ojuPzZB8XzroWh0c8UbR
	GdVQ0syVNpUnK8hxjsf7LNcwGfTk0QE2KLRYr5cdXACFoL83llI9qN0RCOxIwnJVSJyhEb
	wOYndU/KaBF/ouOlwx121mnVHGL9NxY=
Date: Fri, 28 Feb 2025 22:13:05 +0000
Subject: Re: New requirements for XTS encryption mode (IEEE 1619 standard)
In-Reply-To: <9ebe4e65-e5ee-4eb3-b0db-90de426c7863@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Darek Hisc <darek.hisc@aleeas.com>
To: cryptsetup development <cryptsetup@lists.linux.dev>
Message-ID: <174078079146.6.14579579361719164927.619041945@aleeas.com>
References: <9ebe4e65-e5ee-4eb3-b0db-90de426c7863@gmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 619041945
X-SimpleLogin-Want-Signing: yes


> this draft is behind a paywall; even with a paid subscription, IEEE requi=
res additional fees to download it.

This is madness! :(

> we prepared an independent summarization paper explaining the issues asso=
ciated with XTS mode.

You are great and I just wanted to thank you for your work! For so many yea=
rs!

Cheers!
Darek

