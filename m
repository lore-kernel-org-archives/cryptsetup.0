Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DC87F7EA
	for <cryptsetup@lists.linux.dev>; Wed, 21 Feb 2024 17:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708536143; cv=none; b=rLQGPoovUgKrQCcEFfCK3REQHKQ4gn00+9ZUxPLunxOsviH1gE1NPYlHwvi/SYVfz9Ft0qVi7ZYdLEgNBsKbKHTqnBLu8YGNjgREWnWwssG2FOWkWp0bGwG28jADlT8datkTbRvLYwu+yrco10tQvvWacVzCxr+FPbQcKf9c69g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708536143; c=relaxed/simple;
	bh=+CJBeFS1ET127T16pDoU9sqByHyMutDP19PZqsvuX5U=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=C/yQGtYWFE/UGXoyxqx/fj5uwl979qvO84Co9L9THwxul2KQZ1nqS2bn97mjrP7gsN4LlDY18OmvQYmPOtpE1SlaFBVOB2lnAWcajcqS7P3cHaIYYU3rmVx5/LrGrHbqCN3T4Meenk4N3IUT2g7fvP+KVWkTQvn+0YJrz+uYWw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.co.uk; spf=pass smtp.mailfrom=gmx.co.uk; dkim=pass (2048-bit key) header.d=gmx.co.uk header.i=xanda@gmx.co.uk header.b=evLGBfOf; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.co.uk header.i=xanda@gmx.co.uk header.b="evLGBfOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.co.uk;
	s=s31663417; t=1708536139; x=1709140939; i=xanda@gmx.co.uk;
	bh=+CJBeFS1ET127T16pDoU9sqByHyMutDP19PZqsvuX5U=;
	h=X-UI-Sender-Class:Date:To:From:Subject;
	b=evLGBfOfBQo3+9q+YpQQEKlLFCdp552HhZhvLAHZE0x3SxeCNcJZ6x5cNEnu8wi7
	 JijNvd1k1do1M8q8/JzfBQnprdV434q+1CXiv2rsP0h3qXmpfSnaa9CK1YLtBJIqn
	 ldxBZvPwkfYJoJpW9uAHpSSN7HNO0SGDQUzoAwAsvkFyIxDRtK55a0lx3SGJV6h8C
	 SbdYYkDSsp3NzOMVmWJrQ8d/pQnAGDPKvhRtpufAGVVki+stmX5Qi3OX6X4dAAzCo
	 wMlhDqmWBaoV8caIbF+cleffACCezq2ZFCdCIQmYV3SXOJY4l9xAAwfjnkeEJdZ9k
	 1EZJWE/IMTk/nk5W5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.126] ([86.153.48.2]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MpUUw-1r9FBe3njg-00pvCQ for
 <cryptsetup@lists.linux.dev>; Wed, 21 Feb 2024 18:22:18 +0100
Message-ID: <cd29a952-c9ce-4aa0-8903-a79c325824f0@gmx.co.uk>
Date: Wed, 21 Feb 2024 17:22:18 +0000
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: cryptsetup@lists.linux.dev
Content-Language: en-GB
From: xndr <xanda@gmx.co.uk>
Subject: How to resume decryption on LUKS1 in-place
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1R4W2n3MusgG25dlYuQLVz825i+OWGTi7YDULKHZoAEGKwh2dD0
 QdmByJ/FeO9F0SsQ5BuW1/D4BsAo/zybjwUHn9Ve12z60FwsTUMzOgrNUWlAmVLSyhF++A8
 uhlIZ/GWYF4n9hLRblNvAqQhw2VEqhLYB/kF5q0B9HTJnkC9dRBk4mexD7pYCGqAZGWsS9T
 qw8KqQdYdMkPw6zkHGU6g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Efx1alnAWzI=;5y0k0D1HcHabL0PKLBmmNz7Tb/D
 RK01uvmG5KqVwVbr7FDggU0RW5SN5p2qw7S/Z9mra1j+Y18x2lMYslRWaGl4ykltARXkDD0su
 WjNL+KmXFvZLskWrZe29VuKexSSSBY/t9NB3dwyzADFVgLrfQPxVF6T7JnlZMebSgqL03BDEa
 L0i0higjPL+aETueXkYtcgT8jNs0mN76kN0/hSUtjhQYOrPhrlCqwv9uBXsGCpMEnmSLTrApZ
 4w99STh3PmtwGmzoglbvGedoKHjRCTNGGKKP5xPdAkYnJby4KDk8+OmXboGuCgS8PtFHf+gzE
 0Gn3e3l1OkzxxvVvwJvDSMtPwf8B9pu8KQqP7WO4fKD+IRwoJcEx96yighIv8X8ThrQ7Hozm9
 cfFJidfM8xtwH5YA8LYhcklLVKJgtcJ86UuEEayHZ3chfdHjg0IzRTulkwUAY4xSJPsc4YlbO
 hjtYc3hXiCcGvZm4T3Beu0tGaKmV7n0kCGxF30W4n6VwGORbTHqjcPtc+PTTGTxoEKcmWCfOs
 akKCNkkBbW+oO+Ubw6vUvR3V5U629c52t87ncrmcfzRRrwOuHip87ITc7Lz/jkf45sArqtbcB
 9REui9QWTP1uEE9JBAnA9aw3N+hDuGfw1nnZGqu4dbPEmXK0Rih1W4X5L0XrpuRgDexGw7i7b
 vkZa3ylsSh5G5hEBjDIurZSe8gWYgjCROVWw8rwwzrcIvzPLCC3rsD/BTpqM78uRNHoPQQnew
 BPEpo3hiYvhWyK8GxGYFCTk80f39wXEOVNiOIy6Ckw46sLkBqAopx+1haKyf2vrOCss445vI0
 /s2jcZLx/Y2WACN+QJQYa6Zd8TEccw3M3mEWf43MWm/Rc=

Hello 1&All,

Please help us complete an in-place=C2=A0decryption of=C2=A0a LUKS1 device=
:-

We followed the steps here on the Arch Linux wiki by converting from
LUKS2 to LUKS1:-

https://wiki.archlinux.org/title/Removing_system_encryption#Decrypting_LUK=
S2_devices_in-place

Unfortunately the=C2=A0device suffered an IO error at about 85% after issu=
ing
the final command:-

cryptsetup-reencrypt --decrypt /dev/sda3

 From the man pages it might seem that the process can be resumed by
using the command:-

cryptsetup reencrypt --resume-only --header
luks2-hdr-file=C2=A0/dev/encrypted_device

However it seems qualified by being a=C2=A0LUKS2 only facility. Should thi=
s
command still work on LUKS1 or is the process (if there's one at all)
different.

Available are copies of the headers (LUKS 1 & 2) in text and binary form
and what appears to be a log generated during decryption.

Any counsel greatly appreciated - thank you.

