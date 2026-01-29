Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021133.outbound.protection.outlook.com [40.107.167.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC9F31DD98
	for <cryptsetup@lists.linux.dev>; Thu, 29 Jan 2026 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.167.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698111; cv=fail; b=ewR8U5cwVCIYVlJ994CJFaEimLfXl6XKAPPyXpgiyHJolpu15oTEUdKeGftqbYGkq7wkirPKJFx82mk5J++xvxewsEgTKr79wDSPkSpbbEL2hh5f3c7+Y9ExZOrVBMVY73fo+bgusJmpxkLfCje0EtU+Fp0ibyuKrj/s+pu5WVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698111; c=relaxed/simple;
	bh=j71wqjQ3dY6WcQEARb7LQLqzOUyZcEozjGimAV13yTc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BHDALBB05b902FvSXXpNvk2UV68aozUVygkLCg15MEP6ewagFtlY0kDdx300mCmjfPRg+9lXf6gwXKHNts6pjaI9ECQHbW2Fcv4PEf4JoQf8rilOb6xXfnHNdKZBa+GOZihMMpwuHJV3UQyy5CjOkE316UOd5WpR5C1FVzL1BOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosen-nxt.com; spf=pass smtp.mailfrom=rosen-nxt.com; dkim=pass (2048-bit key) header.d=rosen-nxt.com header.i=@rosen-nxt.com header.b=eo8kcHwN; arc=fail smtp.client-ip=40.107.167.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosen-nxt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosen-nxt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosen-nxt.com header.i=@rosen-nxt.com header.b="eo8kcHwN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNzsDKcupTZQcZjSNVmZZMV1nt7yvM5OGb5e3MZwiIdgD98LcoMrGfFIO9Gn+01uS+oupMDlzrLYSINCqYYehZQLf/8s+dxaEot/QbcLmh+PTCi3nurTwJ917WwJst1ioMccF/WLlGOKuCReW8U48ksW6X/gQFcm4r2fpA4KmGnSagaDkICxFSh13y8yASHhqQw3xODCQ/iU9Xx/l6HyhlQRuj87Hsc3qF1CXAh3ILPDHWq/9Nf2JFMTbLXnoWFvE/nUV2QGQbTuUngyo9QNzpOn6Lk6oGIOoaD1JOtJ1oYnW6PGis8B4ir82LOCclCQf8CFASSYssspjFOpgsH19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j71wqjQ3dY6WcQEARb7LQLqzOUyZcEozjGimAV13yTc=;
 b=vHuvoC8CQ8bDI1pQN3+4IU3eWg83eoschv0mBIgQXV6HSrLUp3kYjLd7XwEUemfLFRLv7jBRO8nZD1xLZR4Ui0DR08mGS4LPVV4W9CIfHC+BYOF3An1Gebg8V+fCiHwC3bIcURtroZNK+tp8WOdDY8KvZzDofN6oHM1KjHlN/NfEEHDefhD2tFujTm//Qhp3159OtvY9fSYkx/5PEUAAebjgOZDuEhBhB0iS26eC8iAFLTH0kCV8F8HF5YmU8LlZXwxP+ACLKh34iZ1dpGoUBZKqxQefPR2w84cPdHy18YOL+/cXiMchHIOawRQhe55Zt3WWG0ziaQCns8LXryzC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rosen-nxt.com; dmarc=pass action=none
 header.from=rosen-nxt.com; dkim=pass header.d=rosen-nxt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosen-nxt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j71wqjQ3dY6WcQEARb7LQLqzOUyZcEozjGimAV13yTc=;
 b=eo8kcHwNAOE10pa9CKeQSKGBqGUu2vDO+YOOk3Xjv8EdPWm+Zfx7e9BM8N2TBMR8imO1APnX4wlMfYLweZK8wRAQ0I5dQQN9HCmIolPr1tc5PFJAlVyV7QDqiUk90PIjWHxna2cMmX+lgAQecMMP+w0jmE5S42ViHGLE4Ykbja1/OE1ekYXVFnqn2j4YWwPQOylAkzG27u6PXH4AxyPMjN/oS7UeDcctNd+PptJIRwSFo/tCAv5taRbBy/O5KEEk5v0uXQ+KxE9DAB1ZNhkqS2BpbZEEnp4hAQBqkIERBObp5luiD+fdQrE6vLCdtz28QmPBuNhuC8PPmgp7TdqjCw==
Received: from ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::217)
 by ZR5P278MB2037.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 14:48:27 +0000
