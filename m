Received: from mail-108-mta93.mxroute.com (mail-108-mta93.mxroute.com [136.175.108.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BC4134BD
	for <cryptsetup@lists.linux.dev>; Thu, 26 Sep 2024 11:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727351043; cv=none; b=qJ2tZGassLv4cQoMR3i02fh4hGrC5SawzuYNQlk50iy4jG/Ugse2wODPGYQccbMwNqgfTzAMCuuS90lBiiZ0QAOuQVs7N3S6SNhsnVLmLJCaEjW/Sgn/Zd7r0NpxsSMkap2JA0nYyxDh2zu5dTdZMa77o3ebBXZduVqVH2VdVGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727351043; c=relaxed/simple;
	bh=c7RcQDJhbjcNEZ+C89UNTYy+Nr5N/rzAm12U8r2jYXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rzml2qzTpfBu1YHatXf0uHPjmxd3HXn8iKD5Udk1ifvmQNpMr1ZiJvp9jVR5DVxFL+0hMlRsgvZR7EcrzhGG/ISmbj1ivdDC8ITYXNzGGGBTFQeqeUuWjHANBk5KHNFudUxOEe6n/LysBPTuP37SJdunAdTQdSuDiRkRb+nWOpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=esrevart.net; spf=pass smtp.mailfrom=esrevart.net; dkim=pass (2048-bit key) header.d=esrevart.net header.i=@esrevart.net header.b=axg1TMsK; arc=none smtp.client-ip=136.175.108.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=esrevart.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esrevart.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=esrevart.net header.i=@esrevart.net header.b="axg1TMsK"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta93.mxroute.com (ZoneMTA) with ESMTPSA id 1922e20731f0003e01.001
 for <cryptsetup@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 26 Sep 2024 11:38:51 +0000
X-Zone-Loop: 7be79d1a9d6861049db450303d68b6ecacc9ae455077
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=esrevart.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=85kc3xCDTFgcEk2jVbb8kvPN0eh96x2Cyx3wGsi3WAo=; b=axg1TMsKh+dSgcVF2e15sP7dov
	bXbk65+2z+T1kdL7TcR71m+3NPN0+okEoCQGR4gU5xfoTzMrJQ0jH06BZNbQGobu66ph6pvBNbu/P
	B/vrHhYZWXcEerxM/H2vuBp5poZlh5WDHZEFJ4iQLcDtHQ5uRJkpDXX6lvIDhIaTrJo93oCBk3xma
	lu3SQZloHnds7k0VI3Ozfgi7clqwV1g82tn6EQkxMyBGrRQuD1muxjjnWgKmL2Gji/Zh3c0IfXL2Y
	l8DBIj4h3NjgOOcR0cxrrPzaaAraqLqnAdnjgsvBeZuxTUTl4EyJrOoBjhHCM8LG+Q/LczLvci9zV
	fWHUS2hA==;
Message-ID: <36293944-c584-4b90-81c7-3c422855eef8@esrevart.net>
Date: Thu, 26 Sep 2024 13:38:49 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: labeling drives, related to the file system choice
To: cryptsetup development <cryptsetup@lists.linux.dev>
References: <172728197032.7.12095949214977275668.444357846@slmail.me>
Content-Language: en-US, fr-FR
From: Bastien TRAVERSE <neitsab@esrevart.net>
In-Reply-To: <172728197032.7.12095949214977275668.444357846@slmail.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: contact@esrevart.net

[Forgot to cc' the list when I replied yesterday, copying the reply here 
so people know this has been answered]

Hi phil,

 >1. where is the best place to find all the documentation around 
cryptsetup, the commands,

If you check out the project's homepage[0], you will find a handy 
section called "Help!" which starts with "Documentation". The first 
resource linked there is the FAQ[2] which I do hope you have already 
read, and the third mentions the "manuals (aka man page, man pages, 
man-page)".

Those manuals constitute the reference documentation for all cryptsetup 
commands (as well as all Linux commands generally speaking), and are 
thus the best place to read up on it. I like using the Arch Linux 
manpage portal[2] to browse them, because they are nicely formatted and 
generally as current as can be.

 > various file systems and related flags

Cryptsetup is independent of any particular filesystem. It sits at the 
block layer, underneath the FS. As such you won't find much information 
about file system usage here, and are better advised to check with the 
relevant communities or on general purpose forums like your distro's.

 > and any helpful information for someone learning.

The Arch Wiki is a well-regarded source for end-user focused advice on 
how to use something on Linux. Start with [3] and go down the rabbit 
hole from there.

By the way, there you'll find great articles about filesystems too, and 
e.g. the Btrfs one mentions how to label the FS in its default 
FS-creation example.[4]

 >so, i'm seeing that this -n flag corresponds to using mkfs.exfat alone?

All those commands have their own manpage, which will teach you all the 
option flags that can or cannot be used with them and their meanings. 
Option flags differ between filesystems yes, despite the similar `mkfs.` 
prefix.

 >so, IS THERE A WAY TO LABEL DRIVES USING OTHER FILESYSTEMS, in 
particular BTRFS?
 >i've not found any docs online showing this, and it's quite specific.

See the aforementioned ArchWiki Btrfs link.

By the way, writing in uppercase is generally read as equivalent to 
shouting and frowned upon as such, so for your future participation in 
online forums I suggest you refrain from it... Except when you do want 
to shout (but then be ready to bare the consequences ;-))

 >3. lastly, how important is the mount folder? [...] so it doesn't 
really matter?

Yup, no importance whatsoever, at least insofar as cryptsetup is 
concerned. It does matters from a system administration perspective, 
e.g. the rights needed to mount and access the directory have to be 
considered depending on your use case, but it doesn't impact the way 
cryptsetup works (to the best of my knowledge at least).

 >thanks for reading.
 >appreciate any advice to these 3 queries.

Pleasure, happy hacking and good exploration to you phil!

-- Bastien

[0]: https://gitlab.com/cryptsetup/cryptsetup
[1]: https://gitlab.com/cryptsetup/cryptsetup/wikis/FrequentlyAskedQuestions
[2]: https://man.archlinux.org/search?q=Cryptsetup&go=Go
[3]: https://wiki.archlinux.org/title/Dm-crypt
[4]: https://wiki.archlinux.org/title/Btrfs#File_system_on_a_single_device
