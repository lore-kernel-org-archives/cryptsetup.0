Received: from smtpq5.tb.mail.iss.as9143.net (smtpq5.tb.mail.iss.as9143.net [212.54.42.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AF33330C
	for <cryptsetup@lists.linux.dev>; Sat,  3 Jun 2023 10:46:46 +0000 (UTC)
Received: from [212.54.42.105] (helo=smtp1.tb.mail.iss.as9143.net)
	by smtpq5.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <felix@kngnt.org>)
	id 1q5OXg-0006MM-VL
	for cryptsetup@lists.linux.dev; Sat, 03 Jun 2023 12:31:28 +0200
Received: from mail.kngnt.org ([82.217.117.151])
	by smtp1.tb.mail.iss.as9143.net with ESMTPA
	id 5OXgqsRsh8Mh15OXgqqFPx; Sat, 03 Jun 2023 12:31:28 +0200
X-Env-Mailfrom: felix@kngnt.org
X-Env-Rcptto: cryptsetup@lists.linux.dev
X-SourceIP: 82.217.117.151
X-CNFS-Analysis: v=2.4 cv=Y+A+8DSN c=1 sm=1 tr=0 ts=647b1680 cx=a_exe
 a=z4SNomP1wL5XVOMxzlLTBA==:117 a=z4SNomP1wL5XVOMxzlLTBA==:17
 a=IkcTkHD0fZMA:10 a=oj0XgzxCAOR5GS1RrvAA:9 a=QEXdDO2ut3YA:10
X-Authenticated-Sender: f.rubiodalmau@ziggo.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kngnt.org; s=mail;
	t=1685788286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MAbjcbnBNMwg7s0bEs/2Tl4cPlXWFIMgT3X4+ZKyPjk=;
	b=nqlCIHiinsVrgNxu7n2b2+iSvz0hnFBXmfx9UJoiDK/E4VaIFGz8seGjbWqHe5T2DahNWT
	s8pDyfhy47tF3gdczqkJwh0M9MxUM3gKfWnInk/a4yx5KxiPBu8Emhwb+0xICfyt73bdrj
	evbip7+krLCE3g3/MzTllDMKjrKU5wRvz79s7Q0uFtpZO1pBt135Xn/QvVFi3SYGcPWzJI
	Qv/HJH6OWpJ4zgi+mEGoTll6kWX35OWMBKJRzYHlJdgy+BdGhrmb2sOnL+U2dGGh4rSm9T
	CBitwqbFpCTaw7tOnN5Bige3ZwGVdoB6GttNHea5wzPMBP3qio5iA7oeSLiVWA==
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 03 Jun 2023 12:31:26 +0200
From: Felix Rubio <felix@kngnt.org>
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Subject: Re: How to protect header and on.... paper?
In-Reply-To: <a4bc8457-c127-55b2-5a65-388c3d836bf2@gmail.com>
References: <7ea9a3bc2101154ba3f65e6f55c6fdc4@kngnt.org>
 <a4bc8457-c127-55b2-5a65-388c3d836bf2@gmail.com>
Message-ID: <2b4a7cd077e772e546d2f1528764e054@kngnt.org>
X-Sender: felix@kngnt.org
X-CMAE-Envelope: MS4xfMxtm6fAmXd4H/+jMew2Q4Vi5oUUKNzC6yZmWTpDtQIhTK6xx50f9WcQv/wUHf/sbvChP6U3eP0SMz1hHe19/D4s0Ew9VBnLksQUNONlKNeHRrkwiM05
 iZGM/GxwbjvoLegcfD+xZd5u/bQ3GSqMvoU4apKkFOQP9yytAvcDCxmgv4F3B7K3TM04t9izzmhh7whcwIkTm8uCpcNvt568c7BJLG+ZoaeFJWs6OroPNcLD

Hi Milan,

Thank you for your answer. In this case, would this be the correct 
process?

1. BACKUP: Get the master key, encoded, printed. The master key is 
obtained by executing the command "cryptsetup luksDump --dump-master-key 
<device>", and is the concatenated result of the lines on the entry "MK 
dump"

2. RESTORE: In case LUKS header gets corrupted
   2.1 create a file containing the master key (e.g., master.key)
   2.2 convert the key from hex to binary "xxd -r -p master.key 
master.bin"
   2.3 Use the key to setup a new LUKS header "cryptsetup luksAddKey 
--master-key-file master.bin <device>", will ask for a new wrapping key
   2.4 Open the device with the new wrapping key "cryptsetup luksOpen 
<device> luksrec"
   2.5 Data should be accessible at /dev/mapper/luksrec

Thank you,

---
Felix Rubio
"Don't believe what you're told. Double check."

On 2023-06-03 10:29, Milan Broz wrote:
> Hi,
> 
> On 6/3/23 09:29, Felix Rubio wrote:
>> I have setup a my FDE using LUKS, and tying the decryption key to my
>> TPM+recovery key. Now I am wondering: I know I can get a backup of the
>> LUKS header on a file, store it somewhere and done... but what happens
>> if the USB is corrupted by the time I need it? what if I put it on an
>> optical disk and has been scratched? This kept me thinking: is there 
>> any
>> possibility/process to have the required information for the header
>> printed on paper, that could be stored on a safe?
> 
> You cannot have full text backup of LUKS keyslot metadata, but you can 
> dump
> volume encryption key that allows mapping data device without LUKS 
> header.
> 
> Actually, paper backup was motivation for --dump-volume-key option, 
> use:
>  cryptsetup luksDump --dump-volume-key <device>
> 
> (in very old cryptsetup use --dump-master-key instead)
> 
> There is no automated script that maps dm-crypt automatically from this
> info, but it is quite trivial and should contain all info dm-crypt 
> needs
> to decrypt data area.
> 
> 
> You can also dump metadata keyslot info with luksDump command, for 
> LUKS2
> even in JSON format:
>  cryptsetup luksDump --dump-json-metadata <device>
> 
> NOTE - this contains only configuration, not the binary area content
> of keyslots (but it can be useful anyway).
> 
> Milan
