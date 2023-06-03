Received: from smtpq4.tb.mail.iss.as9143.net (smtpq4.tb.mail.iss.as9143.net [212.54.42.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE2257B
	for <cryptsetup@lists.linux.dev>; Sat,  3 Jun 2023 08:09:17 +0000 (UTC)
Received: from [212.54.42.105] (helo=smtp1.tb.mail.iss.as9143.net)
	by smtpq4.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <felix@kngnt.org>)
	id 1q5LhT-0006Y0-0f
	for cryptsetup@lists.linux.dev; Sat, 03 Jun 2023 09:29:23 +0200
Received: from mail.kngnt.org ([82.217.117.151])
	by smtp1.tb.mail.iss.as9143.net with ESMTPA
	id 5LhSqrJxO8Mh15LhSqpmFl; Sat, 03 Jun 2023 09:29:23 +0200
X-Env-Mailfrom: felix@kngnt.org
X-Env-Rcptto: cryptsetup@lists.linux.dev
X-SourceIP: 82.217.117.151
X-CNFS-Analysis: v=2.4 cv=Y+A+8DSN c=1 sm=1 tr=0 ts=647aebd3 cx=a_exe
 a=z4SNomP1wL5XVOMxzlLTBA==:117 a=z4SNomP1wL5XVOMxzlLTBA==:17
 a=IkcTkHD0fZMA:10 a=LJM8hDkaJEGQ-buF2QQA:9 a=QEXdDO2ut3YA:10
X-Authenticated-Sender: f.rubiodalmau@ziggo.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kngnt.org; s=mail;
	t=1685777362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4/7cTH+W9QQ0m103Yf/2omIpG69sktkiqZFaVtvmKGM=;
	b=rAcl5tCKBHnebnEYE3wdkMKujEXs4qdJB+4KSDWTvmztYqEXkNKc8HnMfiRvtpJgDCDCK9
	SZ7lM+deaZzHEz1opORnfvgkvuxvpZ/qzypcJiEeh/0RbRaolzNZWq7++Jsf8EleZsqi7x
	tnhm2WLJlR4LOvU60cg+aGJFXUHj/X8qDUosFjhDwylCcTxsmWokS1Z7oipLm3mxhztwh3
	79j62hY/Hl/i9sT1FczSs1v9EwQCELYWe3Nm/GQMDuvTLynpEmxg1PXk+HbYUcrykCsckH
	eBn/ueayTxZByLXXMJs0VUjb5aSyiZ6oGMaIVrTNC80t3/i4NYMF+XTARxZGsQ==
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 03 Jun 2023 09:29:22 +0200
From: Felix Rubio <felix@kngnt.org>
To: cryptsetup@lists.linux.dev
Subject: How to protect header and on.... paper?
Message-ID: <7ea9a3bc2101154ba3f65e6f55c6fdc4@kngnt.org>
X-Sender: felix@kngnt.org
X-CMAE-Envelope: MS4xfOIm237pSvfCDjKhRZgMhFWhlxWyLiS/NPWQqi62zqEv4lLEOYBQzDCQ3xXyMG+0RKs6VsvZvks0LrcedmVvpQCE4HM2ds7BxN62JinLOfj87B7Afdqs
 sB9A3RflrrND68YFdYeyql8hX0+RTuoMtyRIHBMh7sNfPIdq5yfLK+xVnXabVMUBkXh+/sIcPIFKuaN6i0hKLHdy+1WslcWh6c4=

Hi everybody,

I have setup a my FDE using LUKS, and tying the decryption key to my 
TPM+recovery key. Now I am wondering: I know I can get a backup of the 
LUKS header on a file, store it somewhere and done... but what happens 
if the USB is corrupted by the time I need it? what if I put it on an 
optical disk and has been scratched? This kept me thinking: is there any 
possibility/process to have the required information for the header 
printed on paper, that could be stored on a safe?

Thank you very much for your time,

-- 
Felix Rubio
"Don't believe what you're told. Double check."
