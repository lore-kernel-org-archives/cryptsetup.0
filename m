Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2084.outbound.protection.outlook.com [40.92.42.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8545160884
	for <cryptsetup@lists.linux.dev>; Tue, 26 Nov 2024 21:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732657777; cv=fail; b=SZj3v1bxQ+rtUDA4P7Fd+hQpUpyYPq4/4uhQWsd/qQlQQoBh1jSH8ERoOW1DHqrwbHE/TatgvsbEdnT9hxdZZBUk+/aGwGd7WtpmPvi/7LY1RROtLL/tJy0727rv3pWlJVdwhp3ChdBQTSUetEsXfBbgXBzYIddcKFtgvjRvsp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732657777; c=relaxed/simple;
	bh=lQQMOXSfe7iAPbpobvJbN1HpPIgi47bHG+mwlu/Inrc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k/Qa7j7brQXcDIFYOnO72GHmiKAUtCaH1fMfpnNlrCOnIx8J1cDBp3yoxcZIs4KlHxOgVnOo8d+BOxPAYyoykn//xkSzfYB/Gol3V8EG97TnnYxmu8ViC85yJwy/u4QEUIaB3ORsKRka5F0KMRjschzjGzybL6vb3Uz+xOX00YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=F+9jRhcv; arc=fail smtp.client-ip=40.92.42.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="F+9jRhcv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDVlrTYm4niVGvg298/D4nhoG7FNcsdCRSV93w3hhS1McmcdP6GPfJ8dtPa/dOyCYdFsay1lqsdpzLHQLQ4FyUqcMPORYk0Ivh8YtJvkDajajIWzHEb6Q/Ejl6IsE2rh+sNYS200sgYUTW35RgvluQ+DlswjzIDI8aZS1fgjbbqQtZZIYFNi+ifC5qqyCGaWBqzfOnEuKpCiCuQP6zQElIdKH+wVz6YwATcF9E4YeI6sg6t00a4s1IM4+Mw5IS/SpB8tLmCFpRIZk+ufkz/Jc4i9O9Z2mFx1ce1sgtZN6AyG6hVhaYTemv512D/cVMbMN4Yxd1HzrXofspUlnMIUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQQMOXSfe7iAPbpobvJbN1HpPIgi47bHG+mwlu/Inrc=;
 b=YUF8tJXL6MFSY2UYGoqjkstlbC17vFaJRctRwPWoQU5oYruNmBDsET4xH9cqWOfULbmx1w5uuhE0MJVgHLpABclTEq1RJLUq5jL904lRHOUcBMt09g9g9dAL+epToI4ziDZNCKcI9rRUUhHxrcKcCH6khPZHBDEp8JoAtMOJnnUIM57SX6KWfkUIM26eNLqOi11JRf4JBF1i9BEctpAo7Iou7IZPupB7/FcNtIBCUs1Wr2B1g7MpjdC4tY0Phm6rLJL20WVZKH0KxAg0SqpP/MhchXEgZaec4mXZxGNgROW7L0l7Nul+Dzjp3XzCypfbCBTtdAXipQYNMGvAgscRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQQMOXSfe7iAPbpobvJbN1HpPIgi47bHG+mwlu/Inrc=;
 b=F+9jRhcvE21E1N9rAIvst0zZd+FJAumcxeLUEmmBhaiLnOMp89B5FIT303f1UoLYJrGJJyg4veddEhQ+7UNQau1qqWX4eo81XwStnfozwOXCA9xpUOHTYMiRq2bz3a7xe7SydiK4tLlnNAE5cbfX/kI+NwfSUldO2QvY0kwE/PXRVMhR8Rrw011HvrRo6TuVvcNZYHnFnohJm0qSb9p0mWQoivRmiK6BGGsrty6gtGvw2bdmlncxWY7Rj0Q6ML7HnOkUZ9SerC9HJ51WDq8Q846Uy/udKBqS1YPpHD4x00ZcHGIizxRk1hej2w4jMZHIvKC4jsocb8OFkQT2a2iMIg==
Received: from PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:320::18)
 by SA1P220MB1432.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:3c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 21:49:31 +0000
