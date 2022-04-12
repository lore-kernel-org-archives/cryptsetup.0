Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20127B
	for <cryptsetup@lists.linux.dev>; Tue, 12 Apr 2022 09:47:10 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id b19so26832100wrh.11
        for <cryptsetup@lists.linux.dev>; Tue, 12 Apr 2022 02:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=iKP47CwX5s+ZIyNVwgZwfHsblxKWOgLB2p7FS1AMCxc=;
        b=N6h8CYjxgjELz/b07A9Si/sjH8pxK05gctsUjjIqZowdZzvTS/S9vca8CguMzbf+gb
         enxDRPYB/QMDzrZKxXgflO5QVy/RrgcM/LmCv+L99CWhuTHd9rJAJHWXFNixDvf5ZTaT
         7ed1qr58NOZNHftFfmtmLY8OSqK7r82XOcvI6sWoKoLe/xsQskL/YQX7oc+t9owW/fbr
         MiAbWbhKJ69dtKaqSTyM+FwVOnJLpNYb+goTVdKt3kgWuOsG1WlbJ74eWHwwaZEkoI+F
         +o3fkXDf74V/cl8qhmT1hnloLodmRifT3cCoJljflERX6hTA2CRpLSmj3vSWq9+bUn93
         Neng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iKP47CwX5s+ZIyNVwgZwfHsblxKWOgLB2p7FS1AMCxc=;
        b=LQmgAc0kmUh6RUFkE64xRIA9V3aHrkZiOnasq/YFQcKHIBlHpz/vQ7D1t4ZG1lZrkG
         TAvZx8babeWPM+uRDJfcpoVq06vKiP6SvOgYM/ikjNlQ7GWWKyBf6MJrXZ9HMOX9Mn2c
         rvvQuUftp0czi0CJSEYEqArlfjMnDliY7GQk9KZuDC/Qti6hj4PtyXZCeQEuqDTUiy9s
         F6iASnDixeEvFSMKphXs0cdIrGgSExDZgHZ/T2eLpzLY8SRSyG0JBdv/0UyNT6XlCfR9
         z3m+QnESjvIZKa/JYj//J3LzL2vs7x7K7Pa3Bw1uwNU0znYd6qGpnyONZVsx2Pw3//+n
         ouYw==
X-Gm-Message-State: AOAM530+zqNbskFAGDDnxpY/gktschLXBCHK5sKTRQxXfk1AqahTqwYL
	xGKl3X7QpZHYiCTygHdoFKjHvSrZy1U=
X-Google-Smtp-Source: ABdhPJyzmk+avrYD7TZNBtWqRwXjx8JdmhqDMxji8AMJqOSczq0VcGm5t+T0y9Tp5Sslqf0U+p4YdQ==
X-Received: by 2002:a05:6000:784:b0:207:a570:b5b3 with SMTP id bu4-20020a056000078400b00207a570b5b3mr8265982wrb.304.1649756828824;
        Tue, 12 Apr 2022 02:47:08 -0700 (PDT)
Received: from [172.22.36.87] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
        by smtp.gmail.com with ESMTPSA id m2-20020a056000008200b00207a6f32833sm5444316wrx.117.2022.04.12.02.47.08
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 02:47:08 -0700 (PDT)
Message-ID: <c5bb5388-d22f-4973-30a5-873d621f1833@gmail.com>
Date: Tue, 12 Apr 2022 11:47:07 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: dm-verity design question
Content-Language: en-US
To: cryptsetup@lists.linux.dev
References: <CAH4tiUts6MVKNv6RVQhPD3fSGruZo=iYpeY1XrbMs-rUx7TLFw@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CAH4tiUts6MVKNv6RVQhPD3fSGruZo=iYpeY1XrbMs-rUx7TLFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jasper,

if it is question about kernel code, the best is to ask on dm-devel@redhat.com list
(you can cc cryptsetup list too).

Not all device-mapper kernel developers are here (dm-devel is official list
for kernel device-mapper subsystem; this one mainly for userspace cryptsetup tools).

Milan


On 12/04/2022 11:38, Jasper Surmont wrote:
> Hey,
> 
> After going through the dm-verity source code for a while I think I
> kind of figured out the general design; on a read:
> 1. Multiple possible problems get checked like alignment, out of range
> etc. Also variables get set based on the request
> 2. The request is prefetched to the cache
> 3. The actual integrity check is done when the bio ends (bi_end_io
> points to verity_end_io which submits the work to verify digest etc
> 
> If this is correct, I have 2 questions:
> 1. What is the main benefit of prefetching here? We know the remapped
> request is going to be executed very soon, so I don't really see why
> we prefetch.
> 2. In verity_end_io(...), we only submit the work to verify the digest
> if FEC is enabled. Why? Can't we check integrity without using FEC?
> 
> I hope my questions are clear.
> 
> Thanks a lot!
> 
> Sincerely, Jasper Surmont
> 
