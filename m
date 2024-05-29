Received: from smtp.zlima12.com (unknown [45.42.214.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354F3DDA1
	for <cryptsetup@lists.linux.dev>; Wed, 29 May 2024 17:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.42.214.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717005292; cv=none; b=BkmHzKhljMQMJlQhW+astOWlvpEqT9I2nJqNCdhMv7jotlao3Irewf0UYpWW+O+6OOItKhkd1ujSEDDiPZ84JN4jU0kOw09KeD4BGiQyCkoCyd/mlyaPyszbPATLX6BtpzVPdyvPGeIqjbE0X7yM34SAn2egwPt1LAvDR2X7CUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717005292; c=relaxed/simple;
	bh=7Oq4PbN+hdmw7wj34pM47VJX857ina+xNDIH5sweHME=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UYd3Z8UeI4fSRqc/WT5lfeEl0qnUPY/2RIul2/4zR5IMn9R/cUb5KA4TMwWodpa7x85I/0rA2DY9bp97WMX4l7vJmNP6u5CrRjUfWLhX6erACNV7nKdVcKbaiPLcNp4YygoMdOYPflzIU1Gse66kcpu5u+eNl75rXDyJCTwKnmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlima12.com; spf=pass smtp.mailfrom=zlima12.com; dkim=pass (2048-bit key) header.d=zlima12.com header.i=@zlima12.com header.b=cHkjEVlF; arc=none smtp.client-ip=45.42.214.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlima12.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlima12.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlima12.com header.i=@zlima12.com header.b="cHkjEVlF"
Date: Wed, 29 May 2024 13:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlima12.com; s=dkim;
	t=1717004742; bh=7Oq4PbN+hdmw7wj34pM47VJX857ina+xNDIH5sweHME=;
	h=Date:From:To:Subject;
	b=cHkjEVlF5BO5mlOL291zB8g4gBxxf+0Av4aufBR7xzMlmUMc4iiAz7DhfQe7FYb9s
	 xE8//bgEOMAGVARjOCt43bnP+bH89uM36nWxMNWrMiTDcSHqQa1wVbWR9kHuzY/0kO
	 5SWUYLEdf3+t0TEAOBD9m7ijp3clKQFAm2uLo/qn662gjAqP3L+92pv9/PYm2POoA1
	 Uq5X7fab+6vuCjh4uCsgoOrhjJmcZZH5X/CEHPZgT6pAOPbjdVAGSFDxrPBikyQmv+
	 5G2RDu4YcjkmXq+6w1e6+kfBBw6UjYHyOT3sDZTIcYxA2b2AOt6j2NHoK05nYV+p7y
	 HCJeO25qGISvg==
From: "John A. Leuenhagen" <john@zlima12.com>
To: cryptsetup@lists.linux.dev
Subject: Behavior of in-place encryption with --reduce-device-size
Message-ID: <zqmdlvho3du3b7uyldgj4qeqk5ix36o7rmwo44ia2hl6ngmdnl@72qguwtrdma4>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20240425

Hi all,

I was looking at doing in-place encryption on a currently unencrypted
volume, and found that this is supported through `cryptsetup reencrypt
--encrypt ...`. This is great, but I was curious as to how it actually
did this, and the details online were scarce for what could potentially
be a destructive operation.

What is unclear to me is that the LUKS header must go at the beginning
of the device, overwriting any data that might be there. The
--reduce-device-size option suggests that space will be taken from the
end of the device; does this mean that data will be shifted to the right
as encryption takes place? If so, how does this process fare against an
interruption (e.g. SIGINT)? The man page suggests this will be fine, but
I was curious about the details here.

Thanks,
John
