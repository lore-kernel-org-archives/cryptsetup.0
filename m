Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393801CFEAE
	for <cryptsetup@lists.linux.dev>; Tue, 19 Nov 2024 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.80.101.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732040589; cv=none; b=oxsRE9Ij8fCBfek+END7KEA033vS84H5xcfLM/T7gpgRHzZS11zpkyk7Tdahsh+2Y3dFodaQEsaXnxotw2vXohUzQLcn7Eb+FODSb9/Tb2i96f8H65w4+B5vLa25bSvmdXRKDkfbZn9NOQA3oW1IwNBb00SrowYwzY7jkaNNHVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732040589; c=relaxed/simple;
	bh=Lh644ZMQpgFjXOaZyX1ZolXFpc9NNBtYvXyzJYUllE0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geRzB7MmlvZP3QY9BZTsrGepoyslNC/MgNFrlvPp8Hcudtsau86SPLM8dlJ6XX5pUaLe8xkOYS0RN3y4rQbcGx51PJo9Q1gA+3MYmBsUqacWnXQQ/pDBu+Sn+nVpFLjejeeViAGFWSJAW0InLuVJyGmHrxq8Y14ulPXS6kBYtjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net; spf=pass smtp.mailfrom=ewoof.net; arc=none smtp.client-ip=213.80.101.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewoof.net
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 13FE53F944
	for <cryptsetup@lists.linux.dev>; Tue, 19 Nov 2024 19:15:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: 0.245
X-Spam-Level:
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRoOfOOte_oM for <cryptsetup@lists.linux.dev>;
	Tue, 19 Nov 2024 19:15:22 +0100 (CET)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id BBC873F402
	for <cryptsetup@lists.linux.dev>; Tue, 19 Nov 2024 19:15:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 167DE1D00223
	for <cryptsetup@lists.linux.dev>; Tue, 19 Nov 2024 19:15:22 +0100 (CET)
Date: Tue, 19 Nov 2024 18:15:20 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: can't mount LUKS partition with cryptsetup
Message-ID: <5ade3686-267f-4882-968f-a06d4ebe9215@home.arpa>
References: <36eee136-9d15-4f4e-ac0b-083e6d6c3f95@rptu.de>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36eee136-9d15-4f4e-ac0b-083e6d6c3f95@rptu.de>

On 19 Nov 2024 18:06 +0100, from tgiese@rptu.de (Thorsten Giese):
> [...] and read everywhere, that a dm-crypt
> Partition ist mountable with "cryptsetup open" (to get my data).

Terminology: you _open_ a container, then _mount_ a possible file
system within it. The two operations are distinct and not all
containers will contain a file system; a canonical example of that is
an encrypted swap partition.


> When presented with
> 
> Enter passphrase for /dev/nvme0n1p3:
> No key available with this passphrase.

As long as the header isn't corrupted (and what you posted _looks_
sane at a glance), such issues are often caused by keymap differences.
Try switching the keyboard layout to US English without dead keys and
type the passphrase as normal; see if that helps.


> Before entering the passphrase it says something about /scripts/init-premount,
> maybe there is a hint on how to mount it, but I can't find it anywhere.

That file is almost certainly within the initrd, which is why you're
not seeing it at that path after boot.

-- 
Michael Kjörling
🔗 https://michael.kjorling.se

