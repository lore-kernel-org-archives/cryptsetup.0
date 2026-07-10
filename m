Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1029F35E1D8
	for <cryptsetup@lists.linux.dev>; Fri, 10 Jul 2026 17:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783704161; cv=none; b=BbZNt0hNlQ+a9wg2brrPIf//erus8OrqAnNCXpJotrAvgiyTaNXwNdOxYHKB7XuVU8vDTc1XV5UP5jKfrEDd1PVngB6hjGzTMIknkRaRjsSkxuxeo8J3f+1aqmBeH2F51BTl6OnF4ysbali4eAgrYw0HClGdrFxAlGFP+kHVkXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783704161; c=relaxed/simple;
	bh=sZKBR8RumsDdLRl87y/dsG0/Ay95icEOW048qF3+8nY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=i3cOqWIPsseYymv3DDheq+kGt8RcVJ8VxiCduPXKdz6aos6+W1s6rimpBG/WwDmtIXpm2sVN/yF3ZQSDuoXdNcXTsDAmOktgCyV6vXLqCDtqJhsbJPmPDT6Jc5vc2pIIYbLFpkcSGfRslzlxq/SQvexjEQiisf4NHpDyAPahikE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=evolvis.org; spf=pass smtp.mailfrom=evolvis.org; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=evolvis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=evolvis.org
Received: from x61p.mirbsd.org (p5b2babb5.dip0.t-ipconnect.de [91.43.171.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id 07B2C1001D2
	for <cryptsetup@lists.linux.dev>; Fri, 10 Jul 2026 17:14:56 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id 6B320142715; Fri, 10 Jul 2026 19:14:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id 66050140129
	for <cryptsetup@lists.linux.dev>; Fri, 10 Jul 2026 19:14:55 +0200 (CEST)
Date: Fri, 10 Jul 2026 19:14:55 +0200 (CEST)
From: Thorsten Glaser <tg@evolvis.org>
To: cryptsetup@lists.linux.dev
Subject: 4K sector size, cryptswap, with/-out dm-integrity?
Message-ID: <91244f91-7fdd-780f-8860-dfa7e784b7dc@evolvis.org>
x-ms-reactions: disallow
Content-Language: ksh-Latn-DE-u-ca-iso8601-co-POSIX-kk-false-em-text-rg-denw-tz-utc-va-posix, de-DE-1901-u-ca-iso8601-co-POSIX-kk-false-em-text-rg-denw-tz-utc-va-posix, de-Latf-DE-1901-u-ca-iso8601-co-POSIX-kk-false-em-text-rg-denw-tz-utc-va-posix, en-GB-u-ca-iso8601-fw-mon-hc-h23-co-POSIX-kk-false-cu-eur-em-text-rg-denw-ms-metric-mu-celsius-tz-utc-va-posix, und-Zsym-u-ca-iso8601-fw-mon-hc-h23-co-POSIX-kk-false-cu-eur-em-text-rg-denw-ms-metric-mu-celsius-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi,

I=E2=80=99ve been looking a bit at how 4K sector sizes are passed
through the stack today, and I=E2=80=99m wondering a bit about
things the docs don=E2=80=99t have sufficiently deep details for.

AIUI, and please correct me if I=E2=80=99m wrong anywhere:

First, the easy(?) cases:

- HDD with 512 bytes underlying sector size =E2=87=92 4K sectors never ok
- SSD with 512 bytes logical sector size and no 4K listed in
  the =E2=80=9Csmartctl -c /dev/nvme0n1=E2=80=9D / =E2=80=9Cnvme id-ns -H /=
dev/nvme0n1=E2=80=9D
  output =E2=87=92 4K sectors likely not ok?

- HDD/SSD with 4K logical sectors =E2=87=92 4K sectors ok

The documentation also says that this should be:

- dm-integrity device with --sector-size 4096 in journalled mode =E2=87=92 =
ok
  - does this even differ between underlying 512/512, 512/4K, 4K/4K devices=
?
- same but in D (direct) mode =E2=87=92 not ok unless underlying device is
  - 4K/4K?
  - 512/4K or 4K/4K (see below)?
- same but in B (bitmap) mode =E2=87=92 ?
- same but in I (inline) mode =E2=87=92 only ok if the underlying device ma=
tches?
- R (recovery) mode is special anyway

Then, there=E2=80=99s this one:

- HDD with 512b logical and 4K physical sectors according to
  =E2=80=9Chdparm -I=E2=80=9D/=E2=80=9Csmartctl -i=E2=80=9D =E2=87=92 that =
ok?

And the thing I=E2=80=99ve really been wondering about is:

at the moment, I use encrypted swap like this (crypttab):

# <target name> <source device>         <key file>      <options>
cswp1           /dev/=E2=80=A6=E2=80=A6=E2=80=A6                /dev/urando=
m    discard,cipher=3Daes-xts-plain64,size=3D512,plain,swap

Is it possible to add =E2=80=9C,sector-size=3D4096=E2=80=9D to that line an=
d
will it help (encrypting 4K in one go is faster than eight
times 512b after all)? Does the kernel swapping subsystem
work with that? (On amd64, so my page size is 4096, though
since 4K pages on 512b devices works, 16K/64K pages on 4K
devices will likely also work for things like MIPS, ARM=E2=80=A6)

If so, under the same circumstances as above? (Either 4K logical
device (which I seem to not have) or 4K integritysetup with journal
(also on 512/4K or 512/512 devices?) or MAYBE 512/4K devices?)

I=E2=80=99ve been putting integritysetup with 4K sectors and journal
under my RAID-1+LUKS recently already anyway, even if performance
is=E2=80=A6 lacking. But I should stick to J (journal) mode with this, no?

Thanks,
//mirabilos
--=20
=E2=80=9ECool, /usr/share/doc/mksh/examples/uhr.gz ist ja ein Grund,
mksh auf jedem System zu installieren.=E2=80=9C
=09-- XTaran auf der OpenRheinRuhr, ganz begeistert
(EN: =E2=80=9C[=E2=80=A6]uhr.gz is a reason to install mksh on every system=
=2E=E2=80=9D)
