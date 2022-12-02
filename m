Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07404C64
	for <cryptsetup@lists.linux.dev>; Fri,  2 Dec 2022 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=7804; q=dns/txt; s=iport;
  t=1669993668; x=1671203268;
  h=from:to:subject:date:message-id:mime-version;
  bh=MBeVbObGWVdkz6IXQLlI5CBSp4TfPUJpgOjNA9GB3Tw=;
  b=LOiGDTFpCcOyvcwpa3t/MDwlP9hGKKPW8uNueOo42mBeLtgxDuuA01fP
   qsGdTLqES18+7NvwFxhVL6l25r0ZZD7wpz6XYhM8vd99Loyjmgd6t0nwt
   f8cN6XP3C1WmMknP1Jki/kmOomJ5R9VsT93j6ytCynz5d20rTItMb4e6x
   4=;
X-Files: smime.p7s : 5136
X-IPAS-Result: =?us-ascii?q?A0AlAAAjE4pjl5xdJa1aHQEBAQEJARIBBQUBgXsIAQsBg?=
 =?us-ascii?q?VpSgQICKy46RYROg0wDhFBfpCiBLIElA1YIBwEBAQoDAQExEwQBAYISgxSEb?=
 =?us-ascii?q?gIlNAkOAQIEAQEBAQMCAwEBAQEBAQMBAQUBAQECAQcEFAEBAQEBAQEBNwUON?=
 =?us-ascii?q?4VoAQyGbBEaAwEBOBEBSgIEMCcEIRSCUQoBgxERAwGiLQGBPwKKH3qBMoEBg?=
 =?us-ascii?q?ggBAQYEBIJZnD0HCYFAAYFThzODXoQyJxyBSUSBFScMEIYHAoU3OYIulWeBA?=
 =?us-ascii?q?IEBAxkrHUADC20KQzUcTCscGweBDCooFQMEBAMCBhMDIgINKDEUBCkTDSsnb?=
 =?us-ascii?q?wkCAyJmAwMEKCwDCSEfByYkPAdWPAMCDyA4BgMJAwIkVnUuERUFAwsVJQgFS?=
 =?us-ascii?q?QQIOQUGUxICChEDEg8qRg5IPiIXFgYncg4OEwNdgWkEgiQKXZhFhUU8FpMWr?=
 =?us-ascii?q?24Kg2mGJIMmggeVCQQug2UBgWOjUZJdhGEgpzACBAIEBQIOAQEGgWI6gVtwF?=
 =?us-ascii?q?WUBgjwJSRkPjiAZg1mFFIVKdTsCBwEKAQEDCYofAQE?=
IronPort-PHdr: A9a23:48fABRG9Ciy3UrCbFxkA/Z1GfiYY04WdBeZdwpYkircbdKOl8tyiO
 UHE/vxigRfPWpmT8PNLjefa8sWCEWwN6JqMqjYOJZpLURJWhcAfhQd1BsmDBAXyJ+LraCpvG
 sNEWRdl8ni3PFITFtz5YgjZo2a56ngZHRCsXTc=
