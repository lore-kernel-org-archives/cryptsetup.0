Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8EF110B
	for <cryptsetup@lists.linux.dev>; Thu,  2 Mar 2023 15:01:35 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id o12so68692106edb.9
        for <cryptsetup@lists.linux.dev>; Thu, 02 Mar 2023 07:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677769293;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9jXzpvMx4EeYPWWkBb6teQeTfSq1FDtu/bQWD3VynI=;
        b=JWywyqR6AP6vPPXSXgcM85kUeEH3VinCgH32n4GdKfRafd/bRVzZcTaYn7SaTvPHQ+
         Qf2tZ2sgTqoPfb7+MjuteUbCxnqGWpaGpQUnF5qiI+pvDLVd/9VHghXtGkbBrTsD99sD
         7nig15VYE2PvIBdtlO1Gd6UmreI/SgHJFJd+BaftzR0qKcOnTj9Xvk5naCA34ozuBkC+
         2+Y/rntVU3pSNnyESeXZ0Yrq8mbZXm8dXzbcO3E5pXFR5K67/vT7f8T5YetakN+LkJaB
         2nb+/RNTiUe96CPkULeDulEPlMVx2jUomNeC7To+cnHcloY9eH1uSsOym4VNzDSFUSUv
         e4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677769293;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9jXzpvMx4EeYPWWkBb6teQeTfSq1FDtu/bQWD3VynI=;
        b=2BT+JgzEeW6id9XFatWp9zPlSyT0wGI9qBofQHbPcQRhHYaUOACps5Idm8Gjb/A4+p
         XhLgKw6yBrNZH0zQOsCsP6umj2zqnhth/V23+osTP7ZA0Q47aAZMj3QCTi/E2crXJO4h
         LtOY4yaPa77jKqGZ0rO3CVE9YU7WPm+uzyAVIRA1nEpxgdH/RgGg0a4bYGjrDOQFCZYj
         9XSd2Z8we5uNslXrFuyitQG3bX7JMxY8howYVRx5n4+GDmySkDy9wMVNakPIfeK+ZsMI
         /ZC8bDaoTWngl4QWzPmaiXYY9RhZpn4/VTgWtlbOoDguL6exoEZMIcP8MuxLl3bhjpsp
         mq+g==
X-Gm-Message-State: AO0yUKVVciBVAKqX9CiSYoMiMXaBfhQnV3wocEXDJ5qbga9nsCDawihB
	O90P7aJEY0Xf2iSWHFnE+bY=
X-Google-Smtp-Source: AK7set+D3sBvX6Z9ztUzcsfLDZKZlchLOfC29KKXbf6ue42m+PCLN3Jz1fCHQ6d7RzdojS750Pglwg==
X-Received: by 2002:a17:906:9156:b0:8d7:6699:3ba9 with SMTP id y22-20020a170906915600b008d766993ba9mr9813161ejw.29.1677769293226;
        Thu, 02 Mar 2023 07:01:33 -0800 (PST)
Received: from [147.251.42.107] (nbbroz2.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id kb16-20020a1709070f9000b008cae50b0115sm7139580ejc.87.2023.03.02.07.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 07:01:32 -0800 (PST)
Message-ID: <64fc6294-ca5e-f7a9-302f-63b09d569586@gmail.com>
Date: Thu, 2 Mar 2023 16:01:30 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: cryptsetup - No key available with passphrase
Content-Language: en-US
To: Lars Francke <lars.francke@gmail.com>, cryptsetup@lists.linux.dev
References: <CAD-Ua_hj1hkymLbyEyT-eNyCj_naiqHqg7nr3nos8tp9XCERDg@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CAD-Ua_hj1hkymLbyEyT-eNyCj_naiqHqg7nr3nos8tp9XCERDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/2/23 15:03, Lars Francke wrote:
> Hello,
> 
> I am trying to setup LUKS (and I've done it like this in the past,
> like...two weeks ago and it just stopped working) and am running into
> the following issue:
> 
> root@archiso ~ # echo 'a' | cryptsetup  luksFormat --batch-mode /dev/nvme0n1p5 -
> root@archiso ~ # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot -
> No key available with this passphrase.

This is just a little bit confusing handling of end-of-line if used with "-"
(see section "Passphrase processing for LUKS" in man cryptsetup).

The first command will create passphrase "a\n" (including \n !) while the second
command will process only "a" (you can to use --key-file=- there for luksOpen,
it has different syntax.)

But just do not use "-" here, cryptsetup will do what needed automatically.
Also batch mode is implicit if it detects pipe input, so just use:

# echo 'a' | cryptsetup luksFormat /dev/nvme0n1p5
# echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot

and it should work as expected (password will be "a").

Milan
