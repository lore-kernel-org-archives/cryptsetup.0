Received: from webmail.countermail.com (db1.countermail.com [5.226.34.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA5B22307
	for <cryptsetup@lists.linux.dev>; Sun,  4 Feb 2024 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.226.34.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707051323; cv=none; b=fXnyPmvBMn29POsE6S0J3Lyvz0U0Kgn70rH7+p25pK5FrceyJsDIX+gLkWHS31kEJmJ4xdXKvH1jOobAYnj9cVq3lAveRK1CO/wHTg/kdg7br4AYFdBidp+3ExymvoXXUDg5UDX/a48AmhVfzK/QKJ1Bjfo3BYjZ50/sow1e1JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707051323; c=relaxed/simple;
	bh=ISj+AMNH14QhL/K/IHolwBCtrugk1bOuiMEdb2cbHsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sZZb83HPnNZziLm3EB8FqP+etCz4R+CxnMcdPEDwvopz29wFUO6RfO64TZAyPKAV7f9NreW042l4IJNgp5nuBGaw5B/JrJOHH5U8Oxa/iwu9C/2+lOxEFGwvkqnb5Y82++jiNwbplKJ7zQHGY/98u8BQgZliRrmiFtG10XQL7nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=countermail.com; spf=pass smtp.mailfrom=countermail.com; dkim=pass (1024-bit key) header.d=countermail.com header.i=@countermail.com header.b=XadOOcOP; arc=none smtp.client-ip=5.226.34.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=countermail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=countermail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=countermail.com header.i=@countermail.com header.b="XadOOcOP"
Received: from smtp.countermail.com ([5.226.34.35])  by webmail.countermail.com (Postfix) with  ESMTPA id DD9B06ECA0
	for <cryptsetup@lists.linux.dev>; Sun,  4 Feb 2024 13:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 webmail.countermail.com DD9B06ECA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=countermail.com;
	s=default; t=1707051313;
	bh=x8EsFd4uw5jbgCF9o/v/1DB2bwdoTMrX9kCSpmHr3To=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=XadOOcOPh7WELqJWx6bb46VemRjzO01XVXXrJ/0pApX4Of7hANsLYI1GU8NIbD2LA
	 1LuHOQdwNxcR88h9ya4W4QoOEARCgHuACKRrgtJIbi/ZX/mP2lnxwySROVdBxiTPYc
	 uZaEW7lwQVsGwb+42yVE6Q9zxQ12JFMxhrnwLGy4=
Message-ID: <d285676a-e5cf-4fa7-8521-9ae900ca9727@countermail.com>
Date: Sun, 4 Feb 2024 13:55:11 +0100
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
 <ed5843de-eb16-437f-9fc2-7719aafe968d@countermail.com>
 <d208bb24-84ea-45f2-8e38-b66f0c56bbe2@gmail.com>
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
In-Reply-To: <d208bb24-84ea-45f2-8e38-b66f0c56bbe2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/3/24 15:23, Milan Broz wrote:> For LUKS2, we can store a fixed 
size, but the default format
> set it to "dynamic", the size is determined according to data device size.
> 
> See luksDump, for dynamic size you should see
> 
> Data segments:
>    0: crypt
> ...
>          length: (whole device)

Ah, thank you! That answers my question.

Best regards!
M.
