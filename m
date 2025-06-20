Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271B030E853
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 19:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.80.101.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750448949; cv=none; b=q6lIh3ucS7C+nJGDWRC9UQbM7O+LhZbYA+8EaWHAgdK/QWKI6fEFK+k/wb/FvTglUoIx2V3PcVNj041J5bS4D56QsfmwFUlSdwD6n4/OwBwTdPqq2SpZICFCWEoDGpfi/dyNSnIu5xsmmOyFO5f2LOYjP8ro/jTB3R/kEkUjUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750448949; c=relaxed/simple;
	bh=KEvDKPps6N3aBjJWwoLZ+DFqhGvJJIAYji4qkVFE23s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGgXWp8c0aOvrKs0sF8SdOMtc+uvC1/0e1CiPYk6Bi9agsT8MkZLfTmjTfaxHW5P4y06V/DoY4raRn7/yY9i5OkwOwcP2nmYH/VQfzkOgtT3Hc0uJFSkpdYEQ6tnuQei7pHzvJDfV8kZK2s9vGGvdrMzHv1+jTjurcP3nMi7DOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net; spf=pass smtp.mailfrom=ewoof.net; arc=none smtp.client-ip=213.80.101.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewoof.net
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 8323B3FA6F
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 21:38:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.156
X-Spam-Level:
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcMnD3AzKbDu for <cryptsetup@lists.linux.dev>;
	Fri, 20 Jun 2025 21:38:56 +0200 (CEST)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 643A03F7B4
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 21:38:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id B2C061D0017B
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 21:38:55 +0200 (CEST)
Date: Fri, 20 Jun 2025 19:38:54 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Luks encrpted disk with a blake2b checksumed btrfs fs is better
 than cryptsetup --integrity option ??
Message-ID: <748b39c5-866b-4e10-99f9-5e657c95171c@home.arpa>
References: <s2jv1MM1-zykYSRK4j97B_Oz8nW5eHLcm4JTd55UqrAJOVkrvsFhD274SNM_XsvedduP9LKWtjJdGNl5ZGd9b2eh9ihW4j4-2xMGlbJpBs8=@proton.me>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <s2jv1MM1-zykYSRK4j97B_Oz8nW5eHLcm4JTd55UqrAJOVkrvsFhD274SNM_XsvedduP9LKWtjJdGNl5ZGd9b2eh9ihW4j4-2xMGlbJpBs8=@proton.me>

On 20 Jun 2025 18:58 +0000, from improve9406@proton.me:
> Here is a quote from the dev in the gitlab issue :
> 
>> If you are using AES-XTS and a cryptographic hash for the checksum (such as SHA2 or Blake2b), this should (barring filesystem bugs) provide integrity protection.  In fact, it will provide vastly stronger protection than dm-integrity can, because it does protect against replay attacks due to the CoW nature of the filesystem: my understanding (which could be mistaken!) is that the whole filesystem is a Merkle tree rooted at the superblock.  At least theoretically, dm-crypt + ZFS or BTRFS + SHA-2 or Blake2b hashes should be safe against an outright malicious block device.  By “should”, I mean that I would consider it to be a security vulnerability if the attacker could do anything other than roll the entire device back to an earlier version.  Of course, the ZFS, BTRFS, and dm-crypt developers may disagree
> 

Better for what use case?

-- 
Michael Kjörling
🔗 https://michael.kjorling.se

