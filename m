Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950343BB50
	for <cryptsetup@lists.linux.dev>; Sat, 27 Apr 2024 05:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714194359; cv=none; b=F6iDoHdnpr+V6oJtdL8fi03PoY7mtUmLbEHUyRM0DUBmOF+lZBXu9ukve8PzZQXE3gm94MAffsGsM2dx2O9DSmhIGvtfDrGrgFdtnSe78xAkKfLQr5Y8x4kbosX7P/6F7ywHqKovRM8oOnK0M6Gy76MQypkxz6HMPzR5H/TxG+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714194359; c=relaxed/simple;
	bh=A2znbZcjOjxJ8MN9w7J/t3Qk+oGaLK8apMh/v4Te2Ok=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RRxIVJlFtV7VdKnvmhhUHEld9xDtjptTiufu+a+eowAbLrDgMgcXeWjwPNlPsUME4OxoqzhGSCcdloYnVu9k4YtGmhC8AYe5yDEiE6u7XAngVXSQCdZKyV0wCIqQDvoLcOKWxtGqc/Lop3JmppxxBn+7JJ71tRMvRLmHQgLHpoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fomin.one; spf=pass smtp.mailfrom=fomin.one; dkim=pass (2048-bit key) header.d=fomin.one header.i=@fomin.one header.b=saNNv5iU; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fomin.one
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fomin.one
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fomin.one header.i=@fomin.one header.b="saNNv5iU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fomin.one;
	s=protonmail2; t=1714194331; x=1714453531;
	bh=A2znbZcjOjxJ8MN9w7J/t3Qk+oGaLK8apMh/v4Te2Ok=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=saNNv5iUMZvW+gnSHDdHo3QZsWeHNTfvwXh9oTkKfLcM0opTwW6ZInUJ7ceC8YxT9
	 PyHz0DoS5qRvX6s5xqmBXuF79mD+M1GBNp8aOoTqfSxMx04VONF4ybD6xQNbm9Y1Pc
	 XYSNnf4utXsm1VxUTvxCAXBKfquxVGGRZwHcySbjvEW74bzZQF71eW5/dAmiMpT/ix
	 j7AWcjroho8rxPnEdjhi9wdBapknCWLQnN5De/jMPBfO9+Q/hQLFADUq8dpQW0agWh
	 zNq7cVGHHT9cH9yI2/BFGnURvfUlciac5eYFrd/WybHXsC3QxqrD4lqLSzPt/9Z2GE
	 RpUEIMAH8O/WA==
Date: Sat, 27 Apr 2024 05:05:26 +0000
To: cryptsetup@lists.linux.dev
From: Maxim Fomin <maxim@fomin.one>
Subject: Re: mkfs on luks USB flash drive blocks forever with "reset SuperSpeed USB device" (kernel 6.7.9)
Message-ID: <RAfpmZ2xkxaP9hDzji38HPCaLGowefnvLadVpdY53QL2Vv8TOeWyknA4nsP4hsUDYrRJ_nZfO_tpFJvdLaANd9lGjRsrKZ-tFKo3mUwSqDQ=@fomin.one>
In-Reply-To: <10e060de0431f88edeaf7fa395965c1763a6b749.camel@mega.nu>
References: <10e060de0431f88edeaf7fa395965c1763a6b749.camel@mega.nu>
Feedback-ID: 10594471:user:proton
X-Pm-Message-ID: f7777751ff0bc8caa4529fad036d3d42b7369225
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, April 26th, 2024 at 8:35 PM, Daniel Pouzzner <douzzer@mega.nu> w=
rote:
>=20
> [Mon Apr 22 18:08:59 2024] usb 2-2.3: reset SuperSpeed USB device number =
12
> using xhci_hcd
> [Mon Apr 22 18:09:04 2024] usb 4-3: reset SuperSpeed USB device number 10=
 using
> xhci_hcd
>=20

Hi! I have similar problem with some of my disks. In my case these messages=
 were shown often and randomly without specific disk usage pattern. The pro=
blem was solved by disabling UAS dirver for these disks by appending follow=
ing parameter to kernel in GRUB:

usb_storage.quirks=3DXXXX:YYYY:u

where XXXX and YYYY are disk vendor and product id attributes. In your case=
 this probably will not solve the problem because the error is triggered by=
 specific disk usage pattern, but it will probably eliminate one possible s=
uspect. In may case the error was caused by disk controller which flush beh=
avior does not match fs assumptions (information got from btrfs mailing lis=
t and irc, but such errors also often happened with ext4).

Best regards,
Maxim =20


