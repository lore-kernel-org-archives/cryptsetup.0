Received: from mail-gate.swisscows.email (mail-gate.swisscows.email [146.185.79.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45A54B5C8
	for <cryptsetup@lists.linux.dev>; Thu, 23 Nov 2023 18:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swisscows.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swisscows.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=swisscows.ch header.i=@swisscows.ch header.b="R1cVe55P"
Received: from mail-gate (localhost [127.0.0.1])
	by mail-gate.swisscows.email (Proxmox) with ESMTP id 39A7482C51
	for <cryptsetup@lists.linux.dev>; Thu, 23 Nov 2023 19:19:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=swisscows.ch;
	s=postfix; t=1700763593;
	bh=PwQTS1HpoMAa5QMW1IZYmRLmB4WTvu7CoMDuDLo9nH8=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=R1cVe55P6/Fnofu74+8vGQ6VFg0lI1H6UVXorNCONVbJgSHv+l+bvE8dXUsqc9srd
	 jctJAfv07jnGw6YBmBVpGFC/XEacP4T/LdVdcuylT21Ef7vTb0d7wTVYBlMIp/4Vfh
	 6dtL9A4EysxiGPj5GiSjRayQIji5656uFYx+37s+vpvu2KaQuFw/JRndzYoBOn9qmC
	 AoeyEdXe9AfhGxuyRNBjKw4XxxLnIhnCaZcVztklJYTD1T5/BiyzCgvrJKeKcwckl2
	 21ap+2dDIEdD6iiyOwAPdv0XlShkyb/pE4j5mhj6w0LobuOC5d6QxNl064Mjduv0iz
	 kZR/FqLFRgDpQ==
Message-ID: <7a619dce-935f-4c81-a98d-34b71ae90e32@swisscows.ch>
Date: Thu, 23 Nov 2023 19:19:52 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Recovery of LUKS keyslot during PBKDF phase of overwrite
 ChangeKey possible?
From: =?UTF-8?Q?Christian_F=C3=B6rster?= <christian.foerster@swisscows.ch>
To: cryptsetup@lists.linux.dev
References: <7aac4982-b795-4de6-90f8-ad3f3d806edf@swisscows.ch>
Content-Language: en-US, de-DE, ru
In-Reply-To: <7aac4982-b795-4de6-90f8-ad3f3d806edf@swisscows.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I should have included these questions:

Could I just terminate the systemd process when it hasn't actually 
computed the key yet? More specifically, when does cryptsetup actually 
start overwriting the keyslot when the --keyslot parameter is used? Is 
there some overwriting already before it is done computing or only 
after? If only after, then the keyslot should not yet have been harmed 
as it's not done with the iterations, right?

Thank you.


