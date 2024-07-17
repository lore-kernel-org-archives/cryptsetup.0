Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4443717E907
	for <cryptsetup@lists.linux.dev>; Wed, 17 Jul 2024 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721222946; cv=fail; b=s4iTirPBdOOZSoOy3XUn9sRwP3ITirrqWsLckmjaS3FYMLd8vhm+BU++ncVGi13kYxmlQd/M4WcPd1Kl7nOxp4Mwmc3yjzuiq0CKTlnnq9FiPE58ONqNjiv/flNfIFjrSurljRZm4TE2Pt3SCAoHZ6B/8aXTgPJsNkZChopMQ6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721222946; c=relaxed/simple;
	bh=BCVoML7C0mYw18rf2duhS3uKwPBGXYnMQrIhvPZTjyA=;
	h=Message-ID:Date:From:Subject:To:Content-Type:MIME-Version; b=ERHgGablp/FJt0m74jrXzPZqIMY7fOXnn+CmST1tROaFq4fpg073sGdRL+pTqJpJFsxvI0YXQxax5yoVipCcXhq1rSr/YV91EYZBtNbz166WyjAsvJNKs4iLWG56Q6BHWlYYD1PF5gzz4W5vNMrTgPcROth94WlIwNe/8/XH+DA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=EcF0Q0C+; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="EcF0Q0C+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEQuv0pK4DOWumglO/k49uE8VP1p+2KpimQgF4r1uPbwBu/pAGb/4lrnZ/81R5f76z6+3xua1w7N2zPlE84Q7zx7tDfXUj3gnm7lnUbXzRo0BCNJYLwfgG0oQr/DeeC1uFRbEh87c1Ku6C7OZAw+yyYLI50l/rNWg/DQZ9wJPKW/jJBhMLTxfftac4hk/C/mGH+o0Fj88ej+au/3IR0Getbqspm0JwdmxNTLrIvdGgwezcv2tmiajqH4XwzZkgu6zJuemb9tTJUrC55clJF1kJcRxgiXrxBXw1cisUxEhkZ3x3HC2L6ptnUSq6ghwqrPaCcuj7doCJ9Fn5q/bEcstg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVojhR7NRX4OQy4rndMMe6x9l8nUcnKYpbEMFIjFONs=;
 b=trZrkseWJiXpGNgXf9rjHXEHIrC3xVm3QjNCLrd9vOZmRfLfkRi/uPUtH8Y8c/EfSvC36M+/S4+ji+zuseCIYSA4xwn0cs6F9ZXt/PYOTDSq5MsjloJz40z82/hFvaqQUpvSN2tT9wMH++xUetonzoU9i6s1ydXMGGOR++369haQf4PFILsMzlBPfFjvDtuLqwVdE3bLiJrm+8qkMQ+O5Tb4+FkPshu/EXnS/nejxRWCe4gNAP0wDYKra17m0XE1nN0vpSK3FEz984hJVderhY0/aUKynVYPdslEyK9HEGlZdjs6r2WEjgpPUL5qu2OedzAbWv9w98fj2mpUjskm3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVojhR7NRX4OQy4rndMMe6x9l8nUcnKYpbEMFIjFONs=;
 b=EcF0Q0C+GntHH1nVor1stLCu+yPiG8xA4+L4VrpydA21bMckKqAWUSLrqmNGF1f90ewiPzGvTLJZQtZh4Z9b6u+Wz02nhGwEtjimIBQ7NK4Nuy6yudY63X/LQRdqiXDf2UoFDd/DSunuGe3gScJkQNDvO+hPjdlI69TEbn3FoBKLZHkh4GIihGgytm+lnRaKTR3XsS25+nh3khJwnQ0dQATWNeGzOHAWXySMgdkHwyCf3LjjwdyhmQpaeRwNx+fX3NXmhlRSEM6cjz08n/gsCKqmeR/KKw81biEOJSonHPAeH7aJ5QYGjOu3KkBY3b5rTawjgRAJ/dJzt3skOTZ/TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AM9PR10MB4085.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f9::22)
 by AS1PR10MB5747.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 13:28:59 +0000
Received: from AM9PR10MB4085.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3087:c116:dfed:1ca2]) by AM9PR10MB4085.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3087:c116:dfed:1ca2%7]) with mapi id 15.20.7784.013; Wed, 17 Jul 2024
 13:28:59 +0000
