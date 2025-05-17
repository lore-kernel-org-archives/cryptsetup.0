Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832A41DE4FB
	for <cryptsetup@lists.linux.dev>; Sat, 17 May 2025 10:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.19.178.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747478261; cv=none; b=tz8n5i06xgQgPZ69FV9bjc/Q9w5yyD8qkbXR5ZfTYeQS1iHUDzd7vIZRWL8scHkr+QaBvLirrav+g77o8fnCaUohStqPiaI1gr1l33lyXb5dgYsk9gPOtgnJu/i46ag9gAX2T3Ue2UjR9lPcCErI24fui6p87ieP0BDK+24a/bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747478261; c=relaxed/simple;
	bh=nZ+fdO1WQzNe72TIAXma0/uz1eN8BtATojDk3fXhLco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNgS/91J7SbPPtDPW/oBO3nxZAsW8MNlLucCuhHuaPLN7NgJl5cTBLPerekU9PeZMkuBNGFJ0th2M81XpvFpQIVG+b+iPOpmnK8jnJn6jRzGA4c0BY4btqhbEM2Z2xkt8/Eaat4SLICZK3HPurEAUfLW0Nsq94tyHu1K9OUl5xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info; spf=pass smtp.mailfrom=arnowagner.info; arc=none smtp.client-ip=84.19.178.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnowagner.info
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id DC742140094;
	Sat, 17 May 2025 12:30:06 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 5706D17A1A9; Sat, 17 May 2025 12:30:43 +0200 (CEST)
Date: Sat, 17 May 2025 12:30:43 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: Alexander Grund <alexander.grund@tu-dresden.de>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Are there known security issues during creation of LUKS
 containers?
Message-ID: <aChlU6dvZRH8AjIf@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <d936a762-b75b-46b6-9fe7-1652c10afb6d@tu-dresden.de>
 <8a487ad4-b0a7-46ec-9969-d16da7607998@tu-dresden.de>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a487ad4-b0a7-46ec-9969-d16da7607998@tu-dresden.de>

Hi Alexander,

there should not be any issues. AFAIK, everything critical is done in
locked memory and the only things going to disk are the ones that stay 
there.

Obviously, if you have, say, a keylogger active when entering a 
passphrase, that is an issue. But that is not different from
what happens with an exiting container. 

As to documentation, that would be the LUKS specification.

Regards,
Arno


On Fri, May 16, 2025 at 14:29:00 CEST, Alexander Grund wrote:
> Hi all,
> 
> we are planning to use LUKS containers on machines with limited local
> storage but access to a large, but shared file system.
> So far I've only found security considerations for existing LUKS containers.
> 
> Are there any information on issues possible during **creation** of a LUKS
> container?
> I.e. if it is possible for someone with access to files on the file system,
> where the container is being created by `cryptsetup luksFormat`, is able to
> infer any information on the key during the process?
> 
> Can anyone point me to relevant information/research?
> 
> Thanks,
> Alexander Grund
> 



-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