IronPort-Data: A9a23:jjitDatI6Z2s7FA5F2sDVu+n2OfnVKJeMUV32f8akzHdYApBs4E2v
 jNfGTXfaa7OOz2rZJktO86x6Alf7siEipMhHTLYn1l2SnNPpIzdWs/xwizYY3vKf8CYRhlpt
 5ROZ9eaccpqRCfS/kjzPrW99ykl2f3YSLT1BLCYai4tHwQ+GXp/0U08xrdhjNBl0NGwWQiG4
 rsezyGx1HqNg1aYZUpJsvndwP8WgMnPhd84grAfTf5CtgeHy3BLB58VLPnpdSulGIAKQr7rT
 rjIk7rh8DzV1hp8UdnNfpQX3aEprh8+GSDU1xK6joD72kAqShQai/p9bLxGAatuo23hc+pZk
 L2hjrTtD1Z3VkHwsL5FCUMBSXkkZfcuFILveBBTj+TClyUqTFO0qxleJBle0Vowo7sf7clmr
 JT0GRhVBvyxr7veLIGTFoGAsv8ewPzDZ+vzjJ3PIQbxVp7KSbibK0nDCEQxMD0Y3qiiFt6GD
 yYVhKYGgBnoO3Vy1lkr5J0WzcGFplf4djtkr1uPpIcX8UXMlQVB6e24WDbVUoTiqcR9hE2Uo
 CfN+H70R0xcP92Ewj3D+XWp7gPNtXqkA8RJS/vprbgz3QP7Km87UHX6UXO+peS6h0iWUNNEI
 EtS8S0rxUQ33B31E4CjA0TQTHisnSQDcNpKGvEA81+o4a7N6SreDUo5UWsUADAhnJZmGWN1v
 rOTpPviHy13rKaYVW+F3rOVti+pfywUK3ISIyMJU2M4D8LLuoo/iFfEScxuVfPzhdzuEja2y
 DePxMQju1kNpZ8t+oWV+lXBvzWlvJnkbhwY+Vzeblvwu2uVe7WZT4Cv7FHa69NJI4CYUkSNs
 RA4piSO0AwdJcrXxXDSGo3hCJnstqjaaGeD6bJ6N8N5nwlB7UJPamy5DNtWHkZiMs8edSTuZ
 ic/UisOuccDZRNGgUKLCr9d5uwwxqTmUN/iTP2RM5xFY4N6c0mM+yQGia+sM4LFyxlEfUIXY
 MfznSOQ4ZAyUvwPIN2eHL117FPT7npirV4/vLiip/hd7ZKQZWSOVZAOO0aUY+Yy4cus+VuLo
 ocGZpfQmk8GAIUShxU7F6ZOczjmylBmVfjLRzB/LYZv3yI/Qjh6Uq+NqV/fU9U9wPs9ehj0E
 oGVAx8ElwWXaYzvIgSRYXcrc6L0QZt6thoG0d8EYz6VN4wYSd/3ts83LsJvFZF+rbAL8BKBZ
 6RcEyl2Kq8UEWqvFvV0RcSVkbGOgzzw1V3WZ3X4MGRiF3OiLiSQkuLZksLU3HFmJkKKWQEW+
 tVMCiuzrUI/ejlf
IronPort-HdrOrdr: A9a23:TeYNZqiXVWBTalhNu/A6WGhJtXBQX1h13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3IwerwQ5VoMkmsj6KdOrNhdotKOTOGhILGFvAa0WKP+UyDJ8SczJ8W6U
 4DSdkHNDSYNzET5qyWgHjaLz9K+qjizEncv5a5854bd3AMV0gP1XYdNi+rVmlNACVWD5swE5
 SRouBdoSC7RHgRZsOnQlEYQunqvbTw5d/bSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkjb++r6ov5iAu1PhPi7onttrcenau5p+7f+3+4gow/LX+0WVjbFaKvO/VfYO0aOSARgR4Z
 zxSlwbTrlOAjvqDx2ISF3Wqk3dOPJE0Q6l9bde6kGT5vARDQhKdfaoz+hiA2Tkwltls9dm3K
 1R2WWF85JREBPbhSz4o8PFThdwiyOP0AwfeMMo/ghiuLElGchshJ1a+FkQHIYLHSr85oxiGO
 5yDNvE7PITdV+BdXjWsmRm3dTpBx0Ib1+7a1lHvtbQ3yldnXh/wUddzMsDnm0Y/JZ4T5Vf/e
 zLPqlhibkLRM4LaqB2AvsHXKKMeyXwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvY5AMxItaou
 W1bLqZjx9BR6vDM7z84HQQyGG9fIyUZ0Wc9v1j
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,212,1665446400"; 
   d="p7s'?scan'208";a="9651641"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 02 Dec 2022 15:06:39 +0000
Received: from mail.cisco.com (xfe-rcd-003.cisco.com [173.37.227.251])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 2B2F6d4S010562
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK)
	for <cryptsetup@lists.linux.dev>; Fri, 2 Dec 2022 15:06:39 GMT
