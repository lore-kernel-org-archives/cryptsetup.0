Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6A221D5B0
	for <cryptsetup@lists.linux.dev>; Fri,  7 Nov 2025 19:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.19.178.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762544579; cv=none; b=X4IebYi6mGqOSJOr0Q68wd+Xvo367TDMu+PjaIPtT7tC2xATpyqDk/jMjRF9IMZUPx1XUMCWjdLNIPnLDueYlmHX34lncOsbjpjHP9jXub5imLnABlsIwWOvtYHvLYicFJpfN5rddvRZxy10V4Us85vkLtvIIJhw9PS/roQLysI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762544579; c=relaxed/simple;
	bh=KDzpj4R5F4liGMLeHfjQ/bx2fsJzSVl4+Lj9sqZCIgg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dp9nVdJm1dHXM/17EVNX14XpPpLT/ViQfxZeitahi4rKzLYQw+057Tle7WlZTi0toEzXbQgc1t8K42ECKHDEO5fv6D68nbAuQ5G2UK5A20U6/kZiasS9PLdNdNvm4OqklE/f0XCAjMz50qDGgdFXOyTqZ4Dc3SwtL/I/Z/kJwnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info; spf=pass smtp.mailfrom=arnowagner.info; arc=none smtp.client-ip=84.19.178.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnowagner.info
Received: from gate.tansi.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 97E5E1400E2
	for <cryptsetup@lists.linux.dev>; Fri,  7 Nov 2025 20:35:48 +0100 (CET)
Received: by gate.tansi.org (Postfix, from userid 1000)
	id F22FF17A454; Fri,  7 Nov 2025 20:36:54 +0100 (CET)
Date: Fri, 7 Nov 2025 20:36:54 +0100
From: Arno Wagner <wagner@arnowagner.info>
To: cryptsetup@lists.linux.dev
Subject: Re: Question about FAQ 5.21: "Why is there no "Nuke-Option"?"
Message-ID: <aQ5KVmEbO7SHp3Z0@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <ycc43yz54ybgnal5t3rcment6vjvanalx2g2z6rly4wxxpietn@nn222ctnfqaz>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ycc43yz54ybgnal5t3rcment6vjvanalx2g2z6rly4wxxpietn@nn222ctnfqaz>

On Thu, Nov 06, 2025 at 15:38:06 CET, techmetx11 wrote:
> After seeing GrapheneOS's implementation of the same design idea, I feel
> like this idea wasn't given much thought in the FAQ.
 
You feel incorrectly. This has been extensively discussed. 
 
> This paragraph ignores the fact that the TPMs that come with computers
> have improved on-par to the standard of HSMs, and are now integrated
> straight in the CPU in most cases, rather than being a seperate chip or
> card that can be simply bus-probed or manipulated physically.

They really have not. Not even remotely. 
 
> > Still, if you have a good use-case (i.e.  non-abstract real-world
> > situation) where a Nuke-Option would actually be beneficial, please let
> > me know.
> 
> Imagine if you were being tortured by people to unlock a hard drive that
> you didn't want them to see the contents of, and so you give them the
> password to hopefully make it so that it wipes the TPM/HSM/etc. of the
> computer and destroy any chance of unlocking the contents, thus making
> their job futile and saving information from ending up on your
> adversaries' hands (even if it meant it cost you your life)

This senario has been discussed here many times. It is not a 
valid reason to have a nuke option. Also note the cryptsetup
has no TPM integration as part of the project.  

Regards,
Arno Wagner

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
