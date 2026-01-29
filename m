Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazon11020099.outbound.protection.outlook.com [52.101.186.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4EE1E32CF
	for <cryptsetup@lists.linux.dev>; Thu, 29 Jan 2026 15:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.186.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769701217; cv=fail; b=ocpd7wGnYoUxuYv6D7EiPg00HOkoii2pJY/cDkxHjVW6wk2I8fpBGNOQ3R95cK8rr4yielHDklNiITcg2TL9oaSQMaK3SS9cV1GshsQDqZYW9+Moc1ZriZNJ9MbSEIuJOwCnCA+4d+JV+EuKW8jiDEZQjubYvIZI6v1IjQMXrbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769701217; c=relaxed/simple;
	bh=1F3a0P6EqS2lOhBJQmVNjX5KedLCshMWi+rbT/WqN28=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=avamIdb7R4tOR/DRzaHkEcpFXdN/ta/DbPnJ6no6Zenw1hqa5OkyjJm7yjpL76yL6sXtHv+wSS9hYdPGBTm8KIHBqT1NGQhCqkimAG9fq79x7nNnYp3UmtB3z1Iy+hHCsFKyzPIbjJjMaHyvtAJpwDJAd9mOEjN9fsuz80nX0QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosen-nxt.com; spf=pass smtp.mailfrom=rosen-nxt.com; dkim=pass (2048-bit key) header.d=rosen-nxt.com header.i=@rosen-nxt.com header.b=bV4NX+sa; arc=fail smtp.client-ip=52.101.186.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosen-nxt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosen-nxt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosen-nxt.com header.i=@rosen-nxt.com header.b="bV4NX+sa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jE9hzsh6V8/XDxTJOfIHYRmaCbnDWsZvzkDfGctMmMkonSMjEw2p1GF0tM8wbv2BFvNm7F4pw2cJMoLMS5Gaxw0MWEr98Y7Ad8B0q/tO6+FfajTG+D4jd4RfyfCXA/gliR24x8HP3DG3WWRljRxYZei3l5GPoJXRwHwVt2noP9/wxka5os7rqSdU1OBQ5LB+EkkQSCSLsXE1IzxbUWOGlo3khRXX05LM3ctRbwSnw4oYS44jUvowsKz3Lx/12qCLmheR6ntE9TPG/921awaRZVS6mWDDS2eaC45XSPvLdlTn3togWLn+bFFGo9Cae7mVVlMG/8WMOChhtlWnGLZ08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1F3a0P6EqS2lOhBJQmVNjX5KedLCshMWi+rbT/WqN28=;
 b=upYkSkrz+vb5Se0B7TAsqWCygcRUedtMK+NMi8aCM5cgnHSus/Fhz2csw6mscYg1V00sCK7oPYOzjNUfBGalZ8A6sqSk0aAkdIPv9LYjzJr7Swp8beWS4FuZneciNWsvOzbPacHxUdp6BvPf5jFbA3Ol8PRDYik7TepM+3hsaGLcr0KrBnjKMUGDiAWukhvJBRgsVWCzD8yj4kd4vLV0ZxD+Oo01xkazifMoQ1L/92XHCKGeev6628kWbqjeX3rr6nxr5x62bXGhWSacuzlb1uZ0iVyuFtTw37Pu7bn7sQHdsazrSvqa+F02pABSOs5cSTW0mOoXO8ujz5yc/ZE+ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rosen-nxt.com; dmarc=pass action=none
 header.from=rosen-nxt.com; dkim=pass header.d=rosen-nxt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosen-nxt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F3a0P6EqS2lOhBJQmVNjX5KedLCshMWi+rbT/WqN28=;
 b=bV4NX+sa+LWh10S0vWw76XK07S6Qaedi3GzOXJ4JUMX3bLD2FP27/xV/jJVWj5kmAS01MRIYPGPjuuPC3RT8dgtmZBIbRjwR+P3/Pzgq9GGepVCYujmnrxJuIB2SbDqrylp/cJoddZm6u6N+l+VLrcg7or6h5odoQOAbloL0CaMCMkbkeqZlQ5UGYf6WSI9CeeSq3PbPKNkJu5W8L6TFbV4rvc+SNIPDXmQFKSTW8xAtggv+6CiLrk9NCcLz2b4PNOlqUDs+l67oA6KYu/c81I6az5EWtMve2iC/qfwdhB09B5abZfTRe5oz6F5tg6mszhydmL/MOvCN+ntEXWZjsQ==
Received: from ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::217)
 by ZR3P278MB1238.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:73::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 15:40:05 +0000
