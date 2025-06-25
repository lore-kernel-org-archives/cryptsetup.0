Received: from mail.prograk.pl (mail.prograk.pl [46.170.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50F92641E7
	for <cryptsetup@lists.linux.dev>; Wed, 25 Jun 2025 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.170.232.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860368; cv=none; b=nUFNl4Jk0l8IgVCiLP2qY680jWpLI2pW3g59bltil2aSPrLlZV8swikRHkkjM7p1P068ygtcYg4EDes4Qff8garuoXEAHG4Xe8UPlXJi7hQKz4kcQgj0VgEQMwFU1hybgjpR1olLuKundDTgFr9d3cMWX9bb5P+1hIu0csNg538=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860368; c=relaxed/simple;
	bh=p34OebvlypvDVUB79cDYEbwwf2LNbPcLnMX/Hk5JNQ8=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=PUUr915+oDuqmG+f3j5NF6r6zf2HPp1NNitxRG4YaW3mPyC/iM4/7Mfg+X3afPFi5EsvIbRy77aXUtSyyRNmDY/3JzET415/fxxGNOWa9j8CGgkGMXAlbY0nSKZ2aNxuSN0iTmbFHoCGPoGkIbvXuhHOxTitFdDXLsv0W3xZKJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prograk.pl; spf=pass smtp.mailfrom=prograk.pl; dkim=pass (2048-bit key) header.d=prograk.pl header.i=@prograk.pl header.b=Jw0s8Ts+; arc=none smtp.client-ip=46.170.232.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prograk.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prograk.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=prograk.pl header.i=@prograk.pl header.b="Jw0s8Ts+"
Received: from localhost (localhost [127.0.0.1])
	by mail.prograk.pl (Postfix) with ESMTP id 8DC122E203AC
	for <cryptsetup@lists.linux.dev>; Wed, 25 Jun 2025 16:06:00 +0200 (CEST)
Received: from mail.prograk.pl ([127.0.0.1])
 by localhost (mail.prograk.pl [127.0.0.1]) (amavis, port 10032) with ESMTP
 id sGQVWituFQLx for <cryptsetup@lists.linux.dev>;
 Wed, 25 Jun 2025 16:06:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.prograk.pl (Postfix) with ESMTP id EA2492E203C4
	for <cryptsetup@lists.linux.dev>; Wed, 25 Jun 2025 16:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.prograk.pl EA2492E203C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prograk.pl;
	s=2E15B844-9C60-11EE-A329-FE538AB180D6; t=1750860359;
	bh=p34OebvlypvDVUB79cDYEbwwf2LNbPcLnMX/Hk5JNQ8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Jw0s8Ts+WNfY2rwK/0nWvg0QwYlY26F2tkEuMnogWdDmbbTOd+DSyBv2V9UErLlOC
	 X9d0vAMlgdsvEpikrz8lliczkzaLOuL0/nOwXGOQp2mvfZ8Ni4vb1GkPJUkGwWhb+G
	 TZ4nwTXe6eScgM4U22gJPIskAxNkWfqDCue9WBaqq7F9FARw1AlK7uiKDNTGw7adU3
	 9eYU+CXZejMnji01/M5hEyOPEdZknZOOV40YaOnyU0HDahphUi5sjkbI5A2E1Wkee0
	 253j80ymhoAes0mBcUhVaSp9pRNmsqQRPevz3Hi/AHbTfESiBvwOOOq4FtgDADctdX
	 jNw98FVIIsORw==
X-Virus-Scanned: amavis at mail.prograk.pl
Received: from mail.prograk.pl ([127.0.0.1])
 by localhost (mail.prograk.pl [127.0.0.1]) (amavis, port 10026) with ESMTP
 id Lj-RkrbCcG6j for <cryptsetup@lists.linux.dev>;
 Wed, 25 Jun 2025 16:05:59 +0200 (CEST)
Received: from mail.prograk.pl (mail.prograk.pl [10.20.230.202])
	by mail.prograk.pl (Postfix) with ESMTP id C157C2E203AC
	for <cryptsetup@lists.linux.dev>; Wed, 25 Jun 2025 16:05:59 +0200 (CEST)
Date: Wed, 25 Jun 2025 16:05:59 +0200 (CEST)
From: Dominik Rak <dominik@prograk.pl>
To: cryptsetup <cryptsetup@lists.linux.dev>
Message-ID: <438242573.9620.1750860359542.JavaMail.zimbra@prograk.pl>
Subject: label written on top of the header
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 10.1.6_GA_0225 (ZimbraWebClient - FF140 (Linux)/10.1.6_GA_0225)
Thread-Index: rJpBQyyivPpWDXJPQ+T6245esDwOGA==
Thread-Topic: label written on top of the header

hello
i have overwritten a part of the luks2 header with an mbr label but the 2nd binary header and 2nd json area and everything after it is fully intact
i am coming back to this after a long long break because when i saw "By far the most questions on the cryptsetup mailing list are from people that managed to damage the start of their LUKS partitions, i.e. the LUKS header. In most cases, there is nothing that can be done to help these poor souls recover their data." i decided to give up
but now i decided to do some more digging and it seems to me that it is recoverable

i created a new volume with the same settings to see how it should look like and then on a copy of the original drive i changed the starting part to be the same as the one from the new volume (the LUKS ... @ ... sha256 ...) and the rest from the 2nd binary header and 2nd json in the place where the 1st ones should be using hexedit and then that looked like a normal working luks header

but that didnt work, so now im here
if the command is:
cryptsetup luksOpen <device> <name>
then does the <name> matter in decryption? or can it be anything? because if it cant be anything then i dont remember it nor have access to it after such a long time

also after creating a few sample volumes i have noticed that the area where the 1st binary header and 1st json area are compared to the area where the 2nd binary header and 2nd json area are is not identical because there is some undocumented something, unspecified in the https://gitlab.com/cryptsetup/LUKS2-docs/blob/main/luks2_doc_wip.pdf , if its not random then it was overwritten by the label

and the last thing i can think of, does the uuid of the device matter in decryption?

im sorry for bothering but please tell me what to do, if anything can be done
