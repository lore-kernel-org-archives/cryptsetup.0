Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2103.outbound.protection.outlook.com [40.92.40.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB92190059
	for <cryptsetup@lists.linux.dev>; Mon, 25 Nov 2024 22:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.40.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732572803; cv=fail; b=ZwK1VG2ENCqsKI/psRiIOl8ZyPydPH8HW5RCVly46nssC6fvO2bfIcwqLYMbYIJkxCjyHDRRLQFrL93Qt6X0YisRgzR9+5qBC5YgxMR5lJP518SwspGEI2y+ChGAa0rkjeEAnu6Pv2LERA04/iONm7Q3hCc7Am/yGqo7Ly9E4Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732572803; c=relaxed/simple;
	bh=OXsVFgwqRZAv6TQH37x6H2j0vnAqFX4LRw1fEhKA3Rs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hcvk0Ufmio4octggPq1seR+cSCHjScCzrKA97yhlZFdDdIrDBrm9cuYC49BPhsmEz60RMFXowUbFancg+of0046l9DxmcsxKtWUDRv6pjip76g4AMwl3YBPq8nUHvKwMwFwE1yl1Dr7KoNRZ7H20ECFFAVsgzwWbdFxoQC6m5zQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=p0jO2q0a; arc=fail smtp.client-ip=40.92.40.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="p0jO2q0a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rztNNz/rtXb/f9ilFfRXtUrArDsdhYJ73ycXzCKUMM+cAogBAi7WIbFofGkbYD5udVPUcJ6dGD9CeTrqMk/tNn5+U3414BkQTnr49EgSAE3XeJUIk9ToXeWpL5fbKn0LaIRDGtCTSHHYrOucOsMjQLO5N6KS5t6C5HwsK/F1k1YN2TX2BVAu7eTeSkx6Uny5iLHjb+EBlGu8Rk6vHI6+njdj2TJTT3kL2L+tx6W54F9HX6MpIzGsBqzxoWfphhCtjLskPUoMb1IlFZHzXehLguMxA9sorumi2zPTMRFrCuDvhmxAurIJfi8fd49KlvOBJUvQY4/T18I+BLvG/i5IHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXsVFgwqRZAv6TQH37x6H2j0vnAqFX4LRw1fEhKA3Rs=;
 b=xtGX+h/wWiPgSCDBalIdUbXpRNLa7Y+CQnFiOYiKEJtLhfe2KeWXt6agQ5Lyrmf+BOX8ig2vBMD5+dI9Gp0NzXbwGsCeut5W5RPDN10wgiMHzIs41kw6HB6vGTumlWpw8gxGLJOaLZbQU9UEtbilwlSAi7FCgvq88DW00rIKtC/V2mqPwcq/uEd6Pul45yqFXnqRW7EouxgGMMZBAbnhLE8fLasUpYjVnExB47n0+OS6REm++HajQWtdkpN5/sSk5xCQz27yFvsZIrePclVAVY6Ue3CeNPFdc7g+Di/CcxowsE/FlLqg56gAFzzNh1RxMssFdcqcmSm6Juatdr5p/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXsVFgwqRZAv6TQH37x6H2j0vnAqFX4LRw1fEhKA3Rs=;
 b=p0jO2q0a22JWbUJVaK94czh0Yn0og6jbhrHRGcdN6ErEBcnNZbBDkpGdDNrt8CUSdDMQ2ecjqIbiMaeuAwcOXNB0IL50uWzcUGqBSl91r7PfP5MEMKaDUlYNL/cMbQCUGN8i2Bs2kE4HAV70nXzUaCBhs/qdgsTAca4jmdzTAaPV+RpvFyfRd3nP9cgz1dCwpFfe/8VuBeQN7ckmEOeb/jy9SbHD2ds6L42NeoG3ZtonOgDLFxojm2FzT4k86wkfWzglEt+eeZLNv6/cAy+YRD+ss9lnIM0tjKGudMWfDlnsIL7xE1RI9eWrbVzGZVtxLJPLiZjHtJnK5ixU2D4I1A==
Received: from PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:320::18)
 by SJ2P220MB1235.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:589::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 22:13:17 +0000
