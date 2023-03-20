Received: from sonic302-21.consmr.mail.ir2.yahoo.com (sonic302-21.consmr.mail.ir2.yahoo.com [87.248.110.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AD27C
	for <cryptsetup@lists.linux.dev>; Mon, 20 Mar 2023 17:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1679332005; bh=WG3I31yGC6xpRXJEpQiA41nChVki4+t9eXMR7zgOhIo=; h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject:Reply-To; b=XVDRjxOJ25Ut1EhH7WyNITCN8FS7rUiRAZ36A3dt/JNsgz0m55577dmSPh0qX7SMJ6WIcMOu0nbWbVU/jlsgcEohOkSXVYOAB9JuXOGe15lGUlC3eb9eaL92pEf2mZY35sBwCWLJE43EuUDf+nonCwNEkN9cmqbRY/CW8HGrAOKJGqzYdbpLVdOrCpJ92+1OT6K6n5LIAWXVJTAv1pqlpwx5yfmGnmW/AFq1xnthyR2ocE2e1yUykSgwT/GClRKXtHjiEjv6jyg2dvXwYKyS1tu6NHG5PnN5y1G4cimiDNiDUca65sFiMGdkM1/cGj4j+14ZXA5oYTpBIdTxh1jm5w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1679332005; bh=a7fY1Sv2AcIjxAEfZhLVU55tkZ4Rmln/P7VXPuiQx6C=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=M790c3515aNN7KuILaaKtON1hbJqT6cCqP2l1J+lVk3kzeKAAkOUe9d6lemLSIbHgTESLTO4m7WQCUxxYxvqsshZPXx7aMe4xeBxp0n7Ym0m2SACuGfXVX72DlWNA9q1AtUq3by4dyK60ObdhAZ5HvE9JgdFIMlUC+nX8uPEVBMeIFeJUvBsg9ODRxWouHudMmuimwl1wjiOzSTVp06dn3giZwqBuLpod6UMRZgZrpVD+kGLcGnxG4skowKQ36SdJZTtBVr3Gm9b/9/9MxDyI8jGc81juzoDPaXf0heDLYq6lbSgnD1vvmredb4CXi9yrBOrJwf4l+LWW3V5N+ekBA==
X-YMail-OSG: 7DdVArcVM1lslTzBch_OuBQolyA1Ftpkr1VL16Jzh_dpwjEZDz.z.76vVdyzygt
 cV6RtYi4qcRzfBt_kOSWzlcNC1M5u3nG5l6UL4.SAQ3VDX.S1tS8O3_VOsbaMKjZ7V4TgwDHTTJ5
 rc3ZoYDsqfBJgO8YkWYNjnjhXCTPYH46wItUcpUWxA0E3LMYzjifihqRclbLfHwDROwp2egt_4q4
 sL7GHjejFSQKn22QPZbENY.3wW53fLjHKD5IZ4.9vqmh0CbPOFYA1geRAfn0FVngOhaqm4CY8pds
 C0FxKrEFqBwk9wNJngrky3b4SJ4I4gZrQZPVbrYW._OYA9ZleStGd3hj70_v0bu74TJfx.PFwYR.
 H5cIIJWtXrpVTEBsnBHKbvTwbz2Qh9gigD0uqSN2XvDi9pjo_2s7YCcG68Xv8iF.SLNK3fT7U5pu
 7E8_kgQ8X08MBasN5ekcZZKglk6vkyS.RynsIYzbY4dfyR2c4OAvtqN_658e3UvpJynq9cURKI2_
 n7PCYigknJyixp5Hsub0B48865hMlUjTnfkdLYjiVL3dx7ZM8BLkNfK8mEhifBJNyI42lHmTznNz
 8jpowdP.TbgPgzX9IIhReI4K2VsrsUmJo4jacsBXXv0th0yhFVTGuXaypjbcN7PRaRGrZhPF.K9g
 1h4SGhq.SaCt8RQPAM6H37CHSM_xwFMFDyt8YZzaqZXQ3u.vW5ArkB_2vbGopg4HrIpSK50_7CEw
 _CK7LkjWm95dqU0q_rC0ysKDJsfslB8CBveWJNy8KkKIMv39gcwNZ5ejvMBspAavZnjErBb94LH1
 cOBgFTsQCW2np3DEUE7WS1kY_5AEY8NN1yS9f_j5iJ1vLY9kBcinjhDVUYzNUiu75.9iDorBEvch
 zcRF3vlWGwsYmnmOZqLLCtQDFmBdygaz5JDs_ZbxYLqRyXLPN.dLp5YAxqXwc3g9SAWORhLsob6D
 KpKBz4sv7v44rek4WT4S8N4S21yuYnxpjAQnidVX6f1lAu.CB7zRNyhbOPKO5OVOFVswsw7wbCFv
 n1EtGmZ2JsOJQgNiXuO.OQcZ9t5n4zHyroAwzGpBxBI70_3jZrioqP7yvcbLVceH9CfCgl11.Icr
 UbCWrDSVfFf3I0_G1rSJ6Z86nMh1gAPPL2OvSJ5M6Qt2sILepKzNjrRZjVuvkBIQ.y9sK_S6R2NQ
 8FFO5iJpU0VzDogVAkwkuSO0.OmATaIhkLYPNPr5_c.O8flf4RPJFGc86yHPqhMWUKa6vkfT.TD6
 uIR_gVTUKBCV9uHRDI39UFLGDWCz94BrL7eYLNq7YUw.Pqtpxgyv5SB3JO2MTbIRa6X1oMLx.me7
 A3JRm081WgK1ndBq.4RE6lbLiHCopkkqbDoot_NqdsK3zDcF95JythhAMPuJQCzDGbTYGmc.ikc6
 LBYtrmBskk9zezkhF_KlWuFuPBCk6E_B2WyBUhnIKZULOXnhj9VuwygcmMW8LUUGGQHnxo.pCjUC
 JY1cyD0d0loDKALt2F10B4f8OO3AV6NDIwOaNwVnfxjtxM85W8yChoZbTfec5UNrcQW9FV6_yBRh
 khJ_0tSZD.QdECQkkHz0QIgggYtsqVrxbTwxPPf3WNV8ju.X5XPcJfIB8t_4HGQsBp5t2Ylgvc0z
 DmCTFJz82ZFxMX7UCDjOx3XNZvu07RLcEP6dWb4jq5BDjewJe48PskhNRfkNBP.OxKc8F7kaFf_2
 5MYlg0CN4mVvde83qNj9H7rm5t8IXW.zZHTtgJo1DzYuXZYeBbJRLSMYlxKL_kOTK7AwLIaxnh.2
 c3CerHWu7EeUZzbcu8U6laMqjSG9AjauF.GwPAF2AngH1LHcXcDXtNIsu2mtzKvQ0ePoozPYiazY
 G9kF6I1choeaXQeROxEQT1KifPTGY9aqYXlJNgAPi_W7h91eVQo9jCJ10lw9JndItMKbMqMEZN4r
 qxOLoSwlwQDANuzrW_NAsbWLjPo1nwL6wUB7LQam_StexNxBHlijSLIZpXdLCrgw7tCzFoE1Okja
 4uRHKMvPZrp0TuGcgu29kRjema3yKivQP2MYF6jkXkWbMPcgLBdZ2E7fYKTEv.5T9bDH1Wy8_Wqz
 3Yj2cBiJYVXpWU1sD.kBA0468ViPw35ByTd3_ZKZVxh91iaBEcDr1XSR0c0qcykr4Mgoj6zSLmWn
 b.nEodSGc7IZf3yt0q29RdbFua2.tGAXGWqnvqtUh44M-
X-Sonic-MF: <martinolsson311@yahoo.com>
X-Sonic-ID: d94523e2-60d2-4b87-ba34-9b3b753444ad
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Mon, 20 Mar 2023 17:06:45 +0000
Received: by hermes--production-ir2-5b7d458747-bjknm (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7b003df6b00652027deef5f719b8c895;
          Mon, 20 Mar 2023 17:06:44 +0000 (UTC)
Date: Mon, 20 Mar 2023 18:06:42 +0100
From: Martin Olsson <martinolsson311@yahoo.com>
To: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Password hash as LUKS key
Message-ID: <20230320170642.dscsp2nlqos55cpk@debian64.Core>
References: <1738775229.2387123.1678372528163.ref@mail.yahoo.com>
 <1738775229.2387123.1678372528163@mail.yahoo.com>
 <20230310011952.GA1141@tansi.org>
 <885982240.717525.1678893078734@mail.yahoo.com>
 <06e718ed-b377-4b8d-b1f1-31abd40a4dc7@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06e718ed-b377-4b8d-b1f1-31abd40a4dc7@home.arpa>
X-Mailer: WebService/1.1.21311 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On Wed, Mar 15, 2023 at 08:35:05PM +0000, Michael Kj�rling wrote:
> Aside from that already mentioned by Grzegorz Szymaszek, a more
> general question: what leads you to believe that you can give the
> output from mkpasswd (which at least on Debian is provided by the
> "whois" package) to cryptsetup (provided by the "cryptsetup-bin"
> package) and have the mkpasswd output be recognized by cryptsetup as
> being somehow special?

> A quick web search for the two didn't reveal anything obvious
> connecting the two; and the cryptsetup man page does not mention
> mkpasswd.

Oh, I was pretty certain that it wasn't going to work since like you
said it isn't documented anywhere. So I just assumed it wasn't supported
but then Arno replied:

>In priciple,
>this works and is supported, but interactive, pipe and
>read-from-file are all a bit different.

So I decided to give it another try. But I'm pretty sure now that Arno
misunderstood what I wanted to accomplish.

I want to encrypt the password before piping it to cryptsetup.
mkpasswd was just an example of that operation. You can also use python
for example:

python3 -c 'import crypt,getpass; print(crypt.crypt(getpass.getpass(), crypt.mksalt(crypt.METHOD_SHA512)))

But as you pointed out there is nothing in cryptsetup that recognizes
the encrypted string as anything other than a normal password. I was
hoping there was an option somewhere that I could add as an argument
to my cryptsetup command.

As there is no such option I am wondering if there is another solution
to my use case:

"I want to encrypt a drive for a user and I don't want the user to send me
their password in clear text."

