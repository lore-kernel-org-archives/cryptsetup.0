Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92404652
	for <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
 s=s31663417; t=1690224312; x=1690829112; i=blobfish@gmx.com;
 bh=wxOFaVYCRvXZY0z5bQE//aY90zzF6X9DlS3FXfl2iJU=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=rF9lCYpxo8TJOnNT7jSnIMejBOqXBc6PEgBgv4P3IF68M3elA3dpwXB/Du22h2NzUxE/hSu
 hxFl/WSILotBRXQI1g+NZWJUx0Z+9f/e3cimYUytUzRCKKXRilbtEK2JbR7AOGTfVJmdHHWkb
 gNPsuhxyl/P3UeVP+TmIyJYoOr57TT3gqBSH4RIqz40FUaZwsJM+RvHL9Zf6ItSraZfX+Zbeb
 cVCgliL/TiLZiRzmhU9lRfZ+Yt59v2BO3eRqhonv93dK8uL4WqYJZRQXrEnH/q2+I9gpKKOyt
 l4UI3zv0scV4T+UYivsVZOtVzliQXGuO5XlLUFOe3McExxki3H0A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from laptop.localnet ([146.70.57.18]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MN5eR-1qei5t0Lf3-00J4uG for
 <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 20:45:12 +0200
From: blobfish <blobfish@gmx.com>
To: cryptsetup@lists.linux.dev
Subject: Re: Looking for confirmation as I enter the acceptance stage.
Date: Mon, 24 Jul 2023 14:45:09 -0400
Message-ID: <4817818.GXAFRqVoOG@laptop>
In-Reply-To: <31712b7d-402e-452b-9ebb-5ede7afd5186@home.arpa>
References:
 <2159917.irdbgypaU6@laptop> <a543a204-c0c7-4936-8eb0-38fd3ac825b9@home.arpa>
 <31712b7d-402e-452b-9ebb-5ede7afd5186@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Provags-ID: V03:K1:IBeKqc8mE502eCR73l+oSkCqjGZHuCcDeTJK4KhFQSJKt3l7phO
 W/buV8K7IZ0IM7zmIkJr5ad1yj8RUzV4KNaMcs/tGhDoLoR8pErz6/0k/IVaS3PjIYmalOJ
 ff2kHvFt41sCv6wiIlvDVn0+07hCViZlaklSjehfiiXCOm94+rdzbmjqS/Zxsoqa4eV4eoq
 X1o99OKHc9m2UUQhBpxQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/EYin48IW+c=;cJHZjghrGtz45laqWRgxaGQcfNh
 CaLTSIHNn8jVcCtScdHOOV8ea2+2VOMsWagEd7aHvkp+z/A5gjOQBiuS6AHRvLxKlm39hGkdX
 ps7kiH6bK0USc1H5kra0RXP6l2cwqVqCLd+h673CETpYw/x/Ey3dnEOEOjnBIdZH33tlV1pAG
 GDPhqfJjZKTCpA5j/Dlv/TaG3B/wZdS8u/62KCXzco0917+RM+EqUTx0HOm6nqceahhNYeKUp
 7CQkdB1IYH34vk9gwHkEdP7i/SrdU5J4wiEqB4JyghgVk5ymmcnKmMeRLVLSy2slsszCp/a9N
 ZiOxTbZu0ai/uKCnVLnMn5MC2ylTzQVaPnZmyp+Q2ny95DoVtbpWvrmmrOV56HINEQAXaWJl0
 PZPNGPDoLTQAsLHk6eg73BJ7ZWA++uFCTY6OEn8PJS08cvhkGHM618u0Q3W1RnFX2KUTFiFXS
 o6SMg0Y9OrTPcSCXx+NOSUDpXMnHOUV01LS8gEArRBsUp9GXH+y1CFOvxux5xu4IUXwyEaHgW
 3eRAoPGAohA6yGtdHxD8uV5VCN8SGfz/Mvh16YvbbitZ1kqS39hdrr0g7Xi4vMENgP5wnRI5v
 2uUVYF9tNe6ujrkWsO0yQwWqCR62Rf7FWLhsaDWA4g1yNTA7ENv9GHAQs3o76I5FTVAenB19h
 XP3YqH+cFxxz6WNt2OqpOWAqD0owUwbA1q4hTlvPoxVT1lkIsAdOPIad1JcqiJwP67YKBdBnd
 kMgjSmbTA1dh+jxubeB6poYG0tK2gO38OlBBaYScvjUjcgPBmuvCrR/PR5e+v2f1mbQAJMhSa
 LGUeSd40J/3t5Mk8RPHSypDYmIHT/cdZ5f9OE7xt0MX9//K09EVB9tpa6L3zPeqvLCg9iA2So
 ofNOc6+DfyuB1tf9jLOFqhI9dPt0YNJTYrEtmm7V9txza7SpzQc58IKh92u6/A4nE7RN9WzAm
 HBHexA==

On Monday, July 24, 2023 2:17:28 PM EDT Michael Kj=F6rling wrote:
>=20
> This doesn't _have_ to be a showstopper; it's possible that LUKS
> simply needs data that's outside of what you've sent, or maybe you've
> been using that file differently. (And please think thrice before
> sending more; remember, anyone who has a valid key slot passphrase to
> a header has access to the plain text data of the container if they
> can get their hands on the ciphertext data, and this mailing list _is_
> publicly archived. Absolutely do consider that key file compromised,
> possibly alongside your other, memorized passphrase for the
> container.) But it's somewhat of a downer.
>=20
> I would still say you have some chance when doing it with more data,
> though, so what I suggested previously is absolutely still worth
> trying. After all, the extraction I did left only 19823 bytes
> including the header signature at the start, which is plenty less than
> the canonical size of the full LUKS 1 header.

I assumed the key file was compromised  as I sent it along with the mail. I=
 am=20
a little disappointed about my passphrase as I have committed it to memory =
and=20
haven't used it for anything else. Oh well.

I have plans on getting another hard drive this afternoon and starting the=
=20
cloning process. 8TB drive, so going to take a while. After that I was goin=
g=20
to get back into your procedure. I will probably need some more hand holdin=
g,=20
so I will post back when all that is done.

Thanks.




