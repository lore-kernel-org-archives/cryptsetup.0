Received: from mail-200165.simplelogin.co (mail-200165.simplelogin.co [176.119.200.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6351A255C
	for <cryptsetup@lists.linux.dev>; Thu, 29 Aug 2024 15:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945818; cv=pass; b=fO8wrn6mkT3Q1XM8gNPwM3G2nT4SDBGmgFRXX7r/aRT7H3CkSBiFBZImfnxyB01/0qrUFewXwKgQWNIql4c5XQWWZDTGSsBclY79Wjm97ywkMziHAFXy2dIl0kS+knNsSo1EIOy3eDK5nQ1evKxdJ9Qs5De2leHIsM+x4vcnKag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945818; c=relaxed/simple;
	bh=/075eR0hAQeGTnN2Pd94ujk+s9a2GocWyQPJ9h7udj0=;
	h=Date:Subject:MIME-Version:Content-Type:From:To:Message-ID; b=iQ/4xmT8nhkqCmkdUx4KhPrGQ2TOmK9K3pC4Ar92opgizFkb6BYMjMOA6Mw/n9Txc71EfHa0WuZ6++P4ZkF1Bn8ugTL4M8O7kAgxMI2cricgxKsARmGkQOynuQJA5zkt9dAWFvTUfuDGz/ybXqWmeTNAjBBWe1TStsGOs+CNVQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me; spf=pass smtp.mailfrom=slmail.me; dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b=DBcy/i1f; arc=pass smtp.client-ip=176.119.200.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slmail.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b="DBcy/i1f"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1724945814;
	cv=none; b=NCwmzLABF88ckzX1bvZAfYnTcd1Fp/klVQ//q1EycIY0wnS1uuEhELzZJt4v5qWcUH6mAGTFwAS7fyKn+K9nrajHUYB1cKcAtXcZQBl0mq42HcvBsoViMtpSf2zIrm72pXUufVypyzPhQOEWhof6soVJrPGiJbyfh/Bs1JZYGoy4gcXvAb0dNW7eW+LislhlvC3dHHiVneM3j6s+2TdgzVS/LbhmksC57VFbs/i1nEzexY+v1CvVGLp2vUrTHH6gZlOxV5kyH0Ry8J+QK+42A2fREneioD+urAUK9xfZYCpjSjhIr4lfkjsPRpih5GYCOiCFnR1VkcGduF7OuXFsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1724945814; c=relaxed/simple;
	bh=/075eR0hAQeGTnN2Pd94ujk+s9a2GocWyQPJ9h7udj0=;
	h=Date:Subject:From:To; b=FgW3L8UXmvJifVk5sn9myy3mMJVnMJLYi8FzXBI2sRnS2fBRqXGs3ESGApMF8QdHnscfiMdYAyi6ldQFAAjNLOtsZSVgDupaGAl/uZqnfijwQYF8QOCW8eRFrAv0nC5peavlYppqbQdYMobhuuysv26FGdpC5sG1ly5Gn4pCjp1r3YcwS271xV93gXGxHkj415IynT6fYvTnIjGfX+Wyh33FRW0bdYzTGrSe0NBgbpfuiEepbj7aQWy649rAq94+7/CG/wQ9+LhtblhXYxIk0ZEn/PhfXJHn93/chSi3StTIdMKVtB12fetJ1Cus2X3rg+3XFy0Jb0T8lBKL0MwiIg==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=slmail.me; s=dkim;
	t=1724945814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/075eR0hAQeGTnN2Pd94ujk+s9a2GocWyQPJ9h7udj0=;
	b=DBcy/i1f4sjDds0iANf6L0Jrqm/S8DK5qTJZaHY7jhzJHEa5RK8xPaNvuyvPV/lLCtnYvS
	ZrWoQQ3EbirVqZ8hr8+51cUiW6jLG1huWzeVJ+YC39OCGUHW3N8mPEOMasFQ0sc9UofjEU
	UI5lCmN3ogTJpSkrzGFLxUZaQGcKfr8=
Date: Thu, 29 Aug 2024 15:36:49 +0000
Subject: few LUKS queries
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: iam.frightful278@slmail.me
To: cryptsetup@lists.linux.dev
Message-ID: <172494581448.7.10646676381703885267.419037020@slmail.me>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 419037020
X-SimpleLogin-Want-Signing: yes

hi,
i've recently decided to ditch 'luckyLUKS' gui, and get more up to speed on=
 linux filesystem, and get more comfortable with the mounting/unmounting pr=
ocess... so, i recently encrypted one USB drive using LUKS, using a few wal=
kthrough's online...=20
> but i wonder if there are any clear, present tutorials walking through th=
e process... as i'm now seeing the LUKS2 is used on a few other tutorials, =
so wanted to make sure i am approaching this task as best i can.=20

basically. i'd love to encrypt a few small usb drives. then when comfortabl=
e with that, will move onto my 2 larger ssd and hdd drives (1tb and 1.5tb i=
n size)... and maybe encrypt my linux home folder, if all goes well..=20
> i assume LUKS will be able to encrypt my large ext drives?=20

> i wonder if there is a way to edit/change any of the folders i created wh=
en encrypting the usb drive? the device name, container as well as mount po=
int? or are they set in stone? (not big deal, just thought to check)

> lastly, im curious as to the best file system to use for this process? be=
en exploring a bit my options. im fine only using my ext drives on my linux=
, so i imagine exFAT or ext4 are recommended? will do one usb drive with FA=
T32 to be used on other computers.=20

thanks so much. sorry about all the questions. just thought to put them all=
 together. hope thats ok.=20
phil




Sent with Proton Mail secure email.

