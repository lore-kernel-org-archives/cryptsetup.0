Received: from hera.malbolge.net (hera.malbolge.net [185.232.68.32])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E093D7F
	for <cryptsetup@lists.linux.dev>; Tue,  6 Jun 2023 21:07:52 +0000 (UTC)
Received: from hermes.malbolge.net (hermes.malbolge.net [192.168.123.201])
	by hera.malbolge.net (Postfix) with ESMTP id 2BDC27C4714
	for <cryptsetup@lists.linux.dev>; Tue,  6 Jun 2023 23:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=malbolge.net;
	s=hera; t=1686085671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Noomsi2/KIxAtrkYwjJZVOOtoBsvUCiJh5E+vaGYQLs=;
	b=qKfx0Yq/baszJy6nCgXKU0GclzDVKKlvwyYy/VyWh+bmH2A5kYFOaZh7X7qIet+/J6l2j4
	jYbvOaFnQ3Ep6ih/5OgrAPBgJIL4zVX13I889AQ87hmT66VnVrGThnsHPG3U6KAyQlr4Le
	nJ8/oQNrIFN3hVrCfdcCpvDEEJ9/fVQ=
Received: from moon (dynamic-089-014-099-230.89.14.pool.telefonica.de [89.14.99.230])
	by hermes.malbolge.net (Postfix) with ESMTPSA id AF31A426851
	for <cryptsetup@lists.linux.dev>; Tue,  6 Jun 2023 23:07:50 +0200 (CEST)
Date: Tue, 6 Jun 2023 23:08:50 +0200
From: bugcounterism@malbolge.net
To: <cryptsetup@lists.linux.dev>
Subject: Wiping disk vs. initializing container
Message-ID: <20230606230850.630aa048@moon>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi there,

does overwriting an entire hard disk with random data before setting up
encryption make initializing a LUKS container (as described in section
5.3 of the FAQ) obsolete?


Thanks
Michael

