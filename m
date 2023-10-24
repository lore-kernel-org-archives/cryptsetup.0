Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946B43FE1
	for <cryptsetup@lists.linux.dev>; Tue, 24 Oct 2023 07:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OshotkbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698133884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nWpipQlOyeI0QP6JrEo6A87Fl6BEAZ63zW04+BVMc00=;
	b=OshotkbHJDop4vl12zXRBmvQnQ4QiMp2SQrz9anIgas2pgpUl7kjpc9BmEicxiJuHcIXVJ
	oZqHZH8e7BY7URgcOEq02ELSrEI6LpBX4XvQ9zYWc0pWKkO5aEXgKxZOcNh341VHa1YXlz
	XP/t3KUmxw4Svnm/uo2FpoyxDX2uHIU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-TeD3cAQFNgymuIJv0vtsBA-1; Tue, 24 Oct 2023 03:51:23 -0400
X-MC-Unique: TeD3cAQFNgymuIJv0vtsBA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-778b5445527so543252285a.1
        for <cryptsetup@lists.linux.dev>; Tue, 24 Oct 2023 00:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698133882; x=1698738682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpipQlOyeI0QP6JrEo6A87Fl6BEAZ63zW04+BVMc00=;
        b=XBuYc+YEl1TpFPkNay3HV9sphTBF/Z++cGPG+3ehkLPoK9G09qEDaCKNizjVciD17Y
         MsvyKPSZtFNNArilj3z3nh65vX0xMnap4t8mpqOwkOmmd3/eagQFIcU4LoQufvg4lNsI
         l0X4VdiJVWWvgFLjHqCxLFtYfas+P0iBjLosnhQyWG8cCfijDMgesxjiXtzzC0GmAjv2
         zhV2b+MCbjtsXiwgSEkUBRDwNiGWNszIc5KxMPd/dpSGd2erMUok6Fq7sfABt/28pHmz
         rp/BygCFHKeAM4M/f29b02oY+DYF9sZg3o1so0GQX2/rr8nN+SZCyNFDMDLmbsTWtNpS
         oJvw==
X-Gm-Message-State: AOJu0YxOIJcoi4GB6pCSzyO0EExJTH4XeZlYiH8xcAeENvazd0/Rv3DP
	yDtlvEWbDRFmOuxlRlDa5YE5mkOzzL8s7yW3nZR4fnaRZmP2RBBlAInORE7lda07w+yq43kINqN
	bUUt3fIh4uGfWM7S7BBPP
X-Received: by 2002:a05:620a:2416:b0:76c:ae1f:201e with SMTP id d22-20020a05620a241600b0076cae1f201emr19190400qkn.27.1698133882581;
        Tue, 24 Oct 2023 00:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFszevTx5i2BvwHChnIHi3TiQFTRi1Zfa1nX+DZaxNcmcFpuGkQQ/drnvofwzS7qFSElb0/g==
X-Received: by 2002:a05:620a:2416:b0:76c:ae1f:201e with SMTP id d22-20020a05620a241600b0076cae1f201emr19190390qkn.27.1698133882332;
        Tue, 24 Oct 2023 00:51:22 -0700 (PDT)
Received: from [192.168.50.106] ([83.240.62.132])
        by smtp.gmail.com with ESMTPSA id ph5-20020a0562144a4500b0066d0ab215b5sm3467192qvb.13.2023.10.24.00.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 00:51:21 -0700 (PDT)
