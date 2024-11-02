Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se [213.80.101.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D46D380
	for <cryptsetup@lists.linux.dev>; Sat,  2 Nov 2024 23:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.80.101.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730591049; cv=none; b=FFiW3Z7scIzNtRuCyvTyfdbQdpPPrcLAa48zpSGZSgY46ihyEW0NTSRRs050Mlxep3yPVl3DydEptqrGzoeuzPK5zmYpaUA1H7Fa0Gn3H85Mdtlzx4yi9JX9vQ+eIkneTI/jiYPD1rE9HJH/iqBbmafyyxlqnLwNpdBM6OTlBLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730591049; c=relaxed/simple;
	bh=rZ1vx+Rs5kHSPVlrJ98mLSz1XvzayWtOSkUf8YaRrqo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu63d2yYCTatXKdhJRBfdze/ff/1Bqc3XelqGpFsMUEBx2oMJffxS/P2fc1A6m2SVnoNoX0h7yTiHi+igcBOL1Jp6cKVdUyKMFs3Ivj+vc9S8nzRj6Lhm2EHuD1dBEOMQwTDz6UeyK8ACe3w3FhCbUYv/SFZQAOjHJX7ScA+GGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net; spf=pass smtp.mailfrom=ewoof.net; arc=none smtp.client-ip=213.80.101.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewoof.net
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id E9BC73F7C9
	for <cryptsetup@lists.linux.dev>; Sun,  3 Nov 2024 00:36:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: 0.743
X-Spam-Level:
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqfBg5UPqKOz for <cryptsetup@lists.linux.dev>;
	Sun,  3 Nov 2024 00:36:14 +0100 (CET)
Received: 
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 859B23F456
	for <cryptsetup@lists.linux.dev>; Sun,  3 Nov 2024 00:36:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id A73031D002AF
	for <cryptsetup@lists.linux.dev>; Sun,  3 Nov 2024 00:36:13 +0100 (CET)
Date: Sat, 2 Nov 2024 23:36:12 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: device-mapper: reload ioctl ... failed: No such file or directory
Message-ID: <3b73ed3f-44ec-4e37-b32e-632bc030c4da@home.arpa>
References: <1730260948-20104-mlmmj-67cc752c@lists.linux.dev>
 <444a19f7-c557-4b7e-aad9-202a3f2e4876@app.fastmail.com>
 <1b63da83-8290-4d15-8f58-adf5ca6d903a@gmail.com>
 <12f16036-a407-4ca7-9708-1c0f751f5e5d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12f16036-a407-4ca7-9708-1c0f751f5e5d@app.fastmail.com>

On 2 Nov 2024 16:53 -0600, from pelcgfrghczy@punchcutter.ml1.net (David J Iannucci):
>> I expect that you have device-mapper udev rules properly installed.
> 
> I'm not sure - how can I check this? This is a fairly bare-bones Gentoo
> install and I'm not a big expert on everything that I should be, so that
> might have slipped through the cracks.
> 
> But...! I just found something... it seems I am running a systemd-udevd,
> which would not have been my choice... I have taken steps to keep
> systemd completely off my machine, so this is a surprise. Will consult
> Gentoo forums about this.
> 
>> Is there anything in syslog?
> 
> This is what comes out in /var/log/messages:
> 
> Nov  2 16:31:36 linux kernel: loop0: detected capacity change from 0 to 209715200
> Nov  2 16:31:36 linux kernel: device-mapper: table: 254:0: crypt: Error allocating crypto tfm
> Nov  2 16:31:36 linux kernel: device-mapper: ioctl: error adding target to table

Just to rule out the possibility of this being caused by something
about your kernel build settings etc., would you be willing to try
booting a binary, general-purpose distribution like a recent Debian or
Fedora and unlocking the volume from within there, and let us know how
that goes?

The error that shows up in your logs certainly matches Milan Broz's
conclusion earlier: that the problem is during the actual mapping
setup, which happens after passphrase validation.


> p.s. I note that simple reply on this list goes only to the sender
>      rather than back to the list, which is maybe the way the list
>      prefers it? Though in my experience most tech lists like to keep
>      this kind of discussion on the list so that more eyes are on
>      things, and solutions are documented, but if that's not the case
>      here, kindly let me know and I'll use simple reply to individuals
>      from now on.

Overriding the preferences of the original sender as well as making
life more difficult for the person replying is generally not a good
idea. "Reply-To munging considered harmful" was an argument made,
what, two decades ago, or more? Use the "group reply" / "reply to all"
or list reply feature provided by your mail client if you want your
reply to go to the list; use the sender reply function if you want
your reply to go only to the sender of the message you're replying to.

-- 
Michael Kjörling
🔗 https://michael.kjorling.se

