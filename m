Received: from webmail.countermail.com (db1.countermail.com [5.226.34.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC141C2A8
	for <cryptsetup@lists.linux.dev>; Sun, 25 Feb 2024 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.226.34.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708874421; cv=none; b=D1ZRt96T0JwN4tpsN3zkTstIjwp7/pLwwfBkjmhNpPXNfHFkBwPiwHgTb1tRedYxf/4uW+hZ+j839Y56ajCc11M/N5tLwZy4m7e8Ccq5JeeuICfVQksDyAFEGrg93dsyMnaeGvhwyADDdML5Kijaz04p//X+UHdg1bQ+uIDHhDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708874421; c=relaxed/simple;
	bh=HzD673chnrxztBfNhGg6YpqC+XbJwhJ/5H+yaG571pI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=sqSVAEi5VccILe2lch9eQlktgE6VA19UznFozQKmjSNvl9j6IJkLcHhB/mlcPrMI4BAFV2PpE2P1N8bo5Z7U3gpLKC7DNy0T4cdJVWTXgDMFbXrHW7afAqbubxTPzdYxI4+6oE98etC1chMfdRFG/8CTaeyK8GG3UCmGTfiThUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=countermail.com; spf=pass smtp.mailfrom=countermail.com; dkim=pass (1024-bit key) header.d=countermail.com header.i=@countermail.com header.b=LgD/lZ6B; arc=none smtp.client-ip=5.226.34.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=countermail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=countermail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=countermail.com header.i=@countermail.com header.b="LgD/lZ6B"
Received: from smtp.countermail.com ([5.226.34.35])  by webmail.countermail.com (Postfix) with  ESMTPA id 4D92E6ECA1
	for <cryptsetup@lists.linux.dev>; Sun, 25 Feb 2024 16:14:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 webmail.countermail.com 4D92E6ECA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=countermail.com;
	s=default; t=1708874098;
	bh=5ZnNsJ1Ys0IoAaw1j426vvjF4l9QLFB/BWoyDk64jwo=;
	h=Date:To:From:Subject:From;
	b=LgD/lZ6Bl3qt3SZhSh72oEkM9KNHmeuoyl9g+U4G+Cix3dmHNr85lNat248kFNLqg
	 brnx9+CnET+53kV/ibOdOyOtjFMCFOWaV2/uX7FKm7gJfNOlqd4FHsA923/JFr+5Uh
	 ZWOvJgrcUfQK2LZLhf3QZmhyEl9gug8YIpbdC/10=
Message-ID: <31fece1e-62ad-4451-8a87-86f08a4dcd10@countermail.com>
Date: Sun, 25 Feb 2024 16:14:53 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: cryptsetup@lists.linux.dev
From: Mistave <mistave@countermail.com>
Subject: Partition table instead of LVM inside a LUKS container
Autocrypt: addr=mistave@countermail.com; keydata=
 xsBNBFC6N5ABCACT/6LYkViesTff33gFzqzii2sdOi07er31P3MfMgetejDACIbuU3uRzapZ
 gGPRQtiyKcsyzNf7JkmFW+IvcOZEnZBGCaYClkrCHpHw10VR8E6GSIuNdGit9WOMd3gJChj8
 KDxeZyzOo70svWtwcvfPvZfEANmgI4A2fiuuc/e9fTc4uOvI0fRH61wszSadQ2b1Dz8EJa1c
 DeWEmB4NYsXWJ5qLkyT4TwuVFc530X1EUdu3+eC34tT0iMozFNakoKAKTlHyONRVHEntFwoD
 r3VMSEb5DwWIjTuoCEepkdRJ0aKKeCx38Nkll+yc4i3qo9LkUa79Le/3sFeSwpq7P73xABEB
 AAHNF21pc3RhdmVAY291bnRlcm1haWwuY29twsB2BBMBAgAqBQJQujeQAxYCAQQVCAMCBAsJ
 CgMFAlC6N5ACGQECGyMJEMQjYJVxl1LlAAAbCgf9FNOhyQokWJ96h55rnhpApeG5Cu2fQh4L
 /N+yfpcjniGiewrxi/QLw8h4ZzH7u549pKXnosccFS27miiopZtC0oHqfc9E3FWF3iUl7M7f
 uKVHIBuF+zE1ivly/NtUEoUFC/2EUemO3p8X77pYMFK4nLhZuLn2ld+XG2pFMjF/AGrAJDvv
 oIolvpzcCEssvk5q8n5A7kYehS+zE3oPb3+ynUoS89KZs3ggPVp/G2KEv2+DTz5tJygdocfi
 I8e90Je5wBJBlzBQL37a15skuNyPdokxMMve7OqcuoT4g5S30aQrV/QluDjXoFhEdZGXWtBt
 jnC9KIVL+MUe2e+mWm6cyc7ATQRQujeQAQgAhyfJ6FxwkKZO7YazFVwH9QHgmPARnu2G7zIV
 8e4nSRTcBSkt89gRr+qDtUE8cD/Sqk+Dva92o2gSwSvfVlbAGeBtMK/OrLE/jm/4Zundyp9N
 y5x7vRvC8oatgvWbGdqicKphJiYB3dtJyVmJXTB/glzCQf9EBDBhu3A/tDSjhAHoD0iQPqDl
 OG9TBn3aj4Syr3csXAAPoxSLF0n/w8p0/H9DN0/yVDvmYIa9vfcjMBLTcgLHwJr/Uywvs5or
 tabyDQi/Vlu6XvmPFCosR5x7QwEy1nXE9yKsa5vYKNFofKiXzXZNqzr2jbgaT8wzAozRhqG7
 P+TUKXdBcgRmrEvPnQARAQABwsBfBBgBAgAJAhsMBQJQujeQAAoJEMQjYJVxl1LldEYH/0Bs
 c1GKlSYlgHZ4j0SLpqloZo+pwJtrE3tL4j20PAtVg2hqn4VitmaWnJpmUf0bXHEGQ0bh2vWn
 oMS370Rdbk8SuvdFo5YEYfQOX9d2NDH5lRj06bbbMPrPQ6tpc/e/2pEH8B9D1o/FlJMYbwMO
 8kfMB5QwGaDL8yyTu2P96V0NbJcnoZWhU0mtR3+t36mJ9C7OZrTx9TKTQy3QmcmuHjOnm+SZ
 aIZB7+CO0gt6pteS2SYZ+TBIWpI0OTX4RU9YzE7eEVjBk46v7W09VgqY6XM4sCg4TkjeBEgF
 kTb/IIfd2+XDq7l09VSTjoi2WwG+51k06Qy3SwO7aeXhP/A9Zig=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Just a request for some opinions and suggestions.

In most online tutorials about encrypted linux setups it's recommended 
to use LVM (and by that I mean tools like pvcreate, vgcreate and 
lvcreate) on-top of a LUKS container to further partition the encrypted 
block device. However, my question is that, provided you are using a 
full device encryption (e.g. "cryptsetup luksFormat /dev/sdb" and then 
"cryptsetup open /dev/sdb container"), are there any negative effects of 
simply skipping LVM and creating a partition table with partitions 
directly on the new dm-crypt device?

I tried creating a test setup on an empty drive, and the system (Ubuntu 
22.04 LTS) was able to recognize the partitions after creating a new GPT 
partition table with two ext4 primary partitions on 
/dev/mapper/container device. The partitions appeared as 
/dev/mapper/container1 and /dev/mapper/container2, and were also visible 
in /dev/disk/by-id/ folder. No /dev/loop devices or LVM ("lvs" command 
returned nothing) appear to have been used while setting up the environment.

The setup was like (as root):
cryptsetup luksFormat /dev/sdb
cryptsetup open /dev/sdb container
gparted /dev/mapper/container => New GPT table + 2x 10G ext4 partitions
mount /dev/mapper/container1 /mnt/disk => Mounted OK.


- Are there any benefits or drawbacks by using this approach over using 
LVM inside the LUKS container?

- Is this recommended or generally well supported?

- Can such setup be used to host the linux rootfs and other mount points 
in an encrypted Linux setup (including /boot)? Grub?

- Can I expect problems unmounting and closing the dm-crypt device i.e. 
by system shutdown scripts? For example, if I (after unmounting 
/mnt/disk) tried to close the device by doing "cryptsetup close 
container" in my test setup, it complained that the device is still in 
use. I had to first close the "container2" device, then "continer1" and 
finally the "container" device in /dev/mapper to remove the dm-crypt 
mapping.


Thanks in advance.
