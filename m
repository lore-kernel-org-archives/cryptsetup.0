Received: from mail-200162.simplelogin.co (mail-200162.simplelogin.co [176.119.200.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C54F15482
	for <cryptsetup@lists.linux.dev>; Fri, 14 Jul 2023 16:04:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1689350360;
	cv=none; b=l0wVqILuaHLj8PEJx9SuMTnlj0q5UINZYvbxI6IAuPvpssG8C4WLRzbc6Hzse9cQ6pURC7HtbbtRCaRDj1qpgXVEeMy8K8xmuNj2j3Z1CzBuons1gILPcwDYwPAtTVUYeefRCdgiejo3e6OuKiK50mILZBgUc0+hSnsvpkNGNZrhQo3Dfh7Nla9gIb5ndHpNVPFfjGZrM0HgWzFaxGUmcgka1xBVJwfXGBUHJ8xdecH2XtYMCdDkDmB+QK/OhSXvPwfRvNGk5keEZt8W23YHvnq0OeYrp0KICo8wcpU6Fg9pOCT3IYyYjekHnIoXpgJR4Xi1UKSOp3Ul+hgY61YOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1689350360; c=relaxed/simple;
	bh=e+VpZCZW6vt+KZKBQ3LLppBGOswCe0qb/v4qFx5J4Dk=;
	h=DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:To:Message-ID:References:
	 X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing; b=D4zolfHw1u9mAjJtrpA7T1VJ1u+T+CBQNnaznReGdgleP6IYVIx7jMzeUa7Ug2hK4TCaREZsV/XZnNuzcheOCQsGB5aa+zJMLmThdWCEpF0kx7E3InwcDi5VFP6UtCSVgy4+rX2HpxctDjaNq1hyQtWwZO+5iXwnNJKZU6HWGXyXjFzyvhebw+BWOC8kZPz6P7HF5sO03RYjP+ps+zn5zYL3KIVnggJYuvp0UL25Et5EZc0UEE6d/0uyBTgpDLaRrQ3NTs8wF9N1QK2677/MGxGXI0uQ5WzcbbSsG+Q6EMrXb/SmcBtPDUyZeLtzpzEHaPTcY6vxvtlS2UrYiEBVGw==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aleeas.com; s=dkim;
	t=1689350360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+VpZCZW6vt+KZKBQ3LLppBGOswCe0qb/v4qFx5J4Dk=;
	b=eUETH42oGVtxKT2tYRkkHc7iysUnVQXTX+NxxHbm9G6hw2Uaw+/ZEMO8deF0Erc8Kv6FDV
	7SbYHkQJWsvimLqjn5Q2ZCECly4SEq1sJ8J5JyMLEJ5Gdjl5o1p5TkYCQOw1V0zGEAJS0E
	BPy/E1XjP/j3H1W69SqxY615By7WX2w=
Date: Fri, 14 Jul 2023 15:59:09 +0000
Subject: Re: A new container with an old header
In-Reply-To: <a19dc3c4-d5d3-4d66-aa52-cfaa66a374ba@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Darek Hisc <darek.hisc@aleeas.com>
To: cryptsetup@lists.linux.dev
Message-ID: <168935036010.9.15383461725109301682.152889758@aleeas.com>
References: <168917759492.6.4364561119493214109.152005529@aleeas.com>
 <7cb9e19c-eddc-4c2c-a2ac-2673a1e208e8@home.arpa>
 <168926225260.6.8499250006616259794.152440275@aleeas.com>
 <a19dc3c4-d5d3-4d66-aa52-cfaa66a374ba@home.arpa>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 152889758
X-SimpleLogin-Want-Signing: yes

> I strongly advise against using MD5 for anything where cryptographic stre=
ngth matters.
In my action I descended MD5 via sha256sum :)

> There are other ways
> as well, like using dd to graft data from one file into another; I
> picked one method, not really to the exclusion of others but to keep
> things reasonably straight-forward in my example.
I like to learn (when I have a bit of free time) and I came up with this al=
ternative on my own:
dd if=3D/dev/random count=3D100M iflag=3Dcount_bytes oflag=3Dappend conv=3D=
notrunc of=3D/my-container
It seems to be working properly.
What do you think?


