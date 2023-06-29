Received: from mail-200166.simplelogin.co (mail-200166.simplelogin.co [176.119.200.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E426514298
	for <cryptsetup@lists.linux.dev>; Thu, 29 Jun 2023 19:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1688066251;
	cv=none; b=UJ22n07DpFT3HIP9MhuwrwhbvsBquVJtqLhVIzX39IbqhK0pNvGb2Q6GDZkqRZtwh/RQzdakUADrrOXIgZGv3hccuRHXRVghri48StDNxWNTeKLSUCWre9y5cD0Hs1YYOIVJYW2QibXHVte1o5whyz4RMDOnl/2UxorYSFuhOLGsi9wmxYDciZL70Us4/DLLNuVVaTRcjCOp98s9dAzCLGoTBwl+XJyxc6vayJugKL6tcvl3+ohk6Tv2QeA+6wtqu4jG6SbOl1Pc6ywJRzZiJlR6kWZX8wHoWcUxQucKgGmoDe25Z9CaZEnaasEdFZVhJM3EjIvYh3NOSBnGI4PMQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1688066251; c=relaxed/simple;
	bh=dC8zBXT8jfAl/PIWbfO6s3W9tUbuMc2FPtueQ6jNRUY=;
	h=DKIM-Signature:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:To:Message-ID:X-SimpleLogin-Type:
	 X-SimpleLogin-EmailLog-ID:X-SimpleLogin-Want-Signing; b=vUXwVpJT3n66LjYm0IEumtf6CpKmx/CJdZPMguukK63NIhrZgFT/iabcMdETX9Seftp9QrsNWBkFf5XHhGPLBN3JCzSR9nFxvoMMGGKu17Ip2nCrTu4hp9nvj7YkucYNuyw3OPTx9wRB6Ul3huhqlvHuRsG9i10sqeTYHnZhvn+bYAoG/jRR2o3GlDM2V9mVsQwNc49SwTimXqYAIU5ZnJsk7mi3q2MMT+PIcRqDnB03iUt0cuEMelzl/Bu2G+c53p2LQGweHj7HejWYsxcjnSj938FZshUDlAz+nspBWd4aVgSkYIvZmDVWpNEmDRVVfriM1iNpFVxQGB6wzYc/6Q==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aleeas.com; s=dkim;
	t=1688066251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dC8zBXT8jfAl/PIWbfO6s3W9tUbuMc2FPtueQ6jNRUY=;
	b=FSJH0+Gm81TjwDFANIzOXM9Wq1aeFDTQUHbqPciNeBJepJUjm7b2w+6a2VQibxBzLIHX46
	8WFa/Hmwmst79ZphIrp+tZdRy/uvO7tEcJpRfwbq5DehMc8/XcFRR3res5FK5iArri8p5M
	lyP2R2effbT1iJwplxvPtJz2NkZsJbg=
Date: Thu, 29 Jun 2023 19:17:14 +0000
Subject: Problem after detaching the header
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
Message-ID: <168806625127.6.2008140751957055524.147127853@aleeas.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 147127853
X-SimpleLogin-Want-Signing: yes

Hi

I am trying to move my current included header from sda2 to a separate raw =
(no file system) partition of device sdb1, but after removing the original =
header the system does not start and stops at the initramfs console.

OS: LMDE 5 (Linux Mint Debian Edition =3D de facto Debian 11)
Standard LVM installation on LUKS2

I did the following steps:
1. cryptsetup luksHeaderBackup /dev/sda2 --header-backup-file /header.img
2. dd if=3D/header.img of=3D/dev/sdb1
3. option luks,discard,tries=3D3,header=3D/dev/sdb1 > /etc/crypttab
4. update-initramfs -u -k all
5. cryptsetup luksErase /dev/sda2

Up to this point, everything works fine and the system boots up properly
When, according to the instructions in the https://gitlab.com/cryptsetup/cr=
yptsetup/-/blob/main/FAQ.md I do:
6. cryptsetup luksDump /dev/sdb1 > Data segments: offfset: 16777216 bytes
7. dd bs=3D512 count=3D32768 if=3D/dev/zero of=3D/dev/sda2
the system no longer starts.

Have I screwed something up or am I missing a step?
Please help!

Darek


