Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794416536;
	b=InRMQRnmTcKj8QNm8uEPGkt864DwOgYUMlwdJlNimWHFg5u6YOrWotmrjId4GbtefGMQ
	 d6TIsJUtLlkr5DkngsqBtFZL1FtMLcdhA0bygFwq+HW7vONbfmNmVMGfT/xUxMFFODCFh
	 +a/SR4vDIgVuDT/FWwcQWjtagGYSId8IaOBotmX74v1rlYojN0cwkajEGuJBwflWB/yJb
	 0NyZ4wkBJIaLRt91Bo+eG3SC6pgeFx52OyL1kXV6bgkzYaXocIqio0YBidSuSHZbLz4hR
	 XaZe2j5pNSKSIPFW8zlT074bTfCzvU1iUgHM783mC14aLKiogLlE6vhmMPaBvGZJ1+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=B4ZQlB6f4pzKrX+D23dmLEBv1BoTaeHmp9h5tLRfUO0=;
	b=AvF/Q2GEt/GcJjQQ4zIgDUyHCo67zzis4aoBeSsXCVus6RK5Cdrv7zvRtrPifsTiNJYN
	 CysDZua7AmrlMuknkdjYN57TBI97vzKoQZknNOu3fQwNGwMZinQLWzZJzi366nI8lgrgJ
	 ApecScAF/Ef9cMlJPK5UYwahXfnHqkmrB6SCr460p+UDp43IL9lAkN+zA40cVaClGSK2Y
	 bHgH5QNY4UUhwfc2GN5eysQa4UUKgMnxDqbFuwslm4PV/LLeaSrnRzk4DIgNAfWkGZxdq
	 +9VNtaC+Wf0JE6Z8HRhaw8ABmRGkd3TYYqZ6LkyBaGvH2vGoYhe919J0H0pou6JB60g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOb00Br8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0615606A334
	for <cryptsetup@lists.linux.dev>; Wed, 11 Nov 2026 17:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0615606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOb00Br8
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6df0b02fe91so36853eaf.0
        for <cryptsetup@lists.linux.dev>; Wed, 11 Nov 2026 09:02:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794416534; cv=none;
        d=google.com; s=arc-20260327;
        b=ddtwGm6KXivOzro6zcfLIfZv9NDVk41bpmX35YuzKCLE+ILZ7BSR7jAbbUN5i9jPIl
         odyos2qo3zkOZAV3rDES9vByTK+myUcU65+OWI8NzPzr86TYKwRpGSxjOoFkoMMqGSds
         y7Uc8p/cujq4DTo3MRYOeIykqOgFKK+YhcYv2lhKfrFtBpzAdLwNDzLqtrLr+P/ZKZ3Z
         3A1qdhRpZJ+mzTAg9UbBxv7MoRRfVZJ00jBCb4ZNkeHdj4TnO+Mash42yPyKcsJsxX6T
         5dDM2ssHcd/QcRon0hAn+sSqWdhB8p6I6ZhFmostPqjGiOwwa1CCSN0JfA2iFBBHYOMi
         qKaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=B4ZQlB6f4pzKrX+D23dmLEBv1BoTaeHmp9h5tLRfUO0=;
        fh=utADXtLkPiKS2hXB71aeoagFkVnFKmPav6Pf9j2RSNc=;
        b=QKto1gMHXDHt2Rb3GMEy+954qSkyABzGPQDCjOqIUztU0VPLWbDTCq+5Br4EDuMbri
         mPA80XbiQoWYF2KZjAA528tJJNZFh8Jd2Q3lUCbL+sCkKvQqoFiBY7kK7JoPDh/BFqS5
         5wajOI30wqjwfT7YUOpRIsFDq3WymDSJH7f0+qR96hWLsb8VrRJ9psMfHZdDI6j0rdY9
         OoIBwhDqUMDnJDo4XUKleQjhT1wZdR1ezHJ+/Mxf65hJalUPNEeB62tJ3y7/w4jI1ZGS
         rIOEBUnyWd6mQ42yz/3fW/paR808VfNgkVFziWqAEPnKIXhe+XqPTMmdLc1cj17GQUtk
         G96g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416534; x=1795021334; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B4ZQlB6f4pzKrX+D23dmLEBv1BoTaeHmp9h5tLRfUO0=;
        b=rOb00Br8ZxIvPVZN1SFd63uYnybelf0px+/VcTrFCihbOHBTZOLTP5KDsMcE5gJHF3
         d5ARkGKJnRIKr6H6/EvpcDKUKwH1Hc0GpkuMm/Q9aB+kz6d5Xse71h6t0320plpTaKkZ
         fyei5zlIPTi64ClFMJmXsE8yT0+cEoAkO6ESOshO5MpWUipzW0W6C8pnnWDccvAKs4XY
         9pnyhtUBMmhg0VWAdzg1C8cc5O3AdIM8SQY4Qn17X+FBp5L8wyM5aa80AzFKJWFaOVEp
         03eodK1Jr0ABbszKZTp2GKwInVzdm/e4XpQwneXb0swTI4fRmWq857ebY0WeUbtqFvjm
         tpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416534; x=1795021334;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4ZQlB6f4pzKrX+D23dmLEBv1BoTaeHmp9h5tLRfUO0=;
        b=NATqRSJ5EgSllx05Hj0BLp6OgavG8b+YgQvA8kFraCYyT5Gvu2wXqfG+a/WUQc7KwR
         usEeGxpe0/ZI2vVq3mDm7OeHS3JEt8YNIp4rPXftTg2mF2csRJgj/wazKapbu/ZsFXC2
         O6IZv/4JpbVZsFqAMcSVtrvvEQOeEwvmNob5hN+3n7j6lbqbqhMjZlbqT1uJkriIxTqJ
         3Q7sCSfxyd5zEhwwESonSCfLxv4OdWflBxnzW5U140TaMja8hZI1Aq0uHWGo+i8ho/LZ
         P9R319OOd++EOS0o3uDDg6QfekmL1nX/2fAz3xUPj/j3i0IcHDBk9cOg1G4WJ4PsWfAA
         8abQ==
