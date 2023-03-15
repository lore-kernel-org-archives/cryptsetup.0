Received: from sonic302-20.consmr.mail.ir2.yahoo.com (sonic302-20.consmr.mail.ir2.yahoo.com [87.248.110.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3826D53AB
	for <cryptsetup@lists.linux.dev>; Wed, 15 Mar 2023 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678893124; bh=ZLoPZc95iG5UcfyPz67JMKTwn6pFy4h0o8QUhZZWNzE=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=hhg21w0ZAcL8spiD3nR6TxYHRNdgxpIlqztPVSCcbwQkuUlEG9zpXGxbdB/RFkX+l9gXkQqZqs+LWTL1Dc/H4v8zzRO+siMMTSRlPDgyVZF+VyZKq9TBBm/UeCmNxG21MqEl1slVg+/pl1drC59C2rzZxkRLoU+boHA4sE2u2vhSj+Iqu/DqkYcK7KdU10+d9rGmnBGIlTIcfJfZL1MvoTbALh6SI6e8r3Qj3TSZq4aU+fhZXyFFduUhyMgTkbGKACaFePJ57UGIzzA/2Nm20kUkRTWxPuBglmfdmh/2FfEZfNHpk+owXwSTFsdmTjtJLmQp7Pe1TV32xdFExcotXQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678893124; bh=S/96Hon68G374SNTV/ENmPv/hYA8Ru/QCljaqRP59He=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=tj0CbHQyNynbOPozNuY23MWilhJ7EgWD5tDcrJBZKGOOogGuk+ucuSsSr7yQUGmAe16ACIzBNEBipUTED3mR5GY4Ntn3HcStfxPmUEEpIT6xzvKR7YZIWmxoBdhfY3MAfkx57txXB9CJPYop//zgQEAc2P/HoUSpdIiadQbdFQxWCaIJfKhutI2Nzr0UxZ59IEhrxeU9j5CC+cDOxrlby+ZSqzpxpNE7JCjsjMyVFUQX9eIIVhj3JuXUomiAKiTpK5nG8f+qPH+SGn4enECil42c/vKyXIlrbpOKUilpnw32ZtKrm6UscheCtlwjtmxeHcJzA7u487ONZ3tQ5MZiEQ==
X-YMail-OSG: M3NR55MVM1li6voSQTLx5mLJz.xa0gm5Y7Li6gOntVB6yGtzROSHiwoaGkGplZN
 gLpcZ4P0Kf7TWeChQWmr361UX1DuVfYGCB5XxHstgCBYof5Z2oGB.J0w_sfumEYS1oQGwnR28Ksf
 iTTMFaW5PUBLeoEGqNB8qKDxuulpTIUTeCq2BQIU7iaXWbwkdNGGCdrXZpSdB6NVhVRKTNIfE7mj
 K4bKf5ShKTaTjztmpGke0tYqrkenxbIMy2gfJ5Uy5lgv700llR7FF.5U3.SdLs6fUOMztX9JuJu3
 C1kWlF0ZeWFl5MRLArtYXVHxVkmpyArzasbae_etMdJ1.WG7s1eTRScaygGYLYablDiZIk9V0po8
 mtUaHypciI_8z4s_Jyj_WRH24DtRDouwHE10s.Kk1E32xTxO7z.hrWvlekEgvFGR0v_hwYbhMqqM
 GmwjD69blK3.8X0y6JQrJ3NcyUZgfNCesIBhwxbsyj8lD9_T8wp4KKIwfzf67E4erLktdr.1ogw5
 onoPbBMuFN8FToK2tV1LQclWZgCfxsRlTmiQ_3oRRO31cEwHUfAMATMMNFykQ2wVboUTgFESjJbv
 .D50a6P4_BZ2W2oHx3jOnUBuFC13eyP_krOSzk7HuPce9cH9MMDt5fjHpshlPrRoTIfFpqUNl8yO
 mTJgXhLknt1TYGspnxJVSBH2R0otP8EkxN0yJVwB1jFBc_rkplHyNzbqpWPcfMDY21JZNZ8phn26
 ZUqN9Et10pV.TqpJfu1gkOArMr3Iuppo9ygnyUJrlJPqoKK2oRqIcAtoy4POqQDT21Q1GhIk5YOy
 WtzmsxlqCJ2wqt1Isr3vuRUU62U4XTYhjVOrLOiNDF3ruq_n1KkRC8O0cZNYp.xQy2S7EX06j383
 .TAJRaHCjYV0R6UgqJF3s6DyWzHZQHRLzO2oXFieMUkJW1qXcAyUIDAxsCVmELW3fF1vbijY3j7Z
 jlIZueFQd1mJ89uoYGLXv.A.MtzuvI7eo.eCLQKlMOVEZlA3O4zUF5Ka_Z.22xQLzN4YAsirk4PA
 w39xcelNAB151NrJHGekjRlQScqhRXYzOwPFTzsxJNTDzgu5oVuue6DVOiLHTrcnKFV0PWxUftQD
 v5zbM3CjsftCZwdMsFBFPWY7BMYWiMFPbU8p._FCzx2xZrd8mPvP4RK2M.7FFIMawI1_rV2u8bV0
 qzfk5b3S817ADhJ2EMyB.jTQ26238xNQ9IlaZNrYj5mIczsG4cNTrMiC2VBjcQYQ6SZ6X676XRHm
 or1G8TIdC4ZR0HPHh8oqMb509NikwVCq2ggHbgTou4mdpGpAa50ICl.wN.g3m36Ch_LgwqV08iy1
 ZAskIYTgK7WHIdXSCUBOPe0OwPr79kIDM5ON6H8L4hmhqd68Imcit44cfVTkc6XF_fDvkXmcxnFH
 JYf99fqiNL_wc41Z0_lyeqMta0kC5uob5F80w10wQS10sF8zF9MDYlxcx_j7b6mTnENflptmapGc
 PChlIWPe4JG1gKIuunBaOZ0bTbuKdwkQ2H5bGybYbIkCyDcyHx4YqlLB_1fBo1Jysp7s_zV3SIyi
 dpnfWEkYrh.9IPezWXo56YFPM3TWMam1ORg1BpDN5tWDzV0urggqneBQ4Ktgq9xHmoXiltYgicjW
 K4SnjsuIeiuNjfHAnfW6oSvb2ueqZypQMW9Tp5D1eFNOxGUKFRjYwpJDTzhv8s_wg5pPmrTToQKi
 eQStAc6MAF5tJE8jUcxAMRePoTmLfHfoT5ondZdxEw4.yE45LrPIYciExSdxPT.3GVyiXXemzi4R
 oXeYmKXYs67eqKaYhjGcvYnH0lNgsaegNw1pf6z4XI1MhlyYaHrU1iK.eOlfnDmud5aI23uPjup.
 brVqlFuBxokpUVgNaMXchdFMVI5bdxm03M7rH_SpkzkzouDQjJHxIqhJlSAc2hwdaWMNQD8PKU7m
 2Hz4TKwDW6HkToaCDZpxm51mLpBawHCNlHQ8PdBiiHp0l3p6GXiMtr.t4r13Awy7G4775k5N4SB_
 KaWtJWdD956rNXO0vH8rspCQyoxDhF9Otj5nfYObgqYgXYYG8b64r9U33pJc5jyio.L2HSpayY3U
 9Y6pr7DTr6Z055RYmZA8AgURRoGdWKmxQzmNRymdxpDX_O.652LaiH5Rwum0j3_hk_bd2Qxb_vLO
 LZpxHdBG3uxJe0yPDXy_leic.
X-Sonic-MF: <martinolsson311@yahoo.com>
X-Sonic-ID: 40486ca7-fdc9-4805-ba20-03840c2e2aac
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Wed, 15 Mar 2023 15:12:04 +0000
Date: Wed, 15 Mar 2023 15:11:18 +0000 (UTC)
From: Martin Olsson <martinolsson311@yahoo.com>
To: Arno Wagner <arno@wagner.name>
Cc: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Message-ID: <885982240.717525.1678893078734@mail.yahoo.com>
In-Reply-To: <20230310011952.GA1141@tansi.org>
References: <1738775229.2387123.1678372528163.ref@mail.yahoo.com> <1738775229.2387123.1678372528163@mail.yahoo.com> <20230310011952.GA1141@tansi.org>
Subject: Re: Password hash as LUKS key
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21311 YMailNorrin


 On Fri 10, Mar 10, 2023 at 02:19:54 CET, Arno Wagner <arno@wagner.name> wrote: 

>You probably have an issue with line endings. In priciple,
>this works and is supported, but interactive, pipe and 
>read-from-file are all a bit different.

I see maybe it's something wrong with the way I'm going about this. The following
are the commands I'm running:

mkpasswd (asks me to enter a password, I enter test)
Password:
$y$j9T$35ITJ7yCc3kFUsasf3QDa/$n.HqacKYHPIEE6VxIHhT2vW8.7vfh.fn008SQS5ETb9

printf "%s\n%s\n%s\n" "12345" "$y$j9T$35ITJ7yCc3kFUsasf3QDa/$n.HqacKYHPIEE6VxIHhT2vW8.7vfh.fn008SQS5ETb9"| sudo /sbin/cryptsetup luksAddKey /dev/sda3

(12345 is an existing key, and the password hash is test)

printf "test" | sudo cryptsetup luksOpen --test-passphrase /dev/sda3 && echo "There is a key available with this passphrase."
No key available with this passphrase.

(this shows that test doesn't work to unlock the encrypted partition)


>The man-page has more info on this. Best try it out with a
>really simple password like "test".

Could you point me to what section I should look at? The man page does mention hash
options but they relate to the encryption of the partition rather than the password I input
to cryptsetup.

BR,
Martin
