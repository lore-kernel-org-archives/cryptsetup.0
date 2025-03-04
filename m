Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8204A1F8917
	for <cryptsetup@lists.linux.dev>; Tue,  4 Mar 2025 20:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.80.101.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741120710; cv=none; b=RXtksklFt5X1lkG+lVpjM4jmfkYXE79n3Dfcm4D/Zk2fMQ/Q6JjPgukg37t/3XGo22vfZ2VRq9EkD3bSnOdd01bhsW6XOrsWKAkRNW37JFYgaL442aP1YP1XZAc59PH89PR8P0IZnvKlr2IdI0xb0VcTgllX7Qs/VlPKIK+1tqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741120710; c=relaxed/simple;
	bh=cXtczH02XDy/KTB9vdqfb8IKk5Pud+6HNf33Ycvti6Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueSFyTzGKfk6ZVvmRzyp5DIcNWs3eqk5RvbrDwIEQnbMjntNCpahA1KSCXt3aa7I7PQr51i1QlV+Q7J9f1TjDMpnqL6MOeQx9T/7gXurjdD3BXkECTrmyZ2OvZ8qwcBw82X+tlRSI3XXgWmV1g/zFo06Yd1p8mBom6x2GvzQaXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net; spf=pass smtp.mailfrom=ewoof.net; arc=none smtp.client-ip=213.80.101.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewoof.net
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id ECCB73F9A0
	for <cryptsetup@lists.linux.dev>; Tue,  4 Mar 2025 21:31:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: 0.244
X-Spam-Level:
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urQInM6WmnmX for <cryptsetup@lists.linux.dev>;
	Tue,  4 Mar 2025 21:31:03 +0100 (CET)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id E4CF13F93D
	for <cryptsetup@lists.linux.dev>; Tue,  4 Mar 2025 21:31:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 2CDE21D002A3
	for <cryptsetup@lists.linux.dev>; Tue,  4 Mar 2025 21:31:03 +0100 (CET)
Date: Tue, 4 Mar 2025 20:31:02 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Boot with encrypted disk but only with USB Stick
Message-ID: <333fe5ad-3786-4388-81ad-3e3d4066099d@home.arpa>
References: <01a001db8cee$fc0f5550$f42dfff0$@m4com.de>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01a001db8cee$fc0f5550$f42dfff0$@m4com.de>

On 4 Mar 2025 11:19 +0100, from dnichterwitz@m4com.de (Dirk Nichterwitz):
> I have configured my system to boot a luks encrypted harddisk. I addes a
> keyfile on a usb stick and this works to boot automaticaly when plugged in .
> But ist her a way to configure the system to only boot with stick ? because
> if i unplug the stick the system ask für passphrase.

To cryptsetup, a key file (in the sense of its --key-file parameter;
not --volume-key-file/--master-key-file) _is_ a passphrase. See
cryptsetup-open(8) under OPTIONS.

So you will need something outside of cryptsetup to detect whether the
USB stick is plugged in and if not, stop the boot process and/or
prompt to insert the USB stick, before the boot process gets to the
point of unlocking the container. Exactly how to do that will depend
on your distribution and init system, but as Arno suggested, will
likely involve tweaking the initrd. For example, on a Debian-based
system, you'd likely start out somewhere under /etc/initramfs-tools.

Note that doing this won't add any security compared to your current
situation; anyone who wants to attack the container can still do so
normally, because they can either remove the storage device or make a
full-disk copy of it and attack that with no regard to your boot
scripts.

-- 
Michael Kjörling
🔗 https://michael.kjorling.se

