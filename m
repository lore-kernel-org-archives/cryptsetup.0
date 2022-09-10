Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804F4A48
	for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 10:34:11 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id bj14so7164891wrb.12
        for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 03:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MB5t0XHPyObGa8aBnismMR12bz6yrXciL49DzuryAOQ=;
        b=WHctpNLQrR+4ShPEjbyP7AB81hVOqzHisqQA3HpUQULINkRKOWr0ckckFbP/ZmizuM
         AASG+vu8//GKxYzxjKwgLZ30J9ssHv++rFUVj1PYbHDoilCgkSTBbSEVFcNuFBt0lUhB
         xWayXZB4mbz1hMQLCU4QmUr3qjCVm0qRoiKhsAzNrhKbFPTfufujfB3wWqqlSkIMn8yW
         U4eOxuZ8BBIZdFuNEXkEpjSzPScaL0Vu2JNI6leBIMmD0X1kI2sJjaF3ECgpFTdLHZk2
         ACSZqVsDa/by+NNXutzYnkri7xIDgvy+6rTC3Z9NHkrp5blYkl2nyqX6GjonMh8tsxR9
         w15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MB5t0XHPyObGa8aBnismMR12bz6yrXciL49DzuryAOQ=;
        b=L4nzO3cCtJlfwI5G6p6BJBEvUec+jAVUmjqJUsUBCMqehLKBuCFbYMigW+LzTBntT1
         XOfMzEH952Z4EwYN/Nxg+RfdFLYLI84vKpX06ly8wdFeWyOXt89I+Koiwuehv/mIWzYV
         NZqFHqvvvKuaACu9JDCh2vGQLXq1GGSAQEf8vpnk7zXW4UEIqTkTMKmEqek8+GxIiIRA
         KIIp5SRA2X+LfNpaKaf6qRh98xUbi6r0Vk/NHvmIgNrPttAq73S5SS09ccRgLe11VIf2
         wGjwG1kymFPt2nrpYB/F2KPj//4tDEjiC85lmoR77hjl7ORYaOgN0sCVXXoChGX3mwaA
         P3ZQ==
X-Gm-Message-State: ACgBeo2gND6G9NFvQ2tzEJY7jWuGr5hR3wV56ZROsFMx9gVhg7PbUwzs
	T9hW5URk47i2k8i/wJuvBbo=
X-Google-Smtp-Source: AA6agR5SBaWl/Nw0HyQQCSE6o/fXKaIuWa1Kovgr9F4UsGtZ0CJD3xzHtEO/l1O33z4OPsFBRQiKUA==
X-Received: by 2002:a5d:6d81:0:b0:226:e0a4:a023 with SMTP id l1-20020a5d6d81000000b00226e0a4a023mr9800561wrs.660.1662806049655;
        Sat, 10 Sep 2022 03:34:09 -0700 (PDT)
Received: from [192.168.8.101] (78-80-105-246.customers.tmcz.cz. [78.80.105.246])
        by smtp.gmail.com with ESMTPSA id d41-20020a05600c4c2900b003a5c999cd1asm3789279wmp.14.2022.09.10.03.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 03:34:09 -0700 (PDT)
Message-ID: <6f804ddc-a6ed-a784-3ca1-5126b5d8f4cf@gmail.com>
Date: Sat, 10 Sep 2022 12:34:07 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: sha256 in "AF hash" despite using sha512 during luksFormat
Content-Language: en-US
To: "doffloster@gmail.com" <doffloster@gmail.com>
References: <CACHosL-Nxs5dHJddw8RjqnK4d7OewzA2FT6G1ZQcAhw=PzLLpQ@mail.gmail.com>
Cc: cryptsetup development <cryptsetup@lists.linux.dev>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CACHosL-Nxs5dHJddw8RjqnK4d7OewzA2FT6G1ZQcAhw=PzLLpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

And just reading your log...

# cryptsetup 2.4.3 processing "cryptsetup --type=luks2 --verbose --debug --hash sha512 --key-size 512 --header /tmp/header.img --key-file - --iter-time=50 luksFormat /dev/sdb1"

If you want to improve security DO NOT decrease keyslot iteration time!

You set 50ms (--iter-time=50) that will cause all KDF parameters to use absolute *minimum*.
(Default is 2000 = 2 seconds!)

The whole discussion about changing hash is pointless then...

m.

On 10/09/2022 00:50, doffloster@gmail.com wrote:
> Dear cryptsetup/LUKS Team,
> 
> I was using sha512 in the luksFormat command.
> Later I used luksAddKey while thinking that it should be using the
> sha512 hash that I defined in luksFormat.
> But, when I did luksDump, then I noticed that the field "AF hash" for
> the second key (which was added via luksAddKey ; its keyslot is #1)
> contains the value "sha256".
> I expected it to contain sha512.
> Notice that keyslot#0 has "sha512" in its corresponding "AF hash" field.
> 
> Attached script which reproduces that issue, filename
> "reproduce_commands_without_hash.sh".
> Attached output of the script, filename
> "reproduce_commands_without_hash.log.txt".
> 
> Did I miss something?
> 
> Best regards,
> David.