Received: from xfe-rcd-001.cisco.com (173.37.227.249) by xfe-rcd-003.cisco.com
 (173.37.227.251) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 2 Dec 2022
 09:06:38 -0600
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (72.163.14.9) by
 xfe-rcd-001.cisco.com (173.37.227.249) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9
 via Frontend Transport; Fri, 2 Dec 2022 09:06:38 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJrfwbqdjFcul507EQhnmA4NqCB1w8Ug+zPtEPt5aqkzjZ/RBBHfDmpqJnUsipGcvjllg6e1d9PSF1f8I/3jZruY0pZUu8OUmoFs6OvBVX/DgbklWUVPFhxTRyUvNO4fxWa4hwOht8UbFTjWE4v7CKOdTuET2gRWllpGqrVgeWTJRlYNgqTK5okHinBL2ecP9T+M120xFx4Aj3Vlgvm7xEiKiOixZjBBG349a6OAjtDkWNoCvcC+RRLpx2mAZ9dVOxDDtJ4Wgo7HG9lMSvW3FjiVJCup9y10zP7w0v8gfVJs3ePGWuEXL8xeFFSvoxENzT08XEBO27HD5Vy9PSESIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QD1tWqKVo7e8Q0d9co2BuCSSC2kvnLly+1t4VEBq4Eo=;
 b=HIhi3Fc8YLFnSOn7Lz+8ImRFeqY0RB//HKZuUKP15S2qdwJSl08RU+261BsQwJIvbQfWJM8RpAwlXxU2XTHebpK7OOIiCiEenKbkLvdw3OUSyb8XcYLqsZyrEZgj2VlydEU99hLA/zJQDW/mndMjeELV5RQsjx/oXC6NsFOp2Nt2Ma0Q4XH4MNQWkrIPw8cvsRq3bwsdWKVHJiQbgZLDJStxikm0AUKdiAFfWjwhWSf0xZQRG+u4QOjfoRHnMOD/0e4UEj4uNeBeIUVp87R+nNEG+Siz91wBWLluHjKD9gepi8SSJyd49eOOh9biLD38nQSsnwcyP+LPbJ2tlL4H4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD1tWqKVo7e8Q0d9co2BuCSSC2kvnLly+1t4VEBq4Eo=;
 b=fLsa8Te4bRht7KY33emfQ0adi7LiVwf6MubdkVxzmfth5/c6L9d1mqjHqj582QAMrshxH4WryrMjftqySOKyiYWkAWY66UezucYEeAegJTzioF8quK76I4pWyc5GpQH/eRax1aMkQSkQqcGT+60zuv9cNF0CIANfFn1aBJaNu/M=
Received: from BL0PR11MB3379.namprd11.prod.outlook.com (2603:10b6:208:6c::12)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 15:06:37 +0000
Received: from BL0PR11MB3379.namprd11.prod.outlook.com
 ([fe80::c809:d3ed:3a46:2f8a]) by BL0PR11MB3379.namprd11.prod.outlook.com
 ([fe80::c809:d3ed:3a46:2f8a%7]) with mapi id 15.20.5880.008; Fri, 2 Dec 2022
 15:06:36 +0000