Message-ID: <a8b2f0f4-13f9-46f1-a729-c4b894664ab8@redhat.com>
Date: Tue, 24 Oct 2023 09:51:19 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cryptsetup benchmark vs openssl speed, huge difference
To: John Smith <dingrite@gmail.com>, cryptsetup@lists.linux.dev
References: <CA+5JoNqPHYVNKp+8LGj8tQtCfU4fK=GKOSgihfQko=_rCiLpGw@mail.gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 xsFNBGGg1gYBEADpTn8FgSaeBI8YJYs2dMqUD8nI/DkA1+UImIuISZx+agczCJzcFuE7u8BK
 fUdC6ebcOW05BBM8HB6lxn+bDw1RJz+wBujPpkzimnHL0EtA1N1FsEnc6oQhMtxyqgLfeQ9K
 U5758StYqmZqLE5Geo4kH8HSDEOr9GbM8NSG1BbHyf64GR6GwOMSIqUH+oUgjBO/1e/A7R1H
 RqA5iUaiJITbxBqARk/j3AkUsCG2WsfxzB9JecHnGgW8aS6mH/DkXN/eqomDQhpAxD4AuuhA
 6h8o7dkkXtN9SNC/jm8Rx01sl35NVMI9m2b9VAThwJ9bNh7OOETZRsnKWAV6NGIbcrGLM8Bs
 X1yJTRzHgeO3n0SfpM6AoSXl3DJZf8Ll7p/DwYtCU3qK2GuLlNh5R8Ja2kC5Soap38h5x5If
 KcAQN/3FQJkK2LAAHYBzKcyIMX4XLo6jzw1OI40G5Vy9rj/X3URwplHtCunMO2VGMjuuO3VZ
 L3vLHvotHw4i/hrToVIEpMaAwsjExDfdkqy93GFAzelsFe8+fOoCIn8uX2BNmmJc2AAtOcal
 v0yMN0gjiqnEu+LfOLma1vy4xNWbuWMY+14PZK+YMT5KPGX3LTa1EMUGNvvMcOUCqKMjHmgN
 TZ+Gs5e437qbLuGnfflI2LAdOp3LOmS4CRbY55NQXj3TE56H9wARAQABzSJPbmRyZWogS296
 aW5hIDxva296aW5hQHJlZGhhdC5jb20+wsGUBBMBCAA+FiEElvP/z9ON8q9BUuWfhO4cWVad
 nVwFAmGg62YCGwMFCRStNoAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQhO4cWVadnVyg
 IA/+OEQbSnfKFBK+ikaiItY+2wLkcfajZUuQJ0zimjEmcnAMdXtF+CrM3J8IsObATmUUOCja
 4X8Cafok4yjIriCcn0xlOXxoUPTX2LQZAybDEaG+dbsL4q/DaLW52ol09yXJqjR3ncMi4DKL
 3fKwI6w2gLw74ULS3mltn65HxujJc+H53HoiQt4wAbqR6lp8Q9Jr6lYUA6JTKQaFvr9vlA14
 sKBHFARsOt/PdgJldU5rYkFP1adWV/XB8e8g6kH6/Ry0ZjhpY5Gp7smaTe2HvSpVrOsnqH53
 TZtOufHEnn9Y/sbZozCA5ItPw7HpxW7ehBFc7SU/51lGq7W7Rwb5SVjdKHffuekDNNkWLoeh
 o+70MR7KoPkwNdyvLSRaCm24IqsOTazkY7Kyxfo47VM4XzEpljQq3j+g0b0kNONZnmKozt06
 s6dHclqci2dJCDauyW3P+Irpn4gTCUrD18kPns2xcFCEqr6UuBcT943ZpCvH5Z1n/rUUiBze
 +4xq5JYkSbrRI/zKN+h0LxPaufUIni2Lf43egH7l1sWv3/Y41/4Hfsr3yE7NxMnXuaOO2UAt
 pTEadbMM47ZB6/tx33+GpNQ0SyHRyJfOZVWfLxZJwseiOR/nEEaYuKanQpconeiAD9oC1Gda
 3bzgEpBU6QXoSBDHN9+vEq3B+Ri65gdZpC1TfRvOwU0EYaDWBgEQAL7svmDEUIORmh744Woj
 1n7VB5NTYVlulbjCtBzqXQaBZWTrQvOnBP0/DTi+cmex2iav/f+FKHHcdR2wWaoeXw99cnjZ
 f4raUuwdsVuKHNCibXHrzFXGKksdWDsW6DyEvoRbHPvsrPsTXDWBx2RKtwLaaiYc1/o8hWsH
 AV4087nVoX8lRcoAOlpG0hXdKvqC3pRMiB1vPSSjHsFg65a501qdHj3UteNoVklFTbn49Pyo
 MwraSliyUP4rEmXqx8Qygaa1Eswjefeor3jG+JKjNaryOP6Z5rUUHBV6hINqydtM8IONgQqZ
 j/JAqsbWxrtPbV9VY680/yFjKIBkZy/eMrkeJJw9OlXMHVKQWbTpW4ZVcx3CvI/baRqoTTs6
 bwzPHRMC3CMPT2kw1pt3QFytxRguuYMs5WqZtR+G3+Xm6oIV4z1x5moFGX/yRcGKVPf7doEH
 +FaETgCTxEwbt8LZeX+gQj/iOiTmDa5+IHoBgrr9LlisLoNd3aYp9eMuuFs1ev7BjF3kbllj
 R8fc2LyhZCsCJdI0Vsjpa+NJoX2VmwHnu/cvtBGVuugLmagPGiGDiOSyWKPmxiSX2/TKdNLm
 6TKekkNyNEhP4zt8VsEoMkPEImM89oPEP2jur9upPK9R+gadwnrabusr1cvv/dHIgZ9Gf7FS
 IwkFQDrw9E0l+iNBABEBAAHCwXwEGAEIACYWIQSW8//P043yr0FS5Z+E7hxZVp2dXAUCYaDW
 BgIbDAUJFK02gAAKCRCE7hxZVp2dXMz7EADNJ9S69eK6RpyYo6AzS+JgFMg8Z1him31G5nNm
 a/2YYscyVfrJ4Yv7/GF94yUeldikYw5lEbHQT4Nz3oaloCdspG0BPOXB2h3wg9iHCqTb7Pwp
 yLil66aufJtHQgGHaT+T4DljH+o7BCKP1wD9kCSuUGKo72JmRLbKXr1P9RpPiRgp3ZOtmUlq
 ieNEseOASWoatt64Nb7A2linV+rnwiXMqom74ZbmW5g0ZzPjjTmQqzgoV7uaWrKCCYrAD2OE
 v4HYAv1fjNuL2NokBILx7zbQ8Duy8pd8LXQkryOtw+EOjGa3zgQBp/Xoa6SXP8F+tv8hfBHp
 GdofNO4NCZRf7ov76lqBO6F+G3/EFZyOjl3FFpFV9X8HYfemu0dpQUb7shnh4FpSFokP1Fze
 8cBDSi7QS3hZio74bYAGkEV/47jFE1P5ZrBhZb1tg+EYNvXPIV8Et0gCL+WMZFE/B+Pq1GEq
 p6l3x7b9kO8dMwhnUAhjiIhkCA1+cY/HjHUTcSROG8/q4nhenxIgQc3cAsQ6iLO24RlXU15P
 qxDEePjhSYAPLdpO2V6kWV/5GL0dBvi9MGp5MN6ox8ShFkE1xMh+pJgmHcjJq2MHeH7uqyYQ
 eJndz3q+QBWrUkUOIrwY6NbsZJECBHQd/wxYE/y9gO5qNdfVAS7UUwcc4S5WUM2bNb8klQ==
