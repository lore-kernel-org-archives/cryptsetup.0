Received: from ricl.de (ricl.de [202.61.193.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9711C6A8
	for <cryptsetup@lists.linux.dev>; Wed, 20 Dec 2023 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ricl.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ricl.de
Received: from [IPV6:2a02:908:691:c740:a2ce:c8ff:fe6e:7a72] (unknown [IPv6:2a02:908:691:c740:a2ce:c8ff:fe6e:7a72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: richardclauss@ricl.de)
	by ricl.de (Postfix) with ESMTPSA id 3CEB1A6A732
	for <cryptsetup@lists.linux.dev>; Wed, 20 Dec 2023 09:26:11 +0100 (CET)
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=richardclauss@ricl.de smtp.mailfrom=richardclauss@ricl.de
Message-ID: <dd0162b6-c15b-474b-9395-2ae594ec8c9a@ricl.de>
Date: Wed, 20 Dec 2023 09:26:10 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cryptsetup@lists.linux.dev
Content-Language: en-US
From: =?UTF-8?Q?Richard_Clau=C3=9F?= <richardclauss@ricl.de>
Subject: dmcrypt - possible corruption of data with kernel
 6.7.0-rc5-1-mainline
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.09 / 150.00];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:3209, ipnet:2a02:908::/33, country:DE];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_ONE(0.00)[1]
X-Rspamd-Action: no action
X-Rspamd-Server: ricl
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 3CEB1A6A732

Hello,

I don't require assistance, but hope someone involved with dmcrypt can 
make use of the following hint:

I believe dmcrypt corrupts my data on arch linux with mainline kernel 
6.7.0-rc5-1-mainline, while it doesn't on stable kernel 6.6.7-arch1-1.

My system has a btrfs mounted at /, which contains a file test.img, 
which is used as block device for dmcrypt. The decrypted block device is 
then mounted at /mnt/test

When I rsync ~150GB of data to /mnt/test the btrfs inside shows many 
write_io_errs on kernel 6.7.0-rc5-1-mainline. The outside btrfs / shows 
no errors. An extended smart selftest of the underlying nvme also 
revealed no errors.

When I do the same with the stable kernel, no errors show up. It is 
probably only my system, but maybe someone wants to try that out. I 
created the image file completely new each time.


# I used the following commands to set everything up:
dd of=/test.img bs=300G count=0 seek=1
cryptsetup -y luksFormat /test.img
sudo cryptsetup open /test.img image
sudo mkfs.btrfs /dev/mapper/image
sudo mkdir /mnt/test
sudo mount /dev/mapper/image /mnt/test

sudo chown -R user:user /mnt/test

cryptsetup is at: 2.6.1-3

Regards

Richard



