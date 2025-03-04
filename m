Received: from mgw1.m4com.de (mgw1.m4com.de [188.34.176.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F9D1FCCF6
	for <cryptsetup@lists.linux.dev>; Tue,  4 Mar 2025 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.34.176.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741083609; cv=none; b=sXQZD0DtKZbBuQAP71vsoEYoVruR9Dyr2PInT9WEO+GFvMQe6uzP9I+ki+cmF+q7IU2EdJsD2VuZky9BDEL0a6zMU9TEusGiJlwHXjZKmsWgdoWyhFXoQma11UXtp+YilP0LV1NdKwZVsrF8jhzsBjWLrGNDUkRTxmzGVKTwr/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741083609; c=relaxed/simple;
	bh=k3QwF1L95sptszbGau8efAkbQ02ZNjsycYIU33uxw9w=;
	h=From:To:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=gv+MWmQziDQRCj64jJpIdDkeO7T7EJznnjU9XfMxWMGahsJTmpSR1tn/zH/PSdluy5LLBKVxelFCDUF2nOb5PIG+SsmVTw0s3DkaVs+317k2tlmlF2D0kBmcIVmoXHDdYAP6z1fBxudRWREHsjYBhjygSsWn588TMDNh5+OV3vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m4com.de; spf=pass smtp.mailfrom=m4com.de; dkim=pass (4096-bit key) header.d=m4com.de header.i=@m4com.de header.b=XFNiB7vV; arc=none smtp.client-ip=188.34.176.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m4com.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m4com.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=m4com.de header.i=@m4com.de header.b="XFNiB7vV"
Received: from mgw1.m4com.de (localhost.localdomain [127.0.0.1])
	by mgw1.m4com.de (Proxmox) with ESMTP id E3B103012CF
	for <cryptsetup@lists.linux.dev>; Tue,  4 Mar 2025 11:20:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m4com.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:in-reply-to:message-id:mime-version:references:reply-to
	:subject:subject:to:to; s=m4com.de; bh=k3QwF1L95sptszbGau8efAkbQ
	02ZNjsycYIU33uxw9w=; b=XFNiB7vVth5VZ6l89iyxL7GISbMFZ2QfaCT1F+CF5
	6Sz8l9rs+tOzhUHaFoxvtDvIlfL5hRB/7HnK8yz/6IBDnD7NUkW94Zzviz75hewZ
	tCVUv3bVajcgsJxXHj4No8Vrj6oiZbGwqs6ybPuEA9SwAC6Xyw0W5jcaofRDO9l4
	Gk1Lr6hujRG9Og/DWRUx7JmRa4OH77LfUHbBHyFrs6DcJKLX6gH5m+eBCIwTtQ85
	31jG9ApJ3zshMsLWU4U98i5C1XYulE8aV7Sl9lX1pxRh/g2pgIvFV31Jr5eb5npo
	KYTvDmlcSeDrJMrwBb/iq++DkfeQ6QV2564KwXI0ra1nRIDFRrDhjSbbbIGzl4T9
	1xnkeDJZMBRqEuywsvOIg43aFNpjgeJVrpdxL2W/B/qASDo9xMjww5yEGTT5t4gn
	4Nj+XdcEBVZwQzXqr7jVkyLHWFdXOlplzVa07Z1RJlkFUsxnLJwAQYskHPKTIN7L
	UoMWCvV/8i9EOI2zOXHZNqvt6+/J8btrVP21V93I7gzb1lQUm+RCv6LBsO6mzgc1
	lP3TDqfzAM2fFl1pxmFiU17es93Q7ZQC2uxvYv/g1SDU7YTs/Au4vsp5gZfK3T5K
	8sp/0mJg6+K387aij9egyu8vCNei+6nuhTBJ4rBGMddIo/MRmAfvdPiQgtlndjiG
	IU=
From: "Dirk Nichterwitz" <dnichterwitz@m4com.de>
To: <cryptsetup@lists.linux.dev>
References: 
In-Reply-To: 
Subject: Boot with encrypted disk but only with USB Stick
Date: Tue, 4 Mar 2025 11:19:58 +0100
Message-ID: <01a001db8cee$fc0f5550$f42dfff0$@m4com.de>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQO6IcyP2Hhwwacx+v/y3Hb1q9cy8a+lmVNg
Content-Language: de

Hello,

I have configured my system to boot a luks encrypted harddisk. I addes a
keyfile on a usb stick and this works to boot automaticaly when plugged =
in .
But ist her a way to configure the system to only boot with stick ? =
because
if i unplug the stick the system ask f=FCr passphrase.

But i want a system only works with stick and no way to do a other boot.

Thx

greets Dirk