From: "Mike Luken (mluken)" <mluken@cisco.com>
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: LMS verification support
Thread-Topic: LMS verification support
Thread-Index: AQHZBl+sbmPNnGrJGEiqRjxDOZ+Xvg==
Date: Fri, 2 Dec 2022 15:06:36 +0000
Message-ID: <95080015-BD73-49C4-88D0-23502B75A532@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Microsoft-MacOutlook/16.67.22111300
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3379:EE_|IA1PR11MB6122:EE_
x-ms-office365-filtering-correlation-id: 9b563379-ceef-4e5e-c618-08dad476cede
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JqC2jSbOlh8CkyvjERQF4u5o2j6+VnN74uQ01O9GJPp+si022BFPQB56lgdfYxmX/jKRfox+23p6TSnQaqH5rriRbu9etSrstePTTwIXIulywk4qagbqBc7xMs80gv1tw/RnQAey5qHaoo1n/7Akzy4ySvKz8MOvAoNimB89ok6Iyvc7hOolnFhZa46B7IhDhU5ER9gSN0ZCOLFcv0ZgezpirKnvqLWaTIE9+68UX12vR7WaZTwVu2x/6a/R1Qb/+t0xMxKmPMgBX1rM4Rmc/HqSPlr+EGLrvLTifggeauXYX8uzuM95hyanN2TyAShviv4xYvXe5JWOXysiELPIaBLvjDEqso5jrYDGx8sLAnAxUhs/AfQbUPkFTS3YUIuzeUuogu/hrZyCNSKlWGALcaRCbwIR0SUfNN2CjXW2o7T+3L0elSsVFUdJ8WNmaNbe19f6ZXA+KVA/c8DW9U3HAoPxQFuhBBNnfbk4Q40yZ/t/lG+LopJDJx64LnIMXh2zJQ42+5kiTOrsE5xj2Q8+/gdmONaGrxhZw5E8sHrz6y8N4IfHJxlBUH4zXVIjAytdBeutNgkAiEfxb5jk6LGJyGy/Nj1pYt8JzgXY05wxQ5nPjsRFpcmWT5/6ueQGObRdu4Akvg1Oxs2qZdvB9caxmsj/Q+b4w7bRagzsBTc9boNQTMg2L3Jd0Fh9RVhuf+wmoYssHq7EDC8MXvqW6X2IIDWDK4Xc1/Ydkmb4h5wC9JQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199015)(71200400001)(478600001)(99936003)(6506007)(6486002)(6916009)(122000001)(36756003)(83380400001)(38100700002)(3480700007)(6512007)(186003)(33656002)(26005)(38070700005)(15650500001)(2616005)(2906002)(66476007)(4744005)(66946007)(64756008)(76116006)(66556008)(66446008)(8676002)(316002)(7116003)(5660300002)(41300700001)(8936002)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXFjK2dhMmQxMloremNZV0NNMThtZEJvUUJ6SWNOUkwrVWl6YjQzSjRzRWpI?=
 =?utf-8?B?UStCei9OZGNObnVGbTZZNitERG45SXpHRlZIVDY3cjY0ZXZBQ2RFQlVzdTZM?=
 =?utf-8?B?ODNnZlZBeTF0c2JMdlR0YWwzWmg3TmhPV0lXVjNzckRYVzhSbjBKQ3ZsYVpE?=
 =?utf-8?B?SDVYYy9wRTRHVHJEZlF3ZmhwYnNuL1JBS0NPUmJCTUNTbUVlNWVqdnNpWHRy?=
 =?utf-8?B?cjkxMHJHd2NlZWJxUUVyYnducFVQNDV0YTZZUXc0WHNqRnMzSitNOFQ5VVVy?=
 =?utf-8?B?OGRPOGgzb1czckUwejk4Vy8zUGE0dlVsZitkaTVHVnEzRE54ZHZjZGxzWEZl?=
 =?utf-8?B?MjJqeXZ1eVhzbk16aEtsZWFZVEIyeUdTaWVDWEJ5NXo3S1VLYytubHhVcXlY?=
 =?utf-8?B?VWViOEZVczJpM0lxUmcrZ2o5N1lsRjN5R3Z4eklHc2ZxcWZpSkZGMGhyZFU3?=
 =?utf-8?B?a0ptaW5yK3ZuWVoyZUNMM0JsSDRJY1BPNS9hbnRSa1J1QUc0NWZ5WjNvTWdZ?=
 =?utf-8?B?TFVNZDh2K0pONzdMWW0yQ3FOSEVRdWpHUUFBUnpNYzlHbG9zb3MzN1R5N1ll?=
 =?utf-8?B?WUNZUWs5cERib3JPOXlkZFFaZCtQQlRqa3I4dzNrNzBKSXFFL2gyL0h5cThv?=
 =?utf-8?B?aDY5WFU2K1ZidjFMQzR6TlVGODd6c25VSDc4NE9VVEp6NzN3TXNHZFFOOTdQ?=
 =?utf-8?B?cTZJZTVickVqa3h5a0JzTmp1NHdmS3hnM1JJZSszcytiYzU3UVZzdENoQVd2?=
 =?utf-8?B?WlZPL2p6RGdCZURKbnF2TDkwMUJ4Z2tVcng0Rjc0eVhxbHNmRVBpQ2tmbVIw?=
 =?utf-8?B?bkdXSkVsQTg1RTlkZHZvZUthb3dEdllHb2draTVON0NIRlMzak8zUjNJQk9v?=
 =?utf-8?B?VXd2dmVUQ3dBb2o4Z1kvRWpGSlpiU1doTFJNR0EwR3lUem1DUUszREVLYWNL?=
 =?utf-8?B?c3FQT1VpNWkvTm9UZHN6alc2UEtCd2JOZWk0eGwxSzRIZWRZQkdJOEhrSmRK?=
 =?utf-8?B?VDlmRk5BRHBJSWM5ODZtWTNvS0VSQnNBNUVDenVJc3JBMEJ2eU1pMUZqUDBR?=
 =?utf-8?B?ZCtXRE9WQWIvWXhCYzhJenFWRlZkVlZaYUVHTVdhMjh3anhFZ1dIdTRxbFky?=
 =?utf-8?B?aWFNRmtpbTlsMmJTR3ZFUGJ4by9UZ0ZjV3dXSFJLS3lVRkJzZjJKQWFDaGRy?=
 =?utf-8?B?b04xeEVVWHBOSDMwQ3JDRmkxRWp4VGFnUVovZkZBSWs1eDY3TCtoRVgvRjlO?=
 =?utf-8?B?Nks1bTNZRTcyK1ZLY0dIRlFzM3V1OHhleEo0OTNqN3lqczYycVVDejR2Umh0?=
 =?utf-8?B?dWJkdWR6RG4wdFliVVJrdVRDVDJoU0hWWGhpQThWSXZ0SGpHRGxWbWtkekhk?=
 =?utf-8?B?ZnpjVUwzbXMwa3RZaE15Wm9pbFc3cG5jZ3BYZ2VlRWtXcEdxUitmM0dnVjlS?=
 =?utf-8?B?ajhmcnpMTnRaU05MVW43eFlhNWw3U0FjdmNzVi8xQWRqV3ZyS0VtQmhHOHZM?=
 =?utf-8?B?Y2ZYaWpOWFJ1MHZuRXBLcC82TFZRaWVndW92aCtGVDBjeHY5T1ZvZERsRlN1?=
 =?utf-8?B?MHpPeEtQampOenZCakkzTllQR21PRU1ZOHdadXk1WXFPVXVJbUNGTXo4ZUtF?=
 =?utf-8?B?UmtGYTdRbFNCckw1UnNTNndVREh4VlhDQjI3Zk02YmdheUVBa2I3ZGlnajRw?=
 =?utf-8?B?cWRNWFN1cnpOYytPV2IxZUcyRWUxekJyK1pqUTgvZnBQU0RJdExlNVlYUFQw?=
 =?utf-8?B?MFNKUkpsMmdTYWN6Z0tDV1VUY2pvYmhGYm1Dejd3bVRQT1VEWGIyeDZKdFlH?=
 =?utf-8?B?K0h4K1dLbnZpQVRDQTBqQjRha29mQjhYb1lSUFZTLzFyL05NdWRUWkRSR2Vh?=
 =?utf-8?B?Ritib0M0NnFnU2NlR1RvZHBna3lvS2crMWxoSXVNdVJNd0cxa2hWcU9xbFAr?=
 =?utf-8?B?TjNyQWZrZU5YUHo4bWhKRmEwRGhuV1VDdFA1NHkxck15d2JCYkZzMjBvSFN5?=
 =?utf-8?B?dHJTK0I0Q1UzcUFSOHk1RkY5VHIrUE1HZlc1SE9lSkZZdm1PL05PSTlSR0FF?=
 =?utf-8?B?Y25Ha1d5YzM3b242TzE3TVIwN1RaYzNnS0hLbmJKdWltNGoyNDFRKzd3NUo4?=
 =?utf-8?Q?ZAA4duiI4+/oddO7QycJhWI1z?=
