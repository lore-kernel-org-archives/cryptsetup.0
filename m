Received: from server.novatec-inc.com (novatec-inc.com [24.142.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FC125EFB9
	for <cryptsetup@lists.linux.dev>; Thu, 19 Jun 2025 22:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.142.169.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750373710; cv=none; b=qBWZJvfrnmmwlH7hiEQxVg3nT7g5lxWY1t/g1d+9ZvzijZYi8wKJ7GiO2hfrfp/JCJUTz2/PAFdQqTbNh5/VktQeyHivtapqK3h7iAQ4UTq1mzrKeaLdiLjYV9LO4EiKlxQzEeRM625gruyNHlYyJfMOec3XGcmpmL/ruCuHI1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750373710; c=relaxed/simple;
	bh=ScQHVqTE+Jb5Oe67skZXyIQXvrNefaQrNGneR+1qZpI=;
	h=From:Message-Id:Date:To:Subject:References:In-Reply-To:
	 MIME-Version:Content-Type; b=WKOB6OU+UvIemcwQXf1AUSixtOwb0BmmNhDvtywvhthBZEUYntvoE8rg8cy30OO+mYSwoiLlmL0jn6osntPw1R0C27B14sb4VEYKxTn+jDlVgsuMn2hWKWE4fgqKebBTDXAa3rqGVWyyLpgBFQU5T+zvFcrJUlhkY+OYwqZ/duE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=novatec-inc.com; spf=pass smtp.mailfrom=novatec-inc.com; arc=none smtp.client-ip=24.142.169.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=novatec-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=novatec-inc.com
Received: from server.novatec-inc.com (localhost [127.0.0.1])
	by server.novatec-inc.com (8.18.1/8.17.2) with ESMTPS id 55JMt1Mk027294
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <cryptsetup@lists.linux.dev>; Thu, 19 Jun 2025 18:55:01 -0400
Received: (from mfoley@localhost)
	by server.novatec-inc.com (8.18.1/8.18.1/Submit) id 55JMt0n4027293
	for cryptsetup@lists.linux.dev; Thu, 19 Jun 2025 18:55:00 -0400
From: Mark Foley <mfoley@novatec-inc.com>
Message-Id: <202506192255.55JMt0n4027293@server.novatec-inc.com>
Date: Thu, 19 Jun 2025 18:55:00 -0400
Organization: Novatec Software Engineering, LLC
To: cryptsetup@lists.linux.dev
Subject: Re: Using Windows and bitlocker
References: <202506191557.55JFvYQZ004708@server.novatec-inc.com>
 <70be44da-a130-407e-b529-d6e7ee820b1e@home.arpa>
In-Reply-To: <70be44da-a130-407e-b529-d6e7ee820b1e@home.arpa>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]

On Thu, 19 Jun 2025 21:45:30 Michael Kjörling <152cc69a347e@ewoof.net>wrote:
>
> On 19 Jun 2025 11:57 -0400, from mfoley@novatec-inc.com (Mark Foley):
> > [...] I've downloaded and installed cryptsetup 2.7.5. [...]
>
> Most Linux distributions include cryptsetup in their repositories; you
> should not need to download and install it manually through
> out-of-band means. Using the distribution's packaged version is
> generally better unless you are working on the cryptsetup code; you
> get updates through the distribution's normal update process, and you
> don't risk unknowingly introducing incompatibilities between for
> example the kernel, libcryptsetup, and cryptsetup.

Michael, thanks for your prompt response. My distro (Slackware) does not ship
with cryptsetup, but I built/installed from
https://gitlab.com/cryptsetup/cryptsetup. The build, make and 'make test' all
completed without error. Slackware is pretty generic in terms of kernel and libs.

> > I have a couple of empty partitions ready to test with, and I believe I can set
> > up an encrypted partition using 'cryptsetup luksFormat' and 'cryptsetup
> > luksOpen' per numerous examples I've seen.
> > 
> > Questions:
> > 
> > Is cryptsetup the right choice for Windows/Samba access of entrypted drives/
> > partitions on Linux?
> > 
> > If so, do I need to use BitLocker from Windows?
> > 
> > If so, How do I set that up with cryptsetup?
>
> I'm afraid you are confusing two somewhat different, related concepts,
> and that this is a significant source of your confusion.
>
> Microsoft's Bitlocker, LUKS on Linux, VeraCrypt, and others are
> examples of _full-disk encryption_ (FDE) solutions.
>
> Full-disk encryption is mainly about protecting _data at rest_. The
> typical example is if someone steals a laptop, or an external storage
> device used to hold backups. (It's also useful in other situations, of
> course.)

Yes, that "at rest" thing was something I was suspecting. There is little chance
of someone stealing this server as it is in a secure location behind two locked
entries with keycard, motion detection alarms, etc.

The reason I am investigating this is because our insurer recommended that we
encrypt the sensitive data on this Samba share.

> Once the system is booted and the volume is unlocked, full-disk
> encryption is generally designed to allow access to the storage device
> as if it was not encrypted in the first place. 

One thought that occured to me ...  perhaps a Windows user, for example, might
have to enter the passphrase when mapping this encrypted partition.  But,
regardless of whether bitLocker, LUKS or some other disk encryption mechanism is
used, if a Windows user, or a Linux user on the Samba host, can read/write these
"encrypted" files, I would assume than any malicious actor that would gain
access to either the Windows workstation or the Linux host, would also have
read/write access to these files, unencrypted. Yes?

In which case encrypting would be useless. I think that might go for
exfiltration as well if, for example, a malicious actor acquired scp
credentials. In such a case scp'ing the "encrypted" files would exfiltrate them
unencrypted since, presumably, the credentialled user would be able to
read/write these files in an unencrypted matter. 

Is all the correct?

[snip]

> What you are more likely looking for here is _access control_.

Yes, I already use access controls on files and directories on this Samba share.
But, that means authorized users can access these files. If a malicious actor
gains access to a legitimate user's workstation, he/she can access these files
without problem, right?

If everything I've theorized above is true, it doesn't sound like LUKS, or other
disk/partition encryption is going to be useful.

[snip]

> So, _ignoring_ the tooling: _what's your goal?_ At-rest protection,
> access control during use, or both?
>
> -- 
> Michael Kjörling
> 🔗 https://michael.kjorling.se

As I mentioned, the goal was to satisfy the cyber-insurance provider's request
that we encrypt high-value data.

Currently, only authorized users with Windows domain credential can access the
Samba share, and there are certain folders/files further restricted with ACLs.

The root user has access for the purposes of backup.  The only Linux user on
this system is me, and I am the only one who can log in from the outside world
(restricted in /etc/ssh/sshd_config).  There is also a batch-only user which
does scheduled (cron) file transmission via sftp.  There are countermeasure in
place to detect and block anyone trying to break into the Linux host within 10
seconds of the attempt (and I get notified) -- although logfiles show they've
never actually tried my user ID. 

So, what's the verdict? LUKS is the wrong tool for the job?

Thanks --Mark
