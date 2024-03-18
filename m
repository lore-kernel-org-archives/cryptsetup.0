Received: from w4.tutanota.de (w4.tutanota.de [81.3.6.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4C3383B0
	for <cryptsetup@lists.linux.dev>; Mon, 18 Mar 2024 13:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.3.6.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710767638; cv=none; b=XVqMPOn5XRfDGN2AFQxpMI3mwgaCxrbiuwDB4avMzRs/EDnflj7561KZhTiXLjHeU9AWCDUqf0CPptS9/U0BCBMnRAk0+rxS2YgBdYQTAoKzeCJHN6XleuCoWe4xZEbJSaQk2P54vOZWsXbkRAWLH2UiFW5ilDL25T1tm6hzu/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710767638; c=relaxed/simple;
	bh=HGL628Yf6/pr+LuXuFkLzBUV0SoW2wKEKQv+M9RQeUw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=QQNJEUc1sCz9/4+qJM7plUgNNIUZ3AiLSO6mBFmhCiG8Fc1O5hYC+JiRt7NveFFBx8w80LVU/7Q72yM1cyfkGqPO63VaJghrIDIItG+dh/IiltRtHwtdIByIc8k8hySyepmhlg5PmaBud97HW+5IeaEobv/q7jMF1q9D5fh4ljk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grigr.xyz; spf=pass smtp.mailfrom=grigr.xyz; dkim=pass (2048-bit key) header.d=grigr.xyz header.i=@grigr.xyz header.b=B1UaL8q8; arc=none smtp.client-ip=81.3.6.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grigr.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grigr.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grigr.xyz header.i=@grigr.xyz header.b="B1UaL8q8"
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
	by w4.tutanota.de (Postfix) with ESMTP id 665E11060353;
	Mon, 18 Mar 2024 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1710767633;
	s=s1; d=grigr.xyz;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=HGL628Yf6/pr+LuXuFkLzBUV0SoW2wKEKQv+M9RQeUw=;
	b=B1UaL8q8FViK4AKuGFT8cPpcvMqVP3xkHqB55G152S9//suvMjubJr9YBRac5qei
	Ru+wHcUB8m7ZeepsH/RLS0JQLi2XF8r9XJoNGH54a5H7f47zuugFiRRalVIPRgJXrX7
	F6hdgQ+NMyx5XkDkhE/QLq8UPueMv4fSl6+hYY6j+xjRW4/stpYtEu+44o+RWb+ARDX
	MjD9ucDLDKSKGzLyUKPWjlfPRv1Ky39pZuaDhd3jFUTPqKrB3h3d2DwbVchsagt21oh
	dn1z8GbaVnjOAsg72WnPu2udJPcANLoAYlDGH2vvt40S0f7ijYnpaq0gxGThQJ0WHFg
	iA73wlCByA==
Date: Mon, 18 Mar 2024 14:13:53 +0100 (CET)
From: Nikolai Grigoriev <nikolai@grigr.xyz>
To: Ondrej Kozina <okozina@redhat.com>
Cc: Cryptsetup <cryptsetup@lists.linux.dev>
Message-ID: <NtGgb5H--3-9@grigr.xyz>
In-Reply-To: <c238a50b-e382-4dec-9b4b-9c33e420b541@redhat.com-NtFh9t5--7-9>
References: <NtEMHPl--3-9@grigr.xyz> <c238a50b-e382-4dec-9b4b-9c33e420b541@redhat.com-NtFh9t5--7-9>
Subject: Re: OPAL setup for a new drive without sedutil initial setup
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I tried to enter a password expecting it to become my new Admin1 password. =
That did not work. The message was something like "Invalid Admin1 password =
or permission denied". I ran it with "--hw-opal-only" against /dev/nvme0n1p=
3. The drive us brand-new Crucial T500 2Tb. Never used sedutil on it. I wil=
l try sedutil now to see what is going on and to set my password.

--
Nikolai Grigoriev



Mar 18, 2024, 04:36 by okozina@redhat.com:

> On 18/03/2024 03:21, Nikolai Grigoriev wrote:
>
>> Hello,
>>
>> I was about to set up a new machine and I was about to use OPAL the "old=
" way. And then I discovered that cryptsetup now supports OPAL! Thanks :)
>>
>> However, something is not clear to me from the documentation. When I tri=
ed "luksFormat", I was prompted for both passphrase and OPAL Admin password=
.=C2=A0 For the former it is clear, this is the passphrase for LUKS2 itself=
. However, I never configured OPAL on this drive, thus, it does not have an=
 Admin1=C2=A0 password (and SID) set at all.
>>
>> Does it mean I still need to=C2=A0 use "sedutil-cli=C2=A0 --initialsetup=
" before using cryptsetup or...or I do not understand what=C2=A0 is expecte=
d :) The documentation seems to suggest that this password needs to be prov=
ided only when initial setup was=C2=A0 done. Should I enter an empty one th=
en? And if so, what my actual Admin1 password will be after setup is comple=
te?
>>
>
> Cryptsetup does the initial setup automatically provided the device repor=
t itself as yet uninitialized.
>
> IOW, it should work on SED OPAL devices in both states. Either, you have =
to provide existing Admin1 PIN or you are setting a new one during luksForm=
at command.
>
> Kind regards
> Ondrej
>
