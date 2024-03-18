Received: from w4.tutanota.de (w4.tutanota.de [81.3.6.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D9208A8
	for <cryptsetup@lists.linux.dev>; Mon, 18 Mar 2024 02:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.3.6.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710728493; cv=none; b=FEhSATRmQGVWEJPMR3K3MDYYkgfQCe0AYzMNrDOA6Q41Q2BtJCa1YFyR3BlAMHvbX/+3anBma2vpCvtrWaOTnI+tBJUL8r4fiKpxukr169jv1yvjkdxYY8vyUY2ERL/NZl++gkI5uY6XAiG4xohhHohQqeAyAuvRZcTwrp6LxJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710728493; c=relaxed/simple;
	bh=QBcj/RGRhMUpukjDA9gscsVYpuxJElmDTJjrGZxNcXU=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=ubUgTeHz8ipjOU6rDKj5QO5LQFhjc0FgAX68wO2wbroBrwrlh2eGa0c4v83Rcy6MMXVIYdarc46612vhIEUxgPV4ssAI7NIT/QZvEJPPZR094GE3u+RZUXXk4yHjFmW/Y1bVg2c1X7B/v5dTt2oOyNCa9OxOiJbyVPWXS/uz038=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grigr.xyz; spf=pass smtp.mailfrom=grigr.xyz; dkim=pass (2048-bit key) header.d=grigr.xyz header.i=@grigr.xyz header.b=aw0UH87F; arc=none smtp.client-ip=81.3.6.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grigr.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grigr.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grigr.xyz header.i=@grigr.xyz header.b="aw0UH87F"
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
	by w4.tutanota.de (Postfix) with ESMTP id 584BF106016E
	for <cryptsetup@lists.linux.dev>; Mon, 18 Mar 2024 02:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1710728489;
	s=s1; d=grigr.xyz;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=QBcj/RGRhMUpukjDA9gscsVYpuxJElmDTJjrGZxNcXU=;
	b=aw0UH87FyCwuuveFtupAOqRAVvCKA8Es9qnvIOXmowoPueygfSXJSjsDrtLTEMHI
	NOm69FkuGDGP/EnoqOmzzxmimjL1yyNVyWZjVXNnGBxBBL5FsJvuGxO9yGSpk4OBw0I
	L7OM7S2oIv+al6TED1G1P2PtcjLo1xzabGipmSA3313zRTPBMbV5i0FvFw8lJijZ426
	7vle1wQkvg9CJWMwE+k5OuF3SyCIt3TzXWcwC+PKq7yD31wTS9zY4yz9ARUPDmdAcB7
	vrhRrzzZMphzEOo1NQviBQGl7U3bqqdSQObJ5pml4azG4wR0VvNjU1JPHM4KG2hdJvP
	cppNwJ1ETA==
Date: Mon, 18 Mar 2024 03:21:29 +0100 (CET)
From: Nikolai Grigoriev <nikolai@grigr.xyz>
To: Cryptsetup <cryptsetup@lists.linux.dev>
Message-ID: <NtEMHPl--3-9@grigr.xyz>
Subject: OPAL setup for a new drive without sedutil initial setup
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I was about to set up a new machine and I was about to use OPAL the "old" w=
ay. And then I discovered that cryptsetup now supports OPAL! Thanks :)

However, something is not clear to me from the documentation. When I tried =
"luksFormat", I was prompted for both passphrase and OPAL Admin password.=
=C2=A0 For the former it is clear, this is the passphrase for LUKS2 itself.=
 However, I never configured OPAL on this drive, thus, it does not have an =
Admin1=C2=A0 password (and SID) set at all.

Does it mean I still need to=C2=A0 use "sedutil-cli=C2=A0 --initialsetup" b=
efore using cryptsetup or...or I do not understand what=C2=A0 is expected :=
) The documentation seems to suggest that this password needs to be provide=
d only when initial setup was=C2=A0 done. Should I enter an empty one then?=
 And if so, what my actual Admin1 password will be after setup is complete?

Thanks!
--
Nikolai Grigoriev
