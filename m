Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE29730E85D
	for <cryptsetup@lists.linux.dev>; Thu, 19 Jun 2025 21:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.136.2.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750369971; cv=none; b=kBsxqDkxdqmZwIHk+zBY0cKtj5VJYWsSv2njih1j+gsD3+tePeJIDY9US75J5IWD/IOdj0lhxCA3VxZfD7tulkNwjz2sCzzLKYPExW8dP0+7ed2V9aTUxs6ygKS5xNe2OhJ4WRBn4z6ri7xe0qL6JciltPxWFu6FraedZbMzMAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750369971; c=relaxed/simple;
	bh=81m8qNKYzR5NKAVTAy4xK8/VB2T9efc7oDMgAlVCywE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jh67R4DDTyMqnI3l39bi2hhumyE0F74IRX1J017Ma3BOOsFfqfC0CJTOhQfG3IYB2T9nBZCMgIKIqAiLQM/QZd6SvjwmVXAnuruauLwvG65WeM6DrJJZjzaLb2tlWZ5Jw/AuO42srFz5fIiC5kg5W8/6T4Zs+gVmyq6UmOz3gsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net; spf=pass smtp.mailfrom=ewoof.net; arc=none smtp.client-ip=79.136.2.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewoof.net
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 73C4D4048D
	for <cryptsetup@lists.linux.dev>; Thu, 19 Jun 2025 23:45:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: 0.744
X-Spam-Level:
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2TltkH2mTR5N for <cryptsetup@lists.linux.dev>;
	Thu, 19 Jun 2025 23:45:32 +0200 (CEST)
Received: 
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 61A2A402A9
	for <cryptsetup@lists.linux.dev>; Thu, 19 Jun 2025 23:45:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id B4F4A1D004F1
	for <cryptsetup@lists.linux.dev>; Thu, 19 Jun 2025 23:45:31 +0200 (CEST)
Date: Thu, 19 Jun 2025 21:45:30 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Using Windows and bitlocker
Message-ID: <70be44da-a130-407e-b529-d6e7ee820b1e@home.arpa>
References: <202506191557.55JFvYQZ004708@server.novatec-inc.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202506191557.55JFvYQZ004708@server.novatec-inc.com>

On 19 Jun 2025 11:57 -0400, from mfoley@novatec-inc.com (Mark Foley):
> [...] I've downloaded and installed cryptsetup 2.7.5. [...]

Most Linux distributions include cryptsetup in their repositories; you
should not need to download and install it manually through
out-of-band means. Using the distribution's packaged version is
generally better unless you are working on the cryptsetup code; you
get updates through the distribution's normal update process, and you
don't risk unknowingly introducing incompatibilities between for
example the kernel, libcryptsetup, and cryptsetup.


> I have a couple of empty partitions ready to test with, and I believe I can set
> up an encrypted partition using 'cryptsetup luksFormat' and 'cryptsetup
> luksOpen' per numerous examples I've seen.
> 
> Questions:
> 
> Is cryptsetup the right choice for Windows/Samba access of entrypted drives/
> partitions on Linux?
> 
> If so, do I need to use BitLocker from Windows?
> 
> If so, How do I set that up with cryptsetup?

I'm afraid you are confusing two somewhat different, related concepts,
and that this is a significant source of your confusion.

Microsoft's Bitlocker, LUKS on Linux, VeraCrypt, and others are
examples of _full-disk encryption_ (FDE) solutions.

Full-disk encryption is mainly about protecting _data at rest_. The
typical example is if someone steals a laptop, or an external storage
device used to hold backups. (It's also useful in other situations, of
course.)

Once the system is booted and the volume is unlocked, full-disk
encryption is generally designed to allow access to the storage device
as if it was not encrypted in the first place. With LUKS, this is done
through Linux device mapper dm-crypt mappings, controlled using the
cryptsetup tool and its underlying libcryptsetup library. (Bitlocker
is a bit of a hybrid as it integrates with NTFS file encryption and
access control on supported Windows systems as well as typically use
the system TPM for transparent volume decryption.)

Using full-disk encryption _provides the capability_ to ensure that if
someone for example steals the file server, the thief won't be able to
access the files stored on it because they cannot open the volume.
Without the key material, it looks like random data; there is no way
to know whether that data represents a design for a new fighter jet or
a photo of a kitten.

What you are more likely looking for here is _access control_.

Access control works on a directory/folder or file level, and is about
which authenticated users (if any) can access which directories or
files. Windows ACLs and Unix-style file permissions are examples of
how access control can be manifested.

Access control in an environment like you describe can be configured
for example by restricting certain shares in Samba to certain users or
groups, depending on who should have access to what. (It's been ages
since I did anything of the sort, and this mailing list is the wrong
place to discuss how to do that.) The Samba server software will then
(assuming it is implemented and configured correctly) enforce those
restrictions on any accesses through it. However, Samba needs to be
able to read (and write, if anyone has write access) everything for
this to work.

Correspondingly, Samba essentially doesn't concern itself with the
underlying storage stack, including LUKS; it operates on directories,
which may be a part of one, all of one, or contain a combination of
several file systems.

So, _ignoring_ the tooling: _what's your goal?_ At-rest protection,
access control during use, or both?

-- 
Michael Kjörling
🔗 https://michael.kjorling.se

