Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3C5173
	for <cryptsetup@lists.linux.dev>; Sat, 21 Jun 2025 01:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750468181; cv=none; b=QWhofwy1fcX8nV2WaoIsLvj/EDoEWMY8dmkVZdMNNF0ONma4S3i5YiUxkfyCNYTLrnrOeSBA7cM3WvtPgD1SJIlum/oor3NI4h/8KZj07jPSV0LQLUw75nbl1wqZy+7kREoyw91gOhCLDZImHh6rP/LONxhXSRAb+9YEiL0iRwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750468181; c=relaxed/simple;
	bh=sL69zAuUzqcLUKFNNPqfCxqnOqFb41Dx0+vubNw/kKw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FqNeaO5NJQ3p8Lxk+vxRQ+cB25Cj1UX/SO6hDiNQsW2HhLoSAJ21PMOAI49DIbWutUGncdr7tcmKSQAyKcRtt8PD/urG1OtXNker5VJ/XYeJFlwvb7y4rWcRfq1GQSYL5U32Ry0JP7uZ4bgoG3kBUy9b79XwCUokOPPXtIIJ1JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=WLUQtwib; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="WLUQtwib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=leisba5chbewnn2dtmfqejr6xi.protonmail; t=1750468171; x=1750727371;
	bh=sL69zAuUzqcLUKFNNPqfCxqnOqFb41Dx0+vubNw/kKw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WLUQtwib5SVwRT7BWTqsLge5zvZK6j8PJNXnIZVhRmAc7khRpZuUsJQjoPapaU31C
	 90P4LXs2XKZKYUxbwxYpV869wAB7R2MSWvsUnr5IacDvtwMDz9sa0DWO00NGE0mcde
	 tAOIOw0sWnhJEXqQuoVdxASFobMeqLXTPN40l+2zSs5Hv8z+0MWRrlgcx/YoOhujJd
	 9gBPl1pbJB4wP+6L5e5zYbYG2v+gXaZNuAMqpX5FhM1mLXIGJlCut9DwaHO88Qe6p4
	 Bf6TDFCTMKaKnNlAR+RcczLr3gnNll4uYQxxpqiZzlqAV1V2Hrrv/BMWg1a4RZREPH
	 iJl5R7vrC6kNQ==
Date: Sat, 21 Jun 2025 01:09:27 +0000
To: "152cc69a347e@ewoof.net" <152cc69a347e@ewoof.net>
From: improve9406@proton.me
Cc: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: What use case ?
Message-ID: <Lx6U-7dh0AGdrodf7xHyNWflu8pbb8B5xsJ-M1dnnjbmugCI1pKMOAf-2IQn-BUG1Ffg3ZJTcwX14C-VVB8PXoOlPawi8G6HY4Ynx23PbKY=@proton.me>
Feedback-ID: 132508452:user:proton
X-Pm-Message-ID: 12fcc1ccb59bc5e6f3b804df2bd326186809b809
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


I guess to protect from what AEAD protects from , mainly offline bit flipin=
g tampering & possible replay attacks.

Can you plz tell me what are other use cases if there are any ?
