Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A8570838
	for <cryptsetup@lists.linux.dev>; Sat,  5 Apr 2025 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.80.101.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743875617; cv=none; b=bznQMxe/sP6pcLjS7QBoIC5knrvMV4PqfvzRK6i6wjSr3duZ86FdyPHIx+ySzfNkTm+J9XVWcHnCV5vmeYfMxk+JXDymDQ+819GZKK8UbA7zDMb+p1hp2TdZd6gQsr4R761dC/I1SUPuRahhBp0nd1xWJIASoP4AYXZ+h/35jzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743875617; c=relaxed/simple;
	bh=q0/pgokrqvCLAKbi3OXE0aLueKOEEzTk7y8sJyBS4IA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ke0epGgEHD+541A5N7jTaR3CJIKp4DeWrWnioBjAuJg9pBQwCTSs+RdKaN1d0ocVCuF186BwSsAH7Nd7sySqVr3CUc/3EVLhgBjWAA8rPbKz4eeBC2UqC6ReJDk6OilrIr72Vf1G9m/GIpa0Wq427UMMJrvjTIgKRu58eS8L+uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net; spf=pass smtp.mailfrom=ewoof.net; arc=none smtp.client-ip=213.80.101.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewoof.net
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 04B283F43D
	for <cryptsetup@lists.linux.dev>; Sat,  5 Apr 2025 19:47:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.156
X-Spam-Level:
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XAIvywu759Wx for <cryptsetup@lists.linux.dev>;
	Sat,  5 Apr 2025 19:47:36 +0200 (CEST)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id DB4473F2BC
	for <cryptsetup@lists.linux.dev>; Sat,  5 Apr 2025 19:47:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 7DF491D00227
	for <cryptsetup@lists.linux.dev>; Sat,  5 Apr 2025 19:47:36 +0200 (CEST)
Date: Sat, 5 Apr 2025 17:47:35 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Looking for LUKS GUI
Message-ID: <01aeab8b-341b-4930-bd3e-becf9a42f907@home.arpa>
References: <174386769355.6.1636033258357958528.666033728@passmail.net>
 <174387014408.7.5961259197743680938.666080459@aleeas.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174387014408.7.5961259197743680938.666080459@aleeas.com>

On 5 Apr 2025 16:22 +0000, from darek.hisc@aleeas.com (Darek Hisc):
>> I tried to find Linux GUI install guide, but I can’t find it.
> 
> Try ZuluCrypt https://github.com/mhogomchungu/zuluCrypt

I'm not familiar with ZuluCrypt (looks like it's just a front-end for
creating and mounting encrypted block devices?) but keep in mind that
temporary files can be left scattered around the file system,
particularly in places like /tmp, ~/.cache, ~/.local/state and
~/.local/tmp.

The minimum for a situation like you describe should probably be:

- LUKS for full-disk encryption at the system level _including_ the
  boot loader and kernel
- Optionally separate encryption of different projects' data
- Different, _unrelated_ passphrases for each such container
- Use tmpfs for /tmp
- Use encrypted swap with an ephemeral encryption key
- A drop-by-default firewall configuration
- Always make sure you are running up-to-date software, and be
  _extremely_ restrictive about installing from third-party
  repositories
- Strong, unique passwords/passphrases _everywhere_
- Maintain physical control of the hardware (so that an adversary
  can't, for example, plug in a flush-with-the-port USB key logger
  while you are out for lunch)

Your system might already be configured to do some of this; especially
the last is not about software at all; and this mailing list is the
wrong place to go into depth on how to set it all up. My point is that
although LUKS and full-disk encryption can be an important component,
_just_ LUKS (especially if used only for select data) probably won't
be enough especially if an adversary is able to image the storage.

For passwords and passphrases, I have a web page at
<https://michael.kjorling.se/password-tips/> which is pretty much what
it says on the tin. It's meant to be applicable to and _actionable_ by
the general public; I basically wrote it because I grew tired of
having to repeat it. :-)


>> how really secure LUKS?
> 
> TLDR: This is a golden standard for Linux for many years to encrypt
> FDE (whole disk) in all Linux distributions I know.
> To encrypt files, use ZuluCrypt or VeraCrypt (create containers for files).

Unless you go out of your way to do otherwise, LUKS (via cryptsetup)
uses well-understood industry-standard algorithms, and also includes
techniques to make adversarial key recovery more difficult. (For
example, the "anti-forensic stripes" or AF stripes in the LUKS header
means that even a partially overwritten LUKS header is essentially
useless for gaining access to the contents of the container it is
associated with, often _even if_ you know a valid passphrase.
Exceptions to this exist, but they are highly specific.)

Essentially, if a LUKS container created with modern defaults uses a
strong passphrase, then even for a highly resourceful adversary, it is
believed to be computationally infeasible to gain access to the
contents of that container _without_ actually somehow knowing a valid
passphrase.

Note all the caveats in that sentence, because they _are_ important.

There _is_ a possibility that a weakness would be found in, say,
Argon2 or AES-XTS which would change the security assumptions
underlying LUKS; but personally, I would consider that unlikely, and
if it were to happen, you certainly won't be alone in being in trouble
with regards to data confidentiality.

https://xkcd.com/538/ applies.

-- 
Michael Kjörling
🔗 https://michael.kjorling.se

