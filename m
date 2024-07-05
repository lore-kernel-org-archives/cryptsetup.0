Received: from mail-108-mta195.mxroute.com (mail-108-mta195.mxroute.com [136.175.108.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D9013C8F9
	for <cryptsetup@lists.linux.dev>; Fri,  5 Jul 2024 13:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720186787; cv=none; b=fshh4KUQOFomyF2QDYFULLveN1tarz2/KXs+Dc7+XDgrGQml/8Qmb7LKkAV87KtA6rswaFzCvhZ/JhMnH1UzVGo8Ud78xW2WnyV7XbC2sNtKkO3q2kQXKAsN4guHNnvUyRFb1QCyPIa9N5eROtNZToeFV4dn5DjVk8gCz1/QeD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720186787; c=relaxed/simple;
	bh=+eCjfOec7AJuTuU8aQ2IwAWmVcpBVHaovvRmh6Ezucc=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=UvhRlR9P5fDJzp3nWRW0SIFR/xFTxbNeKebVAcMBdk/m8vFITv75PBMlcDqRUBpQVwRF7d2Ai/3ikaAz/D8lyvMAzuFAcveEt+mS7YWtTrO+DEyEd85OZdf5xxL/2vrmcy2AQ21vxgVPpEEcdVECYsLLIG6oU2EZUmk2B5YgjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=esrevart.net; spf=pass smtp.mailfrom=esrevart.net; dkim=pass (2048-bit key) header.d=esrevart.net header.i=@esrevart.net header.b=ny8GmnXC; arc=none smtp.client-ip=136.175.108.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=esrevart.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esrevart.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=esrevart.net header.i=@esrevart.net header.b="ny8GmnXC"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta195.mxroute.com (ZoneMTA) with ESMTPSA id 190831a973e00017a3.001
 for <cryptsetup@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jul 2024 13:34:36 +0000
X-Zone-Loop: 7c61fbd396696e6a756de4f5a74e1456eb4eed14161f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=esrevart.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:From:To
	:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YDlW+HKul538fBIrUoQfY7GN6CDFqaKJ2gYLYJifKeY=; b=ny8GmnXC45FUCfuer/0Twi5ACZ
	8BNFmAoLKLVlzJ5Pbri5kQ7U1txk3KtD3qrIl1H4TfhoKiIOhWJvzTdR9Z/BLw02mLVDpa2T2q9Zf
	EIQbcBShcwjdbZ/V/G/2ZCT3MifO4rVf1nbMJ8nKD79Zo3/FxFMMAmibTGR139fSF+QFnMKG0u/PJ
	6DNmawjACUia5/pTiQN0GIayKdMdFz8Pp1hWaPU9CgufwPI1Mix722Kjb/PfvVhP32Ki5TP9hKfnm
	P4ny/tX2FHRj7uwg+d97AHMNYt66KauREePlU45MYlr4Im0Q8Gn/4gIjodO9qhfW/lTQK0R/WG/TH
	HtH+5x9Q==;
Message-ID: <1254eca3-84b0-4202-8ac1-fbb5214a5aa5@esrevart.net>
Date: Fri, 5 Jul 2024 15:34:34 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr-FR
To: cryptsetup@lists.linux.dev
From: neitsab <neitsab@esrevart.net>
Subject: Interaction between OPAL drives, LUKS and TRIM/discard
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: contact@esrevart.net

Hi *,

I have been trying out the new OPAL support on the root drive for a new 
Arch Linux install (using a Samsung 980 Pro and --hw-opal-only): to my 
surprise it worked flawlessly and I could boot from my OPAL-encrypted, 
LUKS-managed SED. I really wanted to thank you for adding this support 
to cryptsetup: it's a whole world of improved usability and integration 
compared with sedutils.

After the fact I wanted to add discard support to my LUKS container so I 
ran:

```
cryptsetup refresh --allow-discards --persistent /dev/nvme0n1p2 root
Enter passphrase for /dev/nvme0n1p2:
Unsupported parameters on device root.
```

(I can provide the debug output if you tell me whether to send it in the 
body of a reply, as an attachment or on a paste service)

However, fstrim seemed to be working before that:

```
fstrim -v -a
/boot/efi : 424,3 MiB (444919808 bytes) trimmed on /dev/nvme0n1p1
/ : 1,8 TiB (1995819851776 bytes) trimmed on /dev/mapper/root
```

This made me wonder about the interaction between hardware-only OPAL, 
LUKS and TRIM/discard. In the hardware-only OPAL encrypted case, I guess 
there are no barriers to discards being sent to the drive. Is that why 
--allow-discards is an "unsupported parameter" and fstrim works by default?

If so, do you think it's something that could be added to the docs, a 
bit like there is a warning about incompatibility with --tcrypt-hidden 
so as to warn users there is no need to try that?

Thanks and regards,
Bastien
