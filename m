Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794008F6A
	for <cryptsetup@lists.linux.dev>; Mon, 26 Feb 2024 01:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.19.178.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708910435; cv=none; b=I5ZrBinoQDCTi6OA9gC+kSuDFKtcqFms68OEXoc6w/+7ipegLqBeyk+ox+L4X/MdLtwlLbjfMEamVdMMO029XUp4AYGm8irW3J10xDPDZAE8F0R3CBxx93Nn8qnv0AoDyY2AitoQcSgMyijVvH8f/wJfWUUDxanMRdq354RDfVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708910435; c=relaxed/simple;
	bh=s/FfoJjR544yoHLevLCJjUp0ZcVKBC/RFOPhAu/T5rY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MU6rx5Q1rigvEwmJl8mWcisaF8RDKnGEQCWRSYHalx5kmln7WmBshtURRLxf4DQQco9K7wT1Hkris/b1oB87h1GJxt3KBucVJR9YoT72o1MpRJRzv8ZvbBB9KHNUZsi44MZWmVnXkKPfNVcPJCOyOpLTCbWMth3L9Fx0xstBwlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info; spf=pass smtp.mailfrom=arnowagner.info; arc=none smtp.client-ip=84.19.178.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnowagner.info
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id A246C14005C
	for <cryptsetup@lists.linux.dev>; Mon, 26 Feb 2024 02:10:21 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 3A90C17A239; Mon, 26 Feb 2024 02:11:18 +0100 (CET)
Date: Mon, 26 Feb 2024 02:11:18 +0100
From: Arno Wagner <wagner@arnowagner.info>
To: cryptsetup@lists.linux.dev
Subject: Re: Partition table instead of LVM inside a LUKS container
Message-ID: <20240226011117.GA15410@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <31fece1e-62ad-4451-8a87-86f08a4dcd10@countermail.com>
 <d9045882cb08f2cf0b09f959f0dca6cee5a26e03.camel@interlinx.bc.ca>
 <fd408ce3-bf49-4dd3-841e-e9fa631de574@countermail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd408ce3-bf49-4dd3-841e-e9fa631de574@countermail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)


On Sun, Feb 25, 2024 at 18:04:58 CET, Mistave wrote:
> On 2/25/24 16:36, Brian J. Murrell wrote:
> > So while I cannot comment on any experience with using partitions
> > inside of a LUKS container, I just couldn't imagine not using LVM.
> > 
> > What is your hesitance to using LVM?
> > 
> 
> I'm only asking for opinions in my quest to learn new things about the
> secluded parts of Linux. My "hesitance" was initially that I wanted to
> remove another layer of complexity and use something simpler than LVM...
> that is assuming the partition layout is performed at system setup and will
> remain static for the lifetime of the device.
> 
> Also, I'm not sure, if GPT partitions are as antiqued as you're making them
> sound like.
> 
> Best regards.

Here is my take: I never use LVM, since I consider it
much more of a problem than a solution. Except for some
automation that tries to do everything the same way, I
do not see any use for LVM at all. 

What I do is partition the basic devive (and no, GPT is 
in no way outdated), and then put LUKS containers
into one or more partitions and filesystems directly
on top of that. Quite enought flexibility for a manual
set-up and if something goes wrong, you actually have a 
resonable chance of fixing things.

Alsaus remember KISS is the very basis of all reliable, 
secure and save design. Do not use a mechanism unless
you really need it. Avoid complexity at all cost. 

Regards,
Arno

 

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
