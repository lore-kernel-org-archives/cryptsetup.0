Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAB910EB
	for <cryptsetup@lists.linux.dev>; Fri,  4 Nov 2022 08:13:40 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id bg9-20020a05600c3c8900b003bf249616b0so2679814wmb.3
        for <cryptsetup@lists.linux.dev>; Fri, 04 Nov 2022 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DipnZN7yC9E+rPPcuwVM4cepZugSZSt4Vwqp3EjwGKk=;
        b=YEdhsqjx0rgjo49YlgQOIHpWSIUUee/cuwNTDNW9UwMdBh3/JhYSCmSmzehpqeEJms
         8YUEgDtK56xxmGHrL9g0+mL32P+ckUBzOrUCKDx5OTromSJ4tIhjcOg2F3WU93sk96ny
         6OSHdE3YBkR2za4tPHmYO73oLNjOTae7xb3gHbl7GCfwO1KYfs3KdVgAyVTTqdxZ0VqH
         rZBG+X14WpI0AcTxXv39NNTOSAucFMEvYHbKj/Vf6SKWcFjTR0gVTtGjV9KKezH5MaUX
         rDErx9cJzzzEzfVMtFpzfAjGSVIvs3LP0FsAwc3LqFnJMbFJZ/uU/smTOeqjGPDj0Hkk
         NV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DipnZN7yC9E+rPPcuwVM4cepZugSZSt4Vwqp3EjwGKk=;
        b=DU9jaza7VgQKrBYnVrkJFKL4PybqBDCT/skMIehm0e75nuqFKrJKy66zZhDqulCCJI
         +JIbB0eQTaenZGlOeq29KvypipdDq3TYf80zXGvRvDH2IPOInTjNDrIqeE3mL0I7qwI3
         Bh9SD6pHWkHlT6QdvZY7lVwNr1yV95+8XihQLSxRl1rej03NQQePKBqQARWk3Lh8lDvj
         Y2D8Da+ivUeO9t+F0ZH3EwfbXqo3OLi7JiohHcGx01AMNQ0fA2RpViM2ikW51srKmiEI
         eXcU8SwGQaNIAGZRnBul7gl1NpUtGt6oJDG7QCHSbFTtUc/a3IX32ixHAQ8lCsvbUVEA
         OXYg==
X-Gm-Message-State: ACrzQf0UF0h7/60Cnv8TiWxjUVB6vE+Pv1gx9Fe0XmJ60SnsEXh/y85O
	nuvMjplEhvJ5BXexCFObKoM=
X-Google-Smtp-Source: AMsMyM5txRaRFXHrL+SoxrXskFA4wLbK64iSqc6QSXWHc17wfRqggwsyGquK+44hXsDPoTIywW2SLw==
X-Received: by 2002:a05:600c:3506:b0:3cf:70ac:7039 with SMTP id h6-20020a05600c350600b003cf70ac7039mr18288806wmq.145.1667549618549;
        Fri, 04 Nov 2022 01:13:38 -0700 (PDT)
Received: from [192.168.8.101] (78-80-27-162.customers.tmcz.cz. [78.80.27.162])
        by smtp.gmail.com with ESMTPSA id w8-20020adfd4c8000000b0023672104c24sm2745811wrk.74.2022.11.04.01.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 01:13:38 -0700 (PDT)
Message-ID: <d99e6130-2373-b8e3-dba8-05a1d5f64939@gmail.com>
Date: Fri, 4 Nov 2022 09:13:36 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Questions about Backup and Restore Strategy for LVM2 on LUKS2 and
 for LUKS1 on boot partition
Content-Language: en-US
To: Arno Wagner <arno@wagner.name>, Lamy Geier <lamyergeier@gmail.com>
Cc: cryptsetup@lists.linux.dev
References: <56bfad6c-2ddc-b095-f57e-b6675ce29cc0@gmail.com>
 <20221104073942.GB12504@tansi.org>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <20221104073942.GB12504@tansi.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/22 08:39, Arno Wagner wrote:
> Just one comment on LVM:
> 
> LVM makes partitiopn set-up easy for distribution installers,
> but it makes things much more complicated. LVM is one of these
> tools that are incredibly powerful, but you should only use them
> if you have a really good reason to, because it also makes
> fixing problems incredibly complex. Unfortunately, there are
> a lot of lazy people out there that will gladly accept a simpler
> job now for a much, much harder job in case of problems in
> the future. This is going on all over the software world,
> unfortunately, because the process of engineering software
> is not mature at all yet.
> 
> So, to be clear, LVM will make it basically impossible to
> recover your LUKS partition if anything goes wrong, because
> if it is used, you need to not only understand the technical
> details of LUKS (relatively sinmple) but also the technical
> details of LVM (pretty complex) to fix anything.
> 
> And that is why I recommend not mixing LUKS and LVM and generally
> not using LVM unless there is a very good reason to use it.
> More convenience in writing an installer is not even a regular
> good reason. Classical partitions work just fine.

While I do not like some LVM concepts, it works very well in simple
scenarios and recovery is sometimes even easier than on regular partitions
(there are metadata backups, revert/restore is possible almost always
if data are still on-disk - not discarded by TRIM command or so).

Many distributions use LUKS/LVM combination by default.

For example, if you need to add space to a partition, resizing
can be really complicated if there is no free space directly next to it.
(Here I would say it is the parted tool that is overengineered and dangerous.)

With LVM you can simple add another segment anywhere on disk to logical volume
with much simpler and safer way (it will even resize fs, if you tell it to do).

I think we should focus how to help with these simple scenarios
(as documentation is often obsolete) than to just keep suggesting that
LVM is useless and recovery is complicated (it really is not if it is just
simple linear mapped volume).

Milan
