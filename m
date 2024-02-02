Received: from webmail.countermail.com (db1.countermail.com [5.226.34.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019B11803A
	for <cryptsetup@lists.linux.dev>; Fri,  2 Feb 2024 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.226.34.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706861573; cv=none; b=mGB7fABYjOv8ZwVTsF6xcCVjggejtkVYktgzN1udUF3xUpNL1R7Sjj/xG0tDdwqOGIPW5uxAR/qezQsaGHHSdBe+9Z/a6PggTGWnOhN70FjoeHNrMV+3L+fPE9awRxtCvNN9wKntwmzGHGoolUCxVrAWIKHv5TEgMuvzGzUH5ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706861573; c=relaxed/simple;
	bh=wc4Y4yTWIgqx44TjwgzCiiIk35FUWsv4kyEtURBglSE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=EtozvS76651jupSfFZ9q/IAvYaCBTltYWlJma13cXO0zVN1csy0Py+pCBPopLoNsraFzuuQRl7+ULByiIyyf1k30ePqbLRuGlrlc/rhaYg3mFFg51V4keK3sUfhqzz99LpUCiM+3eXeYtV2xBpzcjbEOomXaXK3UysfIPZE2k3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=countermail.com; spf=pass smtp.mailfrom=countermail.com; dkim=pass (1024-bit key) header.d=countermail.com header.i=@countermail.com header.b=StyAsDjU; arc=none smtp.client-ip=5.226.34.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=countermail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=countermail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=countermail.com header.i=@countermail.com header.b="StyAsDjU"
Received: from smtp.countermail.com ([5.226.34.35])  by webmail.countermail.com (Postfix) with  ESMTPA id 22C1E6ECA0
	for <cryptsetup@lists.linux.dev>; Fri,  2 Feb 2024 09:12:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 webmail.countermail.com 22C1E6ECA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=countermail.com;
	s=default; t=1706861563;
	bh=id+rzYAky0+ZLeHVxf0ICMZBChxfPGKtDmpdnbGj0OA=;
	h=Date:To:From:Subject:From;
	b=StyAsDjU0l/daF0InzQIKYRgy5hFUBcSlBQ68G0idS37uogBzQb5wY6ane9L14zDI
	 Ia0GB0q1Wmr3HO2r5+ua31w1nSHTMgN4OroEXIpuE79HzqN3e76NQZcEDlj3OgcnIj
	 4GfgoLQ1YMjY6PV6XBCiLFtQ0ie1YXPi2LOByOu8=
Message-ID: <2f1b3b93-2bec-4867-9d78-bd9474a4d31a@countermail.com>
Date: Fri, 2 Feb 2024 09:12:37 +0100
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
Subject: Beheaded LUKS volume pathology
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

Hello, hypothetical question.

Suppose there is an empty and functional hard drive that has been 
overwritten with random data. Then, an encrypted LUKS/2 volume with 
detached header is created on the entire device by using cryptsetup with 
a strong passphrase (defaults to LUKS2 header on newer distros, but the 
question is valid for both LUKS versions). The /dev/sdb is the HDD, and 
the luksheader.bin file will be later put on a small USB flash drive.

# cryptsetup -h sha512 -s 512 --use-random -y --header 
/root/luksheader.bin luksFormat /dev/sdb

Provided, that an adversary obtains physical access to both devices (the 
HDD and the USB flash drive), how difficult is it for them to 
forensically link the two pieces together?

How easy is it to figure out that *this* particular detached LUKS header 
belongs to *that* particular hard drive (assuming there are other HDD's 
present with "random data" on them, and the USB flash drive has multiple 
detached LUKS/2 headers on it that may belong to different devices)?

Does the LUKS/2 header contain any identifiable or relatable metadata to 
the volume body it belongs to?

Thanks in advance.
