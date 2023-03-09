Received: from sonic304-22.consmr.mail.ir2.yahoo.com (sonic304-22.consmr.mail.ir2.yahoo.com [77.238.179.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D62D50B
	for <cryptsetup@lists.linux.dev>; Thu,  9 Mar 2023 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678373280; bh=TqqBsFS5zAxCnzXvpHcdx/rbrYsfmT9P2n2UPiHGuOU=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=UJ/DwXsoYjXe3PW1UxahJM9zGpT8MeJA0FTKZJ6kTRTASn/VTgcNFuo842MC24N8ibHyZpuAXrsOovNO4EOYViqQ0nlWtVYj6tv6F1x8zxCT0rfatvJnEyfavggIt61L4FuJqMaMXy/ImLR+FzdY1waMNwRthGiZDVStj2/2OA8GDVfYg287/J1W5jDKKZisimAXXv6VDYoHIvf5W2RZgCB6IkZGDAjr8i0gIo0L1/yLcz81lsP5mwIHCX7/GsCNDSdDbujL5qDfOjUv7wUYVaXt4zAKVWeo6nx7gRdhl+IswusruX2IoOCyqjQjTT7tsthgNDL8101uUo6sVlPRsg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678373280; bh=PA01txUHNe1LoL15zoVQT/1o2hNHayie9dK5QqUWKUv=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=gRexBzlmVazb4kCrkW+qo9OInxDdw5MXLaMVvmIp3f+hZOy1VngzZUL5U0ySCjmt3soERMnIk1vx8FDJANufXrLI9vyVh5Krwrk6NlF8FNgNPWFRYSf3YzBUAigpuIDvWmN6Fj4GhzDYvt8xKq7vZJj+QqnwhasffbPiPw3R8Wu+oX68ItyLBBAN5Et2CM1xLpGXLfRW3LuqZjo8nMCjrrJTwFSPbKydGXXqT1btP+qhSR62GUQtnkUqsL0Xi7jcARtb2REY2ppL5NtJ7bOru97vFCkrlNFZnihvUpAMDOw60aOzK/1K57buCbxXD2OUyI/wHj2rpAh+5AOdFGFPmA==
X-YMail-OSG: IS.bb3sVM1kHfUSVjrkdVp6QyumOo6kz_WP6u2638390q3padovRKXSSvmuDlXz
 H2vLmrWFMgKy41NYDmmIRqUyu4M34lXxfBc75H_iJXyJm0BSMIyYRkZS5aCBLQdVQUMTBRlGwtrZ
 TOzJhc9RcJzTj6DCiBoi3.cSOZfoEa.iBJfJgKX8RQm5zjQtl1WA5hEXx4qvPoT7wEZTW2LmY6bL
 5HVly2yTzch29Fxnq_7K5pSsYkzc3JZpm1D1uUH0GKrNM2DFcVr8P8sOHgaGyC2nbBz0qstCSDA4
 ZV_Qt4a2EK2yPwsQmyGS.UvrTnZxO4WJLcolbv__tGW_PaEX.JzTYOx9NL663ImwRElykckGNGjW
 hvg3dprzDBaURVzNrBQ97uppyW5IaEVdMX130HUh4KVGpuq7shpdIK7._bogV4B8rNrsmAfqd3y9
 8S.ho.GOqegu0S1Y3fUOSk0k6wxM0KKXlBxkUNofz5zfoaufOeEhsYLXzrTnAPUkjc1eWsmGN48P
 QREaHgEJxlNXGSHPrFdn4WXoSWXFhVWuteweMKE8H2fjJwanAiZGcBtmoSseREaJ9XNw36qeww6K
 EY7EhOYcGYL1lEc6Ld4iwHLH4RCl4.j.lNi83PebzhcN_yFAKIyd9x9q.FqxAUq9xOyWIP9MMhNj
 0YwNLxNu7gzKuxMTlNhVjdshbYIBf2WKUCtQqvWCGeNFQF_JP65PucqovrYXwPYDjsFXqmfmqYMF
 2wH8HuVTf6NZIDM0eHuO4_i1XVLjFpZjVjkA21NLD6T.5s9QqxT1MCvJP20sYaoj3KCUCPqSYDAy
 6DV.vswzJ1.XfMYC8J77G98YtCz..fyYURJmQtKPX6tghJFOW1.9y6lR.Dg8D2cpLlQH1j1IeHvJ
 p5AjaeBzjzLz_NKzy9OyXwmxvxQtD2Dz4cm.7pLMTEsLMWIRi9PpT7pACM.XOA3T9MG93hqh3r5Q
 mSG_oSUlZmYhgMtAR6dXuDVJDSp4T3Bkks6bUO0OFqjkuAV1HGIQ8gl6Jvj86X4wy2H8trI3YJgH
 i4zbVeoograwYtyT.Ag3179NPqdtEL52mXCA..UImv9HVlY1jzAOl.77JcsyMXjG.a8C90f9cerl
 IUTKkwCF9v80d.30N5zNex0N8Ex2GHP48uw22g69PRnWGA_98kYbwZNlT1uGHzOzBF524NqbBEh5
 TZ2rDRfo.8CQTuBPOlTVae8ihhDUOIfCX95UscyXM2ilNCVpQZm7B9qcUdj7_0Wuh6tag5v3XrTv
 hT__VkkY7PbNptFrLavJ3CPi56AyUwZgrMG9SdlO9himTbgTmMG6iu6ISEMlVVsuz5mth1KU3OjI
 gjC_IPu61_Az3Dxw_XNszcbOSUBc_LRmqIbRAZQIaCnUfdFk8.wSVtlsMt_UD8gYsXBG_3oWmrBb
 93SZ0LHVnEMp9NV8yVyw49VdSG3HdCfStW8E7bweMv6.a4Fa0tCS5tq9R4OF8jw_TX1fwAOIBIvG
 tpwQa.bewJ.8NPMYn22Ry61XzSbChiJyXhwxdUt.j56i9YdwuN12sx1xaCy6p7T6_1syB826qeQ9
 QEqtwp6BoHQzlFp_HEh6SKyvZ91CA.CaqscXkitR9NkWUNmbtIGrPu6Uhba5P5KsbRmQknwQbsHl
 hkPC6U9QJV9j76OD9ews3ArsG.cNSeC.diE4yrox4geKDtEILl217Z.2Kof2u2ecbCucFPmDfFYB
 h24LSYqe76qquJ.mTKrcyS2_JCUVv12VFeN_BOgh.6d7ngITRZv_8VGRTT68PgKOFOwLJvEA33dx
 ElRFg5SIOPjaeir4VEJB8FZgsi0JF4FgKseESAN8_HhJH6uu2rO7Qj1fHLxv8i61efTB58fGbbUC
 U4z7mmmgmFfhOmSQQDirS4DVwkRZJ6r7Mt8EOOLYb4ld1PYvTB.DIaHYb1DGmOzQsdxJnQgAKCQY
 67wonl.tqj.G1ERA5oiBbD9ha3mfVBpsoZEjbCB5ACpOZ8OW6JoIlsqGnMEyUD6_i3zSOALHEeqe
 GHvduk2.pOa6FWQT4.ZjD2niiPDJCmJpUh16OogXocyX5QfNnVOO2JttKa7RLVpwQjg5l1tEekvp
 I9IM.H5jjdoEytLLr2cHqJse2pG7lh3EzKPdI2K4LrOJMdV7mxz4e.GhvyeQ-
X-Sonic-MF: <martinolsson311@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ir2.yahoo.com with HTTP; Thu, 9 Mar 2023 14:48:00 +0000
Date: Thu, 9 Mar 2023 14:35:28 +0000 (UTC)
From: Martin Olsson <martinolsson311@yahoo.com>
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Message-ID: <1738775229.2387123.1678372528163@mail.yahoo.com>
Subject: Password hash as LUKS key
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1738775229.2387123.1678372528163.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.21284 YMailNorrin

Hey,

I want to encrypt drives for users. I want to avoid having their password s=
ent to me in clear text.=C2=A0
I was thinking of having them use a tool like mkpasswd to create a password=
 hash and then=C2=A0
pipe the generated hash into cryptsetup luksAddKey.

Unfortunately that didn't work when I tried it.=C2=A0

So I guess it's not supported right? Maybe you know some other way to achie=
ve what I want to accomplish?

BR,
Martin
