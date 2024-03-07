Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E958527D
	for <cryptsetup@lists.linux.dev>; Thu,  7 Mar 2024 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709813474; cv=none; b=px40sPGE84McWTxruNRVQ0tcGdzSrAm4Q0BbZgNmxf7dE/fZTx+n2J9AdRT4Kv4Pb26UbbIx6+i3fH2t3TOsbI+VIlJ61GrlPIYXwekk4wrk36JlElMMZSs5PCxD1X5RdUCbWQ7dQtx12weWlHGk+FClK6Hs+Z69gSjzOTlBr8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709813474; c=relaxed/simple;
	bh=dQM3S5xwH0cscOeU/WGPEFAjY1b+p6gPT+ZApOAWJ04=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=fravBA+T3Xr5VEpzR0sMKIkrB0YQmlB9oYj/MyJuULWkaNqPzYdW4H/883/cDfdQdmAZ1VYqDFoeEdeJBcH2iAUdXTGjxe7AELFmkvrp1pACdohrLlad5y9JP7KO5tgiK3xEsSygcfYOfD2JOnG7ta/irwp+J8sAuzqoxAHbkuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VWqFTNus; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VWqFTNus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709813472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K4ajdZ5te8DgjvyTuxlbJ97LeVQWjq5vgRxWAU3rP8s=;
	b=VWqFTNus4ZYxbdNqUiU0H5DqBjaMFyDh6saSLhZI+F8pUIrJkPzeKOgHsxyhr/Wb9zGVbi
	jwNB7r5CQu3iQCYgg+E73hMflBo/BwaoklGq7tISUFksbSaff2MPIe1/Y++AQLbvjt222T
	7mZ40/+ay7LNueWWEU/tp16hgOFMEns=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-ZkKAFMSDOS2Hgwxw4cqjnA-1; Thu, 07 Mar 2024 07:11:11 -0500
X-MC-Unique: ZkKAFMSDOS2Hgwxw4cqjnA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5134e56c6c8so602629e87.3
        for <cryptsetup@lists.linux.dev>; Thu, 07 Mar 2024 04:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709813468; x=1710418268;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4ajdZ5te8DgjvyTuxlbJ97LeVQWjq5vgRxWAU3rP8s=;
        b=iSB6UMT2RyBjv7LvT00GZsWOSmBKj1DZ44diVD+6F/6KxbuJAcPAMTGTZb257ZujBy
         yPn9Q5HB3Bb/wc0X//xVLy3OxCzeHzMLunUrtB/YMHp6Cw1l591lfMi/kNtRxf0SsZQ+
         qx13IX2X2V/ip10ZIcWCrr8CA7UEoV4PLexj+mA/RyLI+7qzD/vWUc6XJzK3FCrmi2xZ
         U2ZJQ/5VyV5jmbOj9+1DzN57e6HXnWAZ5FCOi21vQKbt1ubGZa1yMkKZni2XoA5hdHt1
         OXDfDa6+zrn/Xu6wXdhZyT9+tfBsPt9xxn70q72leIAg6OIjopBUYSOUlMmuM7unZuGN
         IuUg==
X-Gm-Message-State: AOJu0YxNptUjnA2iSN0QRFHJhlK00boSCOIjwJa+mjMzkdCqIjZDCF/Q
	1KZMR25f4SuHHUkw+qeTClr7GANY11Qi+JAo7x6KG/i6/lFn51xGTSq8l0vCqYRIKJwO/CiR2Oa
	26wDlupXNeWpw6ta8gHds69kodLP8aZO88X1C8Zmw1A/yS0rilAKiy7Lr7b7U+CFdNcMOv+5d/Y
	diztFwaFn1Uw97K4Q7BWAHn+Jven5JMdPZysd73GLf
X-Received: by 2002:a19:914c:0:b0:513:1f3f:3fef with SMTP id y12-20020a19914c000000b005131f3f3fefmr1342542lfj.1.1709813468647;
        Thu, 07 Mar 2024 04:11:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3K4700430aP3RvZq2LyYIUvQSOA0ucxPRNK8Yw42Ncx/PgxwAcrW7yes5Z0a2J3FGjlj78Q==
X-Received: by 2002:a19:914c:0:b0:513:1f3f:3fef with SMTP id y12-20020a19914c000000b005131f3f3fefmr1342531lfj.1.1709813468178;
        Thu, 07 Mar 2024 04:11:08 -0800 (PST)
