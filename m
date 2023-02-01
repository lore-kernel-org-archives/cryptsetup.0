Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5485780F
	for <cryptsetup@lists.linux.dev>; Wed,  1 Feb 2023 07:16:38 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id u21so16680717edv.3
        for <cryptsetup@lists.linux.dev>; Tue, 31 Jan 2023 23:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R45frqFT29SKARuDX1z7JAJmZfP4znSZvaaKB0CgWyU=;
        b=I8VsLFllhUZ4NYk9pI4iJsFMxj1qgS9a9kcjUqrdMSUEP29P+3cYa0E52p3nYAGisd
         HQk0HD+c78z+HMIJE/IhyKvaaUObX0ka5FeROMjrcq/OmYnVoTsnswB0tciscBiCFlVa
         H5DAOMT/78m4eQG/3uV0CbKkm+D7HONN3V6YYODCrahM971irtOhnDbk2Gdmhe6gW73o
         0M7zqOxzZgpeDh6GPnmoOjGuwdugfsYaVLulhCLtpf81OLQk5Qkp0arDdw+N70xzvR3b
         WucidC2VUZjoAa30wt8day7LrVdjC64419w9LflI1AupwF7Q+e7izAwhYQnEhvzY+UMj
         Wp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R45frqFT29SKARuDX1z7JAJmZfP4znSZvaaKB0CgWyU=;
        b=vgbTYMOYUylq9GanyUXN/1N1uqSZP7uy0T3pJR7LUC01+xxL9w3RjLaoyLZk7MV0Ro
         5xl5Zp7hKhrvJlqxpqn7j3cCZu6PeRR75jF35ydSoxTQuVpMWNrHX873lrHRCyXgqY2T
         KD0A9WLTbzHGOg0L6lx99D2+xwA3SCXum84aPXHF5p2/QcQRKlPTvQ6O+XSdpp3mynab
         EMOcULkN18VxCZg0IL44CSTuOA6i8VhNVFl26rytsBxcEOiU4KHGiiqArp1MJMePeowO
         x3eiB7Eba8gCGJkoqsmKPLqox6WbIsfNgdW17Wv6JLpSRLL+R8iQ9ZjH205lhSNoZVmu
         PcPg==
X-Gm-Message-State: AO0yUKXqI2n/ZT/5grLTSfbeoTHzPqngpmn44XBfAZmuWeCa+VxcaUYC
	VMUU7PI8E42YBMXNyLIC8A8=
X-Google-Smtp-Source: AK7set9cD7dQ+AcfbpzhwD7YcnJu5DL8ph/ifcUyvUr4lAc8OoIqv3KeEmNlIE+T6nJzNoTDfxV0mg==
X-Received: by 2002:a50:d593:0:b0:4a2:51db:c7d2 with SMTP id v19-20020a50d593000000b004a251dbc7d2mr917543edi.15.1675235796394;
        Tue, 31 Jan 2023 23:16:36 -0800 (PST)
Received: from [192.168.2.30] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id dy25-20020a05640231f900b0049e210884dasm9243703edb.15.2023.01.31.23.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 23:16:35 -0800 (PST)
Message-ID: <45de080c-7f2d-ceb1-e418-aceab2cb9d92@gmail.com>
Date: Wed, 1 Feb 2023 08:16:33 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Mounting a device with messed up integrity header
Content-Language: en-US
To: generalmanager@mailbox.org, cryptsetup@lists.linux.dev
References: <af9ae892-0993-8519-c96b-4f64dca84ea7@mailbox.org>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <af9ae892-0993-8519-c96b-4f64dca84ea7@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2/1/23 03:38, generalmanager@mailbox.org wrote:
> Hi everyone,
> 
> I'm trying to mount a partition which was created with "--integrity
> aead" when the integrity feature was brand-spanking new.
> 
> Unfortunately integritysetup doesn't recognize the integrity header anymore.
> I can unlock the volume with
> 
> cryptsetup luksOpen /dev/sdb1/data_crypt
> 
> which creates the (symlinks to) devices containing the data and
> integrity information respectively:
> 
> /dev/mapper/data_crypt (containing an ext4 file system)
> /dev/mapper/data_cryptdata_crypt_dif

Kernel will not activate dm-integrity device if the header is not
available. What is in the kernel log?

Also full cryptsetup --debug log is needed here - could you paste it somewhere?
(Better not spam the list, just send link to the log on pastebin or so.)

...
> Data segments:
>     0: crypt
>    offset: 16777216 [bytes]
>    length: (whole device)
>    cipher: morus1280-random

MORUS cipher was removed from the kernel long time ago
(as they did not want to support it).
See https://lore.kernel.org/dm-crypt/6cfcaab8-70c4-5f78-2483-ca53ce89ef8f@gmail.com/

So either you have very old kernel, or something should scream that crypto cannot be initialized...

> As I wrote in the beginning, the output of
> 
> integritysetup dump /dev/sdb1
> is:
> No integrity superblock detected on /dev/sdb1.

This is not integrity standalone device, do no try to use integritysetup,
It will not work (even if you use the proper embedded integrity header,
you will not able to activate it as used AEAD cipher is processed in dm-crypt.

> 
> Which means that
> 
> integritysetup open --integrity-recovery-mode /dev/sdb1 data_crypt
> data_crypt
> 
> fails with the same error, just as using --integrity-recalculate does.

These options cannot bu supported with LUKS2. (With some exceptions
that requires manual table load.)


Milan
