Received: from mr3.vodafonemail.de (mr3.vodafonemail.de [145.253.228.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B06373463
	for <cryptsetup@lists.linux.dev>; Mon, 20 Jul 2026 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579792; cv=none; b=INxEZQQ8VmXzsGtCOuGn/524PkuXt3VCw7W/RsrnCr31j0Sd5zrJVtf9mEGs4Ez2GDDYXaIxN3CUGcr8b1hgkx+KILFNy0AmvRimeEjX5rKqJs06M0+GGtzrYkcj6doVmqia2PCtUnij5FnevIPr1Gs5pnbx561ppdOme8GoMEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579792; c=relaxed/simple;
	bh=SfIzfb06XIgshsftDVXuD8OHIlJe6RhL07FJDRLhpdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMvagu6j9y2acPTaeXEXDaHJTuTawqXqj39Tf8KilnPW+TrPT6bND+s8g3tRpV3+s4QcZB7i8wJ1B/gB9h/qtWXCPRqmADo1uFFYLrpnKdzEe/Omjp4q6lHTwgRtmNkm4qRUHCTxclAQnaPFw7fm0NkDG02polQias6FFk9Qsyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nexgo.de; spf=pass smtp.mailfrom=nexgo.de; dkim=pass (1024-bit key) header.d=nexgo.de header.i=@nexgo.de header.b=lmBn8B72; arc=none smtp.client-ip=145.253.228.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nexgo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexgo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nexgo.de header.i=@nexgo.de header.b="lmBn8B72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nexgo.de;
	s=vfde-mb-mr2-23sep; t=1784579780;
	bh=fTSDxKhYybHpcb+EqDVrH1dMV5IANMXuG3iMVzaz2AM=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 In-Reply-To:From;
	b=lmBn8B72lsroPg/jVH3kxi9Zu5989ajw6xfmCJq6kS0MaT9xH/gNZq0gVv/MZMqss
	 jvlysGVIesFCLnB/rY54SDVsbH5XYx7daPYg6+xvqx8+zaEWc4K9kZIoIc5l1KKJl4
	 cQaufHKd/knt8NDXM5/MOlMmK3M+G0jXVyahQ+QM=
Received: from smtp.vodafone.de (unknown [10.5.0.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr3.vodafonemail.de (Postfix) with ESMTPS id 4h3sjw2z1vz3sVVL;
	Mon, 20 Jul 2026 20:36:20 +0000 (UTC)
Received: from lazy.lzy (p579d7d31.dip0.t-ipconnect.de [87.157.125.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4h3sjp08Rtz8sZj;
	Mon, 20 Jul 2026 20:36:11 +0000 (UTC)
Received: from lazy.lzy (localhost [127.0.0.1])
	by lazy.lzy (8.18.2/8.14.5) with ESMTP id 66KKaAqT076893;
	Mon, 20 Jul 2026 22:36:10 +0200
Received: (from red@localhost)
	by lazy.lzy (8.18.2/8.18.2/Submit) id 66KKaAxm076892;
	Mon, 20 Jul 2026 22:36:10 +0200
Date: Mon, 20 Jul 2026 22:36:10 +0200
From: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
To: Milan Broz <gmazyland@gmail.com>
Cc: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>,
        cryptsetup@lists.linux.dev
Subject: Re: luks2 + integrity + discard
Message-ID: <al6GuqYni-QF3aEV@lazy.lzy>
References: <al4RjyA894rnZxAK@lazy.lzy>
 <1ddcf551-ae22-4677-9910-37aee6895422@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ddcf551-ae22-4677-9910-37aee6895422@gmail.com>
X-purgate-server: smtpa05
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 1617
X-purgate-ID: 155817::1784579780-F8B2F72E-701709D7/0/0

On Mon, Jul 20, 2026 at 10:28:27PM +0200, Milan Broz wrote:
> On 7/20/26 2:16 PM, Piergiorgio Sartor wrote:
> > Hello,
> > 
> > I'm quite puzzled about the, apparently,
> > missing support of discard (or trim) in
> > case of encryption with integrity.
> > 
> >  From what I understand, which might be
> > very wrong, both the encryption layer
> > and dm-integrity should support discard.
> > 
> > Reading the documentation does not really,
> > at least for me, clarify what is the
> > reason why it should not be possible to
> > have encryption + integrity + discard.
> > 
> > On the other hand, in case of integrity
> > under the raid, with lvm and luks2 on
> > top, it seems possible to have discard.
> > 
> > Can someone provide some clarification
> > on this?
> 
> Discard (TRIM) is supported for dm-integrity
> standalone mode. It is also supported for dm-crypt
> standalone.
> 
> It is not supported for stacked dm-crypt over dm-integrity
> (In authenticated encryption mode where dm-integrity only provides
> interleaved metadata sectors for dm-crypt.)

Thanks for the answer.

I was curious about the technical reason
for this.
Why the stacked mode should not made
possible the discard.
Is this because they're "interleaved"?
Could explain or point out to some
explanation of what is intended with
"interleaved"?

> (And it never will be implemented for this case.)

Well, is this because is too complex or
for some other reasons?
I mean, SSD are more and more common,
giving up discard seems a bit of a problem.

Thanks again,

bye,

-- 

piergiorgio
