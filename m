Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB3D1F932
	for <cryptsetup@lists.linux.dev>; Wed, 20 Dec 2023 08:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HcIpRzMO"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-54cb4fa667bso6708344a12.3
        for <cryptsetup@lists.linux.dev>; Wed, 20 Dec 2023 00:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703062672; x=1703667472; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mNKgz7IRqqGEvBHolBDyIjc3tq/lAY7d84J4ZtlAw4k=;
        b=HcIpRzMOUW2eXX0gBJSMdzGw7U4oQcdD1wPNFqsjpHkMtGugJoWxbK48iP3rYpDPAY
         /Ui50LnoWee9xYMQzScj5QEQuvM2pfWnBXixZMTbUSjM/MWN7KoL9kezk082Q3gipnan
         pRWcQ9rhTooeyBcr3tr1/bGd8/wfLgphDf3s2MYiGY79o6QssGcFf8XWECh0IvK1pvh/
         vR9hvCreL9SpZj/ijB3eXoXZ6zyUm4XE0p80TS6eXK/4jLP/Nm2ZwLC9mUwWtbmTPzDf
         QGt+lW1sm7E8/LRlco31/nbWqbgvsY6AF+tSUtrCVZWRGNSgjMVRQwFAkAuxen9q78OP
         3yGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703062672; x=1703667472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNKgz7IRqqGEvBHolBDyIjc3tq/lAY7d84J4ZtlAw4k=;
        b=nVeQTP5C38iIKDHtkT8cx3jV2YkgtCo4BJ7YnwAvuEtbTXfnN6GX1M31ll9fZHO9BB
         yPf4Eu4LGLZRQWupz64nX7ekLFIO6Lcpxi//ubEpSFfzVuOQVLA+8vG0tg9gelu5WxHN
         LXiqM/YX5noDXnBo+A2GVSdLmCzaX6teKpJPkwie9GirGl3a6ESh1sYX1E4ZDBGVpFsP
         rg7GK+qfP5jR7tUgPc3hbEJCS/C2kSCBp7Lp9zZ4IRNBq6mZ0XTrn/ySzsGsWCZVd1jj
         l8o8BhnXz2CEggu1GlboY7o8CaCtQNdaZDlIzGDVv8K71uF5IO6scOLz4KETOHSp3aGo
         rLWg==
X-Gm-Message-State: AOJu0YxGw3gn3Tkq0Th5jRxTbXSIglld0XbKiuzV/x2nuOTwYBoBVm5d
	gmGlKX8+HYSuKej1927HJd+CNh2efQA=
X-Google-Smtp-Source: AGHT+IElErwHAKMXH5Q1LGh02j5y9GITmzO2MrUOiu0Ss+VdQpoO9UbuYMQF8Mok56Hmu5/Sp9jRFw==
X-Received: by 2002:a17:906:d6:b0:a23:ff8:cda6 with SMTP id 22-20020a17090600d600b00a230ff8cda6mr5896448eji.75.1703062672002;
        Wed, 20 Dec 2023 00:57:52 -0800 (PST)
Received: from [192.168.2.31] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id og49-20020a1709071df100b00a239a593aa9sm1731013ejc.161.2023.12.20.00.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 00:57:51 -0800 (PST)
Message-ID: <463957af-ca19-4754-978a-f69e9f7661af@gmail.com>
Date: Wed, 20 Dec 2023 09:57:50 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dmcrypt - possible corruption of data with kernel
 6.7.0-rc5-1-mainline
To: =?UTF-8?Q?Richard_Clau=C3=9F?= <richardclauss@ricl.de>,
 cryptsetup@lists.linux.dev
References: <dd0162b6-c15b-474b-9395-2ae594ec8c9a@ricl.de>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <dd0162b6-c15b-474b-9395-2ae594ec8c9a@ricl.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

please send this to dm-devel list, DM maintainers are usually not here.
(see link in here https://subspace.kernel.org/lists.linux.dev.html)

However, you will need to add more info and simple reproducer, otherwise
nobody can actually check what's going on here.

Cryptsetup version here does not play any role, as it only configures
kernel dm-crypt and rest happens in kernel.

Milan

On 12/20/23 09:26, Richard Clauß wrote:
> Hello,
> 
> I don't require assistance, but hope someone involved with dmcrypt can
> make use of the following hint:
> 
> I believe dmcrypt corrupts my data on arch linux with mainline kernel
> 6.7.0-rc5-1-mainline, while it doesn't on stable kernel 6.6.7-arch1-1.
> 
> My system has a btrfs mounted at /, which contains a file test.img,
> which is used as block device for dmcrypt. The decrypted block device is
> then mounted at /mnt/test
> 
> When I rsync ~150GB of data to /mnt/test the btrfs inside shows many
> write_io_errs on kernel 6.7.0-rc5-1-mainline. The outside btrfs / shows
> no errors. An extended smart selftest of the underlying nvme also
> revealed no errors.
> 
> When I do the same with the stable kernel, no errors show up. It is
> probably only my system, but maybe someone wants to try that out. I
> created the image file completely new each time.
> 
> 
> # I used the following commands to set everything up:
> dd of=/test.img bs=300G count=0 seek=1
> cryptsetup -y luksFormat /test.img
> sudo cryptsetup open /test.img image
> sudo mkfs.btrfs /dev/mapper/image
> sudo mkdir /mnt/test
> sudo mount /dev/mapper/image /mnt/test
> 
> sudo chown -R user:user /mnt/test
> 
> cryptsetup is at: 2.6.1-3
> 
> Regards
> 
> Richard
  
