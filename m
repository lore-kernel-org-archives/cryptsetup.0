Received: from smtp-out-02.aalto.fi (smtp-out-02.aalto.fi [130.233.228.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DED7C
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 08:46:53 +0000 (UTC)
Received: from smtp-out-02.aalto.fi (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id D4C2727165C_24AB07BB
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 08:46:51 +0000 (GMT)
Received: from exng1.org.aalto.fi (exng1.org.aalto.fi [130.233.223.20])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by smtp-out-02.aalto.fi (Sophos Email Appliance) with ESMTPS id A3715271646_24AB07BF
	for <cryptsetup@lists.linux.dev>; Mon,  4 Apr 2022 08:46:51 +0000 (GMT)
Received: from excalibur.org.aalto.fi (130.233.242.96) by exng1.org.aalto.fi
 (130.233.223.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.21; Mon, 4
 Apr 2022 11:46:51 +0300
Received: from exng3.org.aalto.fi (130.233.223.22) by excalibur.org.aalto.fi
 (130.233.242.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.21; Mon, 4
 Apr 2022 11:46:51 +0300
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (130.233.0.5) by
 exng3.org.aalto.fi (130.233.223.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21 via Frontend Transport; Mon, 4 Apr 2022 11:46:51 +0300
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXcXYF2GGMJKRNSXC9cHbKP8QkmVPpZQ35IpZPhrN4S0jcZb5zfpdohkSzYvaOn4HQ1w1yENCR3tHtEyBme25nuToKu+hKLdaYxbR30u59sLRWJzdV2KBkMQU+dYjf6UXQg/7XKIoiYEeQ5ni8KKiJXFPEKLUH3ZEVE37+twUHU8of9maD53nPZqzQiuLpoC9TbxZY1xc3Ytx3dkPz6Yp1s+TaM8IAyEetVhnFEy4g2RZpAMkQ5a+m9s3VTOWagr3YCauqLnuaKb3v5Sw8pcL9jkJIq2jU2SnEike+YLeR9OnlV+tZx9TlNZZc8EQZb/AUmpjAtanD+Coq9XbR9lZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlJGr0A6e/DeB/RQDBILIFx3OvRu2Pzp4uAdXIwn3v0=;
 b=lhiVzWS6jRr2Zbn1MlALlTwyzv2wx3+Fh4u6xOy/PR+QwJ1kdrwS8NDu/1G4Zrll28bdJaxTrRKL/Rklpu9guu/JQxAxvYpwv+VyIocHRsQfeHh4APNY/Sxqc6ZhdXq0/TaMVNxLkln9I22dUQyhfuHGJCsyTdSIHkrlWMu70hCtYlenxIrb606LYSSV7/PN2T54iK/TXpoGLtlGq8/qGy5IfavCvZxLTPRw68S5M+efKadbWzR/Nrj5EkQpiTBNhvX5KMz/nVfGcL1eiWXrYoLFj4iRP+h1W7AFhxDywbR+laCaD0a7cIMtkmz4cA2mjDwmy6Q7F4dN3rtXQpjNjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aalto.fi; dmarc=pass action=none header.from=aalto.fi;
 dkim=pass header.d=aalto.fi; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aaltofi.onmicrosoft.com; s=selector2-aaltofi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlJGr0A6e/DeB/RQDBILIFx3OvRu2Pzp4uAdXIwn3v0=;
 b=4XFcXThlDc60ylAJ59nB6Vm2+XZW6LSaDyvrBSvuiIRJszqvCq3v0Iw0YmtxiB+x/KSibhqWYFdN/Jb/DPpn28We4BvfB5Reh00qvKViI4ce/FY0MUv46pNBodAGK8xLFGQLjE2OC6CTj+u3SEBe+/cxLe7zrrCToElw17SQGkI=
Received: from PR3P192MB1087.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:aa::16)
 by AS8P192MB1287.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3c3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 08:46:50 +0000
Received: from PR3P192MB1087.EURP192.PROD.OUTLOOK.COM
 ([fe80::6c3e:afc2:b8c6:3a63]) by PR3P192MB1087.EURP192.PROD.OUTLOOK.COM
 ([fe80::6c3e:afc2:b8c6:3a63%4]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 08:46:50 +0000
From: Surmont Jasper <jasper.surmont@aalto.fi>
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: Lib and Src directory
Thread-Topic: Lib and Src directory
Thread-Index: AQHYSACCS2kQ8RaF40e1JDj7sBMVVg==
Date: Mon, 4 Apr 2022 08:46:50 +0000
Message-ID: <PR3P192MB1087367FCDE3417198711049F1E59@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: e9ef0950-aa4c-0a9f-d413-a9e11545d9c9
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aalto.fi;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a26a2a8d-9ca6-4f12-8d52-08da1617a94e
x-ms-traffictypediagnostic: AS8P192MB1287:EE_
x-microsoft-antispam-prvs: <AS8P192MB1287200D3E49FB2578326CB2F1E59@AS8P192MB1287.EURP192.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SQrmL02kivk79Ba5F3ZKVug/DX8lj6dBe+UwQwuP3Y1mlp98582mFD4S43zEXyYSpKRbYnAfQQQsKNzFVqWnBZDjnojfQx2CHdh0dBb5Ymq2E+hLcRktba0unF0EWjZXpM0JPib1gZN7achWvNwdkSDCoLr0m1D73X+4wG9XY+xi2/LiTv2W2F54MmPMkBNC8f6dme/sgXF6ghfGQde6FfXKK5ZKsJKyc6+h5I93gZQPkOu47YEcXLHfU5vSD3I3YxLS+yVYeWXqjwre16ewYegTcBuzXwPurE+d6hqh5P5pkTfFQ40XsixlM9VK84TZLk/KRs4O8TM6wrSCmNoUkiIKh6+RucKedJIaHP3H/dDNj+Vv4YratZFE3MyOCc+OzAE2Ta1G8k5Xr69Dkqcbbg9PDColXMydOgJRvqmKdSn+Y5sLqizL0FbmHUDrMlKYsIZZXNM48jFx908cImS9eVrvn1zxYbXwZPGAKEeAgIrUKfQGVmatUIr/P11DliB97ZzjEBBxv4GMR/wdl6qH1U480OeDhTSxFsSijL1TeQapEd/ckUC9tw5shDIrJwmk8P+GUNY9T5rM2xFVWtHYlDvmip9YCqvIp3qhAvYWnDaBkinzyu4voypf4NybdyawU5REqXPGtMdPIbWRQ9upGonDTlRCjgP4vH2utFsZDITrdqyFlhRCNTvA+abxRtLr2DYOL+CuuMIosBmLL03hGg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB1087.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(508600001)(6916009)(122000001)(55016003)(316002)(786003)(7696005)(6506007)(38070700005)(71200400001)(38100700002)(9686003)(86362001)(66556008)(3480700007)(76116006)(66946007)(66476007)(2906002)(91956017)(66446008)(64756008)(4744005)(8676002)(26005)(186003)(52536014)(8936002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kS1gC4EVbx7Jw4GSCQcMJqwCqKvdf8pavo6BmEOrWmVTCjzTzX935PhY3N?=
 =?iso-8859-1?Q?hFdav9wulrCGYnvXWljalFvaSvB8jCEccyzkspN/0xBxSTvt6bgKam5DmQ?=
 =?iso-8859-1?Q?lh4hqvbX4w9HD1ixTsGB4Oo3AIiSRC72SSBSvW0EM2AL6ZFJEwye9jNV6K?=
 =?iso-8859-1?Q?0gNexXJGStTqshhNuYyUEcA4vwTYGwJii3l18S1zjYlxcrioCmvE16Yh/o?=
 =?iso-8859-1?Q?aQTstll1rjS9U8YzPq+dIQ/cFP9kaZbyjSQEbq17ob0+K3C7o4I9MfQigQ?=
 =?iso-8859-1?Q?KNxZfHy6psiSV2dUpiwN/ZKHQ+qywR6XoR0rPlzXxT3YzGY0Ofa7Uf6wgy?=
 =?iso-8859-1?Q?gongUJIRlGKIKvwXpAdgW3/epXyoVjFwACJca77+MMf+jfCZgu/I3PJ/EC?=
 =?iso-8859-1?Q?qShSyqQv+64tEsIkWpytt6IW32DWF19Invx0b88H1AKe1lwWSF1MfRUSS3?=
 =?iso-8859-1?Q?vNgKrE5qnyyQL/+IAn9Ju5whuzIloluACTGmfkIBdpVANzUDv5rBxQzwIC?=
 =?iso-8859-1?Q?ZEO2wO25FzZsQsEYRWPoxF+kYOpN2o4ZX2VzS2klrrrQG37hx1CLqq+41Q?=
 =?iso-8859-1?Q?CVsZc+ySXtlhjfF3YkY/TDbkXGJvRIyi9lLpG3nj64Gq2LrY6Raem1DmcT?=
 =?iso-8859-1?Q?Xv1/pfJs4u8zjpQFewpstXyrd6t4t0FTLWbsanvrIYsJ6S5nRkWIOMmkDR?=
 =?iso-8859-1?Q?ovsVHni9qy2qbOb7vU6HTntfmj+I6xUiqn+AVdJ4HkjZQ8BJXuk/R4inKW?=
 =?iso-8859-1?Q?HQORYCjQmeCFILv9d7SJv7t7vLVYJ7ClcFC7Ybj+JvWeKlREzE8KsyKWhQ?=
 =?iso-8859-1?Q?ksCx4i1+zaIm3mGOgM+BkIArLB1vtGZcvbXUOHPY3IKl8ZHkZMgza0q9d8?=
 =?iso-8859-1?Q?TZs/fvzv/nxUxaMFFQoAUOB8TfjhJLhfO6Q314esnhbLPFfae3gFjhHvV9?=
 =?iso-8859-1?Q?wxYzE0/Si2Fs2rAyxayVTZOFY/itZc50L6bWOikm8mbJY3I4MiHMl+wwFD?=
 =?iso-8859-1?Q?+862YKGV8AhiKn9L3XiD/G8eJkvCozxgupQ7/DM6f8muHzh4N5wgy3jmgj?=
 =?iso-8859-1?Q?4Xu5k8+D+OeT48TWilooDAmjjVvecCu+1TLLJ/cuGNACT5oKxBSEHbYM1p?=
 =?iso-8859-1?Q?9pOOEdOfE/c3RejSQeg6IMjNuWJ8+3VpY8fPwTXkTdhaOjf/0lqjeWXc0G?=
 =?iso-8859-1?Q?NZU0S0p75gCVgs7RfiWX5kDxFxXe6ee9DE2XrZf43d6pcJ1SWYOJ+cKluZ?=
 =?iso-8859-1?Q?eZbS4silHVtyW4uaMrF/WbhW+o3u/Ih1udWvUvzoNF6e0yd2OpmdWNKxFY?=
 =?iso-8859-1?Q?fa5Rn4qIp3NJMuFG0ImMOqzNI3tF9C9SqtG3YTUfqI/JAYIcYo+rJ7rCQG?=
 =?iso-8859-1?Q?Q4C0UrY1LsWhiFc+f0zsSMx8PLZrPlMXwb4Xfga4Aj6T2kJJzKEu+pxWDu?=
 =?iso-8859-1?Q?1/BUrF0xsiJW5xxmNPSF3Kz8ByQ4YTv2cOr9c9xScThJ7J1KWV1SWIS/wc?=
 =?iso-8859-1?Q?9zhC7ofYEifgYxgsFg99SFprxBB+TJfPApzcy+BEml4YNCIUYCwYH6mhpJ?=
 =?iso-8859-1?Q?Fs09Q39AdIVO9MFHVYe5Cpow9eouKkj3YV/c7q8TwGI1i/+oTtQsCQ0U0u?=
 =?iso-8859-1?Q?dkD1btU0g1qaBLXyB0fZZ9scThLCAbEkbbM7wSv3CoPQOKZAg2HquuVWl9?=
 =?iso-8859-1?Q?ErJifBh8TP948Crp3/3h1DN45fUPsR5u2VN0mW6kIx+XjI+RKAHL/XssFf?=
 =?iso-8859-1?Q?6modT9ZjGml1lZVuEYsJrwg/FRx+d6FFMucxqqiciLnS/4OK5CIHlao2DL?=
 =?iso-8859-1?Q?LXQknORQxw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a26a2a8d-9ca6-4f12-8d52-08da1617a94e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 08:46:50.6434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ae1a7724-4041-4462-a6dc-538cb199707e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DNh/uLIzgvVfhJmaf3nTYL6nSID/Q8HgpfgVtv9RHR1lIfam8v/7Elig9qsBH6tR8ru4mz7D800x8zTq+X9WmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P192MB1287
X-OriginatorOrg: aalto.fi
X-SASI-RCODE: 200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aalto.fi; h=from:to:subject:date:message-id:content-type:content-transfer-encoding:mime-version; s=its18; bh=AlJGr0A6e/DeB/RQDBILIFx3OvRu2Pzp4uAdXIwn3v0=; b=BlVUwKok6HiqnMZVTmJkUNn4wbabFWQMAnKgLUwH4xFnkcN1U5D9G4b0j214perKD7p35+Jd0ZuvfnEg3z3DCJnJc9YoLRS7+EUngvIcudc3BgXDbbBtziRpS4dtnNe+/rVIzDwKozjh9wfTDFdqpYyDhZhnnYwz4WZkS47wUy3SUE2Jbhs7S4R3lUbtdObG+1IrrYtdQji000i84S+yagZ4xtszrjd8Zy3dm5B1oKSUE9ReVzBp9zHhvqKjgmX9MJ8cUqPf2n8z2P23X4vkJLmkID5fixVnGmuNp7Hfn6uDRgoT2eOj849MQPg1Gp6ARTvqnlrIVVHu32Hro9kKCg==

Hey, newbie question here:=0A=
=0A=
What is the interpretation between the src/ and lib/ directory?=0A=
For example, I see files like integrity.c or verity.c etc. Are these files =
also files written for the cryptsetup project,=0A=
or do these contain the same code that can be found in the linux kernel /dr=
ivers/md/dm-integrity.c for example?=0A=
=0A=
I'm sorry if this doesn't make sense, but I don't fully understand how much=
 and which code is intertwined with the code written in the Linux kernel dr=
ivers section.=0A=
=0A=
Thanks!=0A=
