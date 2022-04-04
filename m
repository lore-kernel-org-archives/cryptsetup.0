Received: from sonic314-19.consmr.mail.gq1.yahoo.com (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878CE7C
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1649090475; bh=qAvsWmvghKEmrEVYTMPo2kVdNxKb7rRmPY75aHM6yuU=; h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To; b=Fz51Fsou5MZT6kbS3W3qotqcPcf86otIPVm/nMu89oW9ensKw9IQr0E+7rtfONWS0pHYGCLzlLSTOA4+q1rZIBuXGMaI9Z/M4gqjNIutewe8NHR2vy+xZdQtmJgO+WFEKSz3MBs2vf1uhgypkeRK5oRI+Y9ckWEEnUkNLbGpBfot0iUjSwxw7YRi6dWCd9UswTn8RICfhXduUA9PCaj8L0+fzSq8WP/jEvMERpPr71Opq8fca17be7rlicEYmnyJBkT65Yw5zsp9+1wQfAn1PVw/nLCoMrnoPCosVqev2Gf0RcUWXI82Dt7dcWa9cAXUmlFqzUHMZghH8Quz8HmI5Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1649090475; bh=XiFlk8yPp8fs50r9CJF8zVDVfEebfCQ3y+5cRgcsg0x=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=ogcuFg5YVQ79oNZYguommSHv1A/1ub/QNxDflyGdfXVPqNbjFPSRWzcaIh7ZE4TCIMw7owW5kOfN82f9i4cPUlq3e06ZZ0rZdoosiOZU1IWHWLdQh8Vo41GmuL0hTMjWmHRZmuV8aun2Gm0DAlQIeptq7+NMYUt3GS1cxShVl54IZNoNsBRHzP+UFu0dsMkvpRnvmMCBTVm8c8ofC5uYVqCG7heWR9xSa7V9l0M9sPiZBr89b1OvOHxYDc+FtDNbk+bglqb9trftI+oOVHiS4V1mbtVsdi6DttK+banw+HAfiNp6Wt3ahGfFVa0pzb0Um61t1GxCuLNjUelS/HDFQQ==
X-YMail-OSG: jZXvj7EVM1mXits3_atG2TXAB8Y1I5MWBkxO116q4DEHaO4v3JDvtQFliFv_1xz
 5lbIDEEe9c50RyJJY2zDH9TMRbNg8l6VcYo62U5u6hz2ctxwph3jLJ3rIiNtC9EVhetbG0YRRt4Y
 KDrzQF_mI5BxXiueRDXZl_Q8Vaq0Y9kWttIcrycho7dLYl0YKJTYCxtfGWDpI6H5DT1s4ShKvn7o
 Pb4AEbd2keqiuLoXz5aB72QHpsGknZ.ZArxfMsJDuQKP9x7QwsG26Ft4LCxj2igu9sb2c0fu_mO1
 9qeu3OaunjujcdzwB_bCwAOAbIZKOZt1bvAFhum9rFc_KDOCgDK1o_iZDAwEjIviRREGPcipzxL6
 p7IqZkpdRroHFfmTQA7YS1VsJwhWogC8lhr0J6ObD80K8CdM5SGuzOU_h4CfaUdcGx1hEwuj8TYL
 lLtLhNsxWtAwjp8nItQ9Ce._vkLh1PFlfy6uUaLSOSjM_pVnWX4n78IB4YKFdnDzW7exWBsOoY41
 uhZq.1tPlypXKLIdzjNbU6ikFHYkDENWJ67htn.VUhn6JsdixWZ3scfK60YFDa5FMYqI1AmEkHPb
 izGUrdEn.sLYnj.Ekxk1xu0M5ypmk21BxHjtsqgu7K.2_4RxojI5CZ.GJ5t9W3F9RJ81ReqvNojj
 CJELVUVfrXg4itY5NzIjyI0YL8yP7Mnynp6qFFRBlgQOpu7osZpK5zh3.8ilLSE11rBPgszXSDfB
 aV0bvOZ906Y5rKMNFP_gf4x7dnmvHUG8MOrwJkFViglFFauIvmhYWGZu6n5nHNEA5iUVHG6Tsn3A
 WX.LCZd7xszk4UpMojCWsDXWNfUKsS0.yYM6lVmDt5Wwuz3HMb.50njLxJXf3jYVK5Ikt6c.7x55
 ByFwlNJQn7xza2z6v0hNYpbFNMnWTvzh3wE2ku7mw2yRGiDAgNaFAtXftjgNsTo36Y.5Qn0pq8ox
 K1Nk3x7dLaJ06D58GhNABh6jDersXc192SbRGmLfm2jSBcZTx90S4Y.jhU7n5Y5TGht7mA.FyN.z
 SY8xyHZAYX_bZiE9kqeyGKbVCaXfuVN9bxAJpbT.NpDoBe.yGAR5nG978LXZvcwahioOd7iPf5OO
 ILu5fSC8q1hpioryS6o1YBjW3t8tyM1.jw325WW0Erfb1DThF30pKhzebE.vwT3rPTmMjbfGX776
 nc_tpeq_dHFKSfcungdXmTZ2Q5p5mi9Jjkfbz6E7YhMg0W4u4hb.93Mk8Ruc0tSS_XBuGkWGaWzn
 MzbQk6Nlqb5W2LuBH4q1p4J5aa3M38kiwHcrRKGMa_JqyVV8fSgURE.lpQWvPuqqSScfeHbiToa2
 QcVHAsHiMs_iMWS2HEI_mQAuZfeSBSyguc3I0lW6YuZmWAVi2xSYAYLW2XUeYsfhtb2k1srY3tTr
 3StYJq_5bfAVjGiil_CdjcmBhWLGPqIHH4_4Rw6TetEmjfzpBZLrdIvrEKKczg.d1gke2L7OM96r
 heWwan93zE9LEYnx.O2rCNNCCToKjJKDG0XBC6JZFse65L5hUhzja7pX7BSxOfG3k8FV9mftN_L.
 hIKAf4lkxu75Agl_HHPnuyL9gvFdLJ8dd6..AcE8XW07bIAYNpkJEjta_OwBL5MIUYeJ2zuCnXk6
 mL.GaGAlvbDxlL5_lfviCnSeXKqHmFGBaPBKUtXXmFacChRCrebhKvcsBrR4V9iNBARPMkQ_8RYo
 cg1.W6h.ZB9scquhJm8ASXnVx5Zi.4PozCz1wzcNIyzW4oD8y5VzutIRcWwjMn75oYDzboA1UIaI
 AuXDU_T9CJZXBYBhen0Hvpq7IT3Kgs2zsClhGajjs7kSZnaAKtDFKOn2WYfIeokNavXHLStl9R0Y
 gKUrKdA25QxWwYk5P0kBgHM._FNYRJhYz1qbEx6dKvK1nBRkEIIu3b.iT7YPrDVKqSrbsSON1UKO
 3av1rfZIlo2Hcv3T1GVR6Q5XtMkMt69xk0Qyon1vjvQ4124D6h5.CajgK9Sum7dZS5E1ntzFj6Bb
 98bBfSxCvpJDp_xUbRyVaLQXjOvDNjpTbk0D2VH4_sQPLLdKaTd30fNPk8PvYWgM4t.Uc60BXpzC
 fTVz753i5UgNjREzBbTtwBx4LsqhpqXwZTO58xZUuDq7Tz9mIEX5rtVNSOiQLVnlcU70y1lfcFYm
 t0v7z580MoED4fEBqeM2t0Jgwz4bYdZz3HUNjzMSAhmX1e9RE0aBDtQ87HDneDprJYyc8DjoyEwo
 6ffSAJSr5XesBlheAS9pEd7f.zC3tBM8Yk5tRjVPylVGDz4Q-
X-Sonic-MF: <gbohus@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.gq1.yahoo.com with HTTP; Mon, 4 Apr 2022 16:41:15 +0000
Received: by kubenode501.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 4545b35cdd4287ca698509e0d573377a;
          Mon, 04 Apr 2022 16:41:12 +0000 (UTC)
Date: Mon, 4 Apr 2022 18:41:05 +0200
From: Geza Bohus <gbohus@yahoo.com>
To: Milan Broz <gmazyland@gmail.com>, cryptsetup@lists.linux.dev
Message-ID: <etPan.624b1fa6.52ad5a2e.74ce@yahoo.com>
In-Reply-To: <2bdc84bb-de25-3a07-450d-0001a602030c@gmail.com>
References: <etPan.624b1819.7c3954eb.74ce.ref@yahoo.com>
 <etPan.624b1819.7c3954eb.74ce@yahoo.com>
 <2bdc84bb-de25-3a07-450d-0001a602030c@gmail.com>
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
Hi Milan,

Thanks for your reply. Of course I saw the problem with the versions, I j=
ust don't understand how it can require a newer version than what apt cla=
ims to be the latest.

If I understand correctly, you're suggesting to do

sudo apt install cryptsetup

Right=3F

Thanks,

Geza

On 2022. April 4. at 18:26:56, Milan Broz (gmazyland=40gmail.com (mailto:=
gmazyland=40gmail.com)) wrote:

>
> On 04/04/2022 18:08, Geza Bohus wrote:
> ...
>
> > I have installed cryptsetup-2.4.3 as described here:
> ...
> >
> > apt claims that I have the newest version, v2.3.7:
>
> Do you see the difference in versions=3F
>
> You just cannot have old libcryptsetup with a new command line tool.
>
> Either install everything from the distro repository, or install everyt=
hing directly from upstream,
> but you cannot combine versions this way.
> (Here new commandline tools depend on new API calls that are not in the=
 old libceryptsetup.)
>
> Better do not compile it yourself, use distro provided versions.
>
> Milan

