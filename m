Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CF934DB54
	for <cryptsetup@lists.linux.dev>; Thu,  6 Nov 2025 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762449121; cv=none; b=GWEB8BfanDY+Q5gftPloXW7u2ut8FGxNqygcRfOya37qnFxB60nruXDB5kRtM1t/IpTYhUxzgtPXkYdWXIbf5vycRug1c7G7WBHBkTlWvwYBYTchTOMCy75rmjSH3pV17VBeTGUpO48PD0RoOmlforkIUv4y5qEg+CYMKemsmn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762449121; c=relaxed/simple;
	bh=inShV+WZz0SL6HcvyRFLCxGdo5HRcIXCkymTnZyQL44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iH4aCNvbIXuDmPZQlD7kPYrBqmoJ0JwXYtYBrhCD0/CtZGD3SLKqMl1SKNoHVJ7v5VOjcW8saQGKZP7nUvteONFHUx3RsbNcaGbdhwZOOq+S8MASkvyoXqUosQdzDrj0R8XK9szXMFn9R1OGZD6D8vAVjKrH64QhxIK6yPQ38BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Y5OC8N6N; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Y5OC8N6N"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D61E922FD2;
	Thu,  6 Nov 2025 18:11:56 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3p6AfwYMiafd; Thu,  6 Nov 2025 18:11:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1762449116; bh=inShV+WZz0SL6HcvyRFLCxGdo5HRcIXCkymTnZyQL44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y5OC8N6NzH0TeQjA9T3dtYtU1pdxKnTG6f70//FJl0zCKE0GFPPaL7H4PkBKGaGTc
	 hQwPgvrp/mpjcDAWkgOA2o100LBhE3GICq008qtBVUnE+jVG36ewAYyn8yXp1UsEa8
	 pdPk7ewUB6CstZFC8k5aUCSZS1DcHwqO55LiQiolh6puEnBGpYdw6Lbqd0lE5xBUHZ
	 gNtHRrDjgG6L87tP/CYyPPgTM3mObxJwg/5lqaxv9GsZr5T2BTSKjG9l6So7qPr0L3
	 UVXdZr9KBRUpPqmUg/VIA85l6m0sUGNL6+7LYvmWavPETUDHVPwp8pjpP+DYrp1l59
	 2uXx+Cl2KhEFg==
Date: Thu, 6 Nov 2025 18:11:40 +0100
From: techmetx11 <techmetx11@disroot.org>
To: Kurt Fitzner <kurt@va1der.ca>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Question about FAQ 5.21: "Why is there no "Nuke-Option"?"
Message-ID: <yw5zdw2fubhvkwdt5i7swm6uccfzlgqiljb7ohiw6bao2267ns@p2nvjfcueyey>
References: <ycc43yz54ybgnal5t3rcment6vjvanalx2g2z6rly4wxxpietn@nn222ctnfqaz>
 <aQzAAvW7wmbFoOrv@xed.ch>
 <vygshmb2sfy2fexy4556aqqc2dxiemelcudbec4o7lvtatsjuf@hy4kni6fnjz3>
 <DD9C9341-D528-4BE1-80D9-444F95185D49@va1der.ca>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD9C9341-D528-4BE1-80D9-444F95185D49@va1der.ca>

Again, no one will try and bruteforce using the software on the device,
but if you employ TPM and such, and tie the decryption to the secret
stored within the TPM, they have no other choice but to bruteforce it on
the device.

You can look at Android phones, they may not be perfect. but some like
GrapheneOS has been pretty robust against law enforcement and forensics
companies trying to crack the phone open

Modern computers, especially the CPUs themselves have already had many,
many security mechanisms built-in to counteract most of what you said
(other than putting a camera watching your keyboard), such as Intel
TME (Total Memory Encryption) that transparently decrypts/encrypts
memory as it reads and writes to the RAM, sandboxes and Secure Boot to
protect against malicious code being ran

If this is considered out of scope in LUKS, then fine. I can't argue
much about that

