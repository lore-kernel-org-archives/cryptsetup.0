Received: from server.novatec-inc.com (novatec-inc.com [24.142.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC8A19A297
	for <cryptsetup@lists.linux.dev>; Fri, 20 Jun 2025 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.142.169.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434090; cv=none; b=jRw58Qhr3l9rUwbgJ6h/Yn1sCCJ4LzuOZAw+vWH3uyeIlnWTghpditapSE+R9a5GA3TNG8iCFhLOOxf4lTCv7oiqbnmXBSFIFo0iuzA3eH3tgOKY3D5OZ0OojVzUMrFwxElWrn8nwHuGC75uQhKY3SfGtYhIERyzSCZDYQCmNpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434090; c=relaxed/simple;
	bh=Tx+nZyqDSYuG2eaWG/+WlFxwmNz3VeixS74s6UMraXE=;
	h=From:Message-Id:Date:To:Subject:References:In-Reply-To:
	 MIME-Version:Content-Type; b=WNbGPSok38khx2bLoAFCADeyUfr5g4xBT+YW94feIRWd7mSPZfSpRxJYQHIkZyLbyZh4Z3TwpfboOsU99RfQGB9haSRtuJA43mmHNfEk9wmZ233xMVgbCEif/sT+pXFaMqVbxrFYq+KzR/zP9delD3MFsfuzzU0lcJSBQG4hFIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=novatec-inc.com; spf=pass smtp.mailfrom=novatec-inc.com; arc=none smtp.client-ip=24.142.169.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=novatec-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=novatec-inc.com
Received: from server.novatec-inc.com (localhost [127.0.0.1])
	by server.novatec-inc.com (8.18.1/8.17.2) with ESMTPS id 55KFfE9d006969
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 20 Jun 2025 11:41:14 -0400
Received: (from mfoley@localhost)
	by server.novatec-inc.com (8.18.1/8.18.1/Submit) id 55KFfE5C006968;
	Fri, 20 Jun 2025 11:41:14 -0400
From: Mark Foley <mfoley@novatec-inc.com>
Message-Id: <202506201541.55KFfE5C006968@server.novatec-inc.com>
Date: Fri, 20 Jun 2025 11:41:13 -0400
Organization: Novatec Software Engineering, LLC
To: cryptsetup@lists.linux.dev
Subject: Re: Using Windows and bitlocker
References: <202506191557.55JFvYQZ004708@server.novatec-inc.com>
 <70be44da-a130-407e-b529-d6e7ee820b1e@home.arpa>
 <202506192255.55JMt0n4027293@server.novatec-inc.com>
 <758b021e-bf8a-4785-a29e-cbec16fbdb34@gmail.com>
In-Reply-To: <758b021e-bf8a-4785-a29e-cbec16fbdb34@gmail.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]

On Fri Jun 20 09:09:43 2025 Milan Broz <gmazyland@gmail.com> wrote:
>
> On 6/20/25 12:55 AM, Mark Foley wrote:
> > On Thu, 19 Jun 2025 21:45:30 Michael Kjörling <152cc69a347e@ewoof.net>wrote:
> >>
> >> On 19 Jun 2025 11:57 -0400, from mfoley@novatec-inc.com (Mark Foley):
> >>> [...] I've downloaded and installed cryptsetup 2.7.5. [...]
> >>
> >> Most Linux distributions include cryptsetup in their repositories; you
> >> should not need to download and install it manually through
> >> out-of-band means. Using the distribution's packaged version is
> >> generally better unless you are working on the cryptsetup code; you
> >> get updates through the distribution's normal update process, and you
> >> don't risk unknowingly introducing incompatibilities between for
> >> example the kernel, libcryptsetup, and cryptsetup.
> > 
> > Michael, thanks for your prompt response. My distro (Slackware) does not ship
> > with cryptsetup
>
> AFAIK Slackware packages cryptsetup, at least in recent versions.
> While it is one of the oldest distros I know, it is not so generic :)
>
> Milan
>

You're right! I have cryptsetup 2.4.3 installed on Slackware. I didn't even try
checking for it before downloading 2.7.5

I guess "generic" depends on what one is used to. It does use the older rc.d
startup scripts, not systemd, but other than that, I don't find much difference
with e.g. Debian -- although it's been a while since I've used Debian. AFAIK
kernels and modules are not tweaked in any way for Slackware. Having using
Slackware without problems for the past 30 years as NAS servers, domain
controllers, etc., I'll probably stick with it until compelled to change (maybe
when Patrick Volkerding retires). 

Thanks for your feedback.

--Mark
