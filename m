Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2897D67E74
	for <cryptsetup@lists.linux.dev>; Fri,  1 Mar 2024 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709298755; cv=none; b=b0Li5sknqhzm5eCYY2YZ8M+D5cs4pBchtkI8fpA5PFgwHKvATdNAb36b+IGrp6zlPBF4LbFDzKBShsJAnDObFWenD9fKtwheAm75pI07+tB4GmISWlcyybkejDcstIuUVpZzgOfw5jsvUGRFO29nAUsdAxEIO3w2gfJb37HCA3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709298755; c=relaxed/simple;
	bh=8bx8JysSOkhPO7GY/P6wbmXAG87TBG0H+RU2wVxbEp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=phtCDh4PZtoav33cUusCdcKHVV2Pxa63pxYQ5NYNMsGq08lkbSqI0NkZsryL3pSYxNdnQUR4Q2mPPSH1oWm05pZaEGEGyVvtp9Ngca9mJrEWLVXEVMED6vV2ZSRMjthsKW2DWOdPV+yguGculoLrtDotsuOD/zkcNU2Fn0Cw9OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.co.uk; spf=pass smtp.mailfrom=gmx.co.uk; dkim=pass (2048-bit key) header.d=gmx.co.uk header.i=xanda@gmx.co.uk header.b=parKrAvi; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.co.uk header.i=xanda@gmx.co.uk header.b="parKrAvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.co.uk;
	s=s31663417; t=1709298751; x=1709903551; i=xanda@gmx.co.uk;
	bh=8bx8JysSOkhPO7GY/P6wbmXAG87TBG0H+RU2wVxbEp8=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=parKrAviVLMO6UgvM9dE1I6seC81TODg/Oe2V7/yV9kuriMIEt5TjLRTYfEKxn4Y
	 ppMfoCvSnU95QLhCxXFK9LV8zkkU/ptwxo6l8wli3G3yQFi7EuDNmgFFQaPDpxd4B
	 Dt9fzIyB/zlQxlXONRjHp4rx2yfRcfYsaKiW4zcWIMnqu5TWB7o2HH5boNKicmr0H
	 hZeD8uE1FlBxQcwQgBbppielemKnzo6mwBmygS769TLNDDHWdm7OSnPwAPSXGCVIu
	 hg4GSJES5RusM1PeygPbp3e2XvxvNfyRRmNjzxqyBLQCrfheDpTadgyPujr1G57ED
	 TulfCkva3qtWuXGXFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.126] ([86.158.200.39]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MiJZE-1rCjo906Z4-00fNx5 for
 <cryptsetup@lists.linux.dev>; Fri, 01 Mar 2024 14:12:31 +0100
Message-ID: <3e4d1b13-7935-40b6-883a-68b2ef16545d@gmx.co.uk>
Date: Fri, 1 Mar 2024 13:12:28 +0000
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
Content-Language: en-GB
From: xndr <xanda@gmx.co.uk>
In-Reply-To: <764b4743-a61f-4e95-af07-d53c1e842e64@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EVsVrX/PwA4cs+JCa84fZcDK8DRwmJu2lMvJ7Ku34teU1z6b/UH
 CYhf5gCKHtY3sBpDH4s5yWmRg5jRRrs46gqiPonFZf6RnmI0H8ApUjKeTW7b50t9zIkCd/c
 gvqXV/qDigRI6feZlNbk4kkv53QRFQNKP8JoUomigeIGn43HBArhwzxNFlXKCB4+grDeZZU
 HId9weuchY3Y/oBroLLfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bHz27MStflo=;MpZr6RrV1dNjz37qzqLW/yxRW2c
 ztbL/7smQYQ38CjpgJafycSCopKTOjBvRRAz3dml4RUY4eNMjtJ/Q6/0wyh2yLcwZTSsJrqkK
 +zZn51153MME5010sgFUZAgvrb1WA/EKozdGtNSmwkVDYimY1l3T7pWl21zCJ+BEBk5N4VOQo
 TRS4W+WqmiX2GSHWcOgRNicC4flwVbfOuhduxiQIGDd453VO5a7wmacJsG+X3ArzqAjS7BF28
 Z7NeI31RLRQXxD1poNxblkFIjFTuQyNGrjd4U2gaR+Rcbum+1XS5v1v/bVp4ZJAOT6lPmgdpV
 TirPJj0DnjdNL8OwlhV15N2/LJPMPCp9vfnsBbY0KBUGi3DZYEOVHZIvMIujVeOjJqX5U/44N
 XIU819063tgNhliJPyeCvvKY3cnCko3DqkyYSaZOjQRP/pXepYMrhn10dn1ryM7hErCFt6B+E
 J1kL2dYjGeBjXMW4TZa5Puy9Gr+AVATNv3DNDtPvr7+vZMwNF5jx6739cFkYcZqrOMFhyDkv5
 bSgZc+bblLdEOCNAeuEyuOS/WkGfJ3T8cu1By6dbyfQ0I8iVFuo9WWJZdtHR8/Pb63mN3iImG
 i+U3D/lGC8ZR8/ThISG1ufTHvYNaIKmi16PMGtBRKv5zILmdGKQoK0oNcUt1MqxDcZWlKjrV0
 9IQigdTojnkNi7w4u7vekxnmrGK0xx0wHXXOYuGxVw7gzMHJuZ3iV+iswfFZtyOUCyiYiEQeM
 Ckrm4eoqQ3ee4BQJqdySSDt2WUVVAQ8Iqpd+gPuYCpPQrvcTOQeD86wvPocpyNmS6PqqQya77
 9wMXiuTHTiGCrZum9u4tzQSfb9corZI2HN0H+JR7w9oro=

Thank you for the assist.

We've taken the advice to migrate the data to a backup and after
reattempted using the command:-

cryptsetup reencrypt --decrypt
=2D-uuid=3DLUKS-aaecbfc4-459a-4cf9-9a34-fd4af43b8be0=C2=A0 /dev/sdd

This returns:-

Device /dev/sdd is not a valid LUKS device.

The same is true when omitting "LUKS" from the UUID.

Both the source and clone disks are readable 'as they are' and there's=C2=
=A0a
recovery=C2=A0of 263GB of 500GB - ostensibly it seems the original decrypt=
ion
recovered the active data available.

But we cannot be sure and are somewhat confused now because the original
decrypt operation definitely tanked at ~85%.

Is there anything left we can do before to be sure?

Thanks

On 22/02/2024 11:04, Ondrej Kozina wrote:
> Hi,
>
> On 21/02/2024 18:22, xndr wrote:
>>
>> We followed the steps here on the Arch Linux wiki by converting from
>> LUKS2 to LUKS1:-
>>
>> https://wiki.archlinux.org/title/Removing_system_encryption#Decrypting_=
LUKS2_devices_in-place
>>
>
> While I greatly appreciate what Archlinux community does for
> documentation effort this particular hint is quite unfortunate. The
> hint has mistaken the cause and the effect of a dangerous
> experimentation and on top of all, it is outdated (as advertised under
> section 1.3 heading).
>
> 1) Up to (including) 2.4.3 LUKS2 clearly did not support decryption
> with LUKS2 header put in the beginning of data device (regular LUKS2
> device). Someone tried to force
> cryptsetup utility to bypass the limitation by making header device
> and data device the same via cmd line parameters. There was a bug that
> could not detect such dangerous case and initiated decryption anyway.
> We have patched the bug out ASAP. It definitely did not destroyed data
> but decrypted data in-palce at the original data offset (which is not
> user friendly and that's why it was not support from cli).
>
> 2) Since 2.5.0 you can decrypt LUKS2 device by specifying a file where
> LUKS2 header is migrated for the decryption to be possible. See man
> page cryptsetup-reencrypt, LUKS2 decryption examples section.
>
> I'll suggest edit to the wiki mentioned above.
>
>>
>> Unfortunately the=C2=A0device suffered an IO error at about 85% after i=
ssuing
>> the final command:-
>
> If you have suffered IO error due to HW issue the best thing you can
> do now is copy all data to a new device first (by dd utility for
> example) and try to finish the operation on the healthy device.
>
>>
>> cryptsetup-reencrypt --decrypt /dev/sda3
>
> If you have downconverted the device to LUKS1 before the decryption
> you'd need to pass the original device UUID via --uuid parameter.
> LUKS1 decryption uses files LUKS-<UUID>.[|log|org|new] to track the
> progress and to safe tempory LUKS1 headers. Look for those file in
> work directory from what you have initiated the operation. See
> cryptsetup-reencrypt man page, --uuid option.
>
> But again, migrate your data to a healthy device first, provided the
> IO error had originated in a HW issue.
>
> Also I'd recommend to update the cryptsetup package. The
> cryptsetup-reencrypt binary was replaced fully by "cryptsetup
> reencrypt" command (also for LUKS1) in 2.5.0 release in Jul '22.
>
>>
>> =C2=A0 From the man pages it might seem that the process can be resumed=
 by
>> using the command:-
>>
>> cryptsetup reencrypt --resume-only --header
>> luks2-hdr-file=C2=A0/dev/encrypted_device
>
> That's for LUKS2 only.
>
>>
>> However it seems qualified by being a=C2=A0LUKS2 only facility. Should =
this
>> command still work on LUKS1 or is the process (if there's one at all)
>> different.
>>
>> Available are copies of the headers (LUKS 1 & 2) in text and binary for=
m
>> and what appears to be a log generated during decryption.
>
> If you have converted LUKS2 to LUKS1 before the decryption as the wiki
> suggests there should be only LUKS1 related logs and header backups.
>
>>
>> Any counsel greatly appreciated - thank you.
>>
>>
>
> Kind regards
> O.
>
>
