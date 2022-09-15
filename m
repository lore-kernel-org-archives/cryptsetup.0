Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09AA3208
	for <cryptsetup@lists.linux.dev>; Thu, 15 Sep 2022 14:55:08 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id lc7so42843046ejb.0
        for <cryptsetup@lists.linux.dev>; Thu, 15 Sep 2022 07:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=RY58nSqgCrzl/ggQFmaJ/U6bkGC00X7cdBzxEf4E+H8=;
        b=X0xB/430xRpOqQC6hAGamGt2XBD6SSIqprryjSEQYFXWrUCB0TkBc7JbnvI7IoFU0F
         ZEi1O3hQ6ehJIsNQ7tpfXVet25s9V+wJr1bAY2M2B7lh8nCTk7FWlunXwfjEXJEDQ9on
         Mp8kzXt/LSSLGfSDAeidpPow5zhgL15g81BDAJ4ugKBUjpFjbo+XfUSQflh5Pmc8DR7S
         1uQJQJOf9+OrNOy9Of3uIVPfpiSBuvxXO5UoIHFDK3EIIhhxT6ZSTc0ORj4z1pIM681p
         m8XBsRWRKAW+ypl2luFc54e4rRYJscuYGaEtzn4vYHImvjeoX/ZryONOyQKvOonajB6T
         LHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RY58nSqgCrzl/ggQFmaJ/U6bkGC00X7cdBzxEf4E+H8=;
        b=gizle58jJGc4VSKe2Vuo0cEap/5ACvC5FEZJ97lf46SxpnQjYa88ujKMcvMCNjUPc0
         sjRNtXfjigKJWuOAnQ0cXLZkRatQKKUynXGVVE0HvjXdjY4CA59jVfkfkH6gjOakDUIC
         +4xuL4uyuiWZ5DEhuSBkI7/5Jbba5A963arv7a7m0eMQDP9wNuYzVlZ8OlFppugj1g2/
         ZZengnonsi7GGuMgHFTIyxFBFpq5cIhCHceyyXLXGUv41XqQpJiVwRaB5fEnNVQVoanq
         mDnBwV33xJ1FTGymUhY5MKeRh/dOTGK2EgTgvA/Zaux/OmRSwklQk5f/DVQM3kQo3mG2
         83rw==
X-Gm-Message-State: ACrzQf3l3U+S9iTi44K8Cw5IUdodFu68BnLeKfLefxHTZ6FU9D2A4Y/b
	4LkDtyzLIbJcVqPNzYXDIKk=
X-Google-Smtp-Source: AMsMyM6tS+qxpxYF4l4fp5O7ycWwBvzoZOSxEX7dqGKRmQ2nqvMvZjxUnsZsfrwMSpNqJx283oFJlA==
X-Received: by 2002:a17:907:c1d:b0:77e:b61e:f0c5 with SMTP id ga29-20020a1709070c1d00b0077eb61ef0c5mr241847ejc.457.1663253706919;
        Thu, 15 Sep 2022 07:55:06 -0700 (PDT)
Received: from [147.251.42.105] (nbbroz.fi.muni.cz. [147.251.42.105])
        by smtp.gmail.com with ESMTPSA id gu2-20020a170906f28200b00718e4e64b7bsm9101153ejb.79.2022.09.15.07.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 07:55:06 -0700 (PDT)
Message-ID: <4058ae1f-3d8a-aecc-5d96-abf15e78c9ed@gmail.com>
Date: Thu, 15 Sep 2022 16:55:05 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: performance and threads
Content-Language: en-US
To: =?UTF-8?Q?Krist=c3=b3f_Csillag?= <csillag.kristof@gmail.com>
References: <CAEBTHXYF+90eqqOnrW7M9BjiGomBCqj43xbQ47WBNam0-krbAA@mail.gmail.com>
Cc: cryptsetup@lists.linux.dev,
 device-mapper development <dm-devel@redhat.com>,
 Mikulas Patocka <mpatocka@redhat.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CAEBTHXYF+90eqqOnrW7M9BjiGomBCqj43xbQ47WBNam0-krbAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

