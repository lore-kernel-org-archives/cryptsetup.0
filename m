Received: from smtp-out-01.aalto.fi (smtp-out-01.aalto.fi [130.233.228.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DDFA2D
	for <cryptsetup@lists.linux.dev>; Thu, 31 Mar 2022 18:21:04 +0000 (UTC)
Received: from smtp-out-01.aalto.fi (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id 674F11158CC_245F10EB
	for <cryptsetup@lists.linux.dev>; Thu, 31 Mar 2022 18:21:02 +0000 (GMT)
Received: from exng4.org.aalto.fi (exng4.org.aalto.fi [130.233.223.23])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by smtp-out-01.aalto.fi (Sophos Email Appliance) with ESMTPS id E92B71158BE_245F10DF
	for <cryptsetup@lists.linux.dev>; Thu, 31 Mar 2022 18:21:01 +0000 (GMT)
Received: from exng6.org.aalto.fi (130.233.223.25) by exng4.org.aalto.fi
 (130.233.223.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.21; Thu, 31
 Mar 2022 21:21:01 +0300
Received: from exng4.org.aalto.fi (130.233.223.23) by exng6.org.aalto.fi
 (130.233.223.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.21; Thu, 31
 Mar 2022 21:21:01 +0300
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (130.233.0.5) by
 exng4.org.aalto.fi (130.233.223.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21 via Frontend Transport; Thu, 31 Mar 2022 21:21:01 +0300
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7VuPZ54BhLernqBNAUpViYCBAf7+nFG5J/boJy2Otqot08h/5UMh96YUZ0tHBkuhgRiwmZn3hHjtHra1S//WFhFl0cP/6ngoiZgFkFJvEvtsJYVIq8alG1YCAZkw6oBknd+rX36OWHLSHvFbOvHHLlPPj3jQLyFC36gkdImIh+MI3lRXdvXsR82IdkxehxFdKhmGo/U2l97YUfM1NS/gUMCO9Oq/vlGLZ3hSt6zABr8GAfp4UTaKshQlQZWPrKl6hDPMtC0Gbg6jR18X5fjRaWvc5NRL1b1tvM7B5E+MG2jCUmQReXqFJLGt4IFKKrqjhWRcxIIQktWIccqmWhwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKZui5tx1owc5OpsdFScMSEWU4iUgSAXAWzKEdbyYSM=;
 b=QjjQ7Aq4neRBDKBtvvdH+xH4uHcsDh4EBG7R+3VKdaOVxpEflTQuen/UaT3BuvkhWscHptQ+x+IGudHMaqfwVQhRMKWX/zNhd3TN9FiLgWqL2W51XxxBQcXViR6entPp5XZcmhc1/N/OFg/vxpja42B6aaIDysXXqy4WLp75jNMOG9qg2nDmKiIGkqC5bk5MMYPww5W0LFp9v3mFSoedymLwn3IWTeS/yIAYFLrFqU50Sw1uigDRlLTUtA5VLGm27I/xq9aBmo1WEHf4j2o4ujmBzWoVjJRPHdkxc1CAW35lV/vPer/ZVr+E7N5ApTZ19V2bhhD0uzYl2VE6k9hvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aalto.fi; dmarc=pass action=none header.from=aalto.fi;
 dkim=pass header.d=aalto.fi; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aaltofi.onmicrosoft.com; s=selector2-aaltofi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKZui5tx1owc5OpsdFScMSEWU4iUgSAXAWzKEdbyYSM=;
 b=wWDGS+Oq0cQd3s7VAttFw0qC5saivcBscqxMrGvZe9D4TZfaExt5NH/TScbI6433MR0mPFgwMfeuO48Fmxn2v/11o/6wDfmbQNPHD+3vW8zJ5YD78eLY/kFvwwDNFXX/iSWOGXOeQKGOCqWEq+kDbiWvlVZxz1qm4wOCBvdo89I=
Received: from PR3P192MB1087.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:aa::16)
 by DB7P192MB0426.EURP192.PROD.OUTLOOK.COM (2603:10a6:5:9::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.21; Thu, 31 Mar 2022 18:21:00 +0000
Received: from PR3P192MB1087.EURP192.PROD.OUTLOOK.COM
 ([fe80::6c3e:afc2:b8c6:3a63]) by PR3P192MB1087.EURP192.PROD.OUTLOOK.COM
 ([fe80::6c3e:afc2:b8c6:3a63%4]) with mapi id 15.20.5123.019; Thu, 31 Mar 2022
 18:21:00 +0000
From: Surmont Jasper <jasper.surmont@aalto.fi>
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: [Question] Distinction responsibilities LUKS and dm-crypt
Thread-Topic: [Question] Distinction responsibilities LUKS and dm-crypt
Thread-Index: AQHYRSvyBCC6QK/4DUS5W+NAoK7Pcg==
Date: Thu, 31 Mar 2022 18:21:00 +0000
Message-ID: <PR3P192MB1087C0EE38951D6391C3B1D5F1E19@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 1ec18323-b933-7b1a-330a-c426e03cd019
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aalto.fi;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad73410a-a113-4a08-360a-08da1343356e
x-ms-traffictypediagnostic: DB7P192MB0426:EE_
x-microsoft-antispam-prvs: <DB7P192MB0426DEDCA0207DA7C9FD405FF1E19@DB7P192MB0426.EURP192.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GQ5IYmT3eGA6+w3EPM0ZZmwz4B1e9TGW0aozeGx1kAw2kQHU7FClgLJyGLDNnHFJPemBomuMw57dm+aZaqKOqQP/1L92654C5bv/3td5lP9KFGsyzfkFnXz5ZbFoRpQNtJxvJf0pA610M9kxz3WRqFUD87r5g/IINui7OhbxDLTQKpolc4tTotuGyuAIWEom6KRAkuEDFQrHv9dxVV+Ust3iRouxMZeQgszlW5/cJqIzCQN2nOTArhg6B8nS+/0qleGW2ZcsMM0sLP5ZOple7NErtUvxPQ66HCgqUkIokDYvJHdnWw25lzl7ClkaymCWRGC8fIfRs6eM2TxRU/5kCSYV07r7R5EXRCrexB2XMlXjUHfdv0kaav1aUdDauGjSoW4tHBzEwgkEpRDyizR0M+rKYb3GctHG6kUZZBEz2VSEnWFWxOuseviN0KaaJGJ38/aAqOlixYaulg/mTuZJWoGWibXl85jwo7b7+Ni3tYSZwJRr1cyI/iqwJ4sfSJ/hiOs/FJfi6zItjVRL2l9A1Kidjg3RGQtn6wnLGGpd8fZcL/Wj1VGXDkGu//pq7lGT/zvCFPI7C2H+cj4P07VYAkSIe74fEXPV7gU7OirekUedR19b8VIEnKEGndTqgRSojVW21fEow1a5LYDiJkFYR9Kys6K0A4bEW17NI3vxru2vuYNVmDU6aYUv2c7JF8m8qeZROT/9Oz7jHblpQ5WAnYMiMo7ZoRiFrn8Ml/DqX6FMrGYWuJAF4PoxxU3dH7SvGUimweNwWjXMw2aRF4B1Eg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB1087.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(91956017)(52536014)(76116006)(55016003)(66446008)(64756008)(5660300002)(186003)(508600001)(966005)(33656002)(66946007)(66556008)(8676002)(316002)(6916009)(122000001)(86362001)(2906002)(6506007)(83380400001)(71200400001)(786003)(38100700002)(7696005)(9686003)(38070700005)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?BKL7uEsG394cYYOWcYb71wbS4CAvqT+tF+4JWem8ddzj+FyPixR0wUUr?=
 =?Windows-1252?Q?Iri/eNqv6yk3uWjy3ntTp4M4AZNN2Fx3j5CHc7TG+3Ac0mBP/WMShlJ2?=
 =?Windows-1252?Q?hUpqxbIQy2ZVMMb1s7aLrrSOTrSYA8o9Md7iUSM0QfI/zn26MujJW//6?=
 =?Windows-1252?Q?JCH/MCoN9ZcP4u2Bi2/U28GjGZMwtt5k46iZKRyLrWCSwMeztR3Gi58c?=
 =?Windows-1252?Q?C4/1sv9zEmnJtTZ25NJxH6B1lVy7OquPiPknWUFxjLbpPUz7u7IOlkKp?=
 =?Windows-1252?Q?h/0m1OncwDL7ajB+thVER4UA7kPUJ4WuSNEi5KOP3HMEWaCydlCDZ+eb?=
 =?Windows-1252?Q?cNX1JP0idfCqzzX6vOP98kvhAkSQKrg5itlcREewrmr5MNxpGQovHhBH?=
 =?Windows-1252?Q?nndqxGDMb3/GClvGOw5NwsuJ7k8Phqo0hEHpSFTH/g4jOpIU+J6WnAC5?=
 =?Windows-1252?Q?rGRuF/1k0IsHzmqJqto782EPbon+Y5ZUM2W0qHVRC4GGSOzu4RfW/Lzi?=
 =?Windows-1252?Q?0GdvK5butYf76coYA43NzCGFhfeCdHZeSieMs77DoxkD7zfBERTW2vji?=
 =?Windows-1252?Q?TnuoZJYanS8w/rBcHHFTgu9wew6kAnslyqdchVF5bwAGxVGWk+U0Yyt1?=
 =?Windows-1252?Q?Y3/8a9RbndgtVY/nfobbaYi1Tcphz6OGCNXaCbBT4ITQlfs6XI8jHgvX?=
 =?Windows-1252?Q?cxKukJuElzzVUJDKnZW8KZxiVtleGVO3YJSEBARH1l9qwgsLzirxzfVX?=
 =?Windows-1252?Q?eQRFpmnf1NcX1N3hHHXmuTAWW5VUF+qQ3McdI08MvDwghPrFU5OmjHs+?=
 =?Windows-1252?Q?5hzXjLilJAioRjHnNLPPdd6VFyfpsW71U+6w3nWoNENKo1ER5s6CQknN?=
 =?Windows-1252?Q?+HkPIne1dosg75Gj0sEkd0CA3/+FlsVVTnBCFNvVR7AhTA9oSJNPHqAw?=
 =?Windows-1252?Q?nbCU81hq44NQYE0HfxI7t5ImJqc1tiCwpDXgPGwHSnX3UybGs41xQJ6r?=
 =?Windows-1252?Q?Q4ebwrzg6sdRDe4sF8LoMDQ/YY+iUDlW60WtVkK5WpIPVV8xno3L1BsY?=
 =?Windows-1252?Q?5/jyNI+JIewZv22SilN5YeoceKVpANGF5UPh6rqz2tphABz10O7ZvmZW?=
 =?Windows-1252?Q?dq6zuKPBnUrxTURj5utTtNs0yIuGrvNLjYKoxqRLk9fFoCV4Ncgut451?=
 =?Windows-1252?Q?HxOjiC6eRV7gyZQu4GD0SrVCQhn6O3sryKCr5I8e2OV0SLWQZTf7IBC9?=
 =?Windows-1252?Q?diS09pCcBvrgvWyNaKMQ8LL2CmifIL4ZPTQek5/AQugpDuttnr4b4HVz?=
 =?Windows-1252?Q?pBX8sXZuh0IcvSSkNBN/dpeRauRI4zAGp6CX+NIRbqwVO5Nik665LRBU?=
 =?Windows-1252?Q?YxEVtEBMJ9XeNIqKFzOsfmBs1orDSWlbfQLintlxnuCmR89xBkFKoEmL?=
 =?Windows-1252?Q?Yv285pVWvGb3J+o4G6r/dGRc16xvASw6qSH/bUF+MOuAHgEeXmTC2kV6?=
 =?Windows-1252?Q?HB+fWQSbOYGpDUXbgLrJdNguBUtsMw+7XKuq0AVKR8J+LzrrMKo+a5wD?=
 =?Windows-1252?Q?vGUQ+PxDfWxBY56Cap+ESU5yaYDKtVpm0P5v8t+npzAuZSc90cmZ87UE?=
 =?Windows-1252?Q?9INtSp2sFxz1USTpsGUIF9cWEsyUKRrNHAQnbGDtiNot7DqKvf3i/PBf?=
 =?Windows-1252?Q?fK2n/St5b85lB6Di/dbt8bXMzeE4rdh/SeYyU9LtIseXIEFp18BSqm9+?=
 =?Windows-1252?Q?c+7hSRG5vYFhmyrKh/ZdtG53ped869HCq1H5PkIJO774IRTtrgV1ECbB?=
 =?Windows-1252?Q?/qtgjzkuQwBmMSDivZsw7iQhK8DX+Zf0DLhjNB7iF966+h0CxMh0IYAs?=
 =?Windows-1252?Q?X0PT7Wr6Sr7u53eEmtrZNQyvsm5HCf4grOE=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB1087.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ad73410a-a113-4a08-360a-08da1343356e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 18:21:00.5717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ae1a7724-4041-4462-a6dc-538cb199707e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A/jwlXV8lKZGXANfztIT1o4Eov5XAswC/JQuQviXTwYbNhwE+pbQKd6CetGRv9LfYWWJHZc68o9DaGsVvW/3JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P192MB0426
X-OriginatorOrg: aalto.fi
X-SASI-RCODE: 200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aalto.fi; h=from:to:subject:date:message-id:content-type:content-transfer-encoding:mime-version; s=its18; bh=PKZui5tx1owc5OpsdFScMSEWU4iUgSAXAWzKEdbyYSM=; b=j8KfNK2+iUysNLp9ExzaalV21A1M1CanGXzkyQWDXzyopfiXv3SWx1wWcDUAIZx22vNBrhnNZOabAhytTI7LZL3IUSkYSaA0fWStsj5AXWumNnd0U1dT9WGmpN4E+JUbBmtCYeH4XDNXbX/qG7F+0A5/oFggrCRe39HxUL2n2m9tQK21YSJ4z5jKpggFu8QRSgV2wr/4gLJg02UXxzUJFJL6xz+HNE72TOpDHnw5+fYh59L6SDqh5Bolg15Dh71ZjlKoQqEaNblzJmmptvuT6Eq8QGKLGcwTJhm59s5AqmBneq0DHxO2LrEupl5egxlQt0cmjvBQd7O4NSmPzfQvJA==

Dear, keep in mind I=92m fairly new to Linux kernel development and=0A=
similar, so my question might sound stupid.=A0=0A=
=A0=0A=
Reading through the documentation of both dm-crypt and LUKS, =0A=
I understand that LUKS is a format specification =0A=
to allow FDE, and that dm-crypt is a dm target which allows=0A=
encryption / decryption of writes / reads to the block device.=A0=0A=
=0A=
However, I'm unsure about=0A=
what each of these now exactly provides (ie what are the responsibilities).=
 In=0A=
the slides =A0(look link at the bottom) that the author (Milan Broz) made,=
=0A=
it mentions that LUKS2 can also provide integrity protection (hence making =
the=0A=
encryption authenticated). From this, and also reading the Luks1 specificat=
ion=0A=
I think this is not possible in LUKS1. However, later in the slides it talk=
s=0A=
how dm-crypt allows for authenticated encryption. This is where I'm confuse=
d;=0A=
do we assume we use LUKS2?=A0=0A=
=0A=
I feel like I'm not really grasping the main function and responsibilities =
of both LUKS and dm-crypt.=A0=0A=
Thanks!=A0=0A=
=A0=0A=
Slides: https://archive.fosdem.org/2018/schedule/event/cryptsetup/attachmen=
ts/slides/2506/export/events/attachments/cryptsetup/slides/2506/fosdem18_cr=
yptsetup_aead.pdf=A0=0A=
=A0=0A=
Sincerely, Jasper Surmont =A0=0A=