Content-type: multipart/signed;
	protocol="application/pkcs7-signature";
	micalg=sha256;
	boundary="B_3752820406_4160403662"
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b563379-ceef-4e5e-c618-08dad476cede
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 15:06:36.7813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CZDmwR9PzDC0IiHRDE5RK8qkl11KkpZTVo0HMZ1tEIvtKcVNKalZJIeGqmH6plPHqk8SuIqQom391NTmvzvrdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.227.251, xfe-rcd-003.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com

--B_3752820406_4160403662
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

NIST and NSA have both recommended the use of the LMS algorithm for firmwar=
e and software signatures and verification.=C2=A0 NSA stated vendors should have=
 this supported in products in 2025.=C2=A0 What are the plans to add LMS support=
 into the kernel for things like secure boot (I guess this is done via the S=
HIM which I don=E2=80=99t know if this is covered by kernel.org or not) , signed k=
ernel modules and IMA?

--B_3752820406_4160403662
Content-type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIUDAYJKoZIhvcNAQcCoIIT/TCCE/kCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghHsMIIF6TCCBNGgAwIBAgIQQAF/nOcBVmH7QOrVcRHpEzANBgkqhkiG9w0BAQsFADA6
MQswCQYDVQQGEwJVUzESMBAGA1UEChMJSWRlblRydXN0MRcwFQYDVQQDEw5UcnVzdElEIENB
IEExMzAeFw0yMjAzMTgxMjAwNTlaFw0yNDAzMTcxMjAwNThaMIGQMS8wLQYKCZImiZPyLGQB
ARMfQTAxNDEwRDAwMDAwMTdGOUNFNzAxM0QwMDA2REIzMTETMBEGA1UEAxMKTWlrZSBMdWtl
bjEaMBgGA1UEChMRQ2lzY28gU3lzdGVtcyBJbmMxCzAJBgNVBAYTAlVTMR8wHQYJKoZIhvcN
AQkBFhBtbHVrZW5AY2lzY28uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
r/HJI+FoxZAgkM6vIYI6V0z43BCl+RvNQwZYKfwq6dSHQ+9KnypnSIoGNI6aqstTCYQ3Zs94
Bs14ihBGQ9BV7g0jeWYyUEKr+EuiHHf9JGMih0icdUnita9ZXFxTthi993ROP/puH2Y90hE7
JkPTBVrF06AusxIyVK9NPUg6KgaRBM9jcr+D4LMaRgiieaN0UwnVsnT101pJYrOmpcs0/1kg
bWq57xjhjP5kW8VAFIaojSeXJyQG+Evd3OaMZ1LXIff9px48OVNhghGTS4tYAicJyMuinYo7
/uwKMV0ctZCHXdXaJy9FhUakWVb+f93sygIXgOuu9+HrMx+Rtz2m7wIDAQABo4ICkjCCAo4w
DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCBaAwgYQGCCsGAQUFBwEBBHgwdjAwBggrBgEF
BQcwAYYkaHR0cDovL2NvbW1lcmNpYWwub2NzcC5pZGVudHJ1c3QuY29tMEIGCCsGAQUFBzAC
hjZodHRwOi8vdmFsaWRhdGlvbi5pZGVudHJ1c3QuY29tL2NlcnRzL3RydXN0aWRjYWExMy5w
N2MwHwYDVR0jBBgwFoAULbfeG1l+KpguzeHUG+PFEBJe6RQwggEsBgNVHSAEggEjMIIBHzCC
ARsGC2CGSAGG+S8ABgsBMIIBCjBKBggrBgEFBQcCARY+aHR0cHM6Ly9zZWN1cmUuaWRlbnRy
dXN0LmNvbS9jZXJ0aWZpY2F0ZXMvcG9saWN5L3RzL2luZGV4Lmh0bWwwgbsGCCsGAQUFBwIC
MIGuDIGrVGhpcyBUcnVzdElEIENlcnRpZmljYXRlIGhhcyBiZWVuIGlzc3VlZCBpbiBhY2Nv
cmRhbmNlIHdpdGggCklkZW5UcnVzdCdzIFRydXN0SUQgQ2VydGlmaWNhdGUgUG9saWN5IGZv
dW5kIGF0IGh0dHBzOi8vc2VjdXJlLmlkZW50cnVzdC5jb20vY2VydGlmaWNhdGVzL3BvbGlj
eS90cy9pbmRleC5odG1sMEUGA1UdHwQ+MDwwOqA4oDaGNGh0dHA6Ly92YWxpZGF0aW9uLmlk
ZW50cnVzdC5jb20vY3JsL3RydXN0aWRjYWExMy5jcmwwGwYDVR0RBBQwEoEQbWx1a2VuQGNp
c2NvLmNvbTAdBgNVHQ4EFgQU2zuPid9iDYJxiN8FkzZ12yHVlPswEwYDVR0lBAwwCgYIKwYB
BQUHAwQwDQYJKoZIhvcNAQELBQADggEBAJsSCpc2oBZAEM3jJNCb6r3ao9ICphG2tXfJ8nWY
glo5W3rfKbtmH0V09d019bc2GLbw/4kHRQpPBptshDFAfavc1wvupzaMw5aOFZUNRs8IKK/9
xGfx8Ay7GOyd1zUxvatRrVMDYxFX1uta3cUEf2mAZl+bucqqcWvsjOQ4hw9TgyQPfZt9Kajw
BsR/Fn52jcVu+Rj6/OqlhSHbKFYPdONb0HCgXHSMo1FWuKvKRnWS037W5exPaFgdV46yIy6s
i0ERCg19CsWqxBviTJN3yC5NjKfmr0z9j2bl+NJ9kTrTP0ayua9dPl9o1mi1Li5+Cvw9Gnf2
VcTYdOciJAUraH4wggaXMIIEf6ADAgECAhBAAXA7OrqBjMk8rp4OuNQSMA0GCSqGSIb3DQEB
CwUAMEoxCzAJBgNVBAYTAlVTMRIwEAYDVQQKEwlJZGVuVHJ1c3QxJzAlBgNVBAMTHklkZW5U
cnVzdCBDb21tZXJjaWFsIFJvb3QgQ0EgMTAeFw0yMDAyMTIyMTA3NDlaFw0zMDAyMTIyMTA3
NDlaMDoxCzAJBgNVBAYTAlVTMRIwEAYDVQQKEwlJZGVuVHJ1c3QxFzAVBgNVBAMTDlRydXN0
SUQgQ0EgQTEzMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAu6sUO01SDD99PM+Q
dZkNxKxJNt0NgQE+Zt6ixaNP0JKSjTd+SG5LwqxBWjnOgI/3dlwgtSNeN77AgSs+rA4bK4GJ
75cUZZANUXRKw/et8pf9Qn6iqgB63OdHxBN/15KbM3HR+PyiHXQoUVIevCKW8nnlWnnZabT1
FejOhRRKVUg5HACGOTfnCOONrlxlg+m1Vjgno1uNqNuLM/jkD1z6phNZ/G9IfZGI0ppHX5AA
/bViWceX248VmefNhSR14ADZJtlAAWOi2un03bqrBPHA9nDyXxI8rgWLfUP5rDy8jx2hEItg
95+ORF5wfkGUq787HBjspE86CcaduLka/Bk2VwIDAQABo4IChzCCAoMwEgYDVR0TAQH/BAgw
BgEB/wIBADAOBgNVHQ8BAf8EBAMCAYYwgYkGCCsGAQUFBwEBBH0wezAwBggrBgEFBQcwAYYk
aHR0cDovL2NvbW1lcmNpYWwub2NzcC5pZGVudHJ1c3QuY29tMEcGCCsGAQUFBzAChjtodHRw
Oi8vdmFsaWRhdGlvbi5pZGVudHJ1c3QuY29tL3Jvb3RzL2NvbW1lcmNpYWxyb290Y2ExLnA3
YzAfBgNVHSMEGDAWgBTtRBnA0/AGi+6ke75C5yZUyI42djCCASQGA1UdIASCARswggEXMIIB
EwYEVR0gADCCAQkwSgYIKwYBBQUHAgEWPmh0dHBzOi8vc2VjdXJlLmlkZW50cnVzdC5jb20v
Y2VydGlmaWNhdGVzL3BvbGljeS90cy9pbmRleC5odG1sMIG6BggrBgEFBQcCAjCBrQyBqlRo
aXMgVHJ1c3RJRCBDZXJ0aWZpY2F0ZSBoYXMgYmVlbiBpc3N1ZWQgaW4gYWNjb3JkYW5jZSB3
aXRoIElkZW5UcnVzdCdzIFRydXN0SUQgQ2VydGlmaWNhdGUgUG9saWN5IGZvdW5kIGF0IGh0
dHBzOi8vc2VjdXJlLmlkZW50cnVzdC5jb20vY2VydGlmaWNhdGVzL3BvbGljeS90cy9pbmRl
eC5odG1sMEoGA1UdHwRDMEEwP6A9oDuGOWh0dHA6Ly92YWxpZGF0aW9uLmlkZW50cnVzdC5j
b20vY3JsL2NvbW1lcmNpYWxyb290Y2ExLmNybDAdBgNVHQ4EFgQULbfeG1l+KpguzeHUG+PF
EBJe6RQwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMA0GCSqGSIb3DQEBCwUAA4IC
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
6QT0FFIq

--B_3752820406_4160403662--
