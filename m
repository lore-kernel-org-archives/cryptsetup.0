Received: from sonic317-20.consmr.mail.gq1.yahoo.com (sonic317-20.consmr.mail.gq1.yahoo.com [98.137.66.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FFF7A
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 16:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1649088545; bh=TKq65rapDBJ9VLL3/MZLucUiG9bqHFb5EojG0IrMNYQ=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=tjVcHVGab/recQzeWVSuyf6CtrRzU51t7xx8axIOr4jtUdVbxQ6DkDv02RnQXP1tHA85pJMyLaEHZ001XVs9xVT9kEnToBscI2NUmo1o/SmINchIZS4dJlpHNw3fMZJzPsczp5qr/kqxKRQ5sYi7JsyYm5wpWLhQSSZjXMtP3wLolDUa+XjkUd1vw84AEUpyh4z38hndjjh+/8dxpqpnt+hpcz3Thj+I8k2LMPjPk6Iyo28rIvYhL4A+B9S48DHc3xFZXtVHBe/VmJJYPbXjpbl0cxzTVP8uz6jGAv4XhnHqwedqh2o4VlVXIr+3+/20DVjMujrsQa/bktOwYzm2Gg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1649088545; bh=1pCAnXFRkATWee157G6bOOyq39XQkGS9QRMchnrJyGk=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=fwQugcDJ4+zywIpzkW4E+DM137gfZG+zWOqUWovgIfR5mW27cWNgKmIe2Vg+qT19U7tOEbfpw905KeIowLPzz/+X32IFitvOPfkd0rLrsVpMZAnlh8ef012tGv0SCzoqRzTujsTyg6xsifqU2OkYjL4jR3utBuroUZTEJomG3faAcWk2Uahm6Sh45XIWcVhRWA2riT6Z9C7UD8CX0wXU4J9NKrV7bnUOZv057kxDbpQ//AuDxB36wWeB08qi0x0XMHec5ByVjTpsBWIBeX36Cq842DEtxKBIBaLAyJnJk4yR/ZEWtgX5cjQcoToWehsw2COcPWQl/iEaVM2XcAx/jg==
X-YMail-OSG: 328GNrYVM1mBSj5TDUIAlP57or7aSaoOYBvpWQ.NpYkFPM_2j94TQ4yJlHNJric
 bnmrxEWd0wOTzvWaasJ6byy_6YJKaGQCZSpbkQVFe0TAYseUWTgKETmoveDImq7XMeuAdw8MvqyA
 NbU1v4vlN4MK.NQidncOWd6vvNAy887lLVAKfLDxnil2XAzGRwekDbE8Lib8sJaoqsCmcZm.QZQ2
 Otg5R_QFDAuk38GtjH5G2O2A0c.8Hl0Ra_CgCDZA_bbZ.Nz_Hn0Bkd5yNi6N48OFADONK_MiXNsG
 402nohfvR24tQByRv4jXKxOEiX52VTNkXo2cR5MZOZFKiebC.QUv0ATlqqMOC0aeysNyjgUHNUiS
 wrKEN_ry9zMtktVFiGRrS7.2q8VHaQbvC9HLz9dFSOE2mleDaRxRwTsO9WymDr1mWLty.ZLUWg7Y
 RnPEVwChdL2V.LPY7vsghhvOBUdiVjHRT5ERRMRMfXLtIHo_TTdqxFwSSGT1r.5Q1MW4KB5lqt0U
 iEpl33YOPbhXy221cF3lHWAWbnlYaY8Ed4SAPIP6KQ2JvJUxDWAJpj014HVfc8aMZ_TEIyo.EBKy
 5PH_79BlKW6_LQ9hHpA9UXbpqNf84b6xb9O4HheM06TtK_k2eSV3RsDo1qXPGqRHRj_03WGgz4gz
 BjBGUXcMqU0VVLAP3IP5ajPeQ0pZf68cLIaAHDamJ4uoVTHDOmrzDe9XO0_jxTyBFw2CcOAlB406
 qxIq4cN1jmVzc0PTZHobOqY.3ZNZA05W8l20Gt3mOPe5Vi95ZMMlgXQk5rWjAYcMIFdACPrZo.Dv
 _iv367dMyejno5nN14Inf0gG1QpoiCIMak74fWxsv7xwh5dfqe.CbMAM43hro1KgsSW44k_BhA6c
 Ky2UYGwFqFpOQErpUd5AmdrVHeIF3n4ca62z2_fJnLgqbWumVOYTgcYZSUUdJZn3fGAt1AQAsXZp
 7Etu1FZlxwz3rhUJXX55.SYncoHMhC6aB8rM_zKRIItHYfZgi.3RfAvVQsJCSFHN_FUv0iMOX9zE
 1w.S73lh8Ki2Hz0Euw_LDtrQFoGPYXsAlC9CH2nO6oc3j_ASC_BoaG3eMsrRZoRVAFW6Nb5eoeqt
 gxXFxTryPX8ut4me3OzkKdD5y6o9QuPL70_UfmMRP9xhbA5s_28mQi33oOd.hgiiIiK5PXvrWO42
 IymnFK.ddww3eJNaIAxUIh6dOxjGm3K4iC6Wv5e4hmmRLhCGaDBliC4PeHl.atVLvmuQH5dMnsRA
 Z_YawbGTBElnwaLOKWY_yLJfw9BBMR5IUdEOt7C5J7nYeqoHLwidjl8BV_PlZAvmsrTNdnWhAssb
 bymqvXaOdEB98Qm9iumsvUqLKvLmVdSMs2.qI0gmv4M4zbSGoHMSaxY2UcqKHZ.9aFOG1bKdacdo
 d_O9cDdXe2pUbtCE_jq2qtQomqSKBMnJ_glMFGrPmoV16OevBLJQksSZ41f99LxhwM7f7TsGhZnF
 EW7d2nBh6DCKU172LxvsUt_5j4FUBfIpDXGveQx04aAszGWKSusBz7lqgavpN4qQPNXU6NPui3Xo
 pLAFxMx4krCq3M5EPtHRBWpSPtAN6pTPNA3qkI9CxqDrN0z0quCGC909rH1QtLk9nqiYTQaEbaWx
 KHZj28Sez8K1wDlhKvrKtHG7pcJ9aN..lzNyKSAqO9ASXB3bjBcqtd4CXKaakg8bSgL_a1joMyEq
 qzEriBXjKi27EmIbESfuKw.Z.34Vpgxvk.sM85InD.OlTCVQVBHYQRCIy8lAlXmPePsLBHGDSX93
 FDsULAiV1tBzy7czWhsZuizeJ_qzH9pTgPV14NStcnZZm7lWlb.NTmpZHMRV5dqCJVH8QtNqExug
 .8JsxkC71mTbcga6LiZb8bEWlr4sh.kLjkVvZ.hy1C53T2eizqgo8f5kCFyFvQevZwNkJMOpYNM1
 Z_m.lvk7jS18XwEoedc0PKE_H9U1uV.lJ8wdUw.0kBvH1ZwaIJLgTTiqo.N0pebwhuiT1AxjuET2
 uD1TDyIvX4uUFXYgMLod6QD.8Q5OHIdTuj_AE3O4WC5NjOQAkEak61PoRUR1sQSEqJ_GwMLcDRgT
 ymOn2k8ctusMlX4OIQbDf9lkLc.rhmV6D5fjMzkS9cP_WLFwJ2d72lvTpOwKPNwy7GPV5pkpDApX
 Zu06DwdqNdHK6L8MPMG9YPie0QLhvKP7.Lx930NT9AWv7K55HRxv1i.qdJsHqqowWr8SomTBN0dD
 P..8jN_7uE6U4EQ95W.njY7Vi0mrV.PAoM0MRAbMycqp6Pbb0YBOhlDj6RfjzMdHhUHXpbuYmypX
 mhiWIatJ5ZknL0uX7uEhe3yZm
X-Sonic-MF: <gbohus@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.gq1.yahoo.com with HTTP; Mon, 4 Apr 2022 16:09:05 +0000
Received: by kubenode509.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID f14c03bc4fc5f59121e0ef1bf81e8994;
          Mon, 04 Apr 2022 16:08:59 +0000 (UTC)
Date: Mon, 4 Apr 2022 18:08:52 +0200
From: Geza Bohus <gbohus@yahoo.com>
To: cryptsetup@lists.linux.dev
Message-ID: <etPan.624b1819.7c3954eb.74ce@yahoo.com>
Subject: cryptsetup: /lib/arm-linux-gnueabihf/libcryptsetup.so.12:
 version `CRYPTSETUP_2.4' not found error
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <etPan.624b1819.7c3954eb.74ce.ref@yahoo.com>
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi all,

I had to reinstall the OS on an old raspberry pi. (The new OS is Raspberry PI 32 bit OS, most recent version.)

I have installed cryptsetup-2.4.3 as described here: https://www.linuxfromscratch.org/blfs/view/svn/postlfs/cryptsetup.html. (It needed a bunch of dependencies which were also installed.)

Now when I try

$ sudo cryptsetup luksOpen /dev/sda1 backup

which is how it used to work, I get the error in the subject:

cryptsetup: /lib/arm-linux-gnueabihf/libcryptsetup.so.12: version `CRYPTSETUP_2.4' not found (required by cryptsetup)

apt claims that I have the newest version, v2.3.7:

$ apt search libcryptsetup
Sorting... Done
Full Text Search... Done
libcryptsetup-dev/stable,now 2:2.3.7-1+deb11u1 armhf [installed]
disk encryption support - development files

libcryptsetup12/stable,now 2:2.3.7-1+deb11u1 armhf [installed]
disk encryption support - shared library

What am I missing? Thanks for any help.
Geza