Message-ID: <946e1e13-c77d-40b0-8d41-4731247d298b@siemens.com>
Date: Wed, 17 Jul 2024 15:28:57 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
From: Gylstorff Quirin <quirin.gylstorff@siemens.com>
Subject: encrypt partition on embedded device with TPM without passhrase
Autocrypt: addr=quirin.gylstorff@siemens.com; keydata=
 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
 XSdq0hnpafc1V+voPJq3LMxUvLNrwg==
To: cryptsetup@lists.linux.dev,
 "Koch, Stefan (DI PA DCP R&D 3)" <stefan-koch@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To AM9PR10MB4085.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f9::22)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4085:EE_|AS1PR10MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: 7770cc8a-039a-4c9e-e7f8-08dca6646a4c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yjk3ZjQyQmtzRGZZNXF6V0hzZjZ6UkxZcEVINk9nMEE5TTFQZmdIdnFZMmZy?=
 =?utf-8?B?MzJqUWlQUEVncFhScm1YRGxjQWNoeldWUGVPVWMvSEJCMWl0dnUrNXpvakhX?=
 =?utf-8?B?b2pjN0tBSHMvNGJsbEUwYXNzbmF5V2tGeUdtUXFYVzVTU3U5VmJ6dGZJeDVZ?=
 =?utf-8?B?d3dNcE15bkdic0ZVMFFleG1tK1RmQU81aEkxdm9ITWxpNm5Lb21BRHpLYmdv?=
 =?utf-8?B?L1FUOWZ6NTlXSXpSM25JUzZnZ0lPOTRUTW0zQzNFdTJZeEFudElDQjJlQkIz?=
 =?utf-8?B?MHI1MzFHRmg1cFVqYm9sbFQxajdwR2xRbnZDUVQ4VDBJaUVCNklZeFNodlU4?=
 =?utf-8?B?Nm80dDB2WWtvMStFZkVkVkVPTCswQ1hZSUpZb2RFUHQyekFhQjR5SytuQzJX?=
 =?utf-8?B?aE5PemZVb1N3SlQ1UGdiejlEMWRJSlhMaVRmTHZEd0hPRmNPUHNVRUVIb3Bt?=
 =?utf-8?B?dmZ4T2tQVCszakVNN1FmZ2NraGlkOHJwZGQ5UXMvTmRoR0VPNEhCc3d5ODZM?=
 =?utf-8?B?Skt0b2RqVGFUblRUKzBWV0E2MWE5bEcxOVpydDRHdHAvOVVJZFRQNWduU2NN?=
 =?utf-8?B?OUV1R2tnbDk3K1Y4L01mbVphRzBack5WVlMrcGdXSzVNZjlVeFJiYmlxTlZL?=
 =?utf-8?B?SWpqbWFmbFhmUERKOW5nb0Q3cHFVYnloUlpRMFNQS2N5c1ZoRlBjYmhGNnFC?=
 =?utf-8?B?cUVTWndYQzZZNVBWbTlaN0xRR1ZPb25xOXY2YXJSZTVkZHAxakQ1S2VheHMv?=
 =?utf-8?B?Z3ExLytqMk1IWnQxamxaQ3VuODZkT01yNS9IK21ISkFjUEdaam1uV0djSXJ6?=
 =?utf-8?B?QzVSVUVidGtBc1JDdjNJMWVXWEtieW56UXE0NGlicEIzdzFFUUIyRXhWS2JG?=
 =?utf-8?B?V0FMa0tNdmJrMlkyTVNCd3dXY1pSVkpLdnNpUDc2TFcvN29CNTlPVFMrNGVQ?=
 =?utf-8?B?RlJ2MzBKcDAzb2hNSTQ2MGRJRjg4RHU3dmZtazd5L2YyZjd4Z3BjSi9SdkZ1?=
 =?utf-8?B?TFVSRk5aTjhZYVIzQUJHNXdrcThXdSs0MWtSenlNODBta0QrbUk2YitnbG5L?=
 =?utf-8?B?ejFsU3Mzdk1nRHJLbUcwaWZhRE1IS01pTGFFQ3RDSFVHc0JRazFYRG0zQ0ZK?=
 =?utf-8?B?aVB4aXdweWdyQnloUXVESE9wN3htNjlzdFRZSk1GcDN2MWJpUG9QQ2NMY1Rz?=
 =?utf-8?B?SFg4SURhUko1ZVFxaDFCd2x3bVZmUk1haitJdHFKZ1JPeVBzVWd6NmVONGxU?=
 =?utf-8?B?QXNyWnpZZEJybkN1MXBJM1lQNGZHY0hORmRacnlOMWNMaGVvaTlQdnBhNUlr?=
 =?utf-8?B?VVAwbzUzaTdTTmNtbHpPenA5eVp5MTZlKzVjZXkzb0JpQ2NVMm5MamUrbWc3?=
 =?utf-8?B?OGEwZ0tDR05pcFcvcEd2ZlorRE56RHgrWS9MblpIK29GNmpLb0xoV2JxanBL?=
 =?utf-8?B?UTRRS25YN044WjZkTEtYZlRkd21JWWJjYThTN3B5dVY3MEtheEFONDYremJx?=
 =?utf-8?B?WmlucmJGZW45YXgrOW9ZT3BpRytIcjlJaE9NYUNKSDA4bkJTR2EzQVVVYURx?=
 =?utf-8?B?UFBwZHQ1SWpLT1dDNFRsRzNTTXNrSVRUYW9uZEtyYjRoNHpwODQwYnczNHRl?=
 =?utf-8?B?Mm9Fd3RMSzZuVXZzam1LZnFmbStTMVA4dlgxUjYwVmswZXdLKzNpS2dUcEhG?=
 =?utf-8?B?SktTZ0dkclJGTFBaVlhRTE5vamJVczRoY1ljN1EwTDN1VUY5Z0V2bEJnWXJI?=
 =?utf-8?B?ckVsRWNZcXpMRlcxMFZkR3BoNkp4S05GSnR0UnN1bkVUNmJBWnpwTWk4ZW1Y?=
 =?utf-8?B?NS9DeTJjYnJGemtNVVFWUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4085.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlJqYmJXUEZHRFIycndCZ0NRMXhJM1NIUTk4MkZFd2NnYitTOTB3bUVzWmdr?=
 =?utf-8?B?eVFFbjg3MFZwVXNKM2lqZ21Qa2FGM1VBVHp2Y2JBcFJVNnFndzdyR0Q4Umg4?=
 =?utf-8?B?STAwNlRCZGNzbzF2c2taRStYV3lxaDh5dFVsaWp2Y2labFZOdk1LTlA4SCtt?=
 =?utf-8?B?aW5VV0xkTVdOUjlxOVFQWXRYMnZ3bWJwVHN6NU9BMzBZenJublg4aGZvem02?=
 =?utf-8?B?QWRDU3FGaFBkcGowYis4VklSWjRzeUZKald3N2d3SjBuZnN0Z0xVRkJ3aVM4?=
 =?utf-8?B?RG8xTjkvWDdJQzA4SnI4em5ob2JIdWZLT1ZWUzZPcEtjTGdvbTBSRDQ2ZS9s?=
 =?utf-8?B?dklmNVZwdWpNNXd0a1VTK2FhWC9Id1hlUnJDWlNaSmZNSnh6NnNCYU91MnN6?=
 =?utf-8?B?ZkZtSnVsVlJRdm5BY3dadDE4TkxOOXN2L3lsaVJKb0Y1UmFmV0pOMDgxOE5G?=
 =?utf-8?B?cHlLZUdDajU0NHdnZ1BvU1c3ZllRS2UrcFJycEUrcHI3UFdvTjNJeG9jY1Y1?=
 =?utf-8?B?UVZLdUtzR3M4UmY1emRMc1NsVENnSUNOcHdoYXpkTXVKTUZuK2JZVU1NOG5Z?=
 =?utf-8?B?VVJNWUxjVk83SWJ3bkZzMlJla3N0Tkh2Z2l4bmU5K2JqRXc1b3JJMWlnVjFa?=
 =?utf-8?B?U29CRWdmL1dJbTJnakphZVZsTU5VMStLb0VEOEZmMEZVZlJERkdsMTlvRk9V?=
 =?utf-8?B?L2UvZm0xaFo1T3pzWFdnS3pRNXp0dWNSelM3TlMyMXdBYlN5WkhpdHl6NEFS?=
 =?utf-8?B?cUN2TFJ5M1NIbU1KdHhrOWY1aFRjMzAwT2JuaDBWc2dPKzVPWHRDTlRsME9Q?=
 =?utf-8?B?SVAyek9FMC9tZjlpK2JLZ0lWcDZWcHNycWE4YXJRSWIyZ2lwemRVMkxwekhN?=
 =?utf-8?B?N0dWdE55Vm1mL0FsSEc1cDZTOC8wTG90Vyt0R0tqZmhoOHhIMUl4NW5Vc0hC?=
 =?utf-8?B?M0xuZGhhNjhpK0JtbTU4aUhDYUdkZWhMSlI3aUU5enZkVUlCQno0QU1iNmpj?=
 =?utf-8?B?cGorNHllMy9jQmJhbmw1WGlwWXVFNkw1ZFRybFR4bXBJNXpLUHc3eVgyWmdO?=
 =?utf-8?B?UlFBNEcwdlUrek8zdlk5QWYrY0ZuYTZWWXFHdnlyc0pnOHZBbXZOZ0ROdC9F?=
 =?utf-8?B?V1NLT3MvL1hiZU4yRHB4dFppUFFGbFNjRWplMUd0Q3hNa1pGTTBrQmhySmRz?=
 =?utf-8?B?QU5PUGFPa1o0bEJqWXhxbjdwQVlXUFRRVU9kN0ZJeDJQMzJRYXZGWkVHRFpz?=
 =?utf-8?B?UHdmNVZmVFcvbWRwbmh1MkhhZ0paYVZkYXkrelhSakxPZUJsSXRRenZFd0gz?=
 =?utf-8?B?Vk9hcVQ3ajRFZ01kTGg1QzV3bzdLV0tWbkY5TytOWEdZTlE2ci9XMXRzdG9S?=
 =?utf-8?B?VjQ3ZEVEL0d0dG1aR2Fld2VXY0k5ZWVwOGV5RDdUbzlXREFxSTVSSVFsOVBJ?=
 =?utf-8?B?U1l6d3pRblMxdW5hbWx5KzE4cXNXZ3dQelR0SUVSRnZGR3E0dzlKWHNjbjln?=
 =?utf-8?B?R0J4THJzOHhRWDVFZ1Jsc3g3RHZmR05hZVdTYzZvNjQ0Y0h1WHQ5UzVFUWJ0?=
 =?utf-8?B?MmhETEU2M2RiREJtei9TaTlpUFl2cTNVa25VNGV3L1J6TE4xRkprOFFHUjNk?=
 =?utf-8?B?Ry95bmNPSDlPMm5wMjlOUGVkUTZRVisrS1k4MitYazZkV01yNjFON2hhREFj?=
 =?utf-8?B?dmhYNGhVdm51eVlOZkNFYXVJZUFRb1NLV0VsYzZOZzNGMmQwTE5zWUxxWXNj?=
 =?utf-8?B?UmdiNU5RckVHekN2dDcwRUhBUmJRanM1ZVI4VHljd0R1ZlRXUFZXWUtSaU84?=
 =?utf-8?B?OGw1c3FTRHllMDhLaVlpWThVazdHL3N4Z1lHQTdRN2VSVWRva2I0T2hiekV0?=
 =?utf-8?B?QmtuNklrVENPNDRmUkJzOWljOWZXUDNrM3dpOURJMis2SDFNUDdSNWR3bzZW?=
 =?utf-8?B?QUY2a1FGTnBlREJGRStzMEhmYW5ZaGszMFVzY1crZ0NmNkdGM1BlaWQ3ZE9w?=
 =?utf-8?B?OGtyd0VrVFp2N2ZkMDh0MUx1aXVoM0tub2pZejhnUDN6cnJ5YXZDakREZW9P?=
 =?utf-8?B?NGJuNHowTysxWThIZ2QzRHJ6RzBCQ1VLYXVPeXlOZlloTXlOZWtZN2JBczVG?=
 =?utf-8?B?QTlkVkoxVlRyZUVlSDhxNk1PK1RxN2p1OVNIWnhzV2N2RUF6OGF1cGRNaDdX?=
 =?utf-8?B?blE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7770cc8a-039a-4c9e-e7f8-08dca6646a4c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4085.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 13:28:59.1310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WycR069ga5JV5F9mpxkKr0uF8aH787pNgSAKOsYrfQQbplJzqtBiIvQW+DS1O3Cq5jkyJHGvTIp41LSsoA+PpNyneQSdhC0JfdG1Si2meho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5747

Dear all,

we have the scenario to encrypt an partition on an embedded device with 
TPM.

Currently we encrypt the partition with a temporary key and afterwards 
we enroll the TPM token.

After the token is enrolled with delete the temporary key.


Is there a way to encrypt the partition directly with TPM token without 
using a temporary key?

Using a token  should work both with cryptsetup luksFormat and 
cryptsetup reencrypt.

Best regards,

-- 
Quirin Gylstorff

Siemens AG
Technology