In-Reply-To: <CA+5JoNqPHYVNKp+8LGj8tQtCfU4fK=GKOSgihfQko=_rCiLpGw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi John,

On 24/10/2023 07:10, John Smith wrote:
> Is there a reason why the AES-XTS speed is vastly inferior to openssl?

cryptsetup benchmark does not measure performance of openssl (or other 
configured userspace crypto backend). For detailed answer see below.

> 
> cryptsetup benchmark
> aes-xts        512b      2503.5 MiB/s      2514.3 MiB/s
> 
> openssl speed -evp aes-256-xts
> type             16 bytes    64 bytes     256 bytes    1024 bytes
> 8192 bytes   16384 bytes
> AES-256-XTS      633950.11k  2343011.04k  4795982.60k  6688253.60k
> 7698595.84k  7806526.67k
> 
> This is also borne out by the NVMe performance, or lack thereof.
> 

couple remarks to better establish cryptsetup benchmark baselines:

1) The benchmark does not perform any I/O on storage device. There's no 
correlation with block device installed in the system.

2) All block cipher results (aes, serpent, ...) are collected measuring 
kernel crypto layer performance (accessed via netlink API from). It 
depends what implementation of the cipher kernel crypto layer loads 
(based on system arch, CPU installed, kernel modules compiled-in etc.).
There's ab overhead for using kernel crypto layer via netlink API.

It does not reflect real performance of dm-crypt mapped over available 
block device in the system, by far. For example: dm-crypt encrypts data 
in 512B to 4KiB sized blocks based on dm-crypt table parameters 
(sector_size). The cryptsetup benchmark on the other hand measures 
performance by encrypting much larger data chunks (1MiB IIRC).

O.

