Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B07281376
	for <cryptsetup@lists.linux.dev>; Thu,  6 Nov 2025 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762444026; cv=none; b=gP9pV8gaDoXOtyRVCggJ0lSY1LP60wFHIBoEjZCsa35cLDnABj9Z8ipcTypAxhImop25mU+Zkvi9u15D2VkRnvezcjEAKNoit0bHJYJpj9nn15TmklwetZpLETzZc22BkdAD0U/7K5o/zJv8JnFfrFHTFoGJV2qGibErAmIIbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762444026; c=relaxed/simple;
	bh=AuTefOsqK35Ggi4vkgxMchAu3uuTZiUWXUywJdQaBR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bfh7X4lMbBAmhyIg8rxnH+75POCWr5ylU1m2LdZUxCSqQmy3OHAq+bAcoKZ2zvSABFbHq3qBwv+nfY3Nw6SnhHkaLG6tsxaY84PHjjQdx9yGGs5kBwHZHJ6vz9Zcf/MF2i1SkY1mBQp2flMRumqXnbk8EoWwggXpgbCbmaHGlD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=JWQXdgpi; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="JWQXdgpi"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BA08E261FE;
	Thu,  6 Nov 2025 16:47:01 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STu7jz5i5IDp; Thu,  6 Nov 2025 16:47:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1762444021; bh=AuTefOsqK35Ggi4vkgxMchAu3uuTZiUWXUywJdQaBR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JWQXdgpiXyuSO0gnHgDnzb/rAbOEBlGo+IbXZ2fJzB63QnrakB50eHUl4xNU9J5tU
	 W0Xr+DUBv5aTOv0HR2sD4w3VRNoGFFByMAXV7UFMPyIM91QPEw98eL1IbSlQemyhmE
	 G0pdP3Cv1va92+za4MuQbtJAe/S6Q8sI3cewqovbGZQnu5JpaX+lVJzeyMnPEw0lEc
	 P4OXNHo3ePVjgaUGaI9KhsU+XNZ421WqKGWr0BfTwwx6fSEXsDfdSmNONVW1S5+blh
	 +e0Lx3vX1ugrFBNPFrV9TWrmHIH1F1/z/iiYw+zB3DTVePD/ZKnMxguu2FSTkIDwbW
	 EqH3ARHFhBa0w==
Date: Thu, 6 Nov 2025 16:46:51 +0100
From: techmetx11 <techmetx11@disroot.org>
To: Chris X Edwards <chris@xed.ch>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Question about FAQ 5.21: "Why is there no "Nuke-Option"?"
Message-ID: <vygshmb2sfy2fexy4556aqqc2dxiemelcudbec4o7lvtatsjuf@hy4kni6fnjz3>
References: <ycc43yz54ybgnal5t3rcment6vjvanalx2g2z6rly4wxxpietn@nn222ctnfqaz>
 <aQzAAvW7wmbFoOrv@xed.ch>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQzAAvW7wmbFoOrv@xed.ch>

Yes, that is what would happen if computers didn't come with a
integrated cryptoprocessor to store secrets or something like TPM2, but
computers do come with that now.
You could require a secret stored in it as apart of the process of
unlocking the drive, either deriving a key from both parameters (the
key-derived password and the secret in TPM) or having the TPM secret
decrypt the configuration that stores the password hash and parameters

Since you can't easily mirror data from a TPM chip, especially if it's
integrated deep into the CPU, wiping it would render the contents on the
drive useless even if they mirrored it beforehand

On Thu, Nov 06, 2025 at 10:34:26AM -0500, Chris X Edwards wrote:
> I don't really have any true expertise to comment publicly but how
> about this:
> 
> You have an encrypted drive with important stuff on it. There are two
> passwords, one is "?LR3*F%@hdQa7Db3d=L7&A27LQ%aAd3aA@?H?adL" and this
> unlocks the drive. The other password is "mypassword" and it nukes it.
> Simple brute force attempts will be hindered. Though if they're smart,
> they are mirroring.
> 
> Maybe I'm overlooking something. There's always something!
> Good luck,
> Chris
> 
> On 2025-11-06 15:38 +0100, techmetx11 wrote:
> > Imagine if you were being tortured by people to unlock a hard drive that
> > you didn't want them to see the contents of, and so you give them the
> > password to hopefully make it so that it wipes the TPM/HSM/etc. of the
> > computer and destroy any chance of unlocking the contents, thus making
> > their job futile and saving information from ending up on your
> > adversaries' hands (even if it meant it cost you your life)
> 
> -- 
> ++++++++++[>++++++++++++<-]>-...<++++++[>>+++++++<<-]>>++++.<+.<++++[>
> Chris X Edwards-----<-]>+.- Have a nice day. >.<-.+++++><chris@xed.ch>
