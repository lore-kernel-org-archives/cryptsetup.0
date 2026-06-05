Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EF870808
	for <cryptsetup@lists.linux.dev>; Fri,  5 Jun 2026 17:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.239.18.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679493; cv=none; b=NSE9RepQ/aXDl2lrhhtGfO6QPtob5UaqnCYanbxHJavgpJol1uzh4XBOG/PEwgf92GMYPLXOlCv03V9wefqP/DDNMbYvlFgAEDs6GnZSIjQRG6/H2Lp3aAG/DvRpv7+B1fEVifCEd8a/nK99xlTlVFz1kQC68Is6YV9g9nV4LGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679493; c=relaxed/simple;
	bh=ukeHJyLEDKyjswLRPIjlTSTDibKoJ7zfVnJ/uMdCVyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwRKEQ+OO/trk/CGg4iQw1m4zbkQC/ZlVCerw8kI146LWh0Ida1yhqaTNJk918H2MsWnBJUpSvn4ff9a8YffjAZDhumLD/PgIWVcsRAxygbrilfDeWxtZOswUqQ6aq7hnhFVtvKb+A7lB1icmmwBepvpVkWKMTKni8NWSp6S7T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ac2.se; spf=pass smtp.mailfrom=ac2.se; dkim=pass (1024-bit key) header.d=ac2.se header.i=@ac2.se header.b=im6XtvSP; arc=none smtp.client-ip=130.239.18.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ac2.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ac2.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ac2.se header.i=@ac2.se header.b="im6XtvSP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id B45C044B90;
	Fri,  5 Jun 2026 19:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ac2.se; s=default;
	t=1780679480; bh=ukeHJyLEDKyjswLRPIjlTSTDibKoJ7zfVnJ/uMdCVyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=im6XtvSPAFbLE1ZaXJlKVDwaXOQeAcURJk0PAIsjYAWomWL/BIE8Cb1ifPa6/3uRa
	 Qmncsqfoihwk6Z2WVqIJE6Lsn+XmHORt8NDMfJjTByg2mWXmhXxFdOBYEep2n9QGxV
	 Myn/RoImAylXo3MSw9YM8P65nMMzWDNtk4Ih7SJY=
Received: by mail.acc.umu.se (Postfix, from userid 24471)
	id 895B444B91; Fri,  5 Jun 2026 19:11:19 +0200 (CEST)
Date: Fri, 5 Jun 2026 19:11:19 +0200
From: Anton Lundin <glance@ac2.se>
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup development <cryptsetup@lists.linux.dev>
Subject: Re: [PATCH] Add mbedtls to PKGMODULES
Message-ID: <aiMDN4xWore5ymZo@accum.se>
References: <20260601203701.1740656-1-glance@ac2.se>
 <6251d03b-d923-4d64-87a3-1e5aa13c5e94@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6251d03b-d923-4d64-87a3-1e5aa13c5e94@gmail.com>

On 02 juni, 2026 - Milan Broz wrote:

> Hi,
> 
> I added the patch to MR for review
> https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/931
> 

I was trying to figure out what the projects workflow was, and it looked
like there were both patches on the mailing list and MR's on gitlab, and
due to me not having a gitlab account since earlier it was just easier
to send it to the ML.

Thanks for the review and merging the code.


//Anton


> On 6/1/26 10:37 PM, Anton Lundin wrote:
> > When cryptsetup is built with --with-crypto_backend=mbedtls, the
> > pkg-config file for libcryptsetup should include mbedtls.
> > ---
> >   configure.ac | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/configure.ac b/configure.ac
> > index 52ddf11b..260b0ab6 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -741,6 +741,7 @@ case $with_crypto_backend in
> >   	openssl) PKGMODULES="$PKGMODULES openssl" ;;
> >   	nss)     PKGMODULES="$PKGMODULES nss" ;;
> >   	nettle)  PKGMODULES="$PKGMODULES nettle" ;;
> > +	mbedtls) PKGMODULES="$PKGMODULES mbedtls" ;;
> >   esac
> >   if test "x$enable_libargon2" = "xyes"; then
> >   	PKGMODULES="$PKGMODULES libargon2"