little bit late reply, but as I struggled with NVMe performance
with LUKS on my recently updated notebook, I add some notes here.

It could apply for your config too, but as I sometimes see similar reports,
it is better to have it on one place (also cc dm-devel as Mikulas
helped me to debug some things).

On 05/09/2022 05:52, Kristóf Csillag wrote:
> Short summary: reading my encrypted is a lot slower than reading it
> raw, while the CPU is underutilized.
> 
> Detailed version:
> 
> I have a RAID1 device, consisting of two identical NVMe devices.
> On the top of the RAID device, I have LUKS encryption.
> 
> These are the read speeds:
> 
> - Raw device read: 2,3 GB/s
> - RAID device read: 2,3 GB/s
> - Reading from the encrypted device: 1,6 GB/s

In general (applies both for reading and writing performance issues)

- check that kernel really uses AES-NI acceleration
   lsmod |grep aes should show used aesni_intel

- for NVMe, always use 4k encryption block (--sector-size 4096 for luksFormat).

   It should be autodetected, but many NVMe lie and show 512B physical sector,
   so you need to overwrite it.

   If you have existing LUKS2 device, you can use online reencryption to switch it on
   existing device (even online).
   It needs to reencrypt the whole drive, so it will take a long time.

   BE SURE no fs above uses 512B block size, though! (otherwise it cannot be activated later).
   We try to check it before reencryption starts, but if you use more complex setup like LVM
   above, it still can run it and cause unusable fs.
   (XFS seems to set 512B blocks; ext4 seems to use 4k block even over 512B sector drive.)

- if the performance is still is not optimal, you can try to use some performance flags.

   You can switch them on/off them over active dm-crypt device by using "cryptsetup refresh" command.
   cryptsetup refresh -perf-no_read_workqueue --perf-no_write_workqueue <active device>
   (and similar flags, see --perf-* flags)

   If it helps, use --persistent option to store it to LUKS2 metadata to be used by default
   for that device.  (see "man cryptsetup open")

For writing issues, like random freezing etc, try also:

- enable discard (both for LUKS device and filesystem)

- and mainly, check your HW...

Some (cheaper) NVMe behaves strange. I had 2TB NVMe that after copying a lot
of data keep systems regularly freezing for a few seconds.
CPU was doing almost nothing, it spent time waiting for NVMe IOs.

I tried several things (even patching dm/dm-crypt to limit IOs). It helps only slightly.
Finally I found that it is just strange NVMe - after replacing it with better one
I have no problems even under extreme load and everything running over one huge dm-crypt.

No idea why dm-crypt amplifies such a behavior (I am sure it can be reproduced
without dm-crypt too, just with some specific IO load). I expect there could be some
internal compression of data or some optimization that is jut not efficient
with encrypted data that cannot be compressed.

So the conclusion is that often the problem is not in performance or
parallel processing of encryption in dm-crypt (that actually works quite nice)
but with NVMe drive itself.

Milan

> 
> As you can see, there is a pretty serious performance penalty for the
> decryption.
> The cipher running is the default aes-xts-plain64 cipher.
> This is an AMD Ryzen 9 5900X 12-Core CPU, so I'm not sure what this is.
> What is even more interesting, is that the CPU doesn't seem to be all
> that busy during the reading. as far as I can tell, I only get 4
> threads of kworker / kcryptd, and their total system load is less than
> 100% (of 1 core.)
> 
> So I'm getting the impression that even though decryption is a
> CPU-bound process, my CPU is still underutilized.
> 
> Is this interpretation correct? If yes, is this to be expected, or am
> I doing something wrong? Can dm-crypt be configured to run the
> encryption on more CPU cores, with better performance?
> 
> Thank you for your help:
> 
>      Kristof Csillag
> 
> ps. I'm on kernel 5.19
> 
