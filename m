Received: from sonic314-19.consmr.mail.gq1.yahoo.com (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE5D7C
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1649093523; bh=fGCjZhrsKkTJax5U2j6WZTSYlzFSbTPHr6Jmyu1itDI=; h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To; b=ciqA6nUOQd0n8V+igctbXXIOXze8PIry0kax7mhy/wKncIub8LWcSL2Lvmvp/pOneiIIsJzdEDkS/wPVuO1p7nGzEFkG6xkwKIF78cuSgulboYriJUQS2XI343QFvoisonXUvfAygQpk4q98edWGcSL7bYIve78tvo0OpuJ8laDc+3pd2hiDzBg0p8TMXnzCbkY3QAcOyCrp4Yl0fj+cdxpDX8F3OcqUdW3s18Z3eVprAgD2j+HgMiTG+Jzh2ohbsGfAJLz8dJY+3vkwHu0l07q6at8E65JFEHIW5WVjNAjqY0SaSpAQnJ3RPUGAcVvxOeXjob+LUd+ZooAqDm7smg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1649093523; bh=NKZzRK+N5Tg7XvqTgzay3mkva882Ufy9QrkVodmHmAt=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=evO14PxXQSNEW5pjbzKPtrqXJJXEIIqXwdygU9BpriyWhhkqxp50PSQKgWQCQXS+G+cNyzCHk316eRJx+GEsF+TrvhZyfLl86K6sFCoepGYDpyj9AGPJi+6Y7mdmNPBd5YSJMeJaSpg+rNvxqr1qMKIK3Cf+irDClCoSLHxVSTOsKN/qRgzRarz/FWNUx3ivtoHhuuSimocSTHh8Ut8wNts/EKzuCRkdHAD+b3sqzVo931H0+jeEMbDHbysoq338CXrhrtE1Rx+CihGsSltnPfmNjXOi3/CYUIDruDmDygs257ZwSly14xChF59tKINh6pbq/spSIle2GCQD8lGk4w==
X-YMail-OSG: Z91JgdQVM1nXtHIqCWAcT5pHVvkzJdEFTPljAUj.ONptVTPVOY3vRGsuryi9ZSI
 TdTiskzSYQEN7Dib3VXTf23mMkTZYq9b52MH_CVyU.JRI0Ce53bvhTnxSzBzNM72M3rln9gnWkGS
 jJcNxtihR.byi7alTdlkWIbz.A1uCQJbEL2.ZoZ3D4aUbKmVhPz3qZLe9zAY8qSh_HV_nMUhT8vS
 7SqIp_Q2qjUsOYjd4K3CsXSe3S2OsKaexurK8b8ignVtpGw.GoL_NDfFUmBJRMnT9bsV59FbxbDr
 nuHU7B3.0JrifwDXpeZZaRWTbBuxx3oX.b0KchaXnMRf04nXCoRppAobsBctN65gj27WHl21wRFo
 hhfSqvS7tmGXUcMwdBhEc6x9O7_LHjbLe1smSyxw7vObOyO1ewMD2u8G9_YjUut07FBw1jHri4Y0
 050kUIg4yMuzry4.BYn7IbSF_1VsMb9zv0wTRh0Ijqws.IKrLFFhPfugaFEFjivFAsx1MrBAJGdL
 3_JMkbaxHQka5LCRlESKCCSTc3ELPONBIbx7C_iGwljUAvvp9qfjfV8KfYWL2lKap_WVvXVAFSYX
 hDYhnueqztnX95r6aqbD_7Waz.aqTZxhn5QKWoMgTRGrNUsXi.wNtou_UyH6KxpdZlGMy5g_.lgj
 79V8ufBkmY3RDbu1IbVkxYRZKJVz0UWHRJPF.HOJGbQCvdj1KB4FQKVC5w4t2L31ZdoQtT3nfSRT
 YNBAxwwX4V1UxI4IALiJEu3aGfdFyS54SP7q59lheKDxW3v2zbhKqOSm8N1cwsxPz4722YQM2n6c
 nQHPpx_aOsiww8NOvhwusqopzrgFFWgSsiv6dzM2gXuQXY0_XgZBbYhSrRuiq9ABMrxYKOl.JIm4
 oy1WEd82w39fwX3hi0lonq5eGh3cPg1zN9tJ42Ay6UJFGG7DYSv.rp0zQpSKc46YYyLYscm6h5sq
 ZYsrwYZwpqz_mE3Iq4JHS6XcF_qQj6Q9D_4TzfFmXCYKuSri0lmjTBVUhPFFjr1KbuhTBNsovthK
 yaHJ62l6avyW6nMYTfSYfnkAUAB.KZ0Q4xRWQ3u9nzUXzlN3AQoiSSXrpRvkMKBS8S70cyATajgy
 xxNd67._Q1trCT3.tS9C3kndenzDGq.CeJZQkPD9k_irdNI.jkbbaN0Uckmbxkg3muIxfoWC8a8E
 SrORftFtcyrp6zsfM0pQjKlGMsRsIHhBlGFBHS6KHBQpIxaLm0TJVwHZPxI0UajoGEFUllsm6LQM
 qkQw2hHHC87e5GhN1n9ZHPlk8mo6SnQlwOBqBNkvIuUJtkisAEtCCRTPTrsWcvMolM2atC7a069K
 BeUXah.5exwQyBINFZPMzJV8HSsQlsq5bWVv_YujwRkvAwcS0LCZCQ.QoJF_n0rYZe67cKbj5ud4
 BXkUADCKww8zu27yJb3DXDkSuM3x2Ln.s0QjVcjefdHRcb74B7j.2R5wJcyyaEPaIG1rTFxLIfb5
 kEDeNfQ3MBt.2MBhZRkA.xl52w3L.Zck6gip22g5Jxin0FZOnL0ywybcuD9eBaIZ05EXbSy4LapK
 4pGQrPPTzNYc0C5H_Du6jTyBkQvJXLaDHVDs9qkBYZt4.j3SOx6PEawFaSwB1eNlHETti5lDGCP5
 Sa0Nj1dt5EkJ693kLq7Eu7N9lbwXQ9IqfRp6xtmmADl3ckHosXC2uALYy4LO3k7Gh9d7GrBg7W9X
 Lu8ElXbLWfyUtYIKkZqjHVHQrtjRmyGMBSCzw4waHiJikfJhBnYqPkni63PDps_wTbxgGninz2jA
 WSSXijX0TTUP0bL5ZKnE8VBcRo231jQHxW1GborkGWICGq9tlQTQvQlEctkybW7NhhvxNBssyfvw
 qP4nR7sz0eZKpHdMtWDMQ1MJ9CnXjPVgzlJHRAe.XoGOMEcPq9F2E.yM0yiXnZFg7G75wWP4M8Ig
 ef0cB.hq3Bs7U1awx4R1BY5nHO03.0IDjASZazRsoxDKmaPR_IXdUI.0yP8g_AQgb5Mw4xM9fNrw
 2YAr8mCTM9xcRGqwfdCqaCQc0E72WPRpSMQEXycEQ_DRVf31_uYprr.95OlAv0c9gzhQyuPSYUuW
 PTCWdJIa6k1K6e5o7OhPhPEJi9mnHlPyQnSK1XTZZv02migbM.CzPwqPIiKT.sEDbl5L9MK1nYl8
 1QUZ6rXw4fzPMviYludiZrZlp1fUFVT0TuOI7v1yKNpbOh6giPD2Qs_N8UNtFL8y4VATaljXOBf8
 uBfKyHxEDolXgp92VEjBb7B2R6wXjp8hj6oQjEiSwCSb3qkJA5Fc-
X-Sonic-MF: <gbohus@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.gq1.yahoo.com with HTTP; Mon, 4 Apr 2022 17:32:03 +0000
Received: by kubenode514.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 2a1c20225f34c74f050915e3840fe1d3;
          Mon, 04 Apr 2022 17:31:58 +0000 (UTC)
Date: Mon, 4 Apr 2022 19:31:50 +0200
From: Geza Bohus <gbohus@yahoo.com>
To: Milan Broz <gmazyland@gmail.com>, cryptsetup development
 <cryptsetup@lists.linux.dev>
Message-ID: <etPan.624b2b8b.423dc97f.74ce@yahoo.com>
In-Reply-To: <60fd4577-2409-5d5a-a615-b1b65c0f5fc8@gmail.com>
References: <etPan.624b1819.7c3954eb.74ce.ref@yahoo.com>
 <etPan.624b1819.7c3954eb.74ce@yahoo.com>
 <2bdc84bb-de25-3a07-450d-0001a602030c@gmail.com>
 <etPan.624b1fa6.52ad5a2e.74ce@yahoo.com>
 <60fd4577-2409-5d5a-a615-b1b65c0f5fc8@gmail.com>
Subject: Re: cryptsetup: /lib/arm-linux-gnueabihf/libcryptsetup.so.12:
 version `CRYPTSETUP_2.4' not found error
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

=C2=A0
Got it, thank you.

G

On 2022. April 4. at 19:07:24, Milan Broz (gmazyland=40gmail.com (mailto:=
gmazyland=40gmail.com)) wrote:

> On 04/04/2022 18:41, Geza Bohus wrote:
> >
> >
> > Thanks for your reply. Of course I saw the problem with the versions,=
 I just don't understand how it can require a newer version than what apt=
 claims to be the latest.
> >
> > If I understand correctly, you're suggesting to do
> >
> > sudo apt install cryptsetup
>
> Basically, yes.
>
> You have somewhere in PATH new cryptsetup tool, but in lib dir old libc=
ryptsetup.
>
> (If you installed it manually, it can by in various non-standard locati=
ons, so
> the best is check =22which cryptsetup=22 (or =22type -p cryptsetup=22) =
and remove it
> from there manually, then reinstall the version from your distribution.=

>
> Usually we are backward compatible, but it is really not a good idea to=
 combine
> different version of libcryptsetup and cryptsetup.
>
> (IOW what you see is the =22correct=22 error caused by library symbols =
versioning
> to prevent a malfunction :-)
>
> Milan