Received: from [10.43.17.51] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id s16-20020a05600c45d000b00412f016a151sm2528525wmo.9.2024.03.07.04.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 04:11:07 -0800 (PST)
Message-ID: <1155f74e-5328-4a1f-9b73-d22093ed8261@redhat.com>
Date: Thu, 7 Mar 2024 13:11:06 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unexpected behavior of reencrypt performed after partition resize
To: cryptsetup@lists.linux.dev
References: <a27e8008-9a85-4218-8d20-d1d56fa73671@gmail.com>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
Cc: =?UTF-8?Q?Aleksander_=C5=81ukasz?= <allllllx@gmail.com>
In-Reply-To: <a27e8008-9a85-4218-8d20-d1d56fa73671@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I've tried to reproduce it but so far with no luck. More question below:

On 01/03/2024 13:27, Aleksander Łukasz wrote:
> Hi,
> 
> I'm trying to debug a mysterious data corruption apparently happening
> during cryptsetup reencryption step that follows partition resize.
> 
> I can deterministically reproduce the following behavior from the
> initramfs boot stage when reencrypting root partition:
> 
> ```
> BusyBox v1.35.0 (Debian 1:1.35.0-4+b3) built-in shell (ash)
> Enter 'help' for a list of built-in commands.
> 
> ~ # while true; do \
>   >     (echo -n "hello" | cryptsetup open /dev/vda4 test ) \
>   >     && dd if=/dev/mapper/test | md5sum \
>   >     && cryptsetup close /dev/mapper/test \
>   >     && (echo -n "hello" | cryptsetup reencrypt /dev/vda4) done
> d53129dd093a5ac0be99995bd5e46edc  -
> 4958175+0 records in
> 4958175+0 records out
> Finished, time 01m28s, 2420 MiB written, speed  27.5 MiB/s
> c4d10b8b556fe4ea1c2430f866b6aa76  -
> 4958175+0 records in
> 4958175+0 records out
> Finished, time 01m25s, 2420 MiB written, speed  28.4 MiB/s
> c4d10b8b556fe4ea1c2430f866b6aa76  -
> 4958175+0 records in
> 4958175+0 records out
> Finished, time 01m30s, 2420 MiB written, speed  26.7 MiB/s
> c4d10b8b556fe4ea1c2430f866b6aa76  -
> 4958175+0 records in
> 4958175+0 records out
> Finished, time 01m34s, 2420 MiB written, speed  25.7 MiB/s
> c4d10b8b556fe4ea1c2430f866b6aa76  -
> 4958175+0 records in
> 4958175+0 records out
> ```

Would you mind sharing whole vda device partition table _before_ and 
_after_ the aforementioned vda4 resize? The dm-crypt device is unaligned 
to 1MiB (not an issue at the moment), but that's what I plan to focus on 
with my tests.

Also, please share a LUKS2 header dump (luksDump command) output for 
luks device before and after the first reencryption run takes place.

> 
> As you can see, first reencryption changes contents of the LUKS
> container (as read via the dm-crypt mapper) and all the subsequent ones
> do not (which I would expect to always be the case).

Would you mind completely skip the reencryption step and just overwrite 
the device with data read from the same device? But write directly to 
vda4 (that's what reencryption actually does).

First lets try without direct flag (I skip 16MiB, default LUKS2 header size)

dd if=/dev/vda4 of=/dev/vda4 seek=32768 skip=32768

or alternatively with direct flag like (again this assumes default LUKS2 
header size 16 MiB).

dd if=/dev/vda4 of=/dev/vda4 bs=1M seek=16 skip=16 iflag=direct 
oflag=direct,dsync

> 
> I can trigger this behavior by resizing /dev/vda4 partition just before
> booting into initramfs, using any of the tools like systemd-repart or
> growpart
> (which extends /dev/vda4 to the end of also just extended /dev/vda). If

How did you extend vda itself? And how did you pass the change in the 
guest VM?

> 
> 
> Also, I've tried to reproduce the issue using disk image file and a loop
> device, but did not succeed - that is I could not force the first
> iteration after resize to change checksum - all were always the same.

This suggests we might deal with something else than a bug in 
reencryption code.

> Any tips on what I could be doing wrong or what to look for would be
> very appreciated as I'm running out of idea
"lsblk -t /dev/vda" output might also help (again before and after the 
resize)

Could you show me also last 2 cycles of reencryption debug output?
Everything in between

# Progress ????????????, device_size 2538585600
# Next reencryption offset will be X sectors.
# Next reencryption chunk size will be Y sectors).
(...)
# Progress ????????????, device_size 2538585600
# Next reencryption offset will be XX sectors.
# Next reencryption chunk size will be YY sectors).
(...)
# Next reencryption offset will be 2538585600 sectors.
# Next reencryption chunk size will be 0 sectors).
# Destroying keyslot ??.
# Acquiring write lock for device /dev/vda4.

But it's all blind guesses on my side.

Kind regards
Ondrej

