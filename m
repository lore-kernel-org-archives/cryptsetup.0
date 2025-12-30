Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023076.outbound.protection.outlook.com [52.101.83.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43CE35966
	for <cryptsetup@lists.linux.dev>; Tue, 30 Dec 2025 15:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767107509; cv=fail; b=DrC72sH902r6p9/aOVL5r2vEgbrIcQ2PBXbO0bLaCiDZPeeLXpGSnhaPulEyEkOPV7k1E9ZgfYExdx7Ri5SPiFXNKH1y9HNnACq3cicH4twYAKlYr2bWLSD6xQXLnT2M//TevRtIlFj6F3VdvLtnw/NL21dAsTMiUYaH5vaSg8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767107509; c=relaxed/simple;
	bh=hVuPWJj3pR1Thq7eP36hhcKpUE6iUjuov7ozEQeGNHE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pJWEPLoBk+or9talcwUN/hLP0orvv1n7I1ifuHWLpnkkyY9QH/IOGmUW75lL9gv5jpkQkvY6E2NtMHK+vAyQH+VEORik1WcOmusiCz0H6KrZcVSE2vUH7pSc7t7W7J7Cy+m1dHP4iQ87OAKw+E6c/adoZpUIoGcwyuUHCVwhxGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wiora.co.uk; spf=pass smtp.mailfrom=wiora.co.uk; dkim=pass (1024-bit key) header.d=wioraglobal.onmicrosoft.com header.i=@wioraglobal.onmicrosoft.com header.b=eglZM3sR; arc=fail smtp.client-ip=52.101.83.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wiora.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiora.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wioraglobal.onmicrosoft.com header.i=@wioraglobal.onmicrosoft.com header.b="eglZM3sR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUdTe6y8oNn9LZORvsg8icD0s8QdBpuADre2uq9x6XRE3QnbCWfqZoJkL9H9sDeXDt9aPWjTwTARSQ87bixhwhIHdc6w9aWQeoENhnyzyXtgYox9MaBYPb0xzRjBWpovTAdaHz0KEbqrxhtiH6Skj9d5iGBg7IqCpelb2Tjx+/q0th7AsZd5wYZQ2uMCZNx8Mz1bpc3mpwLIZvs0oHoUf5Gbb+DlQJFmayoIjYOf9cPrqIUgRgaHrOBBovoP3HvQXS1q+hSIhz7LCIBclnuAu0X2S2GdupWbIaa60d0E1wRpcrzdbR0DWPNtaP8/Vue/DFZOQY4eQrNAhZEEzO4AHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVuPWJj3pR1Thq7eP36hhcKpUE6iUjuov7ozEQeGNHE=;
 b=xDSUyaVDpjS8x/3bUJaj2GxeO61om/XcK860UqON+K0daAXyWvxvqYLYB5XehvadLFRz1N+IdtJlFlmxfqF92S2kuHu6hS1Ygacc+GsEi+zo3Z+AnUsWJDw6QWeFQd+6cQqvsV4rkCpndDOngDnwA6UyTzsW27xGf56b5bSQpKpVGVFrFcbFBD1IdNSvnk58GeTN6FMyz8gQlrEvISVPibp7t8CXwoV+9a0PI772WtT66+9pDu4sLp3H0JHRFm4tXVMlHBF9VuyntR7EBk0j/jQoO55zKGqMAsA41jw43WWd6QFbBctvUZ/x1pXfymd9skJFIU86uPKQy+idNonznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiora.co.uk; dmarc=pass action=none header.from=wiora.co.uk;
 dkim=pass header.d=wiora.co.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wioraglobal.onmicrosoft.com; s=selector2-wioraglobal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVuPWJj3pR1Thq7eP36hhcKpUE6iUjuov7ozEQeGNHE=;
 b=eglZM3sRC9tK8FZrPKYZDTqmq1HcIjCPsf53Ux3qCYrc/J7EV86OyBxvrorGD1cNkKAfTp9bd16iEfx9f5PsdeoGM0ycHeJGS4aaofODWTOsTkSPRVoJIiDMAIsab05yLBpkatXzu7oE9P0h25fW7fXXMTM430I6rGVL8/knHOc=
Received: from AM0PR03MB5603.eurprd03.prod.outlook.com (2603:10a6:208:174::31)
 by GV1PR03MB8862.eurprd03.prod.outlook.com (2603:10a6:150:85::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 15:11:44 +0000
Received: from AM0PR03MB5603.eurprd03.prod.outlook.com
 ([fe80::7f05:2323:cadd:5696]) by AM0PR03MB5603.eurprd03.prod.outlook.com
 ([fe80::7f05:2323:cadd:5696%4]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 15:11:44 +0000
From: "Matthias R. Wiora" <matthias@wiora.co.uk>
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: Re: PCR9 missmatches since latest updates
Thread-Topic: PCR9 missmatches since latest updates
Thread-Index: AQHcc0KJ9oF/kpq2BkS7JjDHZmin9bUtxZaAgAAMYBaAC86GWIAAtgXz
Date: Tue, 30 Dec 2025 15:11:44 +0000
Message-ID:
 <AM0PR03MB5603040577C449A3D5992E5995BCA@AM0PR03MB5603.eurprd03.prod.outlook.com>
References:
 <AM0PR03MB6212DD259913B638EE8741DC95B4A@AM0PR03MB6212.eurprd03.prod.outlook.com>
 <d11da336-07bc-4871-9db3-9ef8e557611e@gmail.com>
 <AM0PR03MB6212B0F513297E7F8018309895B4A@AM0PR03MB6212.eurprd03.prod.outlook.com>
 <AM0PR03MB56031739DE2075CE202C90BC95BCA@AM0PR03MB5603.eurprd03.prod.outlook.com>
In-Reply-To:
 <AM0PR03MB56031739DE2075CE202C90BC95BCA@AM0PR03MB5603.eurprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiora.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB5603:EE_|GV1PR03MB8862:EE_
x-ms-office365-filtering-correlation-id: e56cc3df-b5f0-45a9-176a-08de47b5be5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?b5jzMPrKrww9dQjyhNey6NFXnGty67wSHuNbNBsNLG7QDqhzk0TosY63lI?=
 =?iso-8859-1?Q?zk0w5Ir/ZgHa7Id38sJEbEi7Zsl9duqDEBzQCNxY15qprPyzc4LglE2wyZ?=
 =?iso-8859-1?Q?iGXrUZr/WSKzltrGTkTqXVLWzQyFBDBEBaDbjze9zUOiBS7M/yVcHxKtXV?=
 =?iso-8859-1?Q?4ib2s+XPRdhZHYti93pLcAX15CfpB06u3W/5GGfT98h7CC+Ipok0TwzfGG?=
 =?iso-8859-1?Q?lyRJGzdzw8YYQyNIan4KVSEEXILEt9YW+UDZsvqZFDmP4RmwZNYmCmngNs?=
 =?iso-8859-1?Q?mHdAk2pX7qOL9Kr37YsX3tQVmqPpFiWNYtM5jjuMViJKqDUgotJIQ7JF/1?=
 =?iso-8859-1?Q?IM3Z07QxH0piyY6x1TEp5AP6QtRHRJoNmHGrxseh7HgQwrmDlRaKAL+Fe4?=
 =?iso-8859-1?Q?yxgOkNeJOoiRznu/Oe4hd74ywI2IC/HYxO5HhyX4geDuClljsYpUrp1Nrl?=
 =?iso-8859-1?Q?wQM5WRB7HOtiFW6N7GhO1A9q0I4zxtZI/ld1wKCP2GqzrkXtFR8M+cTTp5?=
 =?iso-8859-1?Q?6z/e4QcyHBtsZDU2+bdH4WwtySP13hP60OyKUTxHFHxS637v5YTmHfc4+W?=
 =?iso-8859-1?Q?0gBVr9jwWSR5SYqQ+yu1bS8IyZhCINpFlH4ws8a2/otcPZwCk28d5Jp4H0?=
 =?iso-8859-1?Q?Wk1AzjfT+ocqksL4S58bszL96mF6txr8rWRaIKvXPvssA94AGZS7mf0z1v?=
 =?iso-8859-1?Q?q/ZrqNIazu2DYJf96iemDbl61bnkvQI9HPImEcImObulCZ3sDjIlP+pzBp?=
 =?iso-8859-1?Q?b4s0xE319oI2LXcNviAgLWiUvVyzggCJSP3zdmTVwjtTS6Fb7arRIB498C?=
 =?iso-8859-1?Q?hCpw6trKFbJE5BEqCyJLZ+fF1bXFxs+Y1JR3IvASspED9EKUx3xfadrxdi?=
 =?iso-8859-1?Q?g09ZuEOcqwlyDrHPjX66CQB3IcOxNMOkeHZnyjfuFXbLzFCYISSeN49LOI?=
 =?iso-8859-1?Q?+LgeZxGhuWGy77ZOxbvc2CK/dmLxGVylG/cQf/+kd2nkxafkiRoFy+hNL6?=
 =?iso-8859-1?Q?AkryvTAASOxRAy+90QcWuBlP6ydXY9kLNIo0qpZjzC0TXTSBhApd00kpZ/?=
 =?iso-8859-1?Q?40lKEPpCfwvfYoIxw0JEmGIrUDD9HAejejLtD4QM+cgMTLKGARIY0ESQLS?=
 =?iso-8859-1?Q?zvon4v5VTgkCLLvAlzDKKtkTJGZaykhomUh3wqiarlbBUQ1H3uNluSXnFk?=
 =?iso-8859-1?Q?Y3HcrxJ4Tiuj5B4ia14Ymnn5j49xwgWCe+UTrj60yv9f6r1d9Ge65Y8nKX?=
 =?iso-8859-1?Q?c5dUy7vfN/mLNpAC1Ny0xu7tTVQvHgn1q0ZLPtN/lU2nxtrmRCWY11aIdI?=
 =?iso-8859-1?Q?IhrwM/GsG9qYduc6/j2cAcUXOVpTKEuVEHeXA/uyQgsa4qNucwkeARpumQ?=
 =?iso-8859-1?Q?rKcHpXkWqwToGCXL/214e+Nj7p323zl3kAq5SPy7y4BNvm0MPI5aCR17T2?=
 =?iso-8859-1?Q?Ls3SEqXXuR4Hb4isAfCuqLWhlsCNL74XQn7W3We3VkCH+uJvKLXDpOMMLI?=
 =?iso-8859-1?Q?Af7aAv/PP9IxpwiXSW/J8Hs0sT+rYM2B+frzIIQCluctU+DmQNd9KryB+4?=
 =?iso-8859-1?Q?P9MnMsppCrhv/txGLy1K+sEHjxEy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB5603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7vwuRvXpG9zzADqtcUtt0fnKSZQWHeYxFZwteSppzhPs1X15rysEG0dTe8?=
 =?iso-8859-1?Q?iC+qIRMMKRwdNdyjuWAETJuPYrUfE5XfBECgU7i0U+Axa2sHHKpKfxyjZu?=
 =?iso-8859-1?Q?4yPozz14EpmCrUZA5Om7A6Iv/jra6IjF5NCsNCD3UbMiPa04IErdC/Vfqi?=
 =?iso-8859-1?Q?DKVT5m77+QC4w3VgAP7/hTt98ZHpjVrXvLWMMFbwuk9nlsc6Wgv8XyLoH7?=
 =?iso-8859-1?Q?8LtGLc8QDDrVv6fmzx5EE62cGGpJ4nVzM5f/Ugep1BV0D8f31fmD1MiauM?=
 =?iso-8859-1?Q?z71r/VVWNuZVNZO/1O7jSl4EwWGF7PWLw98B13IOeS59Gc3GeAUXkfSiiX?=
 =?iso-8859-1?Q?c//094BP/ZGqnlXPrOhHb5PE0/SRhEAuPwviwxHrO1LZ5fYywkpGgFbjN7?=
 =?iso-8859-1?Q?lOe41rGFizxMPVaAlSBK5cunpzUb2PQJswoJ5uTUp1gnYda3e6ixx7o/46?=
 =?iso-8859-1?Q?3mV5MZ62TaBXS3GWC4HAgrLC67nqr/YP1e2hEuRfV+R3JerehBJpsFHPJU?=
 =?iso-8859-1?Q?FtSdObIuLghwc0JR/7ief4BifbieB5+7rQAWyvr+l5bdnfvy6Gi+CeibWX?=
 =?iso-8859-1?Q?Q4VEUciMv6iLlMq4APJg8WseTbgNW1hGRAlGevLHh3qXXy25DB81vyIwUf?=
 =?iso-8859-1?Q?lpfz707fdkzlAGU6NYpEHeEI11wdjqFLPnH2EsEUh9gm+8yKfIoGVhr9ir?=
 =?iso-8859-1?Q?Rzc+QFtL8wGXTsPIsa6F+2QYIpdDVwfdWPC0I8mjS+vIJj1Bwm7k0DM8tL?=
 =?iso-8859-1?Q?XrFp4J/cXQjWBinpSZ8l1aGP6U5H7ykpt5j1ZMzFGgyuh75HFuTE1NNC4g?=
 =?iso-8859-1?Q?HTjgI+3pm6bwLypPE59KVnCfAUnetqKmdR7Na/iOCSiAHK8zWzP9nxF3uC?=
 =?iso-8859-1?Q?SGtVGMwzkSenPotA8xOVHPcuMgzC6U7h51RTu5239RUdkcBBsgqCSHs39d?=
 =?iso-8859-1?Q?uGcBuitD1sl+5Tajg4b3dGo5LRJAIE+m2zgYGk/zEXZ19Bec3CyFEMGYMB?=
 =?iso-8859-1?Q?CNNdTfSfqIh8/e5yIRX0xrM6MLyPSrA924rQfVMuh3Xt1dAbUfPM+fAJ1Q?=
 =?iso-8859-1?Q?m1DdrVBJjxPI7k0Qd1BVarwcTe9Y9+XQmwf8Xrq5UXancJPHc8q9GTKdPD?=
 =?iso-8859-1?Q?A5RUNNzUh7/6NSPRJLxSF8RoVhffxRxygl3/Cn+fSlcwPlKvAn+d87K3OK?=
 =?iso-8859-1?Q?AEEs2AUd65YVu3AxhaufQ2uWWRlCkPXP9SP6x9uDjg5VQUTqvIzggnMgdH?=
 =?iso-8859-1?Q?XfBY8xGN7dUVuWFLbxUpcl3e71hpLjiBU34+Ns75FxVQ1m0cQpyyd0EyX5?=
 =?iso-8859-1?Q?nldm9GGad0z87e0H/HiYiJSAsBShf7p6C7m+ywWwsi9e+cYgAqYd7aBeUQ?=
 =?iso-8859-1?Q?jeg2xablusKi+q8j3phC8iDjDZTeHilQE2HT+pV3Kv66DDX8v+KQ7HaZrE?=
 =?iso-8859-1?Q?jUcwo6XArvVx9fe0UmQ1tsOzpR0zuq/lrnpLfas15gcsVeujAHfzzSMn8R?=
 =?iso-8859-1?Q?BIuLC6i9Dv6aKGlC+zggzD9gO37PMjxLp04m86imJCMV2UZZr+pVqUbb1T?=
 =?iso-8859-1?Q?wKbHSo1eSroKnspDwgZ+ZQUwYCrf9NYKJI/S5rXycGIuOeLXNyCroKpgFD?=
 =?iso-8859-1?Q?qBHdPTfw/NELgWZZTTHXbRQ8PN3X0G90vDlpbtDNarCkgXhZb0KwklDyB2?=
 =?iso-8859-1?Q?v+sUEqfPG2PCnqpVwlgdPYA4B5KW9xvmJpQA2FGiTcCT59HVNaDQ6bKE7V?=
 =?iso-8859-1?Q?JFoZZpdWyOVxU8aja39AduJ2SebT2PDgA/+CVHu+xue+f008wPUh/QHyxj?=
 =?iso-8859-1?Q?PxzGSRwd97MULsB23zXja/MZvQL+ccWSNjtj9YLwbLRajAdhcR48?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB5603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e56cc3df-b5f0-45a9-176a-08de47b5be5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2025 15:11:44.1311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dc522372-3f69-4143-b880-ea1a60fedcfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/z9wuCE4aSp+VCxzEprgojqijPoOHcjnPs5+CP+tGUBm2WrRq5hUJLFCT0mUfG5Ps4sHIcpGHJhdgP20xCsfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8862

No HTML allowed - fair. Resending Plaintext.=0A=
________________________________________=0A=
From:=A0Matthias R. Wiora <matthias@wiora.co.uk>=0A=
Sent:=A030 December 2025 05:30 AM=0A=
To:=A0Milan Broz <gmazyland@gmail.com>; cryptsetup@lists.linux.dev <cryptse=
tup@lists.linux.dev>=0A=
Cc:=A0systemd-devel@lists.freedesktop.org <systemd-devel@lists.freedesktop.=
org>=0A=
Subject:=A0Re: PCR9 missmatches since latest updates=0A=
=A0=0A=
In case someone steps on this - just a short note:=0A=
I resolved this by having a reference to the PCRs measured in tpm2_evenlog =
available under "/sys/kernel/security/tpm0/binary_bios_measurements".=0A=
=0A=
Based on that I was able to satisfy my requirement to know how the PCRs loo=
k like at the moment I want to know, if my device state is trustworth BEFOR=
E entering my passphrase.=0A=
=0A=
Note: I figured out that some devices (in this case with a discrete TPM) se=
em to hold in this binary_bios_measurement only SHA1, while the TPM2 device=
 is capable of SHA1 and SHA256 banks.=0A=
=0A=
I wonder how this will be handled for tpm2-protected disks, that are also e=
ncrypted at the moment the system has been completely booted up. This case =
should be affected by the exact same challenge.=0A=
=0A=
Cheers,=0A=
// Matthias=0A=
=0A=
CC to systemd-devel=0A=
=0A=
________________________________________=0A=
From:=A0Matthias R. Wiora <matthias@wiora.co.uk>=0A=
Sent:=A022 December 2025 05:05 PM=0A=
To:=A0Milan Broz <gmazyland@gmail.com>; cryptsetup@lists.linux.dev <cryptse=
tup@lists.linux.dev>=0A=
Subject:=A0Re: PCR9 missmatches since latest updates=0A=
=A0=0A=
Yeah! Your hint was perfect! Thanks!=0A=
=0A=
Obviously Systemd Release 259 caused the change:=0A=
https://github.com/systemd/systemd/releases/tag/v259=0A=
=0A=
Extract:=0A=
```=0A=
Information about the=A0initialization of NvPCRs is measured into PCR 9, an=
d finalized by a=0A=
=A0=A0=A0 separator measurement.=0A=
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
Milan=
