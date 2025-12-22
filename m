Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023072.outbound.protection.outlook.com [52.101.72.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4062FE59B
	for <cryptsetup@lists.linux.dev>; Mon, 22 Dec 2025 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766419534; cv=fail; b=UCDrdf7t5h6CUiWrPIsQESeuMPHF4wbyNQE7PnUTVrJpyEWDtwtaqB3GtD65Qb0VdM/bN6fkRqnpbq4q03GLqqfrWEJwc5hL97aILRDz6bBPCMHivD0f6ZhZci/kd3DMQm2bMcj7vM3VbXU081PEf8waCiZkgpOzTBbUhCLmRAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766419534; c=relaxed/simple;
	bh=IWSlcjouQsSoX0HkxPpIuVkdoq5gH4mH3mjH2Gc7Hiw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YU85OnmzCN6An3m/fyT0HjR0+Y/dO9NYzyIoLItjjpPygceQ2JYgSWM05f34biNoNRIvE6i+2DYOJpTpfzbUOmomlybd4BKCGd8h9tH6WrgsIGL+nHFwrZe8Wi/LgxzvUmD54hPJsYIon8USHrlvoTwqz9y01aXzB7oSfsxIFHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wiora.co.uk; spf=pass smtp.mailfrom=wiora.co.uk; dkim=pass (1024-bit key) header.d=wioraglobal.onmicrosoft.com header.i=@wioraglobal.onmicrosoft.com header.b=NilLzdDp; arc=fail smtp.client-ip=52.101.72.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wiora.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiora.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wioraglobal.onmicrosoft.com header.i=@wioraglobal.onmicrosoft.com header.b="NilLzdDp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6p5gB6a2CqZs7KQPqzA9iwjtHVE2cS4+ebsrVgoLgJg+gMsEC3Ym6YNUs67LqYdtdFXhMMCKcyjhbm/7yreKIWtDNrUTxqaybEBWSdLd7pDvEloyPqsaK4gOfQCdcTG8GY2uhshYqV6e4VNt/icYqlcRjdmcJZ3qIWViVdXHliR0aoPEtvVs5k01Aob1nOhTP78v0gPBdXyC9kuYCGFdafS3k0l5TXP5EzaJsVZbzpX7aXTWGQJ3hsKsgaAgxGxMdfpXQMcexjIffKO+y4AEI23agbcAIKPkEG19N/GOxqdkrnn21RMWPY/HxCIsin6rx+X2AdSOiRR3Zu1ZMyYVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMcHbds6fXnL5xNVi9M0wyF0pBJvBJ9dZNr2FlLMUJk=;
 b=BbQ6QBrS8JjZkfm1o85NhjU0wro+PFmsDRH46Spv+nK86iYoFvNhlHXKsi+0Ue2lSs5EqLg63DFSwYWacBiCq4PGqsLNEcmkBrl9T94Efs42mPTpzNMxuS3TboREFZzdRnX3/IID4RTxb16EqoFWvw2LES+5Psesq3AHGseVCdp4X4/uodEdisPnCiXJCv9GrIJTrV/q0BTOkF5vsPhbpHm8DwJgRVE97ZRaAbewLoOGRcaCFBtSlqh8GpXEzq9JfZyDMZJxHlBwvPKbyae4gUF1e2Kp+WJzaYBVTFAAwG02FI7NcYgyquYcF5U+gIquPDrcc7/agZ63ZjP2RhQ8Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiora.co.uk; dmarc=pass action=none header.from=wiora.co.uk;
 dkim=pass header.d=wiora.co.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wioraglobal.onmicrosoft.com; s=selector2-wioraglobal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMcHbds6fXnL5xNVi9M0wyF0pBJvBJ9dZNr2FlLMUJk=;
 b=NilLzdDpoccyuBpvcqIwOsEO3WGcFECFDQgefGWDoXivcI0snGWY6pOBR5VDV+SXO71q/vuTSZs44hboRPcBCpJ7dQ+d4nYPhnedJprTGHRt5cDXHwjwukr9EF03iu6AuDrJwtMop5RR6XVNFRQJGvcOdbSl1dllpcNUhvm/9Dg=
Received: from AM0PR03MB6212.eurprd03.prod.outlook.com (2603:10a6:20b:15a::24)
 by VI0PR03MB11062.eurprd03.prod.outlook.com (2603:10a6:800:2ce::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 16:05:28 +0000
Received: from AM0PR03MB6212.eurprd03.prod.outlook.com
 ([fe80::f164:2f63:dc4b:4f78]) by AM0PR03MB6212.eurprd03.prod.outlook.com
 ([fe80::f164:2f63:dc4b:4f78%4]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 16:05:27 +0000
From: "Matthias R. Wiora" <matthias@wiora.co.uk>
To: Milan Broz <gmazyland@gmail.com>, "cryptsetup@lists.linux.dev"
	<cryptsetup@lists.linux.dev>
Subject: Re: PCR9 missmatches since latest updates
Thread-Topic: PCR9 missmatches since latest updates
Thread-Index: AQHcc0KJ9oF/kpq2BkS7JjDHZmin9bUtxZaAgAAMYBY=
Date: Mon, 22 Dec 2025 16:05:27 +0000
Message-ID:
 <AM0PR03MB6212B0F513297E7F8018309895B4A@AM0PR03MB6212.eurprd03.prod.outlook.com>
References:
 <AM0PR03MB6212DD259913B638EE8741DC95B4A@AM0PR03MB6212.eurprd03.prod.outlook.com>
 <d11da336-07bc-4871-9db3-9ef8e557611e@gmail.com>
In-Reply-To: <d11da336-07bc-4871-9db3-9ef8e557611e@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiora.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB6212:EE_|VI0PR03MB11062:EE_
x-ms-office365-filtering-correlation-id: b3d42154-ac22-49f8-1a9d-08de4173ec96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xcMnuM7/d/fToBtQ6u816ZIWFzE+qre0HJ1PBEf0sMxM71S6+ZndGZWIqW?=
 =?iso-8859-1?Q?tX05Nw6IK+c0MVwoVlGAKlhFCfy0a9idJdU24bP6QNJ2OFtfQaWvxU8Yfn?=
 =?iso-8859-1?Q?wzFZQtzoZGoj51ltg1GZfIlUWNMroYHFSuRVpCzdNIltFTT/kZipBbMxzC?=
 =?iso-8859-1?Q?wBkhQTdfWVYVy+sjIBeilDNIS9pJIziXPZ9hRENqZtJMxuTCibpAhQS4df?=
 =?iso-8859-1?Q?LfWTVR0OFb542G0ihhecR8/GoKAPuzppG2bPCRadRpMp7c2avSM/8DUyUT?=
 =?iso-8859-1?Q?IxqcWfKY5yN4EdkrYy4CK4EL2L7g02+0dgr64MuZDCP6KgurJr+ZStgX8O?=
 =?iso-8859-1?Q?yV31gMqasXRAOZvuRmnEaoN0uek6XGa3tZ28Ib6QjslpzhjBanVwZPLkJN?=
 =?iso-8859-1?Q?XFURH+RGsELeWhXbYmV2V12D4XDin5kxXBMk3lAAx3dg7DDiAY9l8b2sza?=
 =?iso-8859-1?Q?HcFG+EqJ7r578S9cz4N8L0K4kPAWZDuV3Tu8qsdEkpywT3dlH002hxvpc8?=
 =?iso-8859-1?Q?ACMiXNg7ZCLem26Jd5JySFlDgTi0CxbBlZMAQWbsrv/nLHH+8fbq/XE1Sj?=
 =?iso-8859-1?Q?TfY5ba/CH7ZLdxAVmChPYmTYvgSuJSVYPaBrbHcBuQxKMImJqfMwaHQhUr?=
 =?iso-8859-1?Q?YoQEdYKnYTUpJb2xtvJ4j/yYSduVSn6y1cz8VgN+tHr7mIiu70aaAFvQST?=
 =?iso-8859-1?Q?AUhx8GNQf01v/O4jH48JK2phSAQbRBE7YKSnMiPSz5vD9if3cZuBX5zuTl?=
 =?iso-8859-1?Q?5CXnACyv5onTrAvKTo1XG8PyvsjeYyDQqCoWKpQcsEu88ZS2m2fPLdJ/3o?=
 =?iso-8859-1?Q?74PCZlKRconKlXXk6NXQuXzh+OQN0P3FygVJmpz/Ibpg+VU+d4RemcR/Ym?=
 =?iso-8859-1?Q?Gmg6/08N3lNF4N4Nl0W8ggdhGWqynEhYyw7i8s2OD7/0HQ4GnwOwTIJyLB?=
 =?iso-8859-1?Q?Qb2LtOjn0O3NJcnSK+c2w+gxDNnNOwwipFoyQamC0Kjq7LFVOOAgrGk2hS?=
 =?iso-8859-1?Q?KjaT/VNMKP5CELd1SjeY4YqR4D5KRhUOqcaCszpcsJuHj8Yax2DzP7s+zl?=
 =?iso-8859-1?Q?Ggf2n2P+dJr3IIk1EEwRmc97XHZtBHKmePp+C+upOMsOitIYutCL2ol3zf?=
 =?iso-8859-1?Q?ATdliz3oV97TH4XJnYQRljGlRajkpBdBCyRoyOiK1O5p53RYMT4E5YWRq4?=
 =?iso-8859-1?Q?EoZAuKLX5IHjZhb5UyttWnYbWAC42tV0QUE2mzGlDXh/YITJsYUZH06HHH?=
 =?iso-8859-1?Q?JCc4JAqkGIDNYU9ReaovsNXaWoKscl0+qwxGHa06zcF8zprU68wZpSdRhQ?=
 =?iso-8859-1?Q?JU0ouvGidw6KnhUr3vHpVg3KUUPDUBVgag+77QbE7YaVvvIgH5/9WcqKIq?=
 =?iso-8859-1?Q?1w9E5VhrdWvd8WMSSXDu1F+FEvdTL7S3W3Oi8tuik3SplR7MmtZD7KsDdM?=
 =?iso-8859-1?Q?M2VDd2eBpMklrTBfW+XHMTBxdx1Rp1sX8iNz0b3qUVuZBkO44Kge20jemK?=
 =?iso-8859-1?Q?OgKf+ZQLJoSwhDsouzey4swJqf+tR/FfcuzOzDuIKdMAzQDAMzXkJO29LY?=
 =?iso-8859-1?Q?yOieZioZqOcQct9r90B1FMnopIm/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6212.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?b8J3EWlkFqnjpFpc3mQskhxVwHe23ZPaN1/sI/IaKnVLrRKJ1yJ0VbFfbz?=
 =?iso-8859-1?Q?Sq9NLsy03DhTEe6boiVZSYduP8cloavN7lRoep4L0FqkjoXEXBhC+xrZZE?=
 =?iso-8859-1?Q?0t8NAut4ntWXtT5NFh36+mEWgky0EeedEXPRtMVXCO2NT6/Z/rwGgdiqpT?=
 =?iso-8859-1?Q?cxdX2wSsnphMgMAmrq8XIlII5QvJJQCtfTwJ96i5hDhVdD8OmJghEZtKKB?=
 =?iso-8859-1?Q?qgv03Zr4RxJV4Fm2s9sqN4dHcViX9h/c5l/1eQ8cj3tjIfcXTLdrG8OCTW?=
 =?iso-8859-1?Q?69wOymWjDoA5qacaahaeSK1euh4x3lzOatCaU+kvS9Ja6EODClRYC3GSDo?=
 =?iso-8859-1?Q?VBxq5Kb4Jg5eCAOzxURu7Nvi20aHT5xR7ew24L0PJIrii3Zj1RKi3uYt75?=
 =?iso-8859-1?Q?SoQYxMxqQLN9Ia3Z/6PU+UZA7SIWpheoNq9kbw7xJLJr015Bu+rXIH3Fn/?=
 =?iso-8859-1?Q?TBRd9ChBC0BcZl9AO/Nsh8Z1/VTlpRHoVqaff4b38xirSmwLOkgEKfuepV?=
 =?iso-8859-1?Q?SWMLIYbJV1MeNEiyLuV12G6i2LI3j7tCRgJyGcp94QJUmqYLAUupIGewfY?=
 =?iso-8859-1?Q?CZH7TT4+M2al7bWfN08Ixp7K5euJHLL4qDIjX96D2Tm2chTRIGK7jO1COw?=
 =?iso-8859-1?Q?AVi5KzMtl5n0tPjn+joBPmS7rGmp/zxmRssT5MbKh9hEoljJAHmL9epqnR?=
 =?iso-8859-1?Q?4yM9v1TuWiQMzAo3uuAZns/qrkQQNAvmAdPSaoxI5HfDVBygb5aUPtERsD?=
 =?iso-8859-1?Q?vpGzXy2LNqxIsLObtnPCXH5fIdKY4roFeUBfHc0lKU3jvi1Xoa3gRqa68B?=
 =?iso-8859-1?Q?1PKsuEDWmcUvXoSUwLT1S2W50vMO20tGJxeWkdYqMwsSCePA3DKODr/fWp?=
 =?iso-8859-1?Q?ypfUDPELJIj0zxUxizSXlHjY1aaiROyxDmoF+Zy92v+1MjkQpcIfDcI15r?=
 =?iso-8859-1?Q?ua+L8qzR5wdD4XqLHBVPVzeSABb2eSvJuNLwDdDqR/YWByBx71Pt22emGH?=
 =?iso-8859-1?Q?r0OUkzpnggxO+jf4yCojwRBrzQp9SByRh69RDzrgCTi24z8geAmJpIK8OW?=
 =?iso-8859-1?Q?W3rSn1YtxSMou+r05PRn7CTZUqEmbyrbZi55A7fygVkZqG2Ki+Mxznk3Ft?=
 =?iso-8859-1?Q?aC4oRKUlGPsYnUU2bPpqMnc7tq2uQBEtIoHe1T6qNUV/H+58jSlaIXnaS8?=
 =?iso-8859-1?Q?y4fqrANjKbuWsXKd2cIL1Kgw/6afoenGQ+it7EFoEASYUzBMtmAsHGlQiK?=
 =?iso-8859-1?Q?Z8jiwxMR4i0DjMPMqAmUBGdLn1YN1HbslkDB7BcLJEznj+Eet2B7jzkad0?=
 =?iso-8859-1?Q?QjMxvDL9nm8RlvetD9/cLe2d1Odzj8DBj2WF+JMQp5SfpDUmlVgsHgcWPR?=
 =?iso-8859-1?Q?3aWnrMjdAIfifjrYsFuEiCOjnvKQjPcWmxiSMY+9m/1ocJLm1YepXoueix?=
 =?iso-8859-1?Q?4VPQv8Dsd9NoNqE3nFHhyHye1oeWjIE5YZ+JNljj74et1jBJZDeKiRQIB4?=
 =?iso-8859-1?Q?vcDYB/3g+Y5h03IbeTWref8K7oxDg63XGEdB9A4x7SnvUlgpydpzHLfCCY?=
 =?iso-8859-1?Q?SXTueeE2ZQoP35EGlY/2l+alPOW4VT74tqyF5cqX2Eabyuv6tFtUio8Hag?=
 =?iso-8859-1?Q?Jv5YmYesaz/OynjsdxGJYV6mXPucdVVw1kRWPeXGq+DuGJYrUSMsM5Sc+z?=
 =?iso-8859-1?Q?h5Nw+MYkSpVrtubxh1HSZXKAlbTbQHsWZorFatavHGNeF2IF8SUnd3TrC8?=
 =?iso-8859-1?Q?T4gY1sKBy7JNWdFpmO1qcGs3CSs0WoSPdXIGQm/ZO3UV1y?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: wiora.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6212.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d42154-ac22-49f8-1a9d-08de4173ec96
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 16:05:27.9070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dc522372-3f69-4143-b880-ea1a60fedcfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Gl4jHmlNJpVlMf0x0cFLMVVpXCvy383+kgt6Lt5MTS7uWiLxc7O+c+gsLlGgZw4KT1NLEH84L+THAzBo4Nptg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB11062

Yeah! Your hint was perfect! Thanks!=0A=
=0A=
Obviously Systemd Release 259 caused the change:=0A=
https://github.com/systemd/systemd/releases/tag/v259=0A=
=0A=
Extract:=0A=
```=0A=
Information about the=A0initialization of NvPCRs is measured into PCR 9, an=
d finalized by a=0A=
    separator measurement.=0A=
```=0A=
=0A=
as this seems to be by intention with a good reason, I will investigate thi=
s further and most probably adapt my tpm2-kira implementation to fullfil th=
e expectations of PCR 9 at the moment before unlock :)=0A=
=0A=
Cheers,=0A=
Matthias=0A=
=0A=
________________________________________=0A=
From:=A0Milan Broz <gmazyland@gmail.com>=0A=
Sent:=A022 December 2025 04:17 PM=0A=
To:=A0Matthias R. Wiora <matthias@wiora.co.uk>; cryptsetup@lists.linux.dev =
<cryptsetup@lists.linux.dev>=0A=
Subject:=A0Re: PCR9 missmatches since latest updates=0A=
=A0=0A=
On 12/22/25 3:32 PM, Matthias R. Wiora wrote:=0A=
> Hi all,=0A=
>=0A=
> with linux kernel 6.18.2-arch2-1 and cryptsetup-2.8.3-1 (running arch) I =
am experiencing issues when resealing my TPM2 protected enclave protected b=
y measurements on PCR9 on my machine (verified on another device with a sim=
ilar setup).=0A=
> This behaviour changed recently and I could not find any release notes in=
formation, so I decided to start here with my investigations.=0A=
=0A=
I think you need to cc systemd list, or maybe better report issue to system=
d, as it is systemd cryptsetup tools handling TPM2 PCRs.=0A=
=0A=
Milan=0A=
