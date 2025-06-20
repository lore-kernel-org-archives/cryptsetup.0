Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se [213.80.101.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0227FD72
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.80.101.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424120; cv=none; b=Bh/EPk0n+AOIrU8/xDCwE6F7XbJ/pXqflvc+GZL1r75KFpkVlFMwb2mEqTRHLK8YsJOH5K80TKFMjvejQqSLH95I/INQ5bilHxJ5l9sO4x3qUuT0CnYiFt7M/CiGYPNA/m9g7mMtKBTOsURv57VIt4eJ1KMXcQvu2Oiy0b4P+58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424120; c=relaxed/simple;
	bh=2PCvtLb5aXc4xlkr5dwyFUVDe1SC1JFJr62epsy4PdQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5GTGYIuJnf3MUa0/KIORUoIeHBZHV85ACC156wl6kvgqweqFZ1AmVx6+UFPR4H2m9ooBdU0KmmthN3ufDiZKRqcwECokyMsZ56w8gxzGsrKAiJEkE/fwQcpBarDraOgWxBC2D75ua+6w80kGxSgluC3dyOrJAKjUSZw8OyPm6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net; spf=pass smtp.mailfrom=ewoof.net; arc=none smtp.client-ip=213.80.101.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewoof.net
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 7D8713F774
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 14:49:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.156
X-Spam-Level:
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpOOrmk6Bh2i for <cryptsetup@lists.linux.dev>;
	Fri, 20 Jun 2025 14:49:29 +0200 (CEST)
Received: 
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 624E13F3F0
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 14:49:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id BAC071D0017B
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 14:49:28 +0200 (CEST)
Date: Fri, 20 Jun 2025 12:49:27 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Using Windows and bitlocker
Message-ID: <c500224e-4289-4600-96ed-86025015ab9b@home.arpa>
References: <202506191557.55JFvYQZ004708@server.novatec-inc.com>
 <70be44da-a130-407e-b529-d6e7ee820b1e@home.arpa>
 <202506192255.55JMt0n4027293@server.novatec-inc.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202506192255.55JMt0n4027293@server.novatec-inc.com>

On 19 Jun 2025 18:55 -0400, from mfoley@novatec-inc.com (Mark Foley):
> One thought that occured to me ...  perhaps a Windows user, for example, might
> have to enter the passphrase when mapping this encrypted partition.

I don't see any meaningful way in which that would work, at least in
the context of LUKS. Samba would be looking for the contents of the
mounted file system, for which the LUKS container first needs to be
opened; if the file system is not mounted, for example because the
LUKS container has not yet been opened, to Samba the backing location
for the share is just an empty directory and it would appear as such
to remote clients accessing it that way.

> But,
> regardless of whether bitLocker, LUKS or some other disk encryption mechanism is
> used, if a Windows user, or a Linux user on the Samba host, can read/write these
> "encrypted" files, I would assume than any malicious actor that would gain
> access to either the Windows workstation or the Linux host, would also have
> read/write access to these files, unencrypted. Yes?

Correct. LUKS doesn't change who has access and how after the
container is opened. It _does_ protect typically the underlying file
system block device from _meaningful_ access in situations where the
container has not been opened.

(An adversary can of course read out the ciphertext as well as the
LUKS header if the latter is not detached, but having access to those
will generally not allow inferring anything about the actual
_meaningful_ data stored there except _possibly_ roughly how much is
stored and where within the container; assuming in the case of the
LUKS header being available to an adversary that the container uses a
strong passphrase.)


> In which case encrypting would be useless. I think that might go for
> exfiltration as well if, for example, a malicious actor acquired scp
> credentials. In such a case scp'ing the "encrypted" files would exfiltrate them
> unencrypted since, presumably, the credentialled user would be able to
> read/write these files in an unencrypted matter. 
> 
> Is all the correct?

The files would be encrypted _on disk_ (at rest), but when read
through normal means the dm-crypt mapping (set up through cryptsetup
and configured through LUKS) what the file I/O syscalls would provide
is the plaintext data. That in turn is what Samba would expose to
remote clients, being what Samba sees.

LUKS does not offer the kind of granular access control I get the
distinct feeling that you are looking for.


> Yes, I already use access controls on files and directories on this Samba share.
> But, that means authorized users can access these files. If a malicious actor
> gains access to a legitimate user's workstation, he/she can access these files
> without problem, right?

Yes, and LUKS (or any other kind of full-disk encryption itself) would
not change that. From the point of view of the remote server, the
computer would be accessing files using valid credentials.


> If everything I've theorized above is true, it doesn't sound like LUKS, or other
> disk/partition encryption is going to be useful.
> 
> [snip]
> 
> As I mentioned, the goal was to satisfy the cyber-insurance provider's request
> that we encrypt high-value data.
> 
> Currently, only authorized users with Windows domain credential can access the
> Samba share, and there are certain folders/files further restricted with ACLs.

The latter is probably about the best you can do for access control.
You might consider reversing the ACL setup, only allowing access on a
need-to-have basis rather than blocking access to particularly
sensitive data, but that doesn't change the overall argument in this
thread.

LUKS can be used to prevent wholesale access to the data for someone
who gains access to the underlying block device. That can include, for
example, a decommissioned partly-faulty drive which someone might be
able to get their hands on later and send off to a data recovery firm.


> So, what's the verdict? LUKS is the wrong tool for the job?

For access control purposes in a multi-user remote environment, yes, I
would say LUKS is likely not the best tool. Samba's ACLs and
restricting access to the file system the files are stored within on
the server to the user which Samba runs as is probably a better
alternative in the situation you describe.

-- 
Michael Kjörling
🔗 https://michael.kjorling.se

