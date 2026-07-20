Received: from mr5.vodafonemail.de (mr5.vodafonemail.de [145.253.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6364D369D50
	for <cryptsetup@lists.linux.dev>; Mon, 20 Jul 2026 12:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549801; cv=none; b=IMYGdsFOqGQzAzeKbuCqysagioU/92aG9BqkXfbV8IdlxzS17REJsKfJARJkK7x3yhQ1CPtkuNxW7KCOSVKTvSYYLGQapxEEMnfErkXnaZFo/8hfKiqCn9lhdTlTToSjcB3Ye8AVGTNuR1VULFQa8pff0APsDaMMbtEXJi1L3Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549801; c=relaxed/simple;
	bh=gsifjdLQUC+avUj2Ns0iQfOWSOzyYKvDJup04KBA9kU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MDwMN/5/R6LagvCh8tNfjhw5NCc27qsqeAdTqjqqDfi5RODzlhDrSAbVE0Y7G3WlQRHRB8ze/oZzquclA+xy+jNvitSgUm2X8/3OBEiEvOgHUp1cquCB1u8PLJDwPghY4hX/GfR1aaQtlrQOByDvXSeONIGayEmVFzhcO+V5q+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nexgo.de; spf=pass smtp.mailfrom=nexgo.de; dkim=pass (1024-bit key) header.d=nexgo.de header.i=@nexgo.de header.b=i3KpkRBS; arc=none smtp.client-ip=145.253.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nexgo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexgo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nexgo.de header.i=@nexgo.de header.b="i3KpkRBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nexgo.de;
	s=vfde-mb-mr2-23sep; t=1784549779;
	bh=Cue8+V5nWJhb6WRMxmIOu5zPcnn0DoR8vgC+HNCE/IY=;
	h=Date:From:To:Subject:Message-ID:Content-Type:From;
	b=i3KpkRBSH8c/CCn/QNifPdHF3XcPq1FCaP3qPI5Gt5smLmRKNdphIuM9U75VOh2k9
	 E0HwpCea1pK9ACs8wgoiMrB7N4EsCWUZmRPFH71LTlcuUyHAGcwTZu9r6zhNo2lUxT
	 Gr1pl9agnVM3h2PMpZ/tHVHp9enGQQLNRQFs+MiI=
Received: from smtp.vodafone.de (unknown [10.5.0.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr5.vodafonemail.de (Postfix) with ESMTPS id 4h3fcz5YHtz3sWYm
	for <cryptsetup@lists.linux.dev>; Mon, 20 Jul 2026 12:16:19 +0000 (UTC)
Received: from lazy.lzy (p579d7d31.dip0.t-ipconnect.de [87.157.125.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4h3fcz2wWyz92kV
	for <cryptsetup@lists.linux.dev>; Mon, 20 Jul 2026 12:16:16 +0000 (UTC)
Received: from lazy.lzy (localhost [127.0.0.1])
	by lazy.lzy (8.18.2/8.14.5) with ESMTP id 66KCGFDf029151
	for <cryptsetup@lists.linux.dev>; Mon, 20 Jul 2026 14:16:15 +0200
Received: (from red@localhost)
	by lazy.lzy (8.18.2/8.18.2/Submit) id 66KCGFOV029150
	for cryptsetup@lists.linux.dev; Mon, 20 Jul 2026 14:16:15 +0200
Date: Mon, 20 Jul 2026 14:16:15 +0200
From: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
To: cryptsetup@lists.linux.dev
Subject: luks2 + integrity + discard
Message-ID: <al4RjyA894rnZxAK@lazy.lzy>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-purgate-server: smtpa02
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 650
X-purgate-ID: 155817::1784549779-76DD6ABA-D09E4F4C/0/0

Hello,

I'm quite puzzled about the, apparently,
missing support of discard (or trim) in
case of encryption with integrity.

From what I understand, which might be
very wrong, both the encryption layer
and dm-integrity should support discard.

Reading the documentation does not really,
at least for me, clarify what is the
reason why it should not be possible to
have encryption + integrity + discard.

On the other hand, in case of integrity
under the raid, with lvm and luks2 on
top, it seems possible to have discard.

Can someone provide some clarification
on this?

Thanks a lot in advance,

bye,

-- 

piergiorgio