Received: from ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6ba:121e:3a43:ee35]) by ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6ba:121e:3a43:ee35%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 14:48:27 +0000
From: Alistair MacCallum <amaccallum@rosen-nxt.com>
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: LUKS breaks When using fido key with pin
Thread-Topic: LUKS breaks When using fido key with pin
Thread-Index: AQHckS4slwL6ZnIDwEaAgyIQdBuYbA==
Date: Thu, 29 Jan 2026 14:48:27 +0000
Message-ID:
 <ZRH2PF6D297230325546A167E9072E447698B9EA@ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM>
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
x-ms-traffictypediagnostic: ZRH2PF6D2972303:EE_|ZR5P278MB2037:EE_
x-ms-office365-filtering-correlation-id: 56c30703-2533-499a-d340-08de5f457613
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7142099003|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kVqY48yu5uN3ikflk03TT864ElQmz5GtY0BBPZP2UDkQ3v6aVdKUzUn2zj?=
 =?iso-8859-1?Q?6XQA2szx0CdOaDP3Aetmx8Np5ltawnx97Fj33hLJAr5FJ2TYZ4rpVThjgj?=
 =?iso-8859-1?Q?15d77mQO5bZdT/Sj5or+BRbr1fP5qGCp7xa/Uy9n17J2eFVLyfxR1K1E1E?=
 =?iso-8859-1?Q?hVze134pDNRIuR6Ld74xirYzZyfMGLvsjOSDp+RNNN1fCF2y1FXrVPMl/p?=
 =?iso-8859-1?Q?W8he+8XrAVv1w5OEyC053NH5HT24gFmJtsDflPoB4eWig2zwEuOJheFGm3?=
 =?iso-8859-1?Q?ArqA2QgAVgPMNBSMwkb5cAIK/GTpJac8HPFWw8wWBQHbYksMe7LpqwRPm7?=
 =?iso-8859-1?Q?jG384C+ZCZVRAjHwUkzBOzXZ7z5I+Rl81jgtYdE2WU3DiO/Hb/iy9MA09O?=
 =?iso-8859-1?Q?zvlYg6oE3igSGSaZhD+5gv3weKczr+J/Kc2T2/TZbIfny34fMYSmbxG3EK?=
 =?iso-8859-1?Q?Yf9asyQEkuiZbDGJ5SHbxCu9csFU7rXrBJcCSN2XSiRYL2M5g4V/5Jw8Eq?=
 =?iso-8859-1?Q?HwoXsvnhw79rrz4llMgMEmv/pvY7o0+rVlI5ykdwNZlmUHEv4ruZuVdr0H?=
 =?iso-8859-1?Q?tAj39mcYNglVxPlIoalk7F4EjwE4cR9do3+Z7QCGPaW82DnRQmWEiMO21U?=
 =?iso-8859-1?Q?Sz//mekYeGz3Kr2FfY8s8tn2HA/rFDZQmJc9C9CK5DzStt9OQ3WLK8P62x?=
 =?iso-8859-1?Q?F9Blnz8HepnboZ+9/dv54Be2VTyKzrp/VefaUrIwEx93FtP/+cToSdG2iQ?=
 =?iso-8859-1?Q?qKI09isJuFKWHXk8MeutNdBZv1EpoHJaEup8k5Fztpc/xp+9TwnXKIVbRV?=
 =?iso-8859-1?Q?8O7kC6mLl7H5pQZC3pGO65n1OgtOHWodOJu/lOZWykZV5aSNflqMp15G1o?=
 =?iso-8859-1?Q?G50WBui3YrlTacYeBYbQJJZcVGaEh5ZUeG3pntO8DBgrbvkd6F62aAOwCQ?=
 =?iso-8859-1?Q?nao9JHLquSlBRpWvZ0IUu0FjSGstiOi57439ZpBNieuZ+LPM2Y+Fvdtc9l?=
 =?iso-8859-1?Q?eOfvaazzivwWRO/MyNqwU7xz7ZXDVtikLIbLN8xsjfwWg5ZSY4ocyeFpXJ?=
 =?iso-8859-1?Q?H/4tN6OBbmkG8Ic+bMBu9rWXGGuEIXQGVUZxhJbSAIGrBNm4MVPuAnpyjq?=
 =?iso-8859-1?Q?jYiBN0RuwR/jli5invWERj2kRuGqCeSVijmpLmxY8FiE7QE2ItnieLUqkc?=
 =?iso-8859-1?Q?Ko5X1QoqfR/EWGn/q7W7gZCDRgpuw99tBYxCc9ub6QxBRWTiWzfyFEDN3+?=
 =?iso-8859-1?Q?+drnHm1xg7LAA9sQrVg1rPWX5SI3s74isxuELHpsHUlBVcjwl+zw7vcHJN?=
 =?iso-8859-1?Q?eoVV46tQh1wSoMvvytEQ2B7Y9ME3AcNmneotU70jAXo1CFL1GPtOHgAMix?=
 =?iso-8859-1?Q?HroEnqTXyRm+U+rMzCJkcK56PywNbC+gjvUsUGZxRRSs9CaVRxQfa2peUJ?=
 =?iso-8859-1?Q?MDv1Qboo1fJ0vWpWTJI4wTu3zAehqeEub2Hw1RJjic0fGgnMtcnWsGzMoM?=
 =?iso-8859-1?Q?nwivG2Au0oDvsNDGgzS9aomkKMZ5RTSHUr0OLXEs7PgeENqVUPBnkKaTPa?=
 =?iso-8859-1?Q?S1u/zKsfJbcuPio/AZtT7Urok1b7bzhhcZQCR7cxPJtYlVIEM683YKI4Kg?=
 =?iso-8859-1?Q?Z+DVQf1Fw7AfhVgJL6SQb+Dvp/DxEGeYZYALgIeq9YtZL8i2VBPfSNW4C3?=
 =?iso-8859-1?Q?3vNaSYmZ3FQxc+zaJAg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRH2PF6D2972303.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7142099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tq85+AN1zahzSxNiytbbs6mza0VrH+ndJfgWS6cEa8P0pIwV2B2r0Ogcnd?=
 =?iso-8859-1?Q?dIboKKfOnfyIYau6gOigZT3Y5lWPDBTGCfrJJH5MliGIbOXgtj2uHkoGPX?=
 =?iso-8859-1?Q?8VsB53I6tEdPnKdvD7d0k1fW5M5S9phpv8weUKunS53staYAv/RaCPsExG?=
 =?iso-8859-1?Q?Z+KqW1mC487rEx3XhMZKzI+N1IFE63GhLgohqHhkvNykY9Zps0QBQmyBcb?=
 =?iso-8859-1?Q?aLXM3mMgmuxpv3746vigoIDBTkE1y8b45jw1zInRSKKBti6dBdSPhCAc4s?=
 =?iso-8859-1?Q?M7HDGhrtl26C0gzxTrS+wVHwNal4XdEai5tsTDtLAfFMG/+DjYK2vbTZCZ?=
 =?iso-8859-1?Q?iNMN0kA58t22I8heQh4cOigpPfKl55xTJw7hKSnUyWd9oba9TxmGCFRe3I?=
 =?iso-8859-1?Q?evXp84PmQhSfYHgqYgG9lu9qrFXbIo/Tg5w5/poVXuSBXQrW4W59G9BZVS?=
 =?iso-8859-1?Q?ud0fo4UOEwtfX/KN7bHFbsh2fNo/PrZ9c2h+2q8Vk+9RWMEdPY8va2qJTn?=
 =?iso-8859-1?Q?bkJSGXF692Cvw9coQoHJNnVapr3Nxihafxx2pPRrJZ8x8LtksCARzqs9nX?=
 =?iso-8859-1?Q?OejykYR+BOmDVIkSHurk/m8ShSlOkAVKZ4AJVX4qo6KwXJx2qHlaE4I09i?=
 =?iso-8859-1?Q?nfT0g0Sq1Pjb8OnNX0a/stJYfaaQi5N1+5QDvWiqytSg3xZL+MoK25zuyO?=
 =?iso-8859-1?Q?iBkd1HAv+qM+Kpk3DZ+UKkuLj7ZSfJlKqZ39idhZUMY6qlNgu3+Z+GCbA6?=
 =?iso-8859-1?Q?k8ddVbdH92j1I7l7hTh8NzlhiqxugLZKaGnXR7GMM+i6koc7pjEJ+ZeE2d?=
 =?iso-8859-1?Q?HP2XhwYlgi/3bCyH9L/zREgtmIKV2OzW1WvgjLBL75Q8gzOkR4yp3AGbnJ?=
 =?iso-8859-1?Q?g0jfPo7hCYowKpMdE1tnrkpeTD9DYIbrK95p2jP1VvHLTWdnoANXIc3cL2?=
 =?iso-8859-1?Q?E2Df9baRC38r+u4YvrVnvBeMtpVBDruTHpFoQTxhEB5k4DqDowZqvKPAdM?=
 =?iso-8859-1?Q?Vc4OlTgHG8xU3VyezonYf2NcuQcKqjG/M+PHEbiOYkfD9xjHxuqIY7I0g4?=
 =?iso-8859-1?Q?uRdCI1U9U5ifTinOfD1iPIktkaqG1eNySFpGwvDmFrJyWGY81ongzvXnT8?=
 =?iso-8859-1?Q?u38q/VJ1L4iCkLRMsg2YprFdo4FMeS3SJyvOuuxixbav58dJOUoNHcn028?=
 =?iso-8859-1?Q?vtBCekP6n/qH8ZodsJHKdQ6FrfX4y1ZwjKPGNzpPd0eEIzuqG8pvVBdFlj?=
 =?iso-8859-1?Q?kAL8Qr4DLiHGSbJLqtAheFdXSvYF6SXT0zIx57n/k1P71H+hzNBHztgv3l?=
 =?iso-8859-1?Q?nh4S/zwL3DtUaDUqlXFEHBiWORnIYHBEKlnlZ88AvpOHAbjkhqSdslz5x+?=
 =?iso-8859-1?Q?48DlpsYrdg8N/YzvYUIMCp+g7GlfSd6KS198E+SG1ZxdZ9/1o8mvU7KxTX?=
 =?iso-8859-1?Q?EAgphjDe4/Bwy7QbT2Y9SSprDmrLQOUloQ8JELoFAXgeHiORDBNQjajJeu?=
 =?iso-8859-1?Q?mLTf0/5gK0Mh1z/iXsWPVbblozQwh1KEymm2ITtjazt1pYnblsuGNe07fc?=
 =?iso-8859-1?Q?99l1X2htfj+hsOmRJpaqq60WWdwkf+FIBRb4wluSg8mCe//0IqRQJw51Ym?=
 =?iso-8859-1?Q?yS8CXJ5t/IhxiCCCWV8C6HBXDVFNUDvUadtonp0LTARaUWVMi1tHL3wiiq?=
 =?iso-8859-1?Q?f9GQsnJedzLLTNKRh5NmNjeqvDMGZwrGIyiztGtnb+f4IRYAjqnMOajrrG?=
 =?iso-8859-1?Q?BLo0B+ky/pSBXON17pva8HHPewWA12RjinBCLBVntoHL2gze7fmrkZHISb?=
 =?iso-8859-1?Q?4hWgtBkDdfLn+jWQt3O41kPoPTDuT8I=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c30703-2533-499a-d340-08de5f457613
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 14:48:27.1340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff126ac9-146d-44a5-92e2-dcd1bf29806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mgw0Li8ZwzRz6ScffZtU3mYuS8sHJt8FsJ72Ww1rwnPDsFemHHqR2kCS6YIO3P9fJlVDL9WlZ9pByLLOO3UGFwqdf28O2+5+/OOLGU3JJFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR5P278MB2037

Hi,=0A=
=0A=
I'm having an issue getting my fido key to work with LUKs, at boot it promp=
ts me for the pin and user presence twice then fails instead of falling bac=
k to the password that's available. I have the same issue across 3 differen=
t laptops and 3 different Yubikeys. I'm also able to reproduce it on a clea=
n install. If I set it up without the PIN it works as expected, it's only w=
ith the PIN that it fails.=0A=
=0A=
System Details=0A=
- Ubuntu Server 24.03=0A=
- Using dracut instead of initramfs=A0=0A=
- FIDO key is a Yubikey 5C NFC=0A=
- Crypttab, udev rules and dracut conf I assume are correct as the fido key=
 works if enrolled without a PIN=0A=
- cryptsetup v2.7.0=0A=
- libfido2-1 v1.14.0=0A=
=0A=
=0A=
The command used to enroll the key was=A0=0A=
=0A=
sudo systemd-cryptenroll /dev/nvme0n1p3 --fido2-device=3Dauto --fido2-with-=
client-pin=3Dno --fido2-with-user-presence=3Dyes=0A=
=0A=
Any help would be greatly appreciated!=0A=
=0A=
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
