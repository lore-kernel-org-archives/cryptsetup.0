Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB57FEDA
	for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 12:57:09 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so7896768pjm.1
        for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 05:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=mZfKHuauH8dpswUht4DhyaeLhlSdGiANeLPSv3bD8hg=;
        b=Kmq5gCBqYiQh/eeIRZ/d/O8tB43D3fMeDaJ8HKdmw5GO/SnrRYi4XwRJ4tCR57K1Ps
         OgN/oiyQJyVDq2N83lQqCC47iOdj+PiBx8X2Np5+lXS6Ai9dDXxHml1labfveXKEMY6h
         eIT5iP8w7FW1HbcUr7ZSEkY7SAcxQfKRx40pR99oSXqMhvW896AKff/MmVmwFKzlQ4xE
         OyP4uT2uumpiqLxBMbOBcrOG8GuQYxCDfdVh1S47jEWo4gJgwYL6XPM+v03z21rAupWy
         +9LKg/XeD5iQG8vOHureZU6OLuv5VJMEPVtzbT7BP+gE6e/IW1cSJJ4uHvkHB0upp9cA
         vumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mZfKHuauH8dpswUht4DhyaeLhlSdGiANeLPSv3bD8hg=;
        b=tNjkIiHhpkERZbUdJoTsKV1g3InVnj/eqW6FYTu1npw9R9zz1jfsz3lSwwf59VtkNK
         zpIhXS9r0mp5XDVTBbVT3L+tS97Qmv+zgAu7/jzABruBSd5IQFsLXN5pprjkn3PVSx/O
         9QKNxSR5oWvNohkKMHMwJUlA5poKSeTiJ4W5gD/C0SIJ1LxGkw8dbhS4N/8dsWE9gqf1
         /UwpOJI8WPeJu/aZ0yc0tF1ETjsSpI6S4WfgMh9uOIRoFoNF4Y9KYf+XMgw+RBNJF1+a
         zzcdd2pBMEuO4Xie5562KPn3MIGs8sdJqzwDwctBTnk6c0eOKQ/aBrJQ1ap3gTjdM5FA
         OQ/g==
X-Gm-Message-State: ACgBeo0swqclDB4AvVmu7RprTtJkNUAIWx0bO1NkBMT4sTNYkbbp1d4U
	cdAMJv2ONa0rHapdEJ2se5NFh3YJJ3tKxn29VEA=
X-Google-Smtp-Source: AA6agR7MyU+XcVPHMyi4XnbyftiCXZ6wl7t3LKPXZx9Y+yqsKJwGaY8JJV+8fHKn4SqHkvzYj3+N65CCzG23oxFmPNE=
X-Received: by 2002:a17:902:a409:b0:176:a717:4d5d with SMTP id
 p9-20020a170902a40900b00176a7174d5dmr17857831plq.148.1662814629443; Sat, 10
 Sep 2022 05:57:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACHosL-Nxs5dHJddw8RjqnK4d7OewzA2FT6G1ZQcAhw=PzLLpQ@mail.gmail.com>
 <6f804ddc-a6ed-a784-3ca1-5126b5d8f4cf@gmail.com>
In-Reply-To: <6f804ddc-a6ed-a784-3ca1-5126b5d8f4cf@gmail.com>
From: "doffloster@gmail.com" <doffloster@gmail.com>
Date: Sat, 10 Sep 2022 15:56:53 +0300
Message-ID: <CACHosL-eTO=N-sLTOquZM+8XUFVx3_2dZXPhwnR+yH-v0S0hoA@mail.gmail.com>
Subject: Re: sha256 in "AF hash" despite using sha512 during luksFormat
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup development <cryptsetup@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Thank you for inspecting my log.
I used the low iteration time just for the reproduction example - in
the script there is the following line:

> ITER_TIME=50 # Just to make it fast

So, I am aware of the iteration time issue.
In reality I use an iteration time which is higher than the default
(default iteration time is 2000ms).

On Sat, Sep 10, 2022 at 1:34 PM Milan Broz <gmazyland@gmail.com> wrote:
>
> And just reading your log...
>
> # cryptsetup 2.4.3 processing "cryptsetup --type=luks2 --verbose --debug --hash sha512 --key-size 512 --header /tmp/header.img --key-file - --iter-time=50 luksFormat /dev/sdb1"
>
> If you want to improve security DO NOT decrease keyslot iteration time!
>
> You set 50ms (--iter-time=50) that will cause all KDF parameters to use absolute *minimum*.
> (Default is 2000 = 2 seconds!)
>
> The whole discussion about changing hash is pointless then...
>
> m.
>
> On 10/09/2022 00:50, doffloster@gmail.com wrote:
> > Dear cryptsetup/LUKS Team,
> >
> > I was using sha512 in the luksFormat command.
> > Later I used luksAddKey while thinking that it should be using the
> > sha512 hash that I defined in luksFormat.
> > But, when I did luksDump, then I noticed that the field "AF hash" for
> > the second key (which was added via luksAddKey ; its keyslot is #1)
> > contains the value "sha256".
> > I expected it to contain sha512.
> > Notice that keyslot#0 has "sha512" in its corresponding "AF hash" field.
> >
> > Attached script which reproduces that issue, filename
> > "reproduce_commands_without_hash.sh".
> > Attached output of the script, filename
> > "reproduce_commands_without_hash.log.txt".
> >
> > Did I miss something?
> >
> > Best regards,
> > David.



-- 

Best regards,
David.