On Thu, Nov 06, 2025 at 04:47:38PM +0000, Kurt Fitzner wrote:
> Nuke options are mommy medicine.  They rely on:
> 1a) the ignorance of the adversary to their presence and
> 1b) the adversary not taking the most basic precautions
> Or
> 2) External hardware or mechanisms to enforce.
> 
> In either case they are beyond the scope of DM-CRYPT / LUKS.  Any implementation in LUKS would do more harm than good, either giving the user a false sense of security, or in inadvertent activations.
> 
> If your threat model anticipates torture and in spending your life to protect the secrets on your hard drive, then LUKS is not for you.
> 
> And no one, literally no one, will try and brute force a password using the software ON the device.
> 
> You can already accomplish almost all the same  goals using simple methods.  Get yourself a frangible USB stick.  Or a small USB microsd reader and physically score the card to render it easily snapped.  There are even hackaday projects to make USB sticks with buttons that dump a fatal shock into the electronics.  Put your storage device key file on that device and retain it on your person.
> 
> I will also add that your threat model is naive and implausible.  No one who wants your data that bad will get your password with a bat.  They will put a camera watching your keyboard.  Or they will install a physical RAM grabber in your computer.  Or subvert the update process for some piece of software on your computer.  Or any one of a thousand different variations.  And in the remotest chance your threat scenario ever materialized, I promise you a trained interogator will know when you're trying to feed them a fake password before your conscious brain even gets the handoff and the idea percolates to your forebrain.
> 
> Lastly, I will add that if such threat models as you anticipate exist, then such measures as nuke options are then more of a danger to others than they are useful to you.  Do you really want to make it impossible for any person who doesn't actually employ a nuke password to be trusted to give the password?
> 
> LUKS does not address any of this nor should it.
> 
> On November 6, 2025 3:46:51 p.m. UTC, techmetx11 <techmetx11@disroot.org> wrote:
> >Yes, that is what would happen if computers didn't come with a
> >integrated cryptoprocessor to store secrets or something like TPM2, but
> >computers do come with that now.
> >You could require a secret stored in it as apart of the process of
> >unlocking the drive, either deriving a key from both parameters (the
> >key-derived password and the secret in TPM) or having the TPM secret
> >decrypt the configuration that stores the password hash and parameters
> >
> >Since you can't easily mirror data from a TPM chip, especially if it's
> >integrated deep into the CPU, wiping it would render the contents on the
> >drive useless even if they mirrored it beforehand
> >
> >On Thu, Nov 06, 2025 at 10:34:26AM -0500, Chris X Edwards wrote:
> >> I don't really have any true expertise to comment publicly but how
> >> about this:
> >> 
> >> You have an encrypted drive with important stuff on it. There are two
> >> passwords, one is "?LR3*F%@hdQa7Db3d=L7&A27LQ%aAd3aA@?H?adL" and this
> >> unlocks the drive. The other password is "mypassword" and it nukes it.
> >> Simple brute force attempts will be hindered. Though if they're smart,
> >> they are mirroring.
> >> 
> >> Maybe I'm overlooking something. There's always something!
> >> Good luck,
> >> Chris
> >> 
> >> On 2025-11-06 15:38 +0100, techmetx11 wrote:
> >> > Imagine if you were being tortured by people to unlock a hard drive that
> >> > you didn't want them to see the contents of, and so you give them the
> >> > password to hopefully make it so that it wipes the TPM/HSM/etc. of the
> >> > computer and destroy any chance of unlocking the contents, thus making
> >> > their job futile and saving information from ending up on your
> >> > adversaries' hands (even if it meant it cost you your life)
> >> 
> >> -- 
> >> ++++++++++[>++++++++++++<-]>-...<++++++[>>+++++++<<-]>>++++.<+.<++++[>
> >> Chris X Edwards-----<-]>+.- Have a nice day. >.<-.+++++><chris@xed.ch>
> >
> 
> -- 
> Sent from my Android device.
