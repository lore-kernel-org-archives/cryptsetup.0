Received: from mail-200167.simplelogin.co (mail-200167.simplelogin.co [176.119.200.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F256AA5
	for <cryptsetup@lists.linux.dev>; Tue,  4 Jul 2023 16:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1688489908;
	cv=none; b=wYu8iW6OTR5uBGowzhC+3noMa+ac7mwnNEjGJigVj5VLrbqiHWFmlMRnRrn+B2oxaO5GEarCF0Hst7zXL49sJk5kaGFoR1JSY3MkpZnd/hZS2TU1g5ThSgWg60kRsPaV0rrnIRh3sSnrx+CMP/NI57sF7TbDkKOIALBFOzcqaaRzA8uPN9Phh95CooTX0rR2YWnLqa5JS7kq5aFTZ23T537E7MqCnH68PagJDc0i8hAVh4cAHLaCUWoIRSx6SyhCDsTu+IaAOwVJZzIFY+8oycnzfsW5KikorGqoEtKaveNdmuP8sYyqCPsPhNwk2QjgVcHxGYQKTJgIKxmPcxPepA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1688489908; c=relaxed/simple;
	bh=RiUUZEmUgsitlCjffqJVZ1HG0Az0s8jLTLtzRaAnLqE=;
	h=DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:To:Message-ID:References:
	 X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing; b=QoYAoFb9iPRU5oISe9rruZTlzb2tmzojMx78AR7JWnmfTWXlh6/wnEgxk/vg+Dhp+Z6Ld8DuOdZGWh4UhsKAvTqVUNxBoNBtEW/bg7imhMNPjhEEAUCDbgQKO4nRgm8alDyIvoyiJBTf0RTQRJnV3pmjzWnMcC1TXzaikce48tHeLOgDKAe6WZOAsr5MBD5JZW0vsM03ji/6Qd5paFjE3EHgNnL3KTGB/PgfEp8VU8/tyLZ7cy56rlkZx1BT1vnyzX9YEc7GDw3sJ4Czz3LX6lXTO5sLB7BM/1gC8DXtQh2m2hk3m9J9kFXfS8Jn5hojmCI4qVRHj4H1VzdPNg/8Ug==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aleeas.com; s=dkim;
	t=1688489907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RiUUZEmUgsitlCjffqJVZ1HG0Az0s8jLTLtzRaAnLqE=;
	b=XC+oYl/aBImJagcBRY0g2CWnZrYWz22hCSn55WYD2ZXnbaQp03LcnzPHBCJW+Xakr0TU6e
	6mijnK8UAqx/RKcnuX06bhN3m5d1YWUfwFTDjKKJ3rlGA3prWj8tDGnR1BM5dp8zcEAkaS
	GO0+Bfhj2h901JCPYdWXHkZNTD0HBb8=
Date: Tue, 04 Jul 2023 16:58:18 +0000
Subject: Re: Problem after detaching the header
In-Reply-To: <7424eaa5-ea88-d746-9bc6-e8b04cc48769@gmail.com>
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
Message-ID: <168848990761.7.1383748857203841111.148913502@aleeas.com>
References: <168806625127.6.2008140751957055524.147127853@aleeas.com>
 <baaf0d13-97a2-8846-ca4f-8f89d96ef499@gmail.com>
 <168823123339.9.10246224821676034944.147890655@aleeas.com>
 <7424eaa5-ea88-d746-9bc6-e8b04cc48769@gmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 148913502
X-SimpleLogin-Want-Signing: yes


> > Another solution that looks very interesting:
> > In a comment on stackexchange, someone suggested creating a dummy heade=
r instead of the original one, but using a detached one. Do you see any pot=
ential problems and is this a good idea?
>=20
>=20
> LUKS header after calling luksErase is actually "dummy" header (if it mea=
ns header without keyslots).
I meant to go one step further and instead of luksErase create a fake heade=
r (bluff, decoy): Create a temporary container, make a header luksHeadeBack=
up and then luksHeaderRestore to the location of my original header on disk=
. It will "pretend" to be a real header, and in fact I will be using anothe=
r detached one. If my computer is stolen, I wish good luck to the opponent =
who tries to brute-force a drive with a fake header (the real header at thi=
s time will be on a USB in my pants pocket). Do you see any possible proble=
ms in the operating system due to the fake header?


