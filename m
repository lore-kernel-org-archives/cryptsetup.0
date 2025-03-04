Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45561264620
	for <cryptsetup@lists.linux.dev>; Tue,  4 Mar 2025 17:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.19.178.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109788; cv=none; b=M3/jOfDwOImjmY1OFFgVKF42LzZ42xN6VlLq15g7mhbZKs61cUBGjlLGkoFXTYhc3hfbo/hHvXOcPNQt1r4oRmiF+HKWQhbgNFonaj74ik7OYghxWRq2IE3DccWFIlQhBxrktaDCOw9j6jmS3d9E6q2NAKJ5xDYwl6+yiBfEoHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109788; c=relaxed/simple;
	bh=WqPsq0TYC22zA89a6945NqqwtDpFsy+Hf8QUpKWVC+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/+uGBGS5lMf/WKB5Zm0dLdvQs6W5o8HR3QaB/bLL9+ekxw0uT8lHlhiM/xHG2glDz8hw7IEmoalHtdg2nZRTf1yg0EosCO1JVL8sIuFf7R6xJikTclOY/gCr646n3HRoflk7c1iAY/gOmHbKfnc7CAqLEexDLHb1oKVy+Ac+4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info; spf=pass smtp.mailfrom=arnowagner.info; arc=none smtp.client-ip=84.19.178.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnowagner.info
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id A5F7814004D;
	Tue,  4 Mar 2025 18:28:25 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 9E17417A1CA; Tue,  4 Mar 2025 18:28:49 +0100 (CET)
Date: Tue, 4 Mar 2025 18:28:49 +0100
From: Arno Wagner <wagner@arnowagner.info>
To: Christoph Anton Mitterer <calestyo@scientia.org>
Cc: Dirk Nichterwitz <dnichterwitz@m4com.de>, cryptsetup@lists.linux.dev
Subject: Re: Boot with encrypted disk but only with USB Stick
Message-ID: <Z8c4UYAPMufG3viH@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <01a001db8cee$fc0f5550$f42dfff0$@m4com.de>
 <8e675198233bd0fa461bd66fafcd37506f5e20c9.camel@scientia.org>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e675198233bd0fa461bd66fafcd37506f5e20c9.camel@scientia.org>

On Tue, Mar 04, 2025 at 14:07:47 CET, Christoph Anton Mitterer wrote:
> On Tue, 2025-03-04 at 11:19 +0100, Dirk Nichterwitz wrote:
> > I addes a
> > keyfile on a usb stick and this works to boot automaticaly when
> > plugged in .
> > But ist her a way to configure the system to only boot with stick ?
> > because
> > if i unplug the stick the system ask für passphrase.
> > 
> > But i want a system only works with stick and no way to do a other
> > boot.
> 
> Not sure what exactly you want:
>  
> You can simply install your bootloader, kernel and initramfs on the USB
> stick (along with any keys needed for decryption).
> 
> Most BIOSes/UEFIs support booting from USB.
> 
> That way, an attacker cannot mess with these parts, which would
> otherwise be completely open.
> Of course a powerful enough attacker could still replace your firmware.
> And of course this only makes sense if you then keep your USB stick
> with you "all the time".

I did a scenario where the boot-stick was in a safe 
woth limited access in an office.

That was a special case with a hard-coded disc-encryption 
password that was only on the stick. The idea was that 
a trusted non-IT person could reboot the server if needed
and then lock up the stick again. The implementation was
via a custom initrd, which is really not that hard to do.
Essentially you just change the boot-script called by
init in there. (No idea what Systemd requires though, I do
not use it.)

Arno 
-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
