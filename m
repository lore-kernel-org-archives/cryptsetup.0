Received: from outbound.mail.protection.outlook.com (mail-bn8nam11on2101.outbound.protection.outlook.com [40.107.236.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9836D1E25F8
	for <cryptsetup@lists.linux.dev>; Mon, 12 May 2025 20:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747082905; cv=fail; b=ZRh1AVHtsPZIx4vWgUu75duvqDAhlO49djuF3hEeuHOvg0jQ+3/X3hKtgX+lbJCcE50p/dHrXDPxrfasRULRsQRWaaHxCPKRGqkpOZlgLGA2UYBUb/qK32/Yltl08FNP7f3FUitLwcUwMnLtiz87zsR2Uzu5PZkdgEiMlyepzo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747082905; c=relaxed/simple;
	bh=qi8tcriomsTK858ufeqauw1lDGQ0QLKUfQGU4RoVt9c=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=loHErlat7j3SbS6UtcmiUzvjSa4VWctTVhTbiFrGAY1doqgmN432wcgh0M0taBn3JHahROovACpP5Jt9zv6R3pTDqoJR01Hjrw1g/OjL70w5TlKjfSvlALHwWmuuAaVvGuXvFAO/fYH18JLKQl8XF34toP7Radt2fUuvELy0Cys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matrixspace.com; spf=pass smtp.mailfrom=matrixspace.com; dkim=pass (1024-bit key) header.d=matrixspace.onmicrosoft.com header.i=@matrixspace.onmicrosoft.com header.b=KhTJFsWo; arc=fail smtp.client-ip=40.107.236.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matrixspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matrixspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=matrixspace.onmicrosoft.com header.i=@matrixspace.onmicrosoft.com header.b="KhTJFsWo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEv0sVMtCm9wFq3vzqv8pjTu9zIozb7NVt7KOP3eCo5sStIXbM02Fdx3NTwPebw/le1STiEKbuT2lvXAcve4hsou6y7eKEH/VrvccrunicHuydUokka6twAlWljyOsnzg9lKC+RoN6ZyNj5+rvdsiDBhlka+taLCnAQQIdR259b2isFLKVCkfPRsXSw112g1Bhumd/zSeMauGvHO5fDopo70Q4p1+XTU2CovQ3+JeQZFREhdkCKKQmJmv3JUoSMVBzb/jCMu2Cz3ASQ4/PWK03INKkga0KFL4QyPqJovdXZj7yj3s+kM7vX5gPR5Y9DSMX/1sO8I4+kotnclLuep3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrIkC/U1Yq8R+yeqQ2FrBl6toIRbCJGLWANg4L9Or8E=;
 b=yHwkoAAzGSNItl73+8xbTM0M1/7Nc5STbrCuVj6cISSo5Q0pfSzwUgl6MKcvfkJkuQLthcgT4ASqDcOM0sIBDYssSZ4G0CBpCQXfjWD4JolzCh5gcJpgDQwWDNisYm/8fjh8uRNsKQbVfZWGSuTbMby/VNpIOagBzeIFYo01Qp5HtPzIvbENxcLvBMjL4M6cH3wMYQjnuEFjIe4EjNdnUUCf2rkNsPHIjq/0wB9bSPL/4TtFvfeKDrQ7s+fRy05loq/W06C596mJHQAenFEVC6vERW0tFdu5dOJejfmoTb39afIU9q1xYNiASVGr4taGqs6LS2HwV8FSPgI0nzBU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=matrixspace.com; dmarc=pass action=none
 header.from=matrixspace.com; dkim=pass header.d=matrixspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=matrixspace.onmicrosoft.com; s=selector1-matrixspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrIkC/U1Yq8R+yeqQ2FrBl6toIRbCJGLWANg4L9Or8E=;
 b=KhTJFsWofTQ7xKiqwsIZvTh9F3TgTmT7DlmPEyPnGO8qYxGC0NgTHd387i6KosusgSvINWviOi7aRn9YZmpacxXiHRygNrpTlXqL1MKYmr0X+srR7lUCsTJmmnu3SIreYqABy2j7WZTLg+Tgrj4Tmqu7xwC+aRgq3amkbYbnx8E=
Received: from PH0PR06MB7077.namprd06.prod.outlook.com (2603:10b6:510:24::11)
 by CO6PR06MB7330.namprd06.prod.outlook.com (2603:10b6:303:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 20:48:18 +0000
Received: from PH0PR06MB7077.namprd06.prod.outlook.com
 ([fe80::c339:8c0c:259:de9d]) by PH0PR06MB7077.namprd06.prod.outlook.com
 ([fe80::c339:8c0c:259:de9d%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 20:48:18 +0000
From: Jakob Trumpower <jakob.trumpower@matrixspace.com>
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: support for zynqmp-aes-gcm driver
Thread-Topic: support for zynqmp-aes-gcm driver
Thread-Index: AQHbw1zst3OGnVB51U6B06bzPPGXCQ==
Date: Mon, 12 May 2025 20:48:18 +0000
Message-ID:
 <PH0PR06MB707798438CE88E674C6A32BCE897A@PH0PR06MB7077.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=matrixspace.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR06MB7077:EE_|CO6PR06MB7330:EE_
x-ms-office365-filtering-correlation-id: 877ce9a1-4cca-4d28-5a38-08dd91965316
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8EJDJrEH5KvMjVdnT2QBJUCGAQXdIOkUz3ogbv2hh7Z+6+ZfosSdb/LuAS?=
 =?iso-8859-1?Q?OATJ+2AlzcEWQdesouUI9/euoOhVDvHZRpcdeqnka2ujuBhdymtPkPNjeM?=
 =?iso-8859-1?Q?bYivYVPqok93LnfiBuu/TVNIUI65ZXHIYxu1fu32Kfea299f/m/agUzaZv?=
 =?iso-8859-1?Q?+bmqOfKSk1m0Kr71vLyXjqw+SlwT9ky4/h9a1SDUAzDB5nMIbhyxboZRId?=
 =?iso-8859-1?Q?zkB+p1fw/XP9BRkfSwI0T5k8KdFk3RH2nP5WrWJZiHY7/S7/ahCwI4HHYY?=
 =?iso-8859-1?Q?ijYE99Itdd9VrdieL8W/eH6Sikl+qblYP572SVUtA/cvHIOfiw0YsBuNex?=
 =?iso-8859-1?Q?9MOB9YkRfARATpksHZYBfgusvrBhCYTXMfhv8U428ejVvbNgrEnVHtusc9?=
 =?iso-8859-1?Q?/cvHkd5tsSJvTpOPFgcWuhmaFHIjiCxblol/2o03N2k00DRCpHZ/LQ9LOM?=
 =?iso-8859-1?Q?GdDFluZw6pGD5OWWnrsVJlZ9ke4QZS+5N5ehHae5pwP8DktXrxzrW7bLGl?=
 =?iso-8859-1?Q?uWfOXSaiHo1IW/VocaTmnrGurKhDYWNhGHQFuMUJT+PPww8dnPMKdqezUn?=
 =?iso-8859-1?Q?2P7tmw++V8Uib0BbVKd3PZKLeJf3a4bbTKnct8sVUtGYhCcP74KFt7fCbP?=
 =?iso-8859-1?Q?XaJZG7uL2bEEKxqAOfb9TkICcAkR2GK8soVAiOt9+2fURo5oPVwebcpePr?=
 =?iso-8859-1?Q?fe6JmOTjAGm1CVagQv48+B05/7xpy7wcB9tlq9kF+Vv3dhLdaten4MXAZu?=
 =?iso-8859-1?Q?Ejbme9vOzGndH7wcfVe9mbQdqS4IVSlu/zxsI1FPypc5JoZc8NUAF+jQ/E?=
 =?iso-8859-1?Q?Hiq99FDXlo4QYB8ESpoTnoCKtKRqfB7b1dIw4bEBIiaFypI6ijmdE1UnFZ?=
 =?iso-8859-1?Q?6K4ju/c1g/9PJghiC9twE5anmjti5RkzNAhrKtlmeTDzXa3QuWIaANxe0B?=
 =?iso-8859-1?Q?jGksX8xUg0XpNRJcRHW+ngm/WROKNvNazgzon1/yeADTzL+oN7ldgctWLY?=
 =?iso-8859-1?Q?xsLi746lo5K7Ggd9ODXopQunmM//xLJz/533NZMltqEwDOKpVPNx7u/obk?=
 =?iso-8859-1?Q?TMnheSFv9XL5bbd7tSUj7LJIMGP1pyQv8AVbUnvkQG8z1EAFpJkrxRcHJw?=
 =?iso-8859-1?Q?IfatiVlIsuurP4KW3j65SghxRwWqSSMPTcG+PCBRnCY3Z5WUh1O/i5Gvot?=
 =?iso-8859-1?Q?tXYnydgmsSMvdRBH8MDea+e+ve1+ePOvQvI5QCvb8YBo1PHiK/wVl1nCAc?=
 =?iso-8859-1?Q?WSpunUxRLHUBcHvmHn5ay5b4ipXmpT5zw3VO20x19hiZdq5iacLrxFCS4Q?=
 =?iso-8859-1?Q?FR3zGp6a3vv8KR7I4x50sxhYsRx+ELnGSGfUE/3ZwpNasMdOLshjRSbvJY?=
 =?iso-8859-1?Q?yJuXruCN3OMROeYlEGvtor+oHp0+UptSDtEJ8+y+yZ8VuPNfAOsWirk/dR?=
 =?iso-8859-1?Q?Fo0h7H3a9s6JHembdZg8gBtdBl4HVbA3bgs/9F8fej9dy3XxZONICWumld?=
 =?iso-8859-1?Q?GouCUx/eYtLbtkteLiaGQjcDsJ5uPcMamzdHjDjMHlaA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR06MB7077.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IVv7HmBjyJV0jWnkw4j7DBzlszEuNZOKVpg9RdBmQ+OP3b4jeDb1cjgg7H?=
 =?iso-8859-1?Q?54Qyhg1oFtfbD46/vsLgW2QrhKk+JJuUGWlMmEe6drLQUD2terlARv6JIX?=
 =?iso-8859-1?Q?hCZ/QYU1Odmi4UjYRI1iuWzlYhKiSWQiOi5+01bXYmkuNgtQpr0e2968NH?=
 =?iso-8859-1?Q?lRvntmh9/OP3RGD4BVnwixkV6FFImov+kIZmoPJ/vYt20WJ/HAEwkKPPrQ?=
 =?iso-8859-1?Q?434zVo95Q5aIW1zKB/rxolKZxCN7/JWxbyPKbCo/HgtrxgVFU3ZbjGktSW?=
 =?iso-8859-1?Q?EOO0bzDMAMfAJYyWmWC2Ndl78k4ve0NGb3BdPrH8//h8pYpgY4mrfBsHbv?=
 =?iso-8859-1?Q?NwMZqbVkU9XUiHAmg6Toev6YdHbPnF4LMkkJ7XMSkytJe3RfkkGxdXysO1?=
 =?iso-8859-1?Q?tnZdtYiRqqs0Y+cCe9gTllmzh1sY/T8W55AoAo/uRfXEEkoGSk0t2wuP2i?=
 =?iso-8859-1?Q?lhT3d1IU9gQ88+n3bcEqt61yf8j+W1ri4BoGzwN+vJpinzTfS//f1HC7Zz?=
 =?iso-8859-1?Q?asspsX1QidmTd9AA3pJm3UChrmp6/tdECoCu3xp1CzcIytmqpiJJ5VgovO?=
 =?iso-8859-1?Q?d5iPfQMGTrBbgBWoaNT18pOTUlc25eHOaXDWcWxVelzGOAE6Mbfzev+PBu?=
 =?iso-8859-1?Q?HlyKDUigOSkhGwXbtZnNutU+z/Aa5mik7I2AFJZr2eJecVX3/nOdiKrUZn?=
 =?iso-8859-1?Q?G+/60XABrcuCfISk8DhDFF51uU8TOdKAXhx92owPki6Gz370Ea/FY0Of/L?=
 =?iso-8859-1?Q?Jj5MjsaApvBfQxk66tlkJvtxet909wgEM7VxfsS8If8vR9b4KYKcF6H/Q3?=
 =?iso-8859-1?Q?zzFzhsbO4brOYCA5G1dLF/BS6hQqHkyBjDIbdCmbGSck02b0TdTH1JYY54?=
 =?iso-8859-1?Q?zeCO0YGZ5gh7SNO6W5cHYN1QXJb8O9VARMoxC4GqMkPQ7WkWJ0QkFc438W?=
 =?iso-8859-1?Q?mUe2EtVYERfM+HMmpU2nS2bkPX4ZadKERHB31M7HMukPhZFZ7IuwowTuXw?=
 =?iso-8859-1?Q?BF27zGPL4GaZQhu/OIBYrFt5134j++Kftmaf4eqNOMlo+Exv1Qa19MP9oE?=
 =?iso-8859-1?Q?jRYO3RZITUoz9pCn8XpRLPOs9hPs/uzwR44MHa5ZpVdVHsqYKn5XQMxgoi?=
 =?iso-8859-1?Q?I5JXuiiNN5ra1AH9qtbJV3mY67423iIGit/hlpgqUx005R0kkD5Y2UOo0Z?=
 =?iso-8859-1?Q?TTLgIhFUdmZ7zrIQwd03T8SLrNAjx3sem7OX16zQdU5s39gomW9zWHsnFf?=
 =?iso-8859-1?Q?DBJwjDP53chbEwuIpbjhJib6DryOasst7kHgrxEFQKjkKnJL9+ymBr/CKB?=
 =?iso-8859-1?Q?YmORk7L+5rM+jSLiAF+FraDXcQMidAhPT7gAeQCOeqzVje4R/EsDtVmhqd?=
 =?iso-8859-1?Q?7LuawCCj96oO6PhWK6f2kZxP3JaWGQgfSYCUk6JtdT4cSd/gpS6NH97BAD?=
 =?iso-8859-1?Q?X+e08YQGNAlsj4GWASplrdDxLqrlXISuTMnlWvVIRHZbzhnjXWYkFeirsB?=
 =?iso-8859-1?Q?djy6YIttGP+eo8Sw5uXiECcv/mFq/sS4SZwW7F4CAz+UsC+BUEOGi2WFRY?=
 =?iso-8859-1?Q?wkYY5lfsT6c2A8OOyV7KYCrNNef3QclBebDE9dw69maGVfET7Z/hPpH3F9?=
 =?iso-8859-1?Q?HF+td9DmJ9vBsCETPoEF5M+CZss5huheHGFnqTV3iGNwlzDJaBr7s8MQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: matrixspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR06MB7077.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877ce9a1-4cca-4d28-5a38-08dd91965316
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 20:48:18.0987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6a4fa4a1-e2e4-4c78-a723-4ca9e3f43dfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nocpijg9OWv5Kr1WSnMUJXYsQ+QevpGDewBKDB96p4vWZWf7sP2T+o/K5wR4SwLV+sLZywP4KocumioEnzKrJ2K+zW4kBAt754oFZJqrupM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR06MB7330

Hi,=0A=
=0A=
I am working on an embedded Linux application that uses an SoC with hardwar=
e acceleration for AES GCM and secure fused key storage. The goal is to mod=
ify dm-crypt/cryptsetup to point to the driver (zynqmp-aes-gcm.c) and use t=
he internal key storage. This way we can program the volume key from the fa=
ctory and Linux would be able to mount the volumes without user input while=
 maintaining cold storage encryption. The driver and key storage work by wr=
iting a key value of "1" with length 1 and it then knows to always referenc=
e the internal keys for future operations. I think I have this part working=
, however when the kernel starts sending encryption/decryption requests som=
ething isn't correct for the way the hardware accelerator works with dm-cry=
pt, it seems the hardware is a little whacky with how it handles the tag le=
ngth.=0A=
=0A=
The driver calls for a software fallback cipher if the aead_request has a n=
on-zero assoc length. I believe this is supposed to be zero because the GCM=
 tag size is fixed in hardware and cannot be turned off or altered. Perusin=
g other AES-GCM hardware drivers this seems to be an atypical way of handli=
ng request, and it's usually a configurable. I tried ignoring the assoclen =
in the cipher request, but  this is breaking something somewhere else as th=
e driver starts throwing tag mismatches once I start reading/writing to the=
 device.=0A=
=0A=
I am sure there is a way I can eventually modify the driver/dm-crypt to get=
 around this but I wanted to ask here first if I am doing something complet=
ely wrong and there is a simpler approach.=0A=
=0A=
For reference these are the commands I have been using, I renamed the crypt=
o driver module to zynqgcm-random to ensure other aes-gcm drivers don't get=
 used:=0A=
=0A=
cryptsetup luksFormat --type luks2 --cipher aes-zynqgcm-random --integrity =
aead --volume-key-file volume.key zynq_container.img=0A=
=0A=
here is associated tables that get created:=0A=
tz: 0 2040240 crypt capi:zynqgcm(aes)-random :1:logon:cryptsetup:999a090c-2=
8dd-4381-9fe3-519584010235-d0 0 254:0 0 2 integrity:16:aead sector_size:409=
6                                                                          =
                                               =0A=
tz_dif: 0 2040240 integrity 7:0 32768 16 J 7 block_size:4096 journal_sector=
s:16072 interleave_sectors:32768 buffer_sectors:128 journal_watermark:50 co=
mmit_time:10000 fix_padding=0A=
=0A=
Driver for reference (zynqmp not versal version):=0A=
drivers/crypto/xilinx/zynqmp-aes-gcm.c=0A=
=0A=
Thanks,=0A=
=0A=
Jakob=0A=
=0A=
=0A=
