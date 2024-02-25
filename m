Received: from webmail.countermail.com (db1.countermail.com [5.226.34.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2BC182D8
	for <cryptsetup@lists.linux.dev>; Sun, 25 Feb 2024 17:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.226.34.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708880704; cv=none; b=CcAfjRAl/b2H46pXbPPzZb3YfTxvxoWbgy79A4fauO5CQ54qreK6Gl6gyH8DH7qDuz2LOzkagCJtkq8VjF7kuBus/pQErJrfINR8WpkycqsIpKCboaDSFvCjlOGnNopj2mIkQJwK8cgxqpockl+waDQnX9+CxbisrFCGPeXd0S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708880704; c=relaxed/simple;
	bh=L41BF8SKiGWXcLAyx5aGGxBL1iRM6nbtzuYuvKLHhAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gnEDf1wV8gA7W/OkD2SNcYBaqmcv5uZczXgVBsTsS90THnwRc2PT/MEl8HVF5POfkWRK7PMbR2wStAeeGKOFx90hnQB0wtWPcMWzxspECLSQDEur1BjtMIi3pnNxe9bVE7Hripod6RDwKx2VcQwvjPmtlhyeQp2k6k3B7++Tzpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=countermail.com; spf=pass smtp.mailfrom=countermail.com; dkim=pass (1024-bit key) header.d=countermail.com header.i=@countermail.com header.b=gUc98xBK; arc=none smtp.client-ip=5.226.34.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=countermail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=countermail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=countermail.com header.i=@countermail.com header.b="gUc98xBK"
Received: from smtp.countermail.com ([5.226.34.35])  by webmail.countermail.com (Postfix) with  ESMTPA id A891B6ECA1
	for <cryptsetup@lists.linux.dev>; Sun, 25 Feb 2024 18:04:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 webmail.countermail.com A891B6ECA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=countermail.com;
	s=default; t=1708880699;
	bh=zJNNTBYoQab9ClP6q2hNYeAwyhtPhsQvXsiho3vinuk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gUc98xBKeMu2dLtWIxY3ZZs+SOJ3jcOyt4NbszPxPz6kViEG93321CYPbfx9XAkOH
	 OjKclHlnLjUk3kE/+pLseCu27tRmVtRFJFHZ2kH052OhGaTuTHEdl21+iB4FYvxE6q
	 jVwnQ4oD6k25eJiqNxWaj5lqsMWH6A7LokxS+g/8=
Message-ID: <fd408ce3-bf49-4dd3-841e-e9fa631de574@countermail.com>
Date: Sun, 25 Feb 2024 18:04:58 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Partition table instead of LVM inside a LUKS container
Content-Language: en-US
To: cryptsetup@lists.linux.dev
References: <31fece1e-62ad-4451-8a87-86f08a4dcd10@countermail.com>
 <d9045882cb08f2cf0b09f959f0dca6cee5a26e03.camel@interlinx.bc.ca>
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
In-Reply-To: <d9045882cb08f2cf0b09f959f0dca6cee5a26e03.camel@interlinx.bc.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/24 16:36, Brian J. Murrell wrote:
> So while I cannot comment on any experience with using partitions
> inside of a LUKS container, I just couldn't imagine not using LVM.
> 
> What is your hesitance to using LVM?
> 

I'm only asking for opinions in my quest to learn new things about the 
secluded parts of Linux. My "hesitance" was initially that I wanted to 
remove another layer of complexity and use something simpler than LVM... 
that is assuming the partition layout is performed at system setup and 
will remain static for the lifetime of the device.

Also, I'm not sure, if GPT partitions are as antiqued as you're making 
them sound like.

Best regards.


