Received: from mail-200167.simplelogin.co (mail-200167.simplelogin.co [176.119.200.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A9A266AB
	for <cryptsetup@lists.linux.dev>; Wed, 25 Sep 2024 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727281980; cv=pass; b=PvwImadNShWBtu2bCIK0oFSZaIu+xXJRJmWsYKOFihyq/LWDlbYVdc35fxPgto8/xzGO6MUAGI2urv87Afz5PTC2ZoVarklvtGxs2pxaXv86EOJFp/LkwiK4n5FdN/nAzRM28YiNR8AiSYZvWok8k8v33Wq3/2wOvvVpTe/68+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727281980; c=relaxed/simple;
	bh=YJgbWdGlf8usXgEPBXJQPWAboPaBh5c6O8vnF7q+RIs=;
	h=Date:Subject:MIME-Version:Content-Type:From:To:Message-ID; b=ULl4YO4PJEJ27nRRofAQ8ciDVqta80FWXwNq7WvZXK6xALHOF8kP4xUtcRvh9zmz/V1ZgPlFQKkQBPvtbNf0P5hVFpJsodpPesLfKVb7bgnrSWvMycDlVxGgfPBnNFX/qRf3qGlCt1vwOjoYKX3zsH5CZgAPDW+y+LjSHV9aPn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me; spf=pass smtp.mailfrom=slmail.me; dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b=Bq2pguH2; arc=pass smtp.client-ip=176.119.200.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slmail.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b="Bq2pguH2"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1727281970;
	cv=none; b=1ltOufP0faGAMCXuuShSIPsIV5nxqJtqMVwLQW6oIwGFNndUBJKCpm5epe21IiTUJB2nnGqSEUlvlXZh5kOkLU1L2wdb/WsBFrkuX2uLw7nVEkZRzwRb5kuVPBg97syAS1JEXUXjhDaR1uc7Sl/cwulTh3FRfC9UdcRjef0qOjkKsG6NAOiOeAQD7ESf3o5pN65NCPRyP87rwgudKacXTsGl7qIQMtdr/tmRopARQBrc39WOov1KDnUqF1yxz43rvPG5gBK/6YvnZXXL9VEAh5GA+SrVDBE0B9jYOieqCp+UaytVmKyX7bjM4JwXmd8UHIAS7t3+bs/t3HkX4kAZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1727281970; c=relaxed/simple;
	bh=YJgbWdGlf8usXgEPBXJQPWAboPaBh5c6O8vnF7q+RIs=;
	h=Date:Subject:From:To; b=VJHuoCdy7K6ToiWOwFSpdzsfn4RxoKNtBg8/s+Z/KI1emIwa3LBl948C+uTl8HrkQTQOo1P600zFWQHzNPu8lC3OO3N/JfuH4fTS5+Xo1n3rp4yzxT6C3Z9v61ujRi7+UZCnc8sVeqPAUWWbicwHSy/RF1lG8zfBkqnj4G3Ige9s0zDQDAmWjPPDnhsNE5TTKCVduzYs/UFFRkrp6/2NaNXnTWc1NtUWjxbVsMH0TNJX3Ukk+c7VzcAYKm/zy5phLzU1JQXPOce+vZ511o2qvfU71r5uEJx4zL8QTbc1W1+N3jniHSTEi9/4/K0Xu0VYtbZRGBzaFlgtgrDE9lLKiw==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=slmail.me; s=dkim;
	t=1727281970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YJgbWdGlf8usXgEPBXJQPWAboPaBh5c6O8vnF7q+RIs=;
	b=Bq2pguH2dY8fSMfermA+4AE3Peg6oyNs84tqmu67BSCeG4wLs8J2tOJE6V+Oq15zi3Zyok
	ZJSw39h1unc4gNEXt2liyeobh/N/dkimFAdMjGW0Puk1hsIwPIn/WQm1fsouywTHjNp9AP
	I2Wsuqupi7F75sDnGwumvoBKcc6k6B4=
Date: Wed, 25 Sep 2024 16:32:46 +0000
Subject: labeling drives, related to the file system choice
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: iam.frightful278@slmail.me
To: cryptsetup development <cryptsetup@lists.linux.dev>
Message-ID: <172728197032.7.12095949214977275668.444357846@slmail.me>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 444357846
X-SimpleLogin-Want-Signing: yes

hi again,
been exploring online (via tutorials, and utube vids), how to best encrypt =
my drives using LUKS.=20
i'm pretty clear on the process now.=20

but are a couple of pieces that aren't so clear, yet.=20
few points if i may.=20

1. where is the best place to find all the documentation around cryptsetup,=
 the commands, various file systems and related flags, and any helpful info=
rmation for someone learning.


2. i found this good website:=20
https://www.linuxfordevices.com/tutorials/linux/encrypting-partitions-with-=
luks

there are many tutorials of course and videos. but this is the only one i'v=
e seen that includes a command to LABEL THE DRIVE.=20
which to me is a great feature... so that when i enter my newly encrypted d=
rive > enter passphrase > the drive shows, with this label, instead of 'luk=
s-346987sjlk (big string of characters)..=20

so, my query is, in the tutorial in the website, the guy uses FS exfat... a=
nd as a result he utilises, the -n flag, followed by 'volume name/label'...=
=20
i've tried this command, using=20
mkfs.btrfs
mkfs.ext4=20
but neither of these work with this '-n volume_name' ...=20

so, i'm seeing that this -n flag corresponds to using mkfs.exfat alone?

here's the full cmd from the website tutorial (in case not looked)

sudo mkfs.exfat /dev/mapper/map_point -n volume_name

so, IS THERE A WAY TO LABEL DRIVES USING OTHER FILESYSTEMS, in particular B=
TRFS?=20
i've not found any docs online showing this, and it's quite specific.=20


3. lastly, how important is the mount folder? sometimes i've seen /mnt/ use=
d or /temp/mnt/ and some use mkdir and create a whole new directory... is t=
his part only used for the initial set up of the drive, so it doesn't reall=
y matter? as when i plug the drive, my laptop seems to mount it to 'media..=
.. etc.'=20

(just wanted to verify this, as i'm no expert and just learning the ways of=
 these fields).=20

thanks for reading.=20
appreciate any advice to these 3 queries.=20

phil



Sent with Proton Mail secure email.

