Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DCE1398
	for <cryptsetup@lists.linux.dev>; Mon, 15 Aug 2022 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660562569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtGcO7gmTF7t8fO15iFzgHTobOwJ4MBzDZs4ix7+hLQ=;
	b=IY0hf18DPME5sYPRIGwdzhltNj1mX6fod/cikKXgmAGJpQDaSavsFyetCJPanjw9SPNQN9
	Pw334lR+RmN7WPXfID/M18xyJ0Uwr1raSlhAgw1eUUhm4wAsGpqGj2aUmZS8QhHdAA+erS
	anCWZCyiy8RS8qRABu/wq1ztHMrUa6I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-99-yBcoNui3Orinu6vctUjmyw-1; Mon, 15 Aug 2022 07:22:48 -0400
X-MC-Unique: yBcoNui3Orinu6vctUjmyw-1
Received: by mail-ed1-f69.google.com with SMTP id z20-20020a05640235d400b0043e1e74a495so4614274edc.11
        for <cryptsetup@lists.linux.dev>; Mon, 15 Aug 2022 04:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XtGcO7gmTF7t8fO15iFzgHTobOwJ4MBzDZs4ix7+hLQ=;
        b=U/UIMk2q0CgOLVcnGzUKirZcn8d+RTyh5KT7P+6eTUsrSQTJHzUYiahkgIvZxiVUVI
         1bbWUqdmygL8MqnvCWfiuYokl8lpz9cl4X0Crl5ovWpgnkH8hlVc/gPFqPn5bv6wp/ZR
         /g5ysUgGD4e8iZ4hcoZipxHggM1WSBWR34V4yi5v88iw8TYzFnUiS4jYaiYVyJUeUnuC
         Qq9vXltawVxKwlBdATRj6qwnW+nHKJEJ+KEC1AGHoVLovqhrG/Oq5DJSEsLvK/p1C6s5
         zLWk7hBWOg7tFqnzGFEVEk358x5aLsNhRIEmBMRQbjuKiV2QRVegey8Pjo88wQhHXiB/
         UxIQ==
X-Gm-Message-State: ACgBeo0yhtlXawka+atXDOsopjXAc0kNt4nXZadc5VlwDJ61PcG1+7DW
	pUv6h/fu6vPbXg20RTQgAamrNwrrWlUKZSCYpDRe0t5htSsWpnq5iwgp9o6eW2i/u5882c/M07a
	Qv8G+AKyuoiLaXn6wemww
X-Received: by 2002:a17:906:8470:b0:730:ca57:2e83 with SMTP id hx16-20020a170906847000b00730ca572e83mr10203388ejc.740.1660562567134;
        Mon, 15 Aug 2022 04:22:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5fbma9iSf/K4di83UP7E6S+rZZbXysBe03CXPnzLs/wMlOOWZ77giNpbpW5HQh5f/I1nKhVw==
X-Received: by 2002:a17:906:8470:b0:730:ca57:2e83 with SMTP id hx16-20020a170906847000b00730ca572e83mr10203377ejc.740.1660562566926;
        Mon, 15 Aug 2022 04:22:46 -0700 (PDT)
Received: from [192.168.50.106] ([83.240.63.240])
        by smtp.gmail.com with ESMTPSA id d24-20020a17090694d800b007030c97ae62sm3901610ejy.191.2022.08.15.04.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 04:22:46 -0700 (PDT)
Message-ID: <1fb2cfa1-38c9-c9fc-f603-24a3dee78548@redhat.com>
Date: Mon, 15 Aug 2022 13:22:45 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: "doffloster@gmail.com" <doffloster@gmail.com>, cryptsetup@lists.linux.dev
References: <CACHosL8YNzrWpy40ik8Ne6h1KSG7R6eN5cJDyJvs9ZX7yZ=14g@mail.gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Subject: Re: cryptsetup header in-place decryption - reporting about a bug
 alert
In-Reply-To: <CACHosL8YNzrWpy40ik8Ne6h1KSG7R6eN5cJDyJvs9ZX7yZ=14g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12. 08. 22 17:04, doffloster@gmail.com wrote:
> Hi all,
> 
> In this email I'm reporting about an issue that I read about:

Yup, we've seen the issue: 
https://gitlab.com/cryptsetup/cryptsetup/-/issues/614

At the time of the report, cryptsetup did not support decryption of 
LUKS2 devices with header put in head of data devices. The original 
Stack Exchange reporter managed to force/trick cryptsetup CLI into 
operation that even though correctly executed did not satisfied user's 
expectations. Data was not lost as incorrectly claimed in the wiki 
description.

We do not have fuzzy testing for CLI options yet. So from time to time, 
yet another funny options combination might pop up as long as people 
throw random options to it. We do our best to cover it in testsuite but 
sometimes it's not enough.

> There is the following text under the subtitle "Decrypting LUKS2
> devices in-place":
> 
>> Warning: As of 2020, and version 2.3.3, when using cryptsetup to
>> decrypt a LUKS2 block device the program requires you to provide a
>> LUKS --header file. If you do not use the "detached header" feature
>> of LUKS, and naively try to pass the block device itself (which
>> contains a LUKS2 header) as the subject of the --header, cryptsetup
>> will accept this and go ahead with alleged decryption. Afterwards the
>> block device will show up as a LUKS2 device with no key-slots, and
>> your data will be lost.If you try to use cryptsetup luksHeaderBackup
>> as the header file used with --header, your data will be lost. If you
>> try to restore a backed-up header after this faulty decryption, your
>> data will still be lost.

It's outdated since 2.4.0 upstream release (fix was also backported to 
latest 2.3.7 bugfix release).

Nevertheless, the missing decryption feature for LUKS2 devices (with 
header in head of data device) was added in cryptsetup 2.5.0 in the 
meantime: 
https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/v2.5/v2.5.0-ReleaseNotes

Regards
O.

