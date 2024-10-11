Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4619DF6A
	for <cryptsetup@lists.linux.dev>; Fri, 11 Oct 2024 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.136.2.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728633642; cv=none; b=dI7i6C6Sxon5ysvcYDv5jTokN9NAJNKDM7srrFbkzOfEoqk3Z/WnDj6Ge8YlqKBy2EeSiBbsZ4HeDMh55hLainYmnNuq7OKZVymV8jrf/mp8n131yhxPay4c0HTnaGF8x11CS0jg78uJ0WPLmisNdJqSATLtXcIFM2PBUp/sbwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728633642; c=relaxed/simple;
	bh=NnFCfkPXppMOPBaDU32n2KmH3nhw60Q9CLsFmtQzRJg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/LNQ+kNccr8H/1JA43WA47/TvYnzvxBoUeNhWup/eYiIuVx/6YDKaSE1A0xIKt4dfPM8naT1Ijd9xopAWVP7SoT7XVX5meDTpSvlhElrG3QM+gcP35jXeqq8JbYZYUyAUC+Xj8qThS9tgZOR5G0PDQM/7KWjIsplQ00yi7Vly0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net; spf=pass smtp.mailfrom=ewoof.net; arc=none smtp.client-ip=79.136.2.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewoof.net
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id E87953F4EF
	for <cryptsetup@lists.linux.dev>; Fri, 11 Oct 2024 09:52:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.156
X-Spam-Level:
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wQROYiUfLAoI for <cryptsetup@lists.linux.dev>;
	Fri, 11 Oct 2024 09:52:01 +0200 (CEST)
Received: 
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0A40F3F322
	for <cryptsetup@lists.linux.dev>; Fri, 11 Oct 2024 09:52:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id A54F51D00233
	for <cryptsetup@lists.linux.dev>; Fri, 11 Oct 2024 09:51:52 +0200 (CEST)
Date: Fri, 11 Oct 2024 07:51:51 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Issues with LUKS Password Management Options
Message-ID: <80adb3cd-404d-4560-b886-90034178b7b9@home.arpa>
References: <32be1215-bcab-425b-99cd-3adc26590b14@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32be1215-bcab-425b-99cd-3adc26590b14@gmail.com>

On 11 Oct 2024 09:08 +0200, from keraform@gmail.com (Kiss István):
> I would like to bring to your attention an issue regarding the password
> management of LUKS-encrypted volumes. Currently, the LUKS password prompt
> offers three options for remembering the password,

Neither cryptsetup nor dm-crypt has any concept of storing a container
passphrase for later use for unlocking purposes, except for the case
of reading a container passphrase being provided out-of-band to the
tooling (for example by being stored in a file).

You are _probably_ using a front-end provided by your desktop
environment, which does LUKS container passphrase handling using
whatever secrets infrastructure it uses.


> I would like to ask if such a change is planned for the future or if you
> have any suggestions on how this can be more efficiently handled with the
> current system configuration.

This question, while legitimate in itself, is almost certainly better
directed somewhere that people in the know about your particular
desktop environment are likely to frequent. You should also specify
which desktop environment and version, and possibly of other relevant
software, you are using.

If you are uncertain, a forum dedicated to your particular Linux
distribution is probably a good place to start.

I hope you get the answers you seek, but the cryptsetup mailing list
is the wrong place in which to ask your question at least as posed.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

