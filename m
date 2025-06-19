Received: from server.novatec-inc.com (novatec-inc.com [24.142.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE1D235BE1
	for <cryptsetup@lists.linux.dev>; Thu, 19 Jun 2025 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.142.169.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750348663; cv=none; b=STTN7zwYGnFfe4QgKpe5VNpx77uqMGwj8Jq+8ZIa8LhDC1SXNedSV3yyQbsPRS8Jj5zUELAplGDIY+zGofWk7kDryVuljjwRtqgZZThTymEYQX5CHlQCh226bck1sJEeH0y0nOAayrBRvr5T0EV5YMwCSoKoCFzEw/4lRpTx7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750348663; c=relaxed/simple;
	bh=jTjt1uUH1TWgchLyo3Or/o6wleG27D2Wa9Nrk5hdrMo=;
	h=From:Message-Id:Date:To:Subject:MIME-Version:Content-Type; b=fkZL1ynGuT0HmYDRLwFn26zRjUczGLm0KMllrD+4g3wyjCZucrp6qU1puE4SY6lp1ZiQoqFgpBpOosGGlgS6XdqcfYlQQD9Psh4qyuLZ5481yropFu5gOIgjQeVQfblGhj7/agvLb9InvqibXwOzY3ZLKnpWpXJimCoGEIPzNms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=novatec-inc.com; spf=pass smtp.mailfrom=novatec-inc.com; arc=none smtp.client-ip=24.142.169.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=novatec-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=novatec-inc.com
Received: from server.novatec-inc.com (localhost [127.0.0.1])
	by server.novatec-inc.com (8.18.1/8.17.2) with ESMTPS id 55JFvYjT004709
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 19 Jun 2025 11:57:35 -0400
Received: (from mfoley@localhost)
	by server.novatec-inc.com (8.18.1/8.18.1/Submit) id 55JFvYQZ004708;
	Thu, 19 Jun 2025 11:57:34 -0400
From: Mark Foley <mfoley@novatec-inc.com>
Message-Id: <202506191557.55JFvYQZ004708@server.novatec-inc.com>
Date: Thu, 19 Jun 2025 11:57:34 -0400
Organization: Novatec Software Engineering, LLC
To: cryptsetup@lists.linux.dev
Subject: Using Windows and bitlocker
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  2.0 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4101]
X-Spam-Level: *

I have been asked to encrypt files on the office shared drive. After researching
I was pointed to LUKS and cryptsetup.

The shared drive is a Samba shared directory hosted on Linux. Windows users map
this partition on their Windows 11 workstations.

I've downloaded and installed cryptsetup 2.7.5. Linux forum feedback has
advised me that Windows uses BitLocker for security/encryption and that
cryptsetup supports this. The README.md of the downloaded cryptsetup tarball
says at the very beginning:

These formats are supported:
  * **plain** volumes,
  * **LUKS** volumes,
  * **loop-AES**,
  * **TrueCrypt** (including **VeraCrypt** extension),
--> **BitLocker**, and
  * **FileVault2**.

A Google search on this topic gives:

  "BitLocker is a disk encryption feature in Windows, and while you can access
  BitLocker volumes in Linux using cryptsetup with Bitlocker support enabled, you
  cannot create a LUKS volume that is directly compatible with BitLocker. 

  Instead, you would need to choose one encryption method for the partition
  (either BitLocker or LUKS) and then utilize tools like cryptsetup with Bitlocker
  support or dislocker to access the encrypted drive from the other operating system."

I'll confess I don't really understand the above (cannot create a LUKS volume
that is directly compatible with BitLocker? The "Instead ..." bit does not
enlighten me.)

I've read the FAQ https://gitlab.com/cryptsetup/cryptsetup/-/wikis/FrequentlyAskedQuestions,
and the manpage, but there is no mention of using BitLocker and I've found no
examples on how to do this. 

I have a couple of empty partitions ready to test with, and I believe I can set
up an encrypted partition using 'cryptsetup luksFormat' and 'cryptsetup
luksOpen' per numerous examples I've seen.

Questions:

Is cryptsetup the right choice for Windows/Samba access of entrypted drives/
partitions on Linux?

If so, do I need to use BitLocker from Windows?

If so, How do I set that up with cryptsetup?

Thanks --Mark
