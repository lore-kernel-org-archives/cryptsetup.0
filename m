Received: from webmail.countermail.com (db1.countermail.com [5.226.34.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0367C748E
	for <cryptsetup@lists.linux.dev>; Sat,  3 Feb 2024 12:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.226.34.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706964761; cv=none; b=PGclDVTFNBy2mtsqdACNrBPiEK3kiXXPLjZfQUL44iLiolT6iCeQFsUJaWZfaBwlE7aYKT4XaPThgYIz5OwCBPJjLyT9A8X8ns2mwwZyGxN6swsHyg5oy7m143HkbnnTyhphmvd2PJR/39mYnwnaxYY2rqp/tK/iu5wmIec3w6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706964761; c=relaxed/simple;
	bh=SLTpbZ18xEUk6NsO+fT/ml34ygUOj+z/Ft/1FaCZvt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Gvbbg/J7rpXxpplsmIw1rCTI29OCdxHswGfbTDUPUk9JCW7fG6jZzG8cxT51I7EXuK3fV45soFUgdx0CtKjerZqKQ927nnhhBTrKKcs+7mhYKOBnY/VVXK4PIWSiDhwbuz84SykvKqMLM+RGUqO4rRZNctSBEW4kVS9jHUyYty8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=countermail.com; spf=pass smtp.mailfrom=countermail.com; dkim=pass (1024-bit key) header.d=countermail.com header.i=@countermail.com header.b=WaP5+shG; arc=none smtp.client-ip=5.226.34.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=countermail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=countermail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=countermail.com header.i=@countermail.com header.b="WaP5+shG"
Received: from smtp.countermail.com ([5.226.34.35])  by webmail.countermail.com (Postfix) with  ESMTPA id D446341E
	for <cryptsetup@lists.linux.dev>; Sat,  3 Feb 2024 13:52:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 webmail.countermail.com D446341E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=countermail.com;
	s=default; t=1706964751;
	bh=kDzi0PK1FWvtxr+2SYugq6DxVTH01PywIH2ZFh3C0W8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=WaP5+shGBxT565ICsWlmebKYnwpXGc9PpnqoSPWDms3dYdlMkaJNwIz0gVTxj/j+0
	 3839dEt+6Fgn871b5B6vJS0UyD62/FNMopTtmsIiBm78C2LHIesZ5yZnfheZu877wo
	 750sYTN/96tFkuJ82Wa7pMQlU0c9WtvFYA+PmOFQ=
Message-ID: <ed5843de-eb16-437f-9fc2-7719aafe968d@countermail.com>
Date: Sat, 3 Feb 2024 13:52:38 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Beheaded LUKS volume pathology
To: cryptsetup@lists.linux.dev
References: <2f1b3b93-2bec-4867-9d78-bd9474a4d31a@countermail.com>
 <07188020-fa6e-41a4-a8b6-ed8a493d5574@gmail.com>
Content-Language: en-US
From: Mistave <mistave@countermail.com>
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
In-Reply-To: <07188020-fa6e-41a4-a8b6-ed8a493d5574@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/2/24 11:16, Milan Broz wrote:

> So if the user does not deliberately write some information elsewhere
> (like pair detached header and data device using storage UUID
> in /etc/crypttab), there should be no information that logically connects
> the detached LUKS header and data device (for default config).
> 

Hello,

So, just to confirm, there is no metadata present in the LUKS header 
that would allow an adversary to perform guesswork (such as the size of 
the encrypted volume)?

For example, if I have a bunch of encrypted disks with detached headers, 
and only one of them is 10TB, but the rest are 1TB. You're saying 
there's no way that a particular header can be singled out based on 
guesswork because it's the only header that has a bigger encrypted 
volume body?

How does an encrypted volume know what size it's supposed to be? Does it 
always span across the entire partition or block device?


Kind regards!
M.
