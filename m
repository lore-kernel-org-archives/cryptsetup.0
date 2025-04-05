Received: from mail-107162.simplelogin.co (mail-107162.simplelogin.co [79.135.107.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FBB4086A
	for <cryptsetup@lists.linux.dev>; Sat,  5 Apr 2025 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=79.135.107.162
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743871081; cv=pass; b=ROz5DMBuaraa2aBo7M1I35z0NBdsLoZ6PKVRn7ra4cXDY2mZjt+tKW+e8OkWTPMy0+jW09kNjToytLMTXKMMcumMIrWPDurBnv+JevzvYWeD/vaYH6XHeUkRPlYp7TznVU/7UY9mcFj1eBpv9ElvAuGwZASRV454krGtmmsN1iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743871081; c=relaxed/simple;
	bh=SrAsWdZqfXP2w7o13GRMvmAfzc4SUVLdBJYMG2zA0U8=;
	h=Date:Subject:In-Reply-To:MIME-Version:Content-Type:From:To:Cc:
	 Message-ID:References; b=KFmtICLwThAITxciNJYVMsHf4SE0cy5L4++sfaE04v+cedtP38kK3WWDx8I7oKoku6jliTA+BfeyJjMqus/qFsE5blpsDn5fVGRqAs/ikFGdVTuhYwxDWr8ktpnCXVch/AKVlnLUMmnJu/GPxPTJiAh2gZdobhX3TRTAKLz843A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aleeas.com; spf=pass smtp.mailfrom=aleeas.com; dkim=pass (1024-bit key) header.d=aleeas.com header.i=@aleeas.com header.b=GsRE260K; arc=pass smtp.client-ip=79.135.107.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aleeas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aleeas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aleeas.com header.i=@aleeas.com header.b="GsRE260K"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1743870144;
	cv=none; b=sEf2CsqvRCY3a9BFOYd85R9qSXXO5dkRRAktOpHSn0hf1CkwuMuYuobjLWgTpltKxqFRhpwdLMYVL5J1LAvC7Sj98NTArTXy9ohvJtDmqbBf9TWab5yZjkunBOn7nK8DmBxLH54v21K+0565fhx4N6D2jNpVCYk3h/1M1DfdxuQDHQkYN+T6gI9Hb2r08XdSjLI64rH7X8fBtw6+y2l01wgCUDApR0FPnFIGqVmw73gCZeYuJoJdG+Sm2YxcqhvQdYPLwaHap8DzEqCgTywT6q/r5eDbbjOqKz/41GVRo69e66EvzrIyyst3LOUPqKcuFKlipK5Al+Tlt4mSoe8D1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1743870144; c=relaxed/simple;
	bh=SrAsWdZqfXP2w7o13GRMvmAfzc4SUVLdBJYMG2zA0U8=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=HBYOo2q33DtZ4XCehsRQl6KBrpBl9v7RLzqiglVeA75V5GkR7M+yP4RVr6pXicp2KHXX40K03R4bDLD/seCVKmNvTzL6zct3o36gGLbIMKWPiSe7Mr/Dg9tS1cZslWr0cCBvJE5iHp3XR6C7DXVl8IyolcXnTZ7SL3M6M7covaLJ7H/v3zQ2FPcHjIZQ7YI8/arrT1NpyQwHBxTkRIto7bDAYE1ymCBxMVX/uLmCUSj4n42TPGC/shTzs3vSZ1lkiwdoSErVYUqG+y8V8qgYoG3SkCBbf+d0DQtcIaOvVBiS5ftAVCwXgyzCgWlxs6Pl4MOjNhMYfS3OzAKR2NMGjQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aleeas.com; s=dkim;
	t=1743870144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SrAsWdZqfXP2w7o13GRMvmAfzc4SUVLdBJYMG2zA0U8=;
	b=GsRE260KJwCBMkGzVKT9xVTSDgqkEv8tEZ3GD919+LWdbkIjvG4vzRQpDdbRF6BafDT7Qn
	KxXBQ6JBF57ezx8SREwz0P8LsQpDGUaWd21WfSlxPL9EN1oq+RAMPV4sWLSG1797lej5SR
	BtquCbcr1n410P0WrWT+PIyyK7U4R0w=
Date: Sat, 05 Apr 2025 16:22:18 +0000
Subject: Re: Looking for LUKS GUI
In-Reply-To: <174386769355.6.1636033258357958528.666033728@passmail.net>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Darek Hisc <darek.hisc@aleeas.com>
To: Oliver <oxid.oxidize842@passmail.net>
Cc: cryptsetup@lists.linux.dev
Message-ID: <174387014408.7.5961259197743680938.666080459@aleeas.com>
References: <174386769355.6.1636033258357958528.666033728@passmail.net>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 666080459
X-SimpleLogin-Want-Signing: yes


> I tried to find Linux GUI install guide, but I can=E2=80=99t find it.

Try ZuluCrypt https://github.com/mhogomchungu/zuluCrypt

> how really secure LUKS?

TLDR: This is a golden standard for Linux for many years to encrypt FDE (wh=
ole disk) in all Linux distributions I know.
To encrypt files, use ZuluCrypt or VeraCrypt (create containers for files).

> I am journalist

Me too ;)

Cheers!


