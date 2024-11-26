Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E91817BA0
	for <cryptsetup@lists.linux.dev>; Tue, 26 Nov 2024 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.19.178.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732610746; cv=none; b=VkhGR81zeJU9fRwpXmXdVeLv3D3cHSdmT4oW4apEO9YtqqL+ld9Lzs+OVVmcjDOghvzU2lzIjIhMNQ+6gkrHLU7VUlhrOXGC9jqt9upCiPYlpJO+/KgCX73bUJsfkxCD/0qyY7REHlWxGAuP8K4Cpa+/7TwznKLxDd0QrOFr8bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732610746; c=relaxed/simple;
	bh=rvKk9hoUKgP59C8KdPWzQiNYVuyRTib7MqPgm82ng9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlXien9hdOys4dQG3ss+KMmeEHPBVBZl9M43FnObUiML4mTbLPUYWuBvr3EKX7/ZQj/lPOPcPy+5Jhs7WHcXUcqRglqzntecinL5boadSKf629JpKCZkwHAM0WBdPhQ+9ysferMom6lR2AUh4yJ4irpxcgLvfZvfvsorJGxZbro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info; spf=pass smtp.mailfrom=arnowagner.info; arc=none smtp.client-ip=84.19.178.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnowagner.info
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 8B9C614004F;
	Tue, 26 Nov 2024 09:38:29 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id EB2EF17AA7B; Tue, 26 Nov 2024 09:39:01 +0100 (CET)
Date: Tue, 26 Nov 2024 09:39:01 +0100
From: Arno Wagner <wagner@arnowagner.info>
To: Patrick Callaghan <patrickc25000@hotmail.com>
Cc: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: Re: LUKS and quantum computing
Message-ID: <Z0WJJaVuLpcIbkDG@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <PH7P220MB1325C03018B9E4F926B5127CED2E2@PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7P220MB1325C03018B9E4F926B5127CED2E2@PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM>

No idea. And frankly, I have stopped caring. "Quantum Computing" is
a Fata Morgana that does not amount to anything practical at this 
time (after 50 years of resarch) and may well never amount to anything.  
It will certainly not be a real treat in the foreseeable future.

Here is what Peter Gitman thinks of the topic, and I think it
is spot on: https://www.cs.auckland.ac.nz/~pgut001/pubs/bollocks.pdf

Regards,
Arno


On Mon, Nov 25, 2024 at 23:13:17 CET, Patrick Callaghan wrote:
> If we use LUKS encryption with SHA-256 configured (i.e.  the default), is
> this considered safe against attacks by quantum computers? 
> 
> I ask because NIST suggests SHA512 in general for quantum safe algorithms
> (see "old Q17" in
> https://csrc.nist.gov/projects/post-quantum-cryptography/faqs) and we want
> to be LUKS quantum safe now and for several years to come, even if no
> practical attacks currently exist.
> 
> Note, the cipher we use is "aes-xts-plain64" so we have no question about
> this as AES with 256-bit keys is considered quantum safe. 
> 
> Thank you.

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
