Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CEC15382B
	for <cryptsetup@lists.linux.dev>; Wed,  3 Apr 2024 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712168675; cv=none; b=i5piDhV+lNhLndOdy6cp8mf9M99J9E1sjlg7iUnmjHdPlvhfOGSYixVVMLhcUxFRiFaQCz0cyHEkYHme/6A2kwFVoF/vXjcPn7QCuMzfQRG/TbIODkxC89uMrVEJI4wdeYhuNRcKBdt5dePd2FhcXmbkNyC2TH4DXNc6bWLVuv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712168675; c=relaxed/simple;
	bh=9wB/RAWmH2rBZWVt7rXCnQqTDbcevhWWYfr1x/OAyNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GNKuxIPRbAUmVoU+AxQHHhw5dna5Ledrc2xa6PZ8s/3CMSp/Zjk/JRkjDoW9DNYR1YhIOqqYiOuMv5E2zP2vh54fKwg4DHyaKCQyRita9iKmszTkdQk8RcjuKvqs2/DWqyTnGXzgBBDIJaW5UGobEe1qWQDpBLDCd/jPFTtky+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.co.uk; spf=pass smtp.mailfrom=gmx.co.uk; dkim=pass (2048-bit key) header.d=gmx.co.uk header.i=xanda@gmx.co.uk header.b=eHYmtvie; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.co.uk header.i=xanda@gmx.co.uk header.b="eHYmtvie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.co.uk;
	s=s31663417; t=1712168669; x=1712773469; i=xanda@gmx.co.uk;
	bh=9wB/RAWmH2rBZWVt7rXCnQqTDbcevhWWYfr1x/OAyNU=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=eHYmtviea0BqXDgtawvHsN/sHsWJQc3ECkZK9NdWw1AT9nfJdY6kgBGOrtG+K/P3
	 W4NjczoQaBENID4021tYKgUkZScJ+JeIXJ856yxytZ0JGcj0/i9x10Sq/nys6zajw
	 UvOEHWLvcqRCLs77ESZ6NndUz8EoeZV/hcJU95YzjoRLrmzDPN3Wz5NGGwyOWaoo0
	 3KQQj0A9iTtw+l2XptOVEdRqLrgxO0mhu0cBGRQvXoeLuDhpgeBGNvfnThUBEGYZt
	 GApwYdunZK20hjctBB8XuO4U7QFG/qrWz67CEXwkWyBuv7whqD+W3JK+aAqcreffY
	 omqY3Qz8UAIMwTOxhA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.126] ([86.154.10.229]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MsHnm-1sh9Ow45Fq-00tjFY; Wed, 03
 Apr 2024 20:24:29 +0200
Message-ID: <5cd8c2af-150e-44a1-8ca7-e4ef7f84c78a@gmx.co.uk>
Date: Wed, 3 Apr 2024 19:24:28 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: How to resume decryption on LUKS1 in-place
To: Ondrej Kozina <okozina@redhat.com>,
 cryptsetup <cryptsetup@lists.linux.dev>
References: <cd29a952-c9ce-4aa0-8903-a79c325824f0@gmx.co.uk>
 <764b4743-a61f-4e95-af07-d53c1e842e64@redhat.com>
 <3e4d1b13-7935-40b6-883a-68b2ef16545d@gmx.co.uk>
 <80c0a6a8-b710-4483-8e57-56e1951fa213@redhat.com>
 <76ca5ef4-5298-4c03-bdc1-8b1ce012c7b4@gmx.co.uk>
 <6caca783-5a30-434c-b9f1-234a1bff9310@redhat.com>
 <08281b96-b6c3-433e-83ae-3b6b382714ce@gmx.co.uk>
 <dce9e0d8-dbfa-4b1a-ab61-33b6c7bc770a@redhat.com>
Content-Language: en-GB
From: xndr <xanda@gmx.co.uk>
In-Reply-To: <dce9e0d8-dbfa-4b1a-ab61-33b6c7bc770a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m2+sQaJo5tSnH9em6Y2eC15qPGaGvf298NjC1xEjriv5X1jSEX9
 1+M+jpfDEZNOFIbsXLlS3ZDGP3yQvwYPGD1RhM4ls0iWML13X1k4kce3U1tHE8LK7vdCWC4
 cYendkP2fTVhWUYmk3m2rt1anYIZV1LKi5izT7UQgrxJ1+Q0BD4IlMR5onQO4Y+t8e7ecXd
 5pLLTaoGpVR8/TGIBNzdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sBye8eGhGWs=;YAFoa0VcKHJTtxID4zSbw4fiWnG
 VYlGPI+/ImULEmsKbX+6BbfTdVQ4WH7kmEF8oZ3UtbbwXaaYtvJgfVevNCandS5SzAnMZ1sJt
 g3XJ3gXeYGoA5denWtY37tYxbXdei9QjbuBcXEzig+ABsIQ0wYDGYdfyVjqxWRPZ5qcyR8+Zg
 grxm7jULe3tDu4yAkYXJlf2b8TfQBEgMjA96z2tDsA8Yz+0aMx8eSgaXAWHxc+M1odGrVcsrA
 tHWrb9Prf1lw80EQKpeBBiKlYiPvHWCfPMGmMLmKQ7rYCKAN+E4DrkqgICLg9F2bcIOUtw1O8
 5ZUARXTVImyKoV0nF+oTMZn9b5oj1QRaKn94kRBId7D4MLbCXNH27krr/fprX+YyJJr+zo2Wb
 v5f+N6GADxTJDYopOB5svDa1hbgAj7uMLiPGUULhkG7/88jexTmAXIlKwV0RuyXSM8Cf+HVvO
 d8fJU0snUfkt3fxNxihVt+U4bqfAfuzrkHWO/SwH4kL8aoU1LTk9E32bc9z/6s0McyJQ9Qecg
 OyPt0uUW4x6ZFe92Xkit1Fl3DhZni4SpM7+1lw3Q7BVJwBfv57XtJMpqfDORfKxpXO68I30T/
 0fkYuSTsiTWKB6g3pOZg+Oic6EtbIX+QdkacleMUZoVrT2mtVleKYXWhW+yAAtczkCTEDBuyH
 U5DWpadWSSRmcXuVZbPpxb6B52a54UUzAGzX9G24+5JBo6/lcdo3B66G3arhe8ne/kGHtUzBO
 h9A1CeF9YXDu+gpi+QZ0biObBmyiT20+fsz3H1OWofi2MaVPUINZUTajIS3N1aJNZIbHt/JMC
 5RLqU87wtW4bXsVNAIwEx3AzeeUmZ7ZIM97qPrGEyMTK8=

Hello again,

We managed to follow the instructions and resume the decryption from
where it left-off (and thus the data we needed).

Thanks again for helping us on this - much appreciated.

On 07/03/2024 12:14, Ondrej Kozina wrote:
> On 04/03/2024 17:34, xndr wrote:
>>
>>> In general? No I don't recommend to downgrade to 2.4.3 for normal
>>> operation. It's just currently the best option to workaround the bug
>>> introduced in 2.5.0 regarding resuming LUKS1 decryption operation.
>>
>> Apologies - my bad; this is really what we meant.
> No problem, the issue is already fixed upstream[1]. Will be released
> within cryptsetup 2.7.1.
>
> [1]: https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/616
>
> Kind regards
> O.
>
>
