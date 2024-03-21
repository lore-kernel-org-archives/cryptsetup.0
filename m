Received: from w4.tutanota.de (w4.tutanota.de [81.3.6.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450D613664F
	for <cryptsetup@lists.linux.dev>; Thu, 21 Mar 2024 21:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.3.6.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711058131; cv=none; b=Ou4Wv1oGjoI9Buz7ZK9X/QYXt8fdTzVcpktmKYvIs/zJe2Vm1gsl8q7hkokCRQoTup/jBjLTxnNvbvQzQ+Jq/2NL26r94gpXEU0oPYB5WrPoSyM6bc26tDs+2mLcqSsM6wavvu+9fstPOKeEsjQCrUajx2O3N9ta4k4nto5OyYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711058131; c=relaxed/simple;
	bh=kuWOFXDUnMpZB+BKzc7ncYmvCCsnkv40BSd+WqIxMzA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=sDe0EzGcxyeakPnbgFgyKhed5WheGsJbzZFmshyZisS7pRdeGLSd+KdjkHkoOlWdUAPA1MKjbHlP8nAuVETgGrRf72qSyBkKmVZF16ec5BWSVvF+uQbrMf+LFhgX6t9EIVtRSbcHrUsOw7JP2mdayUNkqpeUic7zb7NYAOjly70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grigr.xyz; spf=pass smtp.mailfrom=grigr.xyz; dkim=pass (2048-bit key) header.d=grigr.xyz header.i=@grigr.xyz header.b=XZSxJyC2; arc=none smtp.client-ip=81.3.6.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grigr.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grigr.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grigr.xyz header.i=@grigr.xyz header.b="XZSxJyC2"
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
	by w4.tutanota.de (Postfix) with ESMTP id 3350610600E8;
	Thu, 21 Mar 2024 21:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1711058126;
	s=s1; d=grigr.xyz;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=kuWOFXDUnMpZB+BKzc7ncYmvCCsnkv40BSd+WqIxMzA=;
	b=XZSxJyC2DepIrNqMeauhir8TNsNtUl/BF9icNQWuvXcKKeva4FjTHCDbH66y+bLx
	pNt05ov2m86xhHr9WvncZhG08HIZWh3UE1C8i640u/Qc/T9cpfJDYrDG2bJ+fvL9bT8
	2Jq0Rh3eys8RgKmjR26DHaaEbGSx4WOegspuc806vqd80ktDyQImOvKDLVHGIfflW7c
	ajdBR9JaTKi+r2miSDeCziOdl8EOROhBaCj+f4yIbJiZSaokEGHGmnBD3sKq9bB3fU/
	MWY29AVK7TvCwMu1EV49hxdCW8L3ZRIPsu0oxxYroaZ8HwwGaYdLaRzHpdnLZufiptT
	KYPr/SjJ8w==
Date: Thu, 21 Mar 2024 22:55:26 +0100 (CET)
From: Nikolai Grigoriev <nikolai@grigr.xyz>
To: Nikolai Grigoriev <nikolai@grigr.xyz>
Cc: Ondrej Kozina <okozina@redhat.com>,
	Cryptsetup <cryptsetup@lists.linux.dev>
Message-ID: <NtY-kSF--7-9@grigr.xyz>
In-Reply-To: <NtJ2omI--3-9@grigr.xyz-NtJ2rJc--N-9>
References: <NtEMHPl--3-9@grigr.xyz> <c238a50b-e382-4dec-9b4b-9c33e420b541@redhat.com-NtFh9t5--7-9> <NtGgb5H--3-9@grigr.xyz> <186111b2-f007-4812-8c62-0a8676d9528c@redhat.com> <NtJ2omI--3-9@grigr.xyz-NtJ2rJc--N-9>
Subject: Re: OPAL setup for a new drive without sedutil initial setup
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Just wanted to make sure things are connected for those=C2=A0 searching the=
 archive eventually - the issue for the problem I described in this mailing=
 list ishttps://gitlab.com/cryptsetup/cryptsetup/-/issues/871=C2=A0 The sub=
sequent conversation has moved there.

Thanks!

--
Nikolai Grigoriev



>>
>>

