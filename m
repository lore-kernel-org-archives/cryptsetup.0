Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE8845BF9
	for <cryptsetup@lists.linux.dev>; Mon,  4 Mar 2024 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709563917; cv=none; b=V74niqfah1rLWGIVNvt5o84mFgc2fbkaDtxw5jPrDefw4UFZhwKwqTvQKnk2ap+GrBeBqYGpWaVhOnlvAVycAqf28XoJTi9IMGJc4zI7HyKqN4ZMyXJE5kVjHOoBa8LfK5/AgVySte9b1qdUTv2ms1l1HrHmmq5SdZNLwAbw5vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709563917; c=relaxed/simple;
	bh=HKq9VoPgIwT2u/qidcXfoJCrniRhdVMxf1O54PjIRzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ouLJ8jJghY9CzzocNBmEppzScP74XV5WAgF0VYrHZFOv82LYYecWi5ik1SkbOWTAJiTyrOhCFGWVvBlEuOn/SHxdz5DrC89h7LYoGioGKf8cg8On72LQXj4mkMoa/Y+lxilKl73LkO8VFMZcTygijRTT6WRppj2z0LufkyKtbvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.co.uk; spf=pass smtp.mailfrom=gmx.co.uk; dkim=pass (2048-bit key) header.d=gmx.co.uk header.i=xanda@gmx.co.uk header.b=W8BpKVZT; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.co.uk header.i=xanda@gmx.co.uk header.b="W8BpKVZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.co.uk;
	s=s31663417; t=1709563913; x=1710168713; i=xanda@gmx.co.uk;
	bh=HKq9VoPgIwT2u/qidcXfoJCrniRhdVMxf1O54PjIRzw=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=W8BpKVZTLTTRqH+pgBjV8WagNElbWO5/RgE5ZBLCJlOFF/MECypZddHFzGl64osY
	 DMCrEWHhvcU1PoCF1A5MO2zNhTmv8mfu4EeGMu5I2YuU5paXHywcTRHh+cAXuC+KN
	 awrJvBm36tIIQGZFYsTHcGU1xHcsjC3q9Ie3EsnSFv4C8zs83ZeQJLkAsDYEDfOp4
	 MX6vpvHoWAFSsCHGr9XcAa/6EHh6paY8p5yBfUZuJjJJMeXD2JaXL8lDoo0kgRdO+
	 TfUrFQZSgiuUnJQe7M1vYAnQsgs9D3CUViqWW5VBU2qjDDYhjCcbkyBdUN+Rb0coC
	 W740/BSyo5z/jYIieA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.126] ([86.158.200.39]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mqs4Z-1r386C1iT3-00mseX for
 <cryptsetup@lists.linux.dev>; Mon, 04 Mar 2024 15:51:53 +0100
Message-ID: <76ca5ef4-5298-4c03-bdc1-8b1ce012c7b4@gmx.co.uk>
Date: Mon, 4 Mar 2024 14:51:52 +0000
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: How to resume decryption on LUKS1 in-place
To: cryptsetup@lists.linux.dev
References: <cd29a952-c9ce-4aa0-8903-a79c325824f0@gmx.co.uk>
 <764b4743-a61f-4e95-af07-d53c1e842e64@redhat.com>
 <3e4d1b13-7935-40b6-883a-68b2ef16545d@gmx.co.uk>
 <80c0a6a8-b710-4483-8e57-56e1951fa213@redhat.com>
Content-Language: en-GB
From: xndr <xanda@gmx.co.uk>
In-Reply-To: <80c0a6a8-b710-4483-8e57-56e1951fa213@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2uWJ/2jxuwOy0MBgR22doIt++M0+ve8btriuzdT1ob5fJlp4uvs
 dCbkrnFDeTjwtkysgWi9wHn5XpCxNBhxaP22hkAhdKZ+lM8LZpqozqEgCbg05Dg22Bl+JvH
 H/0/VCvUbAO32LDUXg64UbOJG0Mm7AWgaW3fIOcPTwAh6bFeGaP7szRHA/rqtLrxgHLJKNi
 1O7A2wNYoPjC5cYm3S2VA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+vMojhp3pgI=;d88SWMiF4oUv4WcZdvq7IAhO1R6
 yreHQAUNmd/lduYSeZbxHHkxB1FZuOgxb5FrKN9lYW1hiDI4e5YEsvC7wiWEKFSmz0/leq6aU
 omvGku6F7Dwpa4KM4+9rmSaH84a4DFPr7Ih/0vdlaOkdxgkJtZBgfar0uL13gJ25AhJVDUKUW
 7L+8WmQA6Y3rAW+OyyfTvGeUVNadl3gqyLWbHF5KJuZXLQLJ2q4Xb4/4vEKnU9TVYZLEw/PsJ
 nW7yckUzzzeuXeDVgWZqikWcOxPPo9gq2in4tMGAaMhtkHcYZc1P7NczJv1b1y5eIPC5oZhps
 Lsp64ivo1blUOPW5bvNqhY9ipIUtJSZmTrhHnIwCSWUDJ7UytC+VEKbS8wxyf8TahxZfOLSng
 eamrAo2vvDJhk9qRvGtIbOyOC+MbUIk3grXTq+mxf7s/1nxSHpk7SJ/S6Lciry8VH2JDDa8al
 3mhO9AJKfIwOdiTFj33i64wSGumHHFPk6yPOBO7BBb1m5ehLcLlo1iKLtjEzQ583IYYlwO43a
 BZUxqtvzKiVp5A/EH73ezx+iBoWPR+4RZrzC2tVPazKT71pk+3vrQUOFpd8+3396zELQa+1Ue
 yKR3/6rTJ/dLZ8ZmmvL9Cmj2ukQR37Eq2wlbqLIbO9FQePi/8v3/Mn3GHIf1I37C49sFRyHTv
 gYRCVLsFDoPD9YhLtQdDGs+YaklyNbBqxsSFdVUvoSuvbS5RQpLkrNScOshog74tMWKvXOnHr
 JHGOqo0/Gb4bNKP2mygZ4+myQkuz3ns4EHX8NYPyAR46vinlHOVVNesyRmJf72B0NbIPTErmS
 PgXL3fsdiGqeIq02AUHPCE77gZ7UmnN5QyczC/V/lXzDU=

For the record:-

 =C2=A0=C2=A0=C2=A0 $: cryptsetup -V
 =C2=A0=C2=A0=C2=A0 cryptsetup 2.6.1 flags: UDEV BLKID KEYRING KERNEL_CAPI

 =C2=A0=C2=A0=C2=A0 $: apt show cryptsetup
 =C2=A0=C2=A0=C2=A0 Package: cryptsetup
 =C2=A0=C2=A0=C2=A0 Version: 2:2.6.1-4~deb12u2

We see the latest stable version on GitLab is now 2.7.0; is it still
recommended to=C2=A0rollback to 2.4.3?

As for raising a bug, we'd do so willingly but unfortunately this is not
possible as GitLab no longer allow us to use our=C2=A0 GitHub profile.

:-(

Thanks again though.

On 04/03/2024 10:59, Ondrej Kozina wrote:
> On 01/03/2024 14:12, xndr wrote:
>> Thank you for the assist.
>>
>> We've taken the advice to migrate the data to a backup and after
>> reattempted using the command:-
>>
>> cryptsetup reencrypt --decrypt
>> --uuid=3DLUKS-aaecbfc4-459a-4cf9-9a34-fd4af43b8be0=C2=A0 /dev/sdd
>>
>> This returns:-
>>
>> Device /dev/sdd is not a valid LUKS device.
>
> Ok, this is a bug (regression in fact) in cryptsetup v2.5.0 which is
> not yet fixed.
>
> The most straightforward workaround would be to install cryptsetup
> v2.4.3 and run following command using legacy cryptsetup-reencrypt
> utility:
>
> "cryptsetup-reencrypt --decrypt --uuid
> aaecbfc4-459a-4cf9-9a34-fd4af43b8be0=C2=A0 /dev/sdd"
>
> (no need to add 'LUKS-' prefix in --uuid parameter).
>
> I'll figure out a fix for it (feel free to open issue on
> https://gitlab.com/cryptsetup/cryptsetup if interested).
>
> Thank you for the feedback!
> Ondrej
>
>
