Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A5F3F6C2D
	for <cryptsetup@lists.linux.dev>; Mon, 29 Jun 2026 18:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.19.178.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782758767; cv=none; b=iqavzL5ubvEAl8nt5HAEqltyLkLGAuiJY5ohRrAdissYXRerEJ8/1xwedX98KP/ERNRRWLdMEE05W4x08xZV6nf7qvkM7ccuLRahBpKv8pZjf1btlFotX2uiLr4MgfY3L/2crLhZcypwWmRCKuvXU5A+MW27XPU4ATuXs64t4Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782758767; c=relaxed/simple;
	bh=dB3IIueXNVSARJc4MD6iZsWvHMDewJsqP+5eR+SRb2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/QK9UgRvU1tbrzh9Ox1PSH98ywq3oDvCafs8I887AeF9MHNeObOSH9AhawUqJrrapcW6Fz6RUNjaZWMv6b8lfBm5OGNvvN7BiSrzQ95+P8cyqfb1gxuaYWAZQsrDI1iIFvENbjr/8OoV9ETKz1V71tT1qeREhln5+uzrkfGtcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info; spf=pass smtp.mailfrom=arnowagner.info; arc=none smtp.client-ip=84.19.178.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnowagner.info
Received: from gate.tansi.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 3C605140057;
	Mon, 29 Jun 2026 20:38:42 +0200 (CEST)
Received: by gate.tansi.org (Postfix, from userid 1000)
	id 1288117AD26; Mon, 29 Jun 2026 20:40:42 +0200 (CEST)
Date: Mon, 29 Jun 2026 20:40:42 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: Milan Broz <gmazyland@gmail.com>
Cc: cyper@tutanota.com, Cryptsetup <cryptsetup@lists.linux.dev>
Subject: Re: [feature] PQC KEM
Message-ID: <akK8KlVr8s3ZHdvb@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <OwJ5x3r--N-9@tutanota.com>
 <eeba13d0-3337-4213-8751-53de0838c474@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eeba13d0-3337-4213-8751-53de0838c474@gmail.com>

On Mon, Jun 29, 2026 at 18:42:03 CEST, Milan Broz wrote:
> On 6/29/26 6:27 PM, cyper@tutanota.com wrote:
> > Interested in introducing a new LUKS2 "xwing" keyslot type unlocked by an X-Wing
> > post-quantum hybrid KEM (ML-KEM-768 + X25519, draft-connolly-cfrg-xwing-kem)
> > instead of a passphrase to encrypt the kek (volume key)?
> > 
> > 1) asymmetric model won't shine in single user case but will be attractive in multiple user/image enrollment cases.
> > 2) if per-device fresh wrapping key is desired
> > 
> > 
> > I've implemented such keyslot type and tested.  But don't know if the aforementioned two cases is worth discussion.
> 
> This is typically something that should be done through LUKS2 external token while keeping keyslot
> encryption as it is defined in LUKS. (Maybe you did it that way, no idea.)
> 
> Anyway, what security issue this solves (except "it is PQC")?

That seems to be the key question. 

Also refer to https://www.cs.auckland.ac.nz/~pgut001/pubs/bollocks.pdf

Arno

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
