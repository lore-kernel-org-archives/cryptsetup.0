Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD13622
	for <cryptsetup@lists.linux.dev>; Wed,  1 Feb 2023 02:38:35 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4P65h70pPHz9sRD
	for <cryptsetup@lists.linux.dev>; Wed,  1 Feb 2023 03:38:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1675219111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/q5mQWWs9KmQNOesBFeN1+aLVwrKDwmsI1izp6e6ErM=;
	b=rTv0DgsFW1MunOJV+S8vIBIWUbhjs44UwXDhPcuPOKZwfY3uW4HjEVoqha3uNKlQMtsmA2
	oMgPuwquVkmCcqDhxNoBtt14cNkOCW5ewGNtZwR5Nz4NGtr+qFDuIPajDFN2s1j/WsC/ps
	ueS0NOtJPCpyfXlUJZ6tu6Go/LbwMueZqRhrIX4v8F3XUhpDBHagE3O/NBmzoiJG+89prC
	/midkN+qiYL7KbTomdRXvfdSVQHc4TdjEI7mAe2XhL/1Lhz8qEksOc78lccmE4S2vkLMJK
	OiRtOnuPC2ZS1nUuXVkqkX7LrfAkHcQxtUEyOGPcaftm+oMoEoqfvJsWy3fmgA==
Message-ID: <af9ae892-0993-8519-c96b-4f64dca84ea7@mailbox.org>
Date: Wed, 1 Feb 2023 03:38:29 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: generalmanager@mailbox.org
Content-Language: en-US
Subject: Mounting a device with messed up integrity header
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: n8g7mt7rawhokmcmwbc7gtnqqgiid3sf
X-MBO-RS-ID: 52177972ccaa93f5be5

Hi everyone,

I'm trying to mount a partition which was created with "--integrity 
aead" when the integrity feature was brand-spanking new.

Unfortunately integritysetup doesn't recognize the integrity header anymore.
I can unlock the volume with

cryptsetup luksOpen /dev/sdb1/data_crypt

which creates the (symlinks to) devices containing the data and 
integrity information respectively:

/dev/mapper/data_crypt (containing an ext4 file system)
/dev/mapper/data_cryptdata_crypt_dif

but because the integrity check fails, I get I/O errors when trying to 
mount or fsck the corresponding /dev/mapper/data_crypt device.
I assume this is because of issues with the integrity check as described 
in https://gitlab.com/cryptsetup/cryptsetup/-/issues/490#note_227927246.

cryptsetup luksDump /dev/sdb1
correctly reports the integrity mode to be aead:

LUKS header information
Version:        2
Epoch:          5
Metadata area:  16384 [bytes]
Keyslots area:  16744448 [bytes]
UUID:           XXXX-XXXX-XXXX-XXXXX-XXXXXXXXXXX
Label:          DATA_crypt
Subsystem:      (no subsystem)
Flags:        (no flags)

Data segments:
   0: crypt
  offset: 16777216 [bytes]
  length: (whole device)
  cipher: morus1280-random
  sector: 4096 [bytes]
  integrity: aead


As I wrote in the beginning, the output of

integritysetup dump /dev/sdb1
is:
No integrity superblock detected on /dev/sdb1.

Which means that

integritysetup open --integrity-recovery-mode /dev/sdb1 data_crypt 
data_crypt

fails with the same error, just as using --integrity-recalculate does.

I'm looking for the correct way to proceed. I don't care if it's by 
recalculating/recreating the integrity header & data, by disabling 
integrity checking temporarily or permanently or my modifying the header 
and stripping the integrity part.

Unfortunately I couldn't find a good writeup online or information in 
the faq regarding the best way to go forward in such a case.
I also searched the mailing list, but it's either well hidden or I 
didn't choose the right search terms.

If more verbose debugging output or the full original command with which 
the partition was encrypted would be helpful, I'll gladly provide them.

Thanks in advance for any hints!
Tom
