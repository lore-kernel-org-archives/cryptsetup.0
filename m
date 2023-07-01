Received: from mail-200165.simplelogin.co (mail-200165.simplelogin.co [176.119.200.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06F9D2EC
	for <cryptsetup@lists.linux.dev>; Sat,  1 Jul 2023 17:14:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1688231234;
	cv=none; b=OFwmExRRwGVfZ2oItZvnzAt6ngDPA8dqlgz/D9eEc42XvbMwRya5fcRuoB5sR/Wt2Z1jjjcCfION5xJraTho5FyY8FSK43jb9YtXbaoWopwj0sqEPr9VrbRw0afod1mqy1kCM1TtnD5adzFSPdVW6YrPA2md1f5ZLNIL7JCLQQqwWLoI/Kpsq86ygYSGdHNsXGIhxLW4HDXMCwVzWQMH8bY8EmmHzjRSC6UY908T2svE9lx6gJIUlxeYEGqoV9xxo0Czz0G+quq3PjooMzo9ZfigpPI53uoONxONiUZEtXmk9ovZ0qJdgaAnQrPE9MEEaAk8h6Y1yymIeRloMKa6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1688231234; c=relaxed/simple;
	bh=n7TCqciIhRrN+4PtOLOKE/A529BksDVeWFxWZTttXTI=;
	h=DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:To:Message-ID:References:
	 X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing; b=2BtB9WUNm1DLWLCK5jWwkR9XhAjWuF+v6evhzAmgyqlz7GFZLFYlS4gFuF02df5csK7FBMEFzWbgHxFOjcgcnX+l2gJYNH8dYCTGiOjqXTE7Tc9e1MGIJucOe4ZhA3tMbRegiOV0u5BbBepKe8+j3ECmQ+lcnW5XDsU3HpNunkANe0ZMOgUGzB0nbPKMUFU1vMQSyYRwtNUDh4D0vs0TOzib1wv4z9tFr49omP/qharYpiKhzMTqaWWvHX0HO4hE+TOcXKvnCMDFyDJvp41Gg+izuT7jAfCRaUHdk9i6o3TcFospHSwBzq8+3h8x9YmIlS5jAsIXGOmgqZcKlKpFDg==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aleeas.com; s=dkim;
	t=1688231233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7TCqciIhRrN+4PtOLOKE/A529BksDVeWFxWZTttXTI=;
	b=ds61COUoq6BbUVTn6ybSijaV1jNdv3IFaVuEFoELWp9fgHcZPREkKcAlvvCUF5iPPAoo46
	7uJ7Z3h4c4bdSKoxS35LtNN8Z6H9tzs7QELGbQ6HhO0XPMMFsoaH4UBCWlb0kNapOte6jj
	RmeWm7Tw1RpMhbO1M3x8i+oBMvVdqug=
Date: Sat, 01 Jul 2023 17:06:58 +0000
Subject: Re: Problem after detaching the header
In-Reply-To: <baaf0d13-97a2-8846-ca4f-8f89d96ef499@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Darek Hisc <darek.hisc@aleeas.com>
To: cryptsetup@lists.linux.dev
Message-ID: <168823123339.9.10246224821676034944.147890655@aleeas.com>
References: <168806625127.6.2008140751957055524.147127853@aleeas.com>
 <baaf0d13-97a2-8846-ca4f-8f89d96ef499@gmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 147890655
X-SimpleLogin-Want-Signing: yes


> - luksErase will destroy keyslots (key material)
Does it also destroy the Master Key?

> but still keeps LUKS header on the device, including UUID (so you can ref=
erence the device through UUID
> even if it cannot be unlocked without detached header)
From the comments I've received here https://unix.stackexchange.com/questio=
ns/750288/properly-detach-the-luks-header-from-the-existing-fdelvm-encrypti=
on it also appears that the missing UUID is to blame after destroying the e=
ntire header.

> Check that UUID is not referenced in config.
How to check?

> But as Arno said, this is really question for your distro (note that cryp=
tab
> file can be managed by systemd, but there are also non-systemd versions).
If it's not a cryptsetup problem, it probably affects many (or all) distrib=
utions. I suggest to add the relevant information to FAQ 2.20 because the c=
urrent wording suggests that the given procedure is sufficient and it is no=
t (because it causes a UUID problem that needs to be solved somehow)

> Also without console log it is not clear what exactly fails.
Please tell me what to enter in the initramfs console to check it and I wil=
l give you the result

Another solution that looks very interesting:
In a comment on stackexchange, someone suggested creating a dummy header in=
stead of the original one, but using a detached one. Do you see any potenti=
al problems and is this a good idea?