Received: from ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6ba:121e:3a43:ee35]) by ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6ba:121e:3a43:ee35%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 15:40:05 +0000
From: Alistair MacCallum <amaccallum@rosen-nxt.com>
To: Milan Broz <gmazyland@gmail.com>, "cryptsetup@lists.linux.dev"
	<cryptsetup@lists.linux.dev>
Subject: Re: LUKS breaks When using fido key with pin
Thread-Topic: LUKS breaks When using fido key with pin
Thread-Index: AQHckS4slwL6ZnIDwEaAgyIQdBuYbLVpQ22AgAAEwv4=
Date: Thu, 29 Jan 2026 15:40:05 +0000
Message-ID:
 <ZRH2PF6D29723036834E04BED292E18C5EC8B9EA@ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM>
References:
 <ZRH2PF6D297230325546A167E9072E447698B9EA@ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM>
 <b24e4cfd-03a6-423b-9be7-543500798a98@gmail.com>
In-Reply-To: <b24e4cfd-03a6-423b-9be7-543500798a98@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rosen-nxt.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZRH2PF6D2972303:EE_|ZR3P278MB1238:EE_
x-ms-office365-filtering-correlation-id: 07d8403a-154b-449c-a8e5-08de5f4cacdf
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7142099003|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Eo5PHoDxAvRlUKYladTsLK6B+cvDuaRHVacXb0VcI8CWiYEGt9RyPvKElH?=
 =?iso-8859-1?Q?CE6JB7Z6jHv5ktfssbQHaOh95poiysQlsVqL8nEnaw7fcb9c5d1OW+0hpb?=
 =?iso-8859-1?Q?bxFKtKJmXqucoOVrmP7jC9/7dLhIZAi3hgM+RwA3NgcbXryL18a7W2aDHm?=
 =?iso-8859-1?Q?RvD9uW+pI6wNjv2k4DlKvVNSXJkhte8nkQ3s4WY5XeoDNCWOG+z0/8czJK?=
 =?iso-8859-1?Q?uu0Z1lJ9LBKUFeeDMM7ITGtIwxwky8nhduz8Bc3KOYpdBmSwABnirXutS2?=
 =?iso-8859-1?Q?q3tSI+rYhSxySWWkUe9rOFxesL1OE6DeOV+l0IpK5dklOpAek9icGNYrn6?=
 =?iso-8859-1?Q?csU+ViGokycTVq/N6Hm0D8EUiaXtGema/Q7GjRNKazdqEE0F7Q2RHp3yGY?=
 =?iso-8859-1?Q?TzSD9kA2oKXxG2wLrVx0uXHG4jjkQtNzXLAveyaDBStel3g4i80JOYd8QA?=
 =?iso-8859-1?Q?9R0VrRH1/CDW+74HIF1zRruf2rre78PXBwmZ/wZiiXaE440ULWt51jrsFh?=
 =?iso-8859-1?Q?yX+6avWxO5ZUX0twj5QdkJtWTNf3cOFB6W4CZdMgIRZDL+UvSFt6F+kEx5?=
 =?iso-8859-1?Q?eW2cUQEFuCwR+du64to1sHRgMnjagR47CB8hS+a6qCb4ogNydDzmJUb3bi?=
 =?iso-8859-1?Q?6K2tvJ154e15y8YSEmFEXXqV3ibdPPddO2FXEY77lSY3W8h1gldl0tk1Nw?=
 =?iso-8859-1?Q?MNoNJ+exu6GR/4guHbYx58cHwuFnjGMu/TjgOchyyLFQg02dWMlm3nKkje?=
 =?iso-8859-1?Q?3WZdiNQfoxQL4qgj7QIeHEEQNQ6HkzEfQDoNfz0+kLbtg+3uEuNLTTB5jS?=
 =?iso-8859-1?Q?gcZywFRjJ3O9UxIZyqnoWR8nCc/QHUn/CW9JealRD1RwFR5Qtvq6w7I++X?=
 =?iso-8859-1?Q?Rqt1U8p1pRHj6Z3AkMQVK4TNQM6XoAtASUuec9lbb0rhkMAU8wAmEOBxMa?=
 =?iso-8859-1?Q?JqZ/xPc/Ul4p0ZAFyelkDQ3p4HZYEvcqIPH97sUak7/NtbYMAxrH7PDb4s?=
 =?iso-8859-1?Q?gV88MTjC+WTMIVISVfNLyUSRN4rZ9lMSA96ipdI/u7jobtzmSO8Fer0Ezs?=
 =?iso-8859-1?Q?+uI0Y1hW+uCCJrMsxVKI9LYLA2D8slkoAgTMWMPwBJfGlIL75GsY3ks52w?=
 =?iso-8859-1?Q?6guKFZxnoFnw80up3A0CZ2KTLqabESCFI6d52len9UJxo0n7UFSQQAZUC9?=
 =?iso-8859-1?Q?WyIpfRzLFSvfvfo2UhoD4c5zH2eqTTxo/PANZTqgRTQhgzd6z/HlEQP0P4?=
 =?iso-8859-1?Q?dH7g82QgWtmCzZdM4I929xvASKMvSq8DBExH0u7EPV82tBESQJIY/tuL+h?=
 =?iso-8859-1?Q?bBfWsENiGYG9BRNO7LSnIcgKERPlv4shZgRvF1ogv2y4J8wpHWvCTtNugk?=
 =?iso-8859-1?Q?Kc3acUhsfAUtITtXHV5t44upAdIIOWJHaJFznrbYsB26yXnOW+yxfgvbJh?=
 =?iso-8859-1?Q?9FHGeHi3UTh9CD7wOVmfiuHmqOZVrcv50oh0146297P60hLgHozh9TG2Rs?=
 =?iso-8859-1?Q?wKGHH3wnHx6Yh2b1KOW/P6gZhO6ihzvfsT0HkBtuD+MYTMZ8vUcFhE76SF?=
 =?iso-8859-1?Q?gdj/do/namulVI3jIIevW7jOB34hCcgER5R0TdmyVn/pgbTZZndxq+rx6w?=
 =?iso-8859-1?Q?p7P6SgpFfkt3jPSnZnBvEHMGsYzm15G6dpB9VmIw8PYQzWpftLxbIjOV/B?=
 =?iso-8859-1?Q?kS4c1dBsfsvYvqOhrFc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7142099003)(7053199007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CgBy/eLwYxUMQix3ZIkhPj3bg4kbANN4fiPlTRKyB/6wIRmk2bk0XfUyKo?=
 =?iso-8859-1?Q?c4lIlYU6h1aMVgf0XuJg/9OetWYgfl0KSM1xs02LMGK9+wBImQa9hriCMU?=
 =?iso-8859-1?Q?XtpStS667xPtIQ6sISLXg0os2ifdI2OcQ9gw8E7JE5XacKKuZu6dt1bNF3?=
 =?iso-8859-1?Q?dDrq73Ao9JMytQQpn/GwH7rDDNywndvPWiPgP1o5Tgn50aQDhAfE5+V7IF?=
 =?iso-8859-1?Q?u+DBRTYbN5bSLwW1bR1szUAscBa4h1VN28oDbrNww/uB5rQX1ZDgTxbI9o?=
 =?iso-8859-1?Q?2ALy6G7v9QuoaDAr9nZuF+PB6PGFEKBADCiSe9DBQUkfsSvIvP5eL+994T?=
 =?iso-8859-1?Q?V8Fmdi6bIXTP1ptk3Ur+TLt/h3jgiQ6wJ5SiX/3IO3nxdRR8KkHMNrmIHS?=
 =?iso-8859-1?Q?lAKt0C63xImeIQ+xsWVg+r7qCl5w01zR1tBEEGBc7l888IT1/2YjVQow3V?=
 =?iso-8859-1?Q?w9iv5kWUAzMD+kvHFbaHDUxOI/AW0pOS8Qmg9LrPYsPN6G8QCz7n2jrTdC?=
 =?iso-8859-1?Q?iZXvTB9a+lyammjUc0SuUunhXir4iQAHVgwDXbEcZfNwi0oi0I7p45YQHC?=
 =?iso-8859-1?Q?fboNY+EkNR7bJRIUe+Lw2Fbw+Dz+armSrWV6eoKXYEtqngEcHmXaRhxc97?=
 =?iso-8859-1?Q?hoNa5nRaOt/I/ckQhUK6Z1b5UWCm+AUqFQ6jjDZmdo6LiqN7FVieoVrbXe?=
 =?iso-8859-1?Q?bu+5gWMsMu2Y4uBONnpgOk6ija2Y4fIBEG7ve+u1ONwjyWm38YGeEaH1oc?=
 =?iso-8859-1?Q?2SDkq8LLU1PG8Ul1dW8r0Y+HY3rcpXdt8y2G0Ma90umjfgTkr3+xYaruw5?=
 =?iso-8859-1?Q?bc8YTFP0NNDbBP5JIny4BdrF8/F1FgL3zoaXbS7qmRq2yUMD9rRN8pj9cj?=
 =?iso-8859-1?Q?+w7O5W6pTOKAj8uD5z0X7e1BF6E6KpeyihtHZp8pJK2mF2UsVS0UL7BzBY?=
 =?iso-8859-1?Q?HMUyRDuD88w0ptmfnLrM9UjaCTrrkw/Pm34Y4RCyT5vXuDSDb6tEPHiAxJ?=
 =?iso-8859-1?Q?+YF2bbj8e7jr3Kx9rc6C9wXn9gBg0UloMAeaVMdGcVjOk0y9BJg8zNq6rN?=
 =?iso-8859-1?Q?tKXnI5nVdeLcuixLz0Oy+YNQ+3JV8wzmn8YJsfS+xm1jBfxzkpDgdfbCP4?=
 =?iso-8859-1?Q?ed3zlh4PMcz/4ONFuO+ghVpmvuoOmNVDQoKyf73sNzTUrxa+mGv6e9tA1o?=
 =?iso-8859-1?Q?13kGDW9VdoWflTGf+CcLYFhYQtTzQHt5+X6A+/xYDIwG+vUqiX2F3rE9Km?=
 =?iso-8859-1?Q?CsWufblj/ANUpsn80ozSf+IOPM+X1wGXwP8JXTeHUWwunetg6h9pnMurFP?=
 =?iso-8859-1?Q?eN8rO2/fi/xtQFDjDsW/xw3J+cRg7ekokrBAz2roXkbzgniv7IRcuEYXrv?=
 =?iso-8859-1?Q?alH06GM6GiABCblUmZBJDMU1HDKUsBNG4uo65ISBB1Fun4IakIdSb7GC8O?=
 =?iso-8859-1?Q?bVNK9ktqSo3MDhlqsxOHE4bFAE0i2Go9vc9B0EMlI0jaUKfDpuZO/S6DPp?=
 =?iso-8859-1?Q?9qS5huryM2Ulmnrp0FMDhHdbE+G5mBWEeK9xHp4Bft6dWAl+Lpyh4UgzDS?=
 =?iso-8859-1?Q?kCmeEk1nRk8Xj0E422TeelQBWdyrKkil0wsPPyyRbHk2efYfHZRh8C+Nrw?=
 =?iso-8859-1?Q?45z8J0/NDB+MuLmEep9aNAmW2FlOtDYvXp/e+ypZ6fg24enjcoogPMH/3P?=
 =?iso-8859-1?Q?U46vWHip5wpe74MNN2G42Wz9FF59zD9ofNltATBP3H1mipPRWDz1Q4NAxF?=
 =?iso-8859-1?Q?ZKpaIlJiJDrxy5xQWcbgiBNnGR+bbx9u5xheVHWP/TgdMzs1Aqc6uqcR38?=
 =?iso-8859-1?Q?hXu/LN6dxJzZCrO43/n6XKzi32Wsol0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: rosen-nxt.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d8403a-154b-449c-a8e5-08de5f4cacdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 15:40:05.5214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff126ac9-146d-44a5-92e2-dcd1bf29806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 77FgXB/xlSf250Tky2UClvItcBZKjwatvlBYZd2MLaBxf/hyjNMGc6uA81tP0Hm3g64x4C1NVZOnS2inblOEThjvVOnEdmYWlCuKPsyJk7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1238

Ok, thanks for pointing me in the right direction, I'll try and ask over at=
 systemd.=0A=
=0A=
Kind Regards,=0A=
Alistair MacCallum=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
________________________________________=0A=
From:=A0Milan Broz <gmazyland@gmail.com>=0A=
Sent:=A029 January 2026 15:21=0A=
To:=A0Alistair MacCallum <amaccallum@rosen-nxt.com>; cryptsetup@lists.linux=
.dev <cryptsetup@lists.linux.dev>=0A=
Subject:=A0Re: LUKS breaks When using fido key with pin=0A=
=A0=0A=
[You don't often get email from gmazyland@gmail.com. Learn why this is impo=
rtant at https://aka.ms/LearnAboutSenderIdentification=A0]=0A=
=0A=
On 1/29/26 3:48 PM, Alistair MacCallum wrote:=0A=
> I'm having an issue getting my fido key to work with LUKs, at boot it pro=
mpts me for the pin and user presence twice then fails instead of falling b=
ack to the password that's available. I have the same issue across 3 differ=
ent laptops and 3 different Yubikeys. I'm also able to reproduce it on a cl=
ean install. If I set it up without the PIN it works as expected, it's only=
 with the PIN that it fails.=0A=
=0A=
This activation logic is run by systemd utils (or other wrappers above cryp=
tsetup), so the best would be to ask in systemd forum or list.=0A=
=0A=
Also, 2.7.0 is old versions we no longer support upstream, so it would be b=
etter reporting this to Ubuntu (if they still support it).=0A=
=0A=
Milan=0A=
=0A=
>=0A=
> System Details=0A=
> - Ubuntu Server 24.03=0A=
> - Using dracut instead of initramfs=0A=
> - FIDO key is a Yubikey 5C NFC=0A=
> - Crypttab, udev rules and dracut conf I assume are correct as the fido k=
ey works if enrolled without a PIN=0A=
> - cryptsetup v2.7.0=0A=
> - libfido2-1 v1.14.0=0A=
>=0A=
>=0A=
> The command used to enroll the key was=0A=
>=0A=
> sudo systemd-cryptenroll /dev/nvme0n1p3 --fido2-device=3Dauto --fido2-wit=
h-client-pin=3Dno --fido2-with-user-presence=3Dyes=0A=
>=0A=
> Any help would be greatly appreciated!=0A=
>=0A=
>=0A=
> Kind Regards,=0A=
> Alistair MacCallum=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