X-Gm-Message-State: APuU4Z9KqWczCtreT23RNjQQGJAL5J2QuDhUef1NEXgWHnie8kehbVMG
	N2iPAwA4JSc3/o4VTEB6M5Nmb2gzBdKk0EtxgP5nwKxMPXq8Uf8GAH3j4FhdTswPt0hNzGGC6DM
	it89i+p3QLG9ApK36Uvp6o/T9I14j7+Jb+r7gutE=
X-Gm-Gg: AYBFou0ycDiPRtQfEW9uzNX9HTwRU/hGlcOVqj7vW1Wktk8wzc/C+bJT6b1dnCkmDdx
	TWbQliW/PAoV2id0ZIQiiEM9jZkTwLbY4CCrCFQZGqYxffGUbGkvQdz5gklpml0fBBkgZSI0EWp
	sUD5ALOw0rF3dpgHnGniH3FQDUoLEsnJBTNvy1pfB4c66ri9tI7+Zc3DKPBtVTSLnASXu6mQSZZ
	3dE2tmHOg11qQFNURFUfVKyk6fBDzH3SuydkBvP4qdIZnlmXuyXC+Pvu212rdA4XyKuqdTtSZUb
	Z6fjPqM3vYuAITk0IGNEuwBg1PmwBMn3AbA+/BBwhYDL3ln/8atoN1dQzOEnASX3BO8f3dbOPkn
	z4PO6q2StxD+t6II1X1w7dX4EeNBGN31Xvd0bmrJ53L1EKx13YsV7tilZANwrBKe9M3tmUe44bo
	PVJxLofxqMmUIMupkGJB3kRfIn6ijLG6u0OiEB3X8j75aB7+eJZkaj
X-Received: by 2002:a05:6820:1692:b0:715:2424:db14 with SMTP id
 006d021491bc7-71974182f34mr36258eaf.19.1794416534288; Wed, 11 Nov 2026
 09:02:14 -0800 (PST)
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Post: <mailto:cryptsetup@lists.linux.dev>
List-Help: <mailto:cryptsetup+help@lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
List-Owner: <mailto:cryptsetup+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: xeyrion@gmail.com
Date: Wed, 11 Nov 2026 11:02:03 -0600
X-Gm-Features: AclHuK9VFQtbAHV-m635mf5V_ZkoPxoFoYmKayjZRqL_3VE_eT6Fusa2cNyaezo
Message-ID: <CAB9Cg3=1UKw0KHYDh42P69wPDm1DABfLNDsftjdTJp6s6YvE2A@mail.gmail.com>
Subject: Rotating OPAL range key
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

If my LUKS key gets compromised and I am using '--hw-opal-only', what
is the procedure to do proper key rotation?

I can rotate LUKS key using 'luksChangeKey', but as far as I can tell,
that will keep the OPAL range key unchanged. And since nothing is ever
reliably deleted on flash drives, OPAL key is still available with the
compromised LUKS key, making the rotation moot.

Since OPAL range key can be trivially rotated using eg sed-util, is
this just a missing feature in cryptsetup, or is there any technical
reason why this cannot/should not be done? If it's a missing feature,
are there any manual workarounds possible? Can a new OPAL key somehow
be "injected" into LUKS key slot?

Thanks in advance.
