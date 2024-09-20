Received: from mail-200167.simplelogin.co (mail-200167.simplelogin.co [176.119.200.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C244E184547
	for <cryptsetup@lists.linux.dev>; Fri, 20 Sep 2024 18:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726856115; cv=pass; b=MmO2A81IWKRScE3ySqPJvaRmputm2LbxzKRmTBViRRICMj2FjwZpJEFUo8/Swo0oWUn6DiKJXxqsoWyRlpfZz54O2nxBriF6rBvmBq/PKw72oG2r8q+YS1s1FptVDcZKAt25O4QBr7jVZS7z+plLjcoMifrogJV9x0FSXi4TPpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726856115; c=relaxed/simple;
	bh=B5pOlndi3RuI3xGjE6b+5lqmdBpSz1RiXSjQKNqiSno=;
	h=Date:Subject:In-Reply-To:MIME-Version:Content-Type:From:To:
	 Message-ID:References; b=fD+TqXS0cIBnwwsrqd9IRoIumCeSV8+mATkfmlk2Bnf2k1bCfgO6MahbrhaspwZfDn475R0uyTLl68pmvpEtqwzVSOBgyzDewmh5i66ALcol5EjGxCBUTIs9KdkqkhX8+AniwS39a3GvraXa9hiY1HymEuEjPq4x1ap4R1uZTmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me; spf=pass smtp.mailfrom=slmail.me; dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b=Bg1LgeZO; arc=pass smtp.client-ip=176.119.200.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slmail.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b="Bg1LgeZO"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1726855717;
	cv=none; b=mTDWA0Cfmp2ShTy7fqONUR3oCCv65ypPnP9Qlsx6gftQ9Ifzi9cYw2P5lO8aP+cGianwGNw26Jqe6MXxjT0e14yLtyDvynh8/avAsyUTQPzYbSVmwnaKFEWuFg1/Yp9HlS9VW48xXf9xeOuwmp7DiAWmYwg1sc/J+I5oCZ4if+xLp/4+jD6fgz1XYcYUzjjiqwz8B8woJLAwFQ2ikpiA7qrYfpEjqdpmxhbk2z4PMlBRNO5c6uhPKdesT56wE+B2+WsGkNplVx4LxdUZ/DjDaHLIYlc2yzlULFP+e5S+5l0ShubpDGYMxL/KrAE5UuXadl4BvKk0iLeSs+hjjc/TSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1726855717; c=relaxed/simple;
	bh=B5pOlndi3RuI3xGjE6b+5lqmdBpSz1RiXSjQKNqiSno=;
	h=Date:Subject:In-Reply-To:From:To:References; b=Rs+6bqYwwwSmnmwJgbrEH1sFd6aX37OsRHinHf6Ew2d8sFE+yb0DQ9QeBhqXlmdf4lUzOYApUDMBZMTOpCf15R8wDnK9mH3A/+tygL420EItEOraVCNu0U3GeQju2tDKVm5WUNDQRP+rmzxVruCbttVK/Pbgk/CMLbwI+VB/x2F6c7IW7isctlmp56u374mCktXjASgREx9fTIj31U/jJfGfcQxI1TyLc5yBOfzW4BF+jyqBycgc6QocgUbEDE8Us56TnArtk0XMO7cobU+AS1QiSDao4mrhTdjredACN0/Elix1ta/FiRszDJMNrNmqQNPXhdmHmm+lWCO+vROMRA==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=slmail.me; s=dkim;
	t=1726855717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5pOlndi3RuI3xGjE6b+5lqmdBpSz1RiXSjQKNqiSno=;
	b=Bg1LgeZO1VE71td8tVxcQbj5D6tUM3nDaapyXnrTXg/YaNJMjuLNo+EunS4IPXU4eYeTzc
	/4iipLPGhaEIG46CCgLS5FoIAD1zHy/THYPHsHm0sLRfMJvDdN7B+AD37bOJgAqgy71qD9
	j3+yN3+uKsT+1JRxh24RPlUtiqIgaW8=
Date: Fri, 20 Sep 2024 18:08:31 +0000
Subject: Re: btrfs error creating fs with LUKS
In-Reply-To: <172684422662.7.5260904263367445600.439741447@slmail.me>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: iam.frightful278@slmail.me
To: cryptsetup development <cryptsetup@lists.linux.dev>
Message-ID: <172685571743.6.7587277047454921859.439954689@slmail.me>
References: <172684422662.7.5260904263367445600.439741447@slmail.me>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 439954689
X-SimpleLogin-Want-Signing: yes

solved the issue. no need to reply thanks. got support in linux group im in=
.




Sent with Proton Mail secure email.

On Friday, September 20th, 2024 at 2:57 PM, iam.frightful278@slmail.me <iam=
.frightful278@slmail.me> wrote:

> hi,
> i've been following this tutorial (tried few others in past, but found th=
is the best)... just learning the steps needed to encrypt my drives. and ha=
ve been advised to encrypt my drives using btrfs. as only want/need to use =
with linux... afaics, it's the best option for me. for encrypting large dri=
ves 1-2TB (will use for 32gb usb too).
>=20
> so, here's the link to website i've used (but also referred to few others=
, none clearing up query):
>=20
> https://www.linuxfordevices.com/tutorials/linux/encrypting-partitions-wit=
h-luks
>=20
> this is the command causing issue:
>=20
> sudo mkfs.exfat /dev/mapper/map_point -n volume_name
>=20
> (i've changed it to suit me, to:
> sudo mkfs.btrfs /dev/mapper/31gb_Tosh_1 -n toshiba)
>=20
> tried few variations, even without the flag.
>=20
> will attach screenshot with error msg.
>=20
> i expect the flag is wrong. or i need to change the command to suit btrfs=
.
>=20
> any tips appreciated. thanks.
> phil
>=20
>=20
> Sent with Proton Mail secure email.