Received: from PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM
 ([fe80::e481:dd2a:a6ec:6d1]) by PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM
 ([fe80::e481:dd2a:a6ec:6d1%3]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 21:49:31 +0000
From: Patrick Callaghan <patrickc25000@hotmail.com>
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: Re: LUKS and quantum computing
Thread-Topic: LUKS and quantum computing
Thread-Index: AQHbP4bDOgm+wMrB6UKdUvk6EcvnULLJQk4AgAALewCAAMyYUA==
Date: Tue, 26 Nov 2024 21:49:31 +0000
Message-ID:
 <PH7P220MB13253A096598944892F15BC2ED2F2@PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM>
References:
 <PH7P220MB1325C03018B9E4F926B5127CED2E2@PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM>
 <94a6a2f6-dc55-44ad-9172-6ac76e83abe3@gmail.com> <Z0WWMgwXUdwODyzW@tansi.org>
In-Reply-To: <Z0WWMgwXUdwODyzW@tansi.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7P220MB1325:EE_|SA1P220MB1432:EE_
x-ms-office365-filtering-correlation-id: 385c58a5-9439-4ce2-44ed-08dd0e64359e
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|8062599003|7092599003|8060799006|15030799003|19110799003|461199028|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1PcRbhuUAD+C+iG1QZRZHEXt7RrNDvnzTHTxw4rk8xnlmu1bLTdy3X35r9?=
 =?iso-8859-1?Q?MHn/wjAtuVuYiLzJW7sGMZZ0yHZsXZ/eNqgr12+7Q7f6XTVUG3J166j+cO?=
 =?iso-8859-1?Q?lf0cX7vU7UubEl2TaSSPMyabpfEWsNe0buHOlEeLUVsBXrAgr3w+HmCWBI?=
 =?iso-8859-1?Q?lzElnPnmHwcb6mJS0EQxxoyabKW4lhgLmUpPpEz3ztXOSo8xkKTqOPElkT?=
 =?iso-8859-1?Q?rdJpzZeDnpZOmqqf0xUfPvryoz9UcTsi01fPz2mg5ZGisvH+nWUzf5i6Qr?=
 =?iso-8859-1?Q?T1KZzDQ1mh8EZ4JHuX7ifjpK5bx/Tn8x7Y0s3HpqDWsQmnrijSYifwPFfB?=
 =?iso-8859-1?Q?pfEa+IxoUxLhvZif44EAkyUmQHGcHFr1oi7iD9Lex2bjS3GAORB6bk1f4h?=
 =?iso-8859-1?Q?crWvHpKHcjsm1YS1tI7/GcLPtmoE8UL8GPLLzvAEwcpAQV0j7nnBsM3nGa?=
 =?iso-8859-1?Q?3Agc6/HiwHtaMsc4q3M7vVmpft+Iaj6mGsOcQ2hwqk2abRzp9uYNGzZlV6?=
 =?iso-8859-1?Q?OwMpNhHOjnTZrQMf3uemnL/MYdnIBxWMKQK83ozmM9IWjhjcfuCd6s9DI0?=
 =?iso-8859-1?Q?Q+Gd571Xk6sEZ4F2NqNwzkLqr8bPlDD2mPXZ5FIP/+97cGe8Mj+qpdSL8t?=
 =?iso-8859-1?Q?lB+SDRMU42QXNN3ZGS6tySbXPM023kNtZ3lSK4aSZI4+DoKz/cPFB34P27?=
 =?iso-8859-1?Q?AKzGzSbwi6UjjcgCQDk1PoCNvnM4c1xZgu6hQauJuI+dVxnnm1BwGW0YIQ?=
 =?iso-8859-1?Q?OO8ivbDRazhO8lTftDlIFBUOcPMUw58ylPXUpEHNLTdwoI2O2Ut6kumm2f?=
 =?iso-8859-1?Q?exY7RDTJQNyMyByNoUIp26S5gGoutF/uYYR9Ce/D9y2Mk5Lk30KoEWLq2y?=
 =?iso-8859-1?Q?89T4/DZIbMRxlEYdEhKjC9N83mTfzcvsHLJjt3dM4Ly/Lwc4gEC1KlTACh?=
 =?iso-8859-1?Q?J+3PbMgek3DW1EYHlyAW/n3QTcMV5GvdDJkhfDmq+Lk+jcakxNtsyzb1uZ?=
 =?iso-8859-1?Q?TqnyhGQaDXPTOiAj3Bjewo6dXKDG/WtSCkAyvC2dlPCFkRTPpuG7Ignw1L?=
 =?iso-8859-1?Q?VR/bWOMonj5So4uL5IzhRXE2iZGVG6eAvgwjy1en0KFX?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1xanBwz0iy4AP72eVbwmwY6XPYb1MHGkKlauE+/YdEAx3Bh6QlYvTuqBVD?=
 =?iso-8859-1?Q?3s20Cx0mVsEjArlx3zuEfWQ4UgJkC9xUiH+IlRuCRrMKJFhn4LT0YPcsQC?=
 =?iso-8859-1?Q?/TlY0oQc1OVmJ4o+x86bAYPhMtyqy4RuR0aUBMcFv9HzhAHIfJ+hLQcHag?=
 =?iso-8859-1?Q?Qs1UDbsw/xzF96iU5UxKEz1zyySsVeQRuVkJq8Ri71f70wxGD3WdmHG8GZ?=
 =?iso-8859-1?Q?9MN9h1QKgts7/gtcY12KTHeHuz0BQ+DbinG+5erN3Jz2VVR2oA1kp0tlHb?=
 =?iso-8859-1?Q?U0tSYjAwRluzUEZ9QPWJxtgSic487QCQclwceuPcbwC3xre9W0GpEkJabO?=
 =?iso-8859-1?Q?jgO0ky0Uog+lsthHfy7+0ZLgUUAV7KRLyF1buCUHkpmLRCUQ211H7sR677?=
 =?iso-8859-1?Q?pjQ+hVAI7ixeB1aX4OQwD0G34TG/ES7GivSYb6EboTABuS6QvFJnZwOdGH?=
 =?iso-8859-1?Q?sT1+c14hygvcvU6fTgaP/eirdyHYqoEhrkYB0GhGeaMvFZ8g7eIM+elfFh?=
 =?iso-8859-1?Q?ahPNK0FOgDuLwnrcVJRuRssuMLR83Vcp3UIql3pSrRw1n4HACF1kJgQCsV?=
 =?iso-8859-1?Q?TDYetNOJPTSmqzAAg2q0gXNvdCPIZVYr+rSF0y7wBwLGEN5otqhFlOtzke?=
 =?iso-8859-1?Q?PTUsKfRlhFE9tM5c1Yy47LPNiyNTgL3+oq/z+YKQrIvUKVI0fgafDnwfJy?=
 =?iso-8859-1?Q?TJlkmyEKuMhNfurYQTbiVCTmd5/TLVkCt9YeoZ1OwLK6E693IAycRRivR/?=
 =?iso-8859-1?Q?rGO57N0+bnUMhhKW9bip3WUhjtxjaebHuiCU7HdqT2M4iY0u0k6Ka3Ot/r?=
 =?iso-8859-1?Q?VqlyV2XzL6wuOXwVk1F3VTWPTuSnUeRSsQK6wrpsYJ2x8sPu6OBFsXLpCC?=
 =?iso-8859-1?Q?DboB5TpUOGE59dR+QmmGF9emGWefyOunc9bzZthg3qsXRfOECdtS6j19/s?=
 =?iso-8859-1?Q?TSRenuXaDvc9I1wIcvKOdecTnyxfT1KuHJhaPDYmZH0Ip76TXrOfqomv7G?=
 =?iso-8859-1?Q?wV7okF1et9vWfLhWVSmwAXSFiLdioB1h98zE3NiCwfbo6RtfpfZM64GA1y?=
 =?iso-8859-1?Q?cxGZ72vHjZh4oRcMsqQnVnEoQqusgdVR1pKlCswy1LHiMz76X6BP17F077?=
 =?iso-8859-1?Q?E+b6lVk2Iu9zTTy/tBJwg3KakOAsLdErYfdhil/yb8/8IVPaL6LQA/JDOR?=
 =?iso-8859-1?Q?30xbzA/6ExmFUeBPjL6TB+VEwXN03dEmeW1c8x0giqyz4V3S9UdJv0Cn+E?=
 =?iso-8859-1?Q?mtLN758nYSgIMe5hs6EVsE7cuWCZBmSIWxR/lnyFScqzZr5kfdwZIIidx9?=
 =?iso-8859-1?Q?ZL1o/5Vd2FnS1qTgLkDtqSALkNVHEp5DIOyhdbjKL6nyrTs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-17562.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 385c58a5-9439-4ce2-44ed-08dd0e64359e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 21:49:31.5276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P220MB1432

Thank you Arno for the link and thank you Milan for the "iterative hashing =
for key derivation" point and the LUKS2 hashing comment.=0A=
=0A=
The "we" is a couple of co-workers on my team who are interested in prepari=
ng their partition encryption setup according to the emerging NIST standard=
s, including quantum computing safeness.=0A=
=0A=
=0A=
________________________________________=0A=
From:=A0Arno Wagner <wagner@arnowagner.info>=0A=
Sent:=A0Tuesday, November 26, 2024 4:34 AM=0A=
To:=A0cryptsetup@lists.linux.dev <cryptsetup@lists.linux.dev>=0A=
Subject:=A0Re: LUKS and quantum computing=0A=
=A0=0A=
On Tue, Nov 26, 2024 at 09:53:36 CET, Milan Broz wrote:=0A=
> On 11/25/24 11:13 PM, Patrick Callaghan wrote:=0A=
[...]=0A=
> BTW who is "we" in your pararaph?=0A=
>=0A=
> Milan=0A=
=0A=
I have been wondering that as well...=0A=
=0A=
Arno=0A=
=0A=
--=0A=
Arno Wagner,=A0=A0=A0=A0 Dr. sc. techn., Dipl. Inform.,=A0=A0=A0 Email: arn=
o@wagner.name=0A=
GnuPG: ID: CB5D9718=A0 FP: 12D6 C03B 1B30 33BB 13CF=A0 B774 E35C 5FA1 CB5D =
9718=0A=
----=0A=
A good decision is based on knowledge and not on numbers. -- Plato=0A=
=0A=
If it's in the news, don't worry about it.=A0 The very definition of=0A=
"news" is "something that hardly ever happens." -- Bruce Schneier=0A=