Received: from PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM
 ([fe80::e481:dd2a:a6ec:6d1]) by PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM
 ([fe80::e481:dd2a:a6ec:6d1%3]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 22:13:17 +0000
From: Patrick Callaghan <patrickc25000@hotmail.com>
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: LUKS and quantum computing
Thread-Topic: LUKS and quantum computing
Thread-Index: AQHbP4bDOgm+wMrB6UKdUvk6EcvnUA==
Date: Mon, 25 Nov 2024 22:13:17 +0000
Message-ID:
 <PH7P220MB1325C03018B9E4F926B5127CED2E2@PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7P220MB1325:EE_|SJ2P220MB1235:EE_
x-ms-office365-filtering-correlation-id: 16e2b25f-04ff-4ede-be78-08dd0d9e5d0b
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|8062599003|461199028|19110799003|8060799006|7092599003|15030799003|1602099012|102099032|10035399004|4302099013|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?O7N++Zcm6YbfF2VhOieJGEm2dk9hZzrxBHlDLBhTorwiryy+2lb2vMxBi4?=
 =?iso-8859-1?Q?OOwcirk4GRJjC4NmWqYEnQWgGiQDz/hrA3Ka0J1YN1RER/4OROw4ERkOB5?=
 =?iso-8859-1?Q?q0iKptbkq5UnopywRFeiSCPrDqVXiFvlb66uo6wnV5eXxFHPoXJNMpIExq?=
 =?iso-8859-1?Q?mUv4dhhjurSzuYiow+MogV2ml88cP96Jsfq4+yVkdWuGjJ9+d8zw2WR5V0?=
 =?iso-8859-1?Q?KgwzEOSHAcYrsudG1K8/BVXTEXQbMO5USstAf8j0AT026VaeehkXXCwN/4?=
 =?iso-8859-1?Q?xdxeWq1Vs5Qo3yO2nnsx3fYk/IXZGmZEM4utnumZ8NcFCG2t7x5s2fhK9X?=
 =?iso-8859-1?Q?MuL/RcCsYlHaAfnwxrmKfFlBSCGlVeS7L4xiAxWznWIEkOM7Zkrigsvp1y?=
 =?iso-8859-1?Q?n89vLj5MrfrAdJ3+3F/xYClsbORj3M1iY4YmFbxkzwkC0W6nShRaVu2FeF?=
 =?iso-8859-1?Q?8vpSUseuVsLyZs3zB+o0ktTNImOA+O2VwIhy1gyXTRgIAm5nFJAcp12KsC?=
 =?iso-8859-1?Q?iv3I1u0SHEoqdj8K7o00NxqmWvcoKVvy2eTwlebVQAWpnVhS+rg96OLHaO?=
 =?iso-8859-1?Q?kBBtDLYosjZ0bTQwz+ZztXpMKRxHx01cwxlaTRLqA/DrRl6Hr8BjpoAzrU?=
 =?iso-8859-1?Q?cmErlQERUDN38gqXCtotxkLx+lyukDalRFF193LRs2UwCXo8Bwgt+eyDH6?=
 =?iso-8859-1?Q?FpAzcDpZTl1XDp7PIbEsP6rlRg12Jw6PL68ebqGinn3Zl7MUhzsbrU48Xy?=
 =?iso-8859-1?Q?DnN6ZY3HThXImCoB1eZM9qltJcrswQ1+h2wnKqKPapQbY9HhU+EBTd1Wxt?=
 =?iso-8859-1?Q?bqATpXvrVdL4uA3EGUPMVv7je0rk0d37rSqJxH1DGRVXNviOw3hWMCv9Z4?=
 =?iso-8859-1?Q?oQrYaK+Pn98S7Epl9kwPCg1qaqBppTmDa9m10FV4wWXziuoQAS4B9Yr0nF?=
 =?iso-8859-1?Q?ezd3Sphc8BsqVacaBoFNxddImJGXlCQVLbYX3hwKACrky4Uvd22NPsvDps?=
 =?iso-8859-1?Q?U6iqUJwfXQ31US0rPmgZsXj08uf0qwpx5f7NF16K4kvVJVx48WrDFc4zXV?=
 =?iso-8859-1?Q?vedCL6JJ9v9JpLKSKMsApaeIUIRDpUybaTH+T23bUajxOXAaOyQWoT7MIN?=
 =?iso-8859-1?Q?5Nd3FUBiQ1LRGB2f/RgfsALntYUOqU2oSqtU/1/+9Q96+Lzx3HqBDUGn2h?=
 =?iso-8859-1?Q?8pTMgJZeGekprkYAooqiiru4JX0poDTvUW828LWfPLp72zWzH8K7f+nkFa?=
 =?iso-8859-1?Q?gSRbkfAe78zSXebOfv8s5bQXoLdqwOnsxMgyQ4d5o=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gkW6CDWfTNh9VLCopd0EaFlzQCNBjmosS2SNtuV8JPx9lYZWRhM2OEgTja?=
 =?iso-8859-1?Q?sD5eNuUE12/vtyEHdOJvd9zh5eRPZruDLlBD+NOJIdYKCsmOowXOjWUQp2?=
 =?iso-8859-1?Q?lBsskei3lUSEONw7qO2yT9RylIIp0RpTk+in1XQkhn+ciODOrVAOdPLot7?=
 =?iso-8859-1?Q?Dzh/mmEt97a6dKs4VgjyAerPXucSjtshPTfYjIf4hAboCcmwuwwiDB70Cu?=
 =?iso-8859-1?Q?Stipc4pMkYxjBEoTWjrws8ZLHe2/uWLrlZCPpwOsnwEF47YcFMQkrdu5mY?=
 =?iso-8859-1?Q?ErME0GpyzESb4JgIPvIqbBgdYWX6oUKzX+k9okFgsdEW5IssJXX0ExnUqD?=
 =?iso-8859-1?Q?N4pBMbepgSTJrrEjWV0rIP9/86oOEI5BpjbZJMvk9ynNUcezmoYm6rYO0d?=
 =?iso-8859-1?Q?PUpYhHJ94Sk+xcMsnBcGvD1/QFD7YK1ctyCnxWVOdh2N/cmalv6hq+Plnc?=
 =?iso-8859-1?Q?q+M9FbCXvZ/zLs/I9ixsSb3abF3fllnIiAX5ndS8Kc4PqAu2Qf2TR3KPkM?=
 =?iso-8859-1?Q?QHsGXamUfUlLRzeeaAiqkT+F1hqFOZ2hcF/YIM1Du1v/eqL6bCWAljlXaz?=
 =?iso-8859-1?Q?aruCHUtRfZ8H+u+xuMuiJWMDSYEwfUAtN1KFdGhBLGFHzk0GlwsbAGZ487?=
 =?iso-8859-1?Q?ZmhMt4KvxdRUvTdUheTQQJ+owwHMoX7YPftbgA9R+mAbDSFa9122zgp8Lp?=
 =?iso-8859-1?Q?UXgHl7hP683zAg3a/JOSEYepFrFivhg6E/mz0aEaZRWARfMwncw9U6dd6N?=
 =?iso-8859-1?Q?7iuu5v9/WLfT0HjcuPelabYwlFQ71iC0uJlx2TJgbi6uQbLayIWX2NICeN?=
 =?iso-8859-1?Q?GVYo4AZ7QbjpIrA5KM/kkWqYncVp055NwFVI5bAWkiukF7zZLrQSS/yOOU?=
 =?iso-8859-1?Q?VrDhrc4P1/bRQ8MDjjD0nT7gUaqgFklTc4a62fY8+HqmnU0pvewX63SuU9?=
 =?iso-8859-1?Q?vfxBYdbExhSBOEcYW9Jhrksm7wSfuJxtwSj345QAMlrPhZj5+5EUlmfcoB?=
 =?iso-8859-1?Q?AFd0NfJjU9MR12xqmhehmG+c/qshwrl9Y08nXJMq/NB9st2xviODJPLcFR?=
 =?iso-8859-1?Q?51seVNVcjM/RmwXow20bP9kz02bxps1txnEOjeJzLz6jiwbqD4oLRfCyuU?=
 =?iso-8859-1?Q?ls+g/t8IA0ci6MHYlGE9p8reuTGLGzXGiJFE/+FwHPV7jwgF+FsIYMDW4E?=
 =?iso-8859-1?Q?h/71VRKG6k1ykmPP9qjV7KjjCS6E0XGW386Q9k6gM50erCE+ZWvGZ7Cnc4?=
 =?iso-8859-1?Q?X38B/bLup3Tsi72VeGqA7OkHdh6o4kYiuqPCa1IsqaHXOpz9aQeXVsulsL?=
 =?iso-8859-1?Q?0qrBJOir7ZRBEkHYAE7POl/ICmB13bm3nJCMC7w5xoBdBKg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e2b25f-04ff-4ede-be78-08dd0d9e5d0b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 22:13:17.3118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2P220MB1235

If we use LUKS encryption with SHA-256 configured (i.e. the default), is th=
is considered safe against attacks by quantum computers?=A0=0A=
=0A=
I ask because NIST suggests SHA512 in general for quantum safe algorithms (=
see "old Q17" in https://csrc.nist.gov/projects/post-quantum-cryptography/f=
aqs) and we want to be LUKS quantum safe now and for several years to come,=
 even if no practical attacks currently exist.=0A=
=0A=
Note, the cipher we use is "aes-xts-plain64" so we have no question about t=
his as AES with 256-bit keys is considered quantum safe.=A0=0A=
=0A=
Thank you.=0A=
