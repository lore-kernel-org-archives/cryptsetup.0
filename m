Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF32340298
	for <cryptsetup@lists.linux.dev>; Thu,  6 Nov 2025 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439908; cv=none; b=g+Lls8sPSWtwekcOjDgtD+OTqQXP+KpCgnYs8UWnvPAbzuTRIpyzZ5UWW2l5N7YUqLV6FMg2R4gwk4+dIOvlgrnWI4qr5ixbug8bcZfxcT7Vi//hFknRzepqDTXiGapF7MoLssR+vs/P8qqWh8o2r9Z/otxJKgMwQjstfLuyw54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439908; c=relaxed/simple;
	bh=TN9ucU9Yy2EZSz5Yy2Uglx9YreXQ6KBG15o02HACkto=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BcQ6XMkT2F8sWIpdtXEoGZdjXX6bZW9TijfnrQvcZvDqFxAj4Vp2OzJq17QxWUwZUfDTBvQyfAmouLaS+VKnEU0p4IGoEnWuYIW/ImNN/pAj9iXwMBQnswfLsvWy8N1KE3vw9qdUhjEaEMDqIolDE2MJt6FqOHMZnpiiLywyOKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XgOTDxOY; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="XgOTDxOY"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BB67020D9B
	for <cryptsetup@lists.linux.dev>; Thu,  6 Nov 2025 15:38:16 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjbIExxfkI_n for <cryptsetup@lists.linux.dev>;
 Thu,  6 Nov 2025 15:38:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1762439896; bh=TN9ucU9Yy2EZSz5Yy2Uglx9YreXQ6KBG15o02HACkto=;
	h=Date:From:To:Subject;
	b=XgOTDxOYO1AjgmcxG9s53+9EXjVbtMcDnCS2f0L+JatmfmssJKEP3V5f9iZu0kvpJ
	 fB+yJOiGL/5C36pgITcHQuOARlgHxSc1pE+lVllB/hPXTV3iQih/9xQyBDWgyKNn8g
	 nRsMLmOfG74ropcBugWHLUcR0YwcWzAl1HaGwqNgy+BEIbinTJGK9Ra+e8SKSwuxgD
	 pSd919bH3Rq8ybEWhi4xYfDaNt2r+7Fa6M/UHta+kxglbIrDO6v67wWX1DTGqiRPHg
	 07bwDjWJwfXXG9ccytWzqKEN3/dLBbFP9QWxOfmeh35kaeIqzgoA8zq1B/DIWZMJtl
	 s84ZE4HdJGBng==
Date: Thu, 6 Nov 2025 15:38:06 +0100
From: techmetx11 <techmetx11@disroot.org>
To: cryptsetup@lists.linux.dev
Subject: Question about FAQ 5.21: "Why is there no "Nuke-Option"?"
Message-ID: <ycc43yz54ybgnal5t3rcment6vjvanalx2g2z6rly4wxxpietn@nn222ctnfqaz>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After seeing GrapheneOS's implementation of the same design idea, I feel
like this idea wasn't given much thought in the FAQ.

> While this sounds attractive at first glance, it does not make sense
> once a real security analysis is done.  One problem is that you have to
> have some kind of HSM (Hardware Security Module) in order to implement
> it securely.  In the movies, a HSM starts to smoke and melt once the
> Nuke-Option has been activated.  In actual reality, it just wipes some
> battery-backed RAM cells.  A proper HSM costs something like
> 20'000...100'000 EUR/USD and there a Nuke-Option may make some sense.
> BTW, a chipcard or a TPM is not a HSM, although some vendors are
> promoting that myth.

This paragraph ignores the fact that the TPMs that come with computers
have improved on-par to the standard of HSMs, and are now integrated
straight in the CPU in most cases, rather than being a seperate chip or
card that can be simply bus-probed or manipulated physically.

> Now think of the typical LUKS application scenario, i.e.  disk
> encryption.  Usually the ones forcing you to hand over your password
> will have access to the disk as well, and, if they have any real
> suspicion, they will mirror your disk before entering anything supplied
> by you.  This neatly negates any Nuke-Option.  If they have no suspicion
> (just harassing people that cross some border for example), the
> Nuke-Option would work, but see above about likely negative consequences
> and remember that a Nuke-Option may not work reliably on SSD and hybrid
> drives anyways.

Disk mirroring is a valid concern, but can be fixed by having layered
configurations, such as: having a outer configuration that decrypts the
inner configuration.
The outer configuration can have keyslots for the hardware security
chips, to decrypt the inner configuration (which includes the keyslot
parameters for the duress password and the normal password, and other
LUKS parameters). Not only does this make it so that wiping the
HSM/TPM/etc. permanently destroys any chance of decrypting the inner
configuration and thus the rest of the hard drive, this may also make it
hard to determine if the hard drive is "booby-trapped" just from reading
the LUKS header.

Why was not such a design considered for this kind of setup? (if it wasn't
due to complexity). Computers have advanced so far after
(persumably) this FAQ entry was written

> Still, if you have a good use-case (i.e.  non-abstract real-world
> situation) where a Nuke-Option would actually be beneficial, please let
> me know.

Imagine if you were being tortured by people to unlock a hard drive that
you didn't want them to see the contents of, and so you give them the
password to hopefully make it so that it wipes the TPM/HSM/etc. of the
computer and destroy any chance of unlocking the contents, thus making
their job futile and saving information from ending up on your
adversaries' hands (even if it meant it cost you your life)
