Received: from mega.nu (unknown [108.65.49.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B120B111A8
	for <cryptsetup@lists.linux.dev>; Fri, 26 Apr 2024 19:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.65.49.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714160120; cv=none; b=jgldRO0pI3BzzC9LIgLu+zpfnO0nipdnzEVSnNqECWu2xCONDSlN7cbMrHrvqkvo1pbkFxePJ5lZouKDggjr2F43KAdUirgcJ5m9sOphnSgzhKuCo3DLhb17Pgd/juXSjgcajkc3XFUacOlQG0wrGujYiV1Drcqbtr4Iii5wy3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714160120; c=relaxed/simple;
	bh=93xqvKkOIw5l51i9LX+QeYy4PUDWLw0BSL8Q3ve4uTI=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=PCVQAO+TLPSMXJCiBCBmYSjAtofD0wOBbSMcDU4PfL2OY1UL1dUuEufjJ9DLJIFCb03qkzid0h+jY+DDwglbO3qgcnE8XEzWo+bV0GcA8JpPpR/RhXs27Fa2Zq7Cv2dRaq6cOW9RnwaCeGG0w0wiNOgI8C6LdaOCQNKptc7Vodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mega.nu; spf=pass smtp.mailfrom=mega.nu; dkim=pass (1024-bit key) header.d=mega.nu header.i=@mega.nu header.b=jqTfwHm+; arc=none smtp.client-ip=108.65.49.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mega.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mega.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mega.nu header.i=@mega.nu header.b="jqTfwHm+"
Received-SPF: pass (mega.nu: authenticated connection)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mega.nu; s=20180922;
	t=1714160115; bh=Fxic8w+YP10+bDmd0Mujw36w3xVD5PzWFE9FDw9+Zcw=;
	h=Subject:From:To:Date:Content-Type:Subject:Reply-To:In-reply-to:
	 References:Content-type;
	b=jqTfwHm+K+wcEhakx1gf3y/3oFKOk1yBb+CEbWlUqT6SCv1U7igB3p3s4KVIQQUuK
	 qhaS3ZkMCX4KxeOoIpRvoUzTylYrUtg1wKjYXA63H0ahi1lj8RfDbGPuIutd+gMiYV
	 3X42CnUu/TF5KiKY+XFBl/pchNBaheqiQwK5zVDU=
X-Authenticated-User: douzzer.mobile to mega.nu using PLAIN
Received: from douzzer.mobile (localhost [127.0.0.1])
	by mega.nu:587 (8.17.2/8.16.0.41) with ESMTPSA id 43QJZFQv036969
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 26 Apr 2024 19:35:15 GMT
	(envelope-from douzzer@mega.nu)
Message-ID: <10e060de0431f88edeaf7fa395965c1763a6b749.camel@mega.nu>
Subject: mkfs on luks USB flash drive blocks forever with "reset SuperSpeed
 USB device" (kernel 6.7.9)
From: Daniel Pouzzner <douzzer@mega.nu>
To: cryptsetup@lists.linux.dev
Date: Fri, 26 Apr 2024 14:35:15 -0500
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

I originally opened a ticket for this on the Gentoo bug board
(https://bugs.gentoo.org/930464) but that isn't really the right venue for =
it. =20

I'm finding that on kernel 6.7.9, with a freshly created and opened luks
partition, mkfs goes into D wait, with "reset SuperSpeed USB device number =
#
using xhci_hcd" repeating every 30 seconds on each device.

The behavior occurs with either mkfs.btrfs (with or without btrfs RAID1) or
mkfs.ext4 (no RAID), and with either luks1 or luks2.

This is new behavior.  I've used the same procedure, same hardware, and
same/similar media, dozens of times before (most recently on kernel 6.4.3)
without seeing this.

The hardware itself is a pair of Kingston FCR-HS4 flash readers, and the
behavior occurs on both.  The media are 512GB microSDXC.  I've tried it wit=
h
fresh new Lexar and Sandisk media, both of them SKUs that have worked befor=
e.=20
Same bad result.

If I run mkfs.btrfs directly on the GPT partition, that succeeds.

If I luksOpen and mount previously formatted and mkfs.btrfs'd media, and ac=
cess
it extensively for an incremental backup run, that succeeds.

So what is specifically failing is mkfs on a luks partition.

The kernel log provides no real information, just entries like this:

[Mon Apr 22 18:08:59 2024] usb 2-2.3: reset SuperSpeed USB device number 12
using xhci_hcd
[Mon Apr 22 18:09:04 2024] usb 4-3: reset SuperSpeed USB device number 10 u=
sing
xhci_hcd

When the problem first occured, I discovered I was able to free up the stuc=
k
mkfs process by pulling the cords on the Kingston readers, and then free up=
 the
luks contexts with "cryptsetup close".

Using an older system running kernel 5.4, but with the same flash readers a=
nd
media, mkfs.btrfs succeeded immediately.  When I returned the readers to th=
e
original system, the new filesystem mounted without delay or errors.

A quick look through the applicable Gentoo kernel patchsets didn't turn up
anything obvious, and the problem wasn't there in January on kernel 6.4.3.=
=20
Also, a diff of my configs for the 6.4.3 and 6.7.9 kernels didn't turn up
anything obviously related.

Another data point: I ran a btrfs send/receive pipeline, writing to the
filesystem that I mkfs'd from the old kernel 5.4 installation.  It complete=
d
successfully, 300GB transferred, with no kernel messages, and certainly no
resets.  A post-transfer scrub found and repaired a few sector errors on on=
e of
the two devices, which is just par for the course on microSDXC.

So the problem seems to be very specific to mkfs over dm-crypt on this kern=
el.=20
I'm not currently able to bisect the problem, so I don't yet know if it's s=
till
present in kernels 6.8 and 6.9-RC.

