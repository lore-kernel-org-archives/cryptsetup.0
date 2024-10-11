Received: from mail-200167.simplelogin.co (mail-200167.simplelogin.co [176.119.200.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F48219C87
	for <cryptsetup@lists.linux.dev>; Fri, 11 Oct 2024 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655815; cv=pass; b=WZLJKxkm6WGXGPJwlzU2xfyV94SqVkUS3C8YA8S6jAuDyNag1S/oDmN+vofnFp6+ahRWNMKOj0X57y19NGSLQCTXin4rUB78pH6ZXNundKu+DG3kISDaMDq9OsBEEsEmphMeLoaOyxL/bCX0rYTSGctFkUKPzf3/AejcQ4FtxnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655815; c=relaxed/simple;
	bh=VXGbticiJGEK0MieKvcP6kGRW6sw+TZOslB+3k9nUXs=;
	h=Date:Subject:In-Reply-To:MIME-Version:Content-Type:From:To:Cc:
	 Message-ID:References; b=FMMrANrQSvi7pKR5g7ieFgPSA69wfIN1sUDVW6ilCR/1gVIhSydsUCJotrjSTFXByDhbSl1cWz3sMPe/F8OAUq/SnnEhGSy7Q4IXd7rDpqdWULUcWBQrTVX8gSCbEbqtB4g3C67Efz1Ak3dwTpT5hN/nEosJK/DhD/EanBAgSaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me; spf=pass smtp.mailfrom=slmail.me; dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b=uCXuQ1B1; arc=pass smtp.client-ip=176.119.200.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=slmail.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slmail.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slmail.me header.i=@slmail.me header.b="uCXuQ1B1"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1728655281;
	cv=none; b=QOzYrtU8Mo5k6XNEjK3NGaAMlv8LJkHX358HdxbJfhMtCgBQNCFu4E0U1BHa6haq7uhUcnEmGLjg1ubBjoTrd+m7R5w53byu5IbazVuY6+5nuqd8ytVERea99dGMfw9BM/E7DJ15wHxD+xWxSwHRGreXUlKk4ifXMcCTZRL0TEMLT4x/5VmAvzInToYESvvy/uE71kUkq6FttgY/vib6FwKe4xpcpkXmNZiBM4DGslO5lZIsV+qcibPt24X4FeUvu4AgADOfMQBWWojioCTqmnCn/tNYP3olnjHssrAqTSM0hzq7Qtdq+UnV4/SXBR4QtQ987dyTI5v8RpLTlNmw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1728655281; c=relaxed/simple;
	bh=VXGbticiJGEK0MieKvcP6kGRW6sw+TZOslB+3k9nUXs=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=L+avpsvjjxqYei5Yzqee9Rm8jRZaPLwj3lfljAedL8/29DFQGJ2YSbP+WWNvrP6kdI4VlI7/bnhUsW0a4iFnK81I7f/N1+UMeD/jVdXmm8Z9/woM+Ft3pCZqmsGvQk8/lCNJhq/TS5o3Znhi+1usIhzUY4Istwn1pgRyfIXZFxSFDz5IsAuWu4uyTwuCrvegG2n4bkbfHBhCqU857Dgdvp/PSa21ZXAo7utGaappMK1O77irvLb0ocIPBvfb45oTlMhrev0TK1l4gVu0Wi4pR0fm4KwmWhZSGlJGbj+hOAK6JIMtfSeZ3bt0wp9tmmXvlOA9aa80UL8kve6nGBHI9Q==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=slmail.me; s=dkim;
	t=1728655281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXUC67Yyx/fqXx8F6z4+1PpTbNR5X97L/9BpTiTgkzM=;
	b=uCXuQ1B1aI/mumkSyot1Y7k/QTAmSPPhQ7t5qgpGFqCD8UAUmtv8jyheAz/itzkh82XNZ1
	najeO5uDqU4XHlbvJfL1Ct3Oz/JG9Z3+z/IFkxKJqXjGYJ0AaRsIBwXg38/lU1kStnH5QO
	FTO3RVF9Q+OmBZuvdzj/Jx3gfGynFXM=
Date: Fri, 11 Oct 2024 14:01:09 +0000
Subject: Re: Issues with LUKS Password Management Options
In-Reply-To: <32be1215-bcab-425b-99cd-3adc26590b14@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: iam.frightful278@slmail.me
To: =?utf-8?q?Kiss_Istv=C3=A1n?= <keraform@gmail.com>
Cc: cryptsetup@lists.linux.dev
Message-ID: <172865527522.7.15832692550076661927.460247870@slmail.me>
References: <32be1215-bcab-425b-99cd-3adc26590b14@gmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 460248168
X-SimpleLogin-Want-Signing: yes

i had the same response and request that Kiss istvan has... im surprised th=
e devs don't seem to be aware of this feature (maybe you's don't utilise an=
y GUI at all for cryptsetup usage?...)

but for us GUI users, that when plug in a drive to the computer, we get the=
 GUI with LUKS password box, under this there is the option to forget passw=
ord immediately or til logout etc (as kiss described).. and the default, IM=
O, 'should'/could be the 'forget password immediately'... i also felt this,=
 and wondered how i could change this feature... as it take another few cli=
cks to access my drives.=20

im running a linux mint machine, cinnamon desktop, if that helps.=20

regards
phil

Sent with Proton Mail secure email.

On Friday, October 11th, 2024 at 7:08 AM, Kiss Istv=C3=A1n <keraform@gmail.=
com> wrote:

> Dear Developers,
>=20
> I would like to bring to your attention an issue regarding the password
> management of LUKS-encrypted volumes. Currently, the LUKS password
> prompt offers three options for remembering the password, with the
> default setting being to remember the password until logout. However, I
> rarely turn off my computer, and I often keep it in standby mode for
> weeks. As a result, the LUKS-encrypted volume remains unlocked for
> extended periods, which is not ideal from a security perspective.
>=20
> Every time, I have to manually ensure that the password is only stored
> temporarily (forgotten immediately), which can be inconvenient and is
> easy to overlook. I believe it would be helpful if users had the option
> to set "forget the password immediately" as the default behavior,
> perhaps through a simple checkbox, avoiding unnecessary compromises
> between convenience and security.
>=20
> I would like to ask if such a change is planned for the future or if you
> have any suggestions on how this can be more efficiently handled with
> the current system configuration.
>=20
> Thank you for your attention, and I look forward to your response.
>=20
> Best regards,
> Istv=C3=A1n Kiss
> 

