Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAB68F55
	for <cryptsetup@lists.linux.dev>; Tue, 22 Aug 2023 10:00:49 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-52580a24128so5260758a12.2
        for <cryptsetup@lists.linux.dev>; Tue, 22 Aug 2023 03:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692698448; x=1693303248;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOBPHxFp+fvdhFVYzwLVkPFyDyQD7XJNiUfkUkln7co=;
        b=BHM+NsYdxMpY1xR9b6/nU4xxYTiJLUIzbxwE5yrDgyYTFw+FbOsslAGFDVNg9dx0Xe
         /x5okX5K4KJGWXGrrnZDMmJa/kRiuNWtKxO7XgYcew13tzR9xshMc6XTPduanJOfW20m
         iHxGVibEsTTgpF3/CdXhiImcp22Xcx5toF/d28LF7bkgrZN2TZyBPb5PPXLyAOGu5Q5o
         C5T5qcE5DzJ0TaAHhcl3kFvKLelN4FBUWCN83Otvkcltht7J85284Vt1DnT82ki/XHSi
         ii+ifnbXsf/vf+EOdSI+z4YdIeAfSb4OBESGK7yiiiUmgbFmmv0to0H1cLy99zzFbGsO
         Z6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692698448; x=1693303248;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOBPHxFp+fvdhFVYzwLVkPFyDyQD7XJNiUfkUkln7co=;
        b=UlG4grcQx09Rq0s0v0pi1U48swExmWLeJbT5fTMgVxs8UhvYeDDeLbMh03nCQmRUcf
         vslxDG53yfdzcMMgwcy2ZAGiCIoQzO8jBTDHccaxBI0ljggbX1QCC9YH+grKGt3K43qT
         r4asW108bQTZscGIWeJ5C88WIGvhZueWPUGE44RZ4rdv9xQZnkSJ4lploGdSpa4wVhgF
         j/dZQteY27n9NNgzCdY2sCjhqOot5uUDJVsYPadmmBw6bAZYuLjGk+evMaADp7+Ch0uZ
         gK7sTYeoDgixamXrGwcvok0DJs4Tn/A/siAqPo74EUmm+R+gqNDXCtPr0eq5m79Ogvn2
         vvuw==
X-Gm-Message-State: AOJu0YxSpc+c7JI5jkS3QyZexPAaHfchvOHJAmH1LS3/l2SZIVsRau9Q
	8MK/3Ttz9ElbCoXGGdKM+Ilw1IoUjEA=
X-Google-Smtp-Source: AGHT+IFjkIPZFPVCdxfvqatTwh8MFdK7DP5Xy/0Gi0FxxYWIWlx8+qlht6rsHYvpEqQCFIpTxFJ5hQ==
X-Received: by 2002:aa7:db47:0:b0:525:69c8:6f51 with SMTP id n7-20020aa7db47000000b0052569c86f51mr6187478edt.35.1692698447844;
        Tue, 22 Aug 2023 03:00:47 -0700 (PDT)
Received: from [147.251.42.107] (laomedon.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id b4-20020aa7d484000000b0052a1c0c859asm611202edr.59.2023.08.22.03.00.47
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 03:00:47 -0700 (PDT)
Message-ID: <4c815cd4-ad8c-4053-ae40-5e75010d6256@gmail.com>
Date: Tue, 22 Aug 2023 12:00:46 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Milan Broz <gmazyland@gmail.com>
Subject: Re: Unlock a Veracrypt/Truecrypt partition which uses a keyfile with
 a passphrase from /etc/crypttab
To: cryptsetup development <cryptsetup@lists.linux.dev>
References: <CALmZR2OZ0sKRui1Eu1FxQzBCBhvHHXbsHipGq+jfPUcteROS9A@mail.gmail.com>
Content-Language: en-US
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <CALmZR2OZ0sKRui1Eu1FxQzBCBhvHHXbsHipGq+jfPUcteROS9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/23 11:31, Kent Larsson wrote:
> Hi! I have a Veracrypt (/Truecrypt) volume, which I can successfully
> unlock manually by providing a key file and passphrase:
> 
>      # cryptsetup --type tcrypt --key-file /.keyfile open /dev/nvme0n1p5 shared
>      Enter passphrase for /dev/nvme0n1p5:
> 
> Only root has `rw` on the key file, a binary file of 64 bytes.
> 
>      # ls -l /.keyfile
>      -rw------- 1 root root 64 aug 21 08:09 /.keyfile
>      # file /.keyfile
>      /.keyfile: data
>      # du -b /.keyfile
>      64 /.keyfile
> 
> Is there a way to unlock a Veracrypt (/Truecrypt, `/dev/nvme0n1p5` in
> my case) partition that uses a key file with a password in
> `/etc/crypttab`?

Crypttab should support keyfile as standard option (3rd option), see
https://www.freedesktop.org/software/systemd/man/crypttab.html

There was even dependency mechanism in systemd that mounts the device
with keyfile if not yet mounted.

(Crypttab is processed by systemd not cryptsetup itself. Ignoring
the old crypttab processing - but even there keyfile option was present.)

Milan

> 
> I have tried constructing a file with the structure
> `{passphrase}{newline}{key file contents}` and manually using it to
> unlock as above, but I still got the passphrase question. To create
> that file, I did the following:
> 
>      # echo 'mypassword' > /.keyfile_psw
>      # cat /.keyfile >> /.keyfile_psw
> 
