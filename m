Received: from smtp-out-02.aalto.fi (smtp-out-02.aalto.fi [130.233.228.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E1E7A
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 06:31:17 +0000 (UTC)
Received: from smtp-out-02.aalto.fi (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id D78A727164E_24A90ADB
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 06:31:09 +0000 (GMT)
Received: from exng3.org.aalto.fi (exng3.org.aalto.fi [130.233.223.22])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by smtp-out-02.aalto.fi (Sophos Email Appliance) with ESMTPS id A99F9271648_24A90ADF
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 06:31:09 +0000 (GMT)
Received: from exng6.org.aalto.fi (130.233.223.25) by exng3.org.aalto.fi
 (130.233.223.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.21; Mon, 4
 Apr 2022 09:31:09 +0300
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (130.233.0.5) by
 exng6.org.aalto.fi (130.233.223.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21 via Frontend Transport; Mon, 4 Apr 2022 09:31:09 +0300
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4BQ67TyRLRDrhCKpQprDe54u5zvoebaqLe+m13yXSjHdNN1UdVn57LeRC+eqh1mKRxnh88nO0O/lIaY03kO/AYY1pPsAZwQbCEtCygonD91tT262CUe/SA8EYHBKJF9IikwhnfHl0e5P73BjGV1pUi/tmLPYJ7gMuxQU+bZlWpN6IKTO0s3lU9Ow2mu92gaFSIE8Jtzfzc/TLANmSrhqWxOsn0TU5mpa9PBITKtf8/yFkxwZ/nr19IE/Zn5d3JJOikkXlK1TD0Iqxwn0URI6AVpd1fZd9TyAFjRIi+Ct67zjH67ZWsWnxoskIOL48pYEtUQbo0RZSOOAL7LDVWuRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnPEt0H45KVuvrblWw6V8TT6mQBb9V4C5JYU+z7G02M=;
 b=Wa3lgsNgPr3iKwaD7SbYhdeS7TiAX9+TKNoPp1AP34CVu4zx2+MEe6V4Co0uk7I+3PX/2u1tD+h0iy9FgSLVmqPxtBCs3RQCQNRqD49Y9pIhUw1ENapp+CHCpu2ineW+XmhmAlhQWtLQGYNSVb+bYleq74RKDwSlElGfZj/4K0tv5hOCfJfynl1lQ08hYauUKYA/iYcp5v0vuq1wBQ5AhLoE7sJtZxppHeuq6wwYBi/Q7Bxlo+tFoSSN+Z7O+Kfsizk7H1psEh8UZ9xdoGOPMZnjCmpJVMX0zWF1GWG0ggiFFcOu7GeqQXqqTWD/BCoY0jkPyCrMeqvbuPjpr2HTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aalto.fi; dmarc=pass action=none header.from=aalto.fi;
 dkim=pass header.d=aalto.fi; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aaltofi.onmicrosoft.com; s=selector2-aaltofi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnPEt0H45KVuvrblWw6V8TT6mQBb9V4C5JYU+z7G02M=;
 b=rhsUNXDx+E9Fvc4SZUvRfmGUuzqzmhOFi4uT/Bl+6xBxfetoU6XapYDOG3grhWYUvUDV09bAn8lwQil3nGvEH/hgHM0r0/zyZLE8ncJZ1Yef/VZkQxi0Xg881pIMX042v7NhfYTLr7dCJp4uEU1tWiCYHjSPk1XjmxS/27fOsJE=
Received: from PR3P192MB1087.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:aa::16)
 by AM0P192MB0260.EURP192.PROD.OUTLOOK.COM (2603:10a6:208:47::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 06:31:08 +0000
Received: from PR3P192MB1087.EURP192.PROD.OUTLOOK.COM
 ([fe80::6c3e:afc2:b8c6:3a63]) by PR3P192MB1087.EURP192.PROD.OUTLOOK.COM
 ([fe80::6c3e:afc2:b8c6:3a63%4]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 06:31:08 +0000
From: Surmont Jasper <jasper.surmont@aalto.fi>
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: Development environment preparation
Thread-Topic: Development environment preparation
Thread-Index: AQHYR+1dBInZtw2NiES9IjCZ3rwrWg==
Date: Mon, 4 Apr 2022 06:31:08 +0000
Message-ID: <PR3P192MB1087A708C36CD34F77AC517CF1E59@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 3111a31d-f79f-630d-b4bb-94797bf91938
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aalto.fi;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99c275e6-13ab-4e37-c7f8-08da1604b451
x-ms-traffictypediagnostic: AM0P192MB0260:EE_
x-microsoft-antispam-prvs: <AM0P192MB02602BB0D0ADD464724DF0D0F1E59@AM0P192MB0260.EURP192.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UDRAv7ksNE6KIMmRishgJtHWc9HCgpIwaJQB7W5+ADTYgKsrSRSrPaMP7zci+8pk7N5KQ0DvHyYvwyJyGv0urkkksoCOKgY/wqoZXtRFoWsWv522xH8xwSe6inik4Fs8eUDUufON6ZgnNLOFAJy+3eHCW8fPwy4bBDHovQkIg/ESiZ7gyOK3A1YTUq5JzTe94uR3TuEH0unMt58fwikczBZ9kAfh01cM1JrorNcj4FchultUTTNEgZkqifJrnku41EmIUYmweV/vurlLTlmm1BxVyKnb7aDML4NJYGyHS+s/NupX2W4VUiq9HeQn/U/CoVdCVPkdelJSzOnUypQ9TieSZfww0iMDSN7sHtSnh2h3abQOnPaBEvLnU6V9ttFJRBpivMX1ABJgtGdEiYpjboQ2GATzQuUWnvG/xr+e9Z8WEYrMtwgt65WA1354QMNUcB2XGNZkYbW+V/IBjx55nTc3UKc5WjoTw4esAfZA4zi0no8kpC96uCjI6+alNkfhPu84JsnQTFF17L8TlXzycAYt+FszNte1v7zcV+J7oH1iSZTSWpkfeMC6G2fCQSC/R7ncB5Kj9+33Hfs5mokPLv3CqN99dKwpQUtGnuBPyi+sDCNYf6mjJzMy7GmU749v34bQpSw1dn8KUg6JGkkWNyZxkyPMp2YxHnLF4we8iG8o582sPaZrI0qibXo7lglxafmJzfhl8b7ww1Qw4L8gKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB1087.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(9686003)(8936002)(86362001)(6506007)(38100700002)(55016003)(4744005)(2906002)(7696005)(52536014)(122000001)(33656002)(508600001)(66556008)(38070700005)(26005)(7116003)(186003)(3480700007)(316002)(786003)(71200400001)(64756008)(6916009)(66446008)(8676002)(66946007)(76116006)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MsV5o/iu+S/N5LkWQE4+9XJWfsaWnGQVeFljoYulzW7T4ZQnrYeqmWosn4?=
 =?iso-8859-1?Q?O+NXw325DFJZGp7tKk0LJnTDO9C1Oc1pyv1v2YhsUl0AFWx99FqyZj/yL3?=
 =?iso-8859-1?Q?NjYsTAC5pBOMIFdDBgQfBnE4wC2gX5a9uFYOlzd4CvKEqJ24nUd3ytwM0O?=
 =?iso-8859-1?Q?yqnL0nhB8MQQtgKpwcf2Rtz8bHY6i+L3SE2iSYu/cdjLRbKlhi6duzlD5x?=
 =?iso-8859-1?Q?Tr46dYER/a3qVM7ut4nZeyzPk0BicAR5CLxcrOacUC0trgPdJUZ0FGFMY8?=
 =?iso-8859-1?Q?9nkbqO32qVDfvtxIHDL8hKaqXtbMhZ+cN7fp7Gnu+ZHetQfXtauCgp0uxc?=
 =?iso-8859-1?Q?cITxbbYKnkkRfliHWPCcfsZ35YL7ZMVHZpIKO0TXkIs4zvbLjU86LxUiDh?=
 =?iso-8859-1?Q?bKwGWXTNWVaOvvMwUUBIvN3Xieg0gUBVADGM3Ue6oieVZvSR2qY8VD78VG?=
 =?iso-8859-1?Q?BHXuya3t/bBi5vy7/Mtg1o2FdjFNyhkYc+rfz7XYkYefGWsO0mi3Emdr9p?=
 =?iso-8859-1?Q?xa1G03gMzIKnJOnJ7vqZpw2U9+P19oyU/GI2y1T+nAGyLsaAyuRLk/rT+L?=
 =?iso-8859-1?Q?tYGRITUoRzTfGoALi+GUYH20rEBLSi8nt9xWR7dWu29BplZdZIumLQmy8e?=
 =?iso-8859-1?Q?5hoPv6MAt6rcsANSR8H7oBKgqi59VwRcVs9Ox3+2su/mK91IaxxtaEPSwD?=
 =?iso-8859-1?Q?GbiZSDESuZZPfm1qn4WgnNiM9lKfCHKv15o++lumWeC1TE4DR40Pfw91vn?=
 =?iso-8859-1?Q?1GgGpkLniWq785jQB7hMaAryGTGj1UAL3ceUpl+XKB6ZPGsBUpKP4MgRO4?=
 =?iso-8859-1?Q?D8rzVNHi0uHnvBRSAEdq3o3Mc/JJf5CJ+3SeHXm67IAWuvwb2pi7vkHaSg?=
 =?iso-8859-1?Q?7wBhgUgA7r/OcLarzkZhn6h7cmruOhydDohQYVmXw0Twp/gWvku0y0lEtH?=
 =?iso-8859-1?Q?ACngAz7QWRHXZX7AbDlngwbsAY4qgOW6jeOZDBPZBUlfiUjZBdR1mJl3rY?=
 =?iso-8859-1?Q?M+HiDZ8G1xU9Q6kGBL7Te3d0j0F8sMqxYjXJNthS7T1y4fw4Jp9urHQ85w?=
 =?iso-8859-1?Q?EK8aTbR1BsLkskerqoWfRMOD2nVnAQvWBHLXZZ6zSUXuX3wnC1mFdBI5un?=
 =?iso-8859-1?Q?L/Cd14YrMnJXeCb6/yfgv6SKkR/pPXHMk60B9qU0o7qCMaTXkZy/JCI0oS?=
 =?iso-8859-1?Q?7BGnF3J5IcDAhgAekNtHzSXk+zPBvHjRrMig37Q4as2FMYhPFQZzYQTIRo?=
 =?iso-8859-1?Q?kkObq98fqLO8lwghpKJ8j/5DkwIMDqq0jhFFLo0tNc0s8zGrmFYqU9AbU/?=
 =?iso-8859-1?Q?mPwn8GECAQOOhuqm1m1RWDhgDw3qCBU+NvJH7E/3tnw8ircv0oHphwLpax?=
 =?iso-8859-1?Q?WmCThJRdVBmOyVcIlXtsQ1MtGsbJppe0LVXzojoJmUBf5F7mURZB3oYa/b?=
 =?iso-8859-1?Q?GSkbWtPPMqqmMKRpm4knFomLYHo10StKUv/3FM8Pv69NQfI8sCnpsqzTwi?=
 =?iso-8859-1?Q?iLI0Z0ZlSmfXJUOq9H0fjeiHaQWvDB18cZ0rThNR/b0kaBbDuTRe6Y77t1?=
 =?iso-8859-1?Q?ZbALzjkyEI1rSlarDxw/Qf3AMkDCVA6wtf5K1W+wxA6irROyuHHfuppLgW?=
 =?iso-8859-1?Q?Jjo84mDBhCqCMtnfabUTX6hT3i9KqrPcOvMyUmnrV9KN+SCgWdTyDsclnq?=
 =?iso-8859-1?Q?dsp1WHXYLk6FCoZ7pbqSEIkqVpRUmBjjsGxb0aZmkv69kAYm8LswVbc5Kr?=
 =?iso-8859-1?Q?imZ0DRg4Dv7259yalWCh+/gvK5g3rUG7kN3BJIUd7WJjdcXyfbz1U3eIFr?=
 =?iso-8859-1?Q?IDqDQvoSMA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB1087.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c275e6-13ab-4e37-c7f8-08da1604b451
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 06:31:08.6504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ae1a7724-4041-4462-a6dc-538cb199707e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rZLB9cwLxMuTB3X0Ddmo70XM5pTHDVMpgUYdSPPl4kxHCd4oK6hIH+0KFSeeEqVHQrxdpKd4TNwz47hc/IxGLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P192MB0260
X-OriginatorOrg: aalto.fi
X-SASI-RCODE: 200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aalto.fi; h=from:to:subject:date:message-id:content-type:content-transfer-encoding:mime-version; s=its18; bh=vnPEt0H45KVuvrblWw6V8TT6mQBb9V4C5JYU+z7G02M=; b=00ufy/dpJISCxhVj0Ehm+0sgToltpxHRcZilXoNO2PPx8frOx5O+uU5Qqyit3cdi+AobDzB/GmqgU6XgwbSfxDfCuTqePIAw2W7Jv4Hm7EDMIoIm1F3d8iPNVi5fs8k0m6DTw7225IKGBmLew1+J3+7g9AfNG5fHlzYDL1INARk/slr4w2FaLxR3E6JhOsruhJmNo5wH2ywmueLag1uOOvXAOk8EBG2kkDwzCG5lIBi6uO6Oa08aQRvV02xA9UP618HUs2pcFUY2F7RYkbwkRN1vvoeO/Pb+GaY8yrmYiNq6CnAGhl15U6u+RhXPDVo2TEjIz1ROG2URNgCMuTlhQQ==

Hey!=0A=
=0A=
I'm trying to analyze the code of the cryptsetup project. In general I pref=
er to browse and analyze the code in VSCode. However, after setting everyth=
ing up and including all the header files, there are certain macro's that a=
re, according to vscode, not defined.=0A=
These are Macro's like: DEFAULT_VERITY_HASH, DEFAULT_LOOPAES_KEYBITS, PACKA=
GE_NAME etc. =0A=
=0A=
Is there something I did wrong? Or should I make something first? I can't r=
eally find an answer on the docs / issues on gitlab. Thanks!=0A=
=0A=
Cheers, Jasper Surmont=
