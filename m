Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188A97FA
	for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 12:53:25 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id t6-20020a17090a950600b0020063f8f964so1133041pjo.0
        for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 05:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=AY1/eyiEeUc7Ho6nQTdz5t7qeqdlmI0Wl82X7GcHVIY=;
        b=pax+k2AbC6KO4oEJ624iH4I+Ju0B7bAZfOS+SDV/SzP8Ng6uAJDOR+cA2W9Kw2Far4
         Ld53VNvnnIdh3rV2hNgiT3SKCXqUSlJH1tTsu/Zh8gHTpEua/QIzBMWOa1D6qcbFt8u6
         FRKMU6oM7Ykpzm7RfsGwF3xS65FHHa0Lw+crRHtzJT8wfp65lR9cbdirHHgknx5HlUHZ
         kIISeh5iYTcNbd78nNxAVwpzLmOpYykLFde6R519OhvBH6RENckMuTuRjSsqKbF6XUl6
         NB4ahbPI30EH4hDcZ1Gr8V58gCO3BiGGcH9RAhjCWv3wFQzoe13iC2SW71I/pKx+i94i
         lrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=AY1/eyiEeUc7Ho6nQTdz5t7qeqdlmI0Wl82X7GcHVIY=;
        b=rbSDG9TNVYACmhDBJPbZichBLXxcv/8SPBqXbWr12oN1mdVX5jm6+DGnpkEFl1OJqU
         AI4AAREj+8T0ECquMOqXB7xXlFYwriRsj1Ft/BHU/qajnmLOcZPknMoRWURyI8WBGxJT
         Slnvxb9ZkoKKIBynRyJOXek5K8/KWXJ4PHvjP7ObqWxt+JA4tHHv2wohsyclWv2AhwaZ
         dT8LkUE9H2e+QEG4KK1zeRIN72S/jHSdBXFvgswW5W66SsQzvHpfaFnYT03Y5O7naPMO
         xkDjKidtCyXgyHR+e4/QZV9KFlDc5fUY6mdc4XPM/z8m1rn5zML7K/0TiFb+M0kfw+LE
         x9Zg==
X-Gm-Message-State: ACgBeo1em1aHfkJkMsTpMNz5F2FGw1cbBLYn0xs3QpMrCCFNHe6peogV
	2sxhJ/1XYaPPOqM5iUv/YxBfS6w+lsrpIGN2Yd8=
X-Google-Smtp-Source: AA6agR6ID7Mz8ATK7Jpjr8jYWkX8Gjn5P7EefVVhrLlvs/N0Ce+icglGh2YJW3WVemKPHq1/0LDjcX60XpURAwMLcBo=
X-Received: by 2002:a17:90b:3e82:b0:1f7:3792:d33c with SMTP id
 rj2-20020a17090b3e8200b001f73792d33cmr14307051pjb.222.1662814404475; Sat, 10
 Sep 2022 05:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACHosL-Nxs5dHJddw8RjqnK4d7OewzA2FT6G1ZQcAhw=PzLLpQ@mail.gmail.com>
 <7f403984-bd0d-9b75-d0eb-0cacbb41810d@gmail.com> <CACHosL8YcOXCouZvhTX4rn_F7buVj7tdiefEbHvgGwbfC3t-CQ@mail.gmail.com>
 <8d17f923-271f-d0a2-f28a-5cbc910b6513@gmail.com>
In-Reply-To: <8d17f923-271f-d0a2-f28a-5cbc910b6513@gmail.com>
From: "doffloster@gmail.com" <doffloster@gmail.com>
Date: Sat, 10 Sep 2022 15:53:08 +0300
Message-ID: <CACHosL_rLDJss0N1rmszEEtsaxpTdXwV9mXHbTNMWO62AauYTQ@mail.gmail.com>
Subject: Re: sha256 in "AF hash" despite using sha512 during luksFormat
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Then it is always better use defaults :-)

Haha, indeed I somewhat agree, though I do want to learn a little bit
and be more aware of my configurations.


> Both are obsoleted for LUKS2 as we switched to Argon2 from PBKDF2 for keyslot
> password key derivation. This is what is important here.
> (Argon2 is memory hard algorithm and uses internally Blake64b hash.)

Do you mean that the choice of 'sha512' for the flag '--hash' is
reducing the security strength?
From what I could understand, it shouldn't reduce the security strength.

I executed "cryptsetup --help" and found that the following default
values are defined:

"
Default compiled-in key and passphrase parameters:
    Maximum keyfile size: 8192kB, Maximum interactive passphrase
length 512 (characters)
Default PBKDF for LUKS1: pbkdf2, iteration time: 2000 (ms)
Default PBKDF for LUKS2: argon2id
    Iteration time: 2000, Memory required: 1048576kB, Parallel threads: 4

Default compiled-in device cipher parameters:
    loop-AES: aes, Key 256 bits
    plain: aes-cbc-essiv:sha256, Key: 256 bits, Password hashing: ripemd160
    LUKS: aes-xts-plain64, Key: 256 bits, LUKS header hashing: sha256,
RNG: /dev/urandom
    LUKS: Default keysize with XTS mode (two internal keys) will be doubled.
"


As far as I understand, for LUKS2 the default PBKDF algorithm is
'argon2id' and default hash is 'sha256'.
So, I only changed the default hash to 'sha512' by using the flag
'--hash', though I didn't change the PBKDF algorithm, so it should
stay the default value, i.e. 'argon2id'.
And indeed we can see these values in the log file
("reproduce_commands_without_hash.log.txt") which is attached to the
previous email that I sent - boths keyslots (keyslot #0 and keyslot
#1) have the following property:
"PBKDF:      argon2id"

Thus, the 'PBKDF' algorithm is still the best for LUKS2 in the
cryptsetup flags configuration that I chose, I think.

Also, I didn't find any mention of the 'Blake64b' hash.

> These are not used for data, only for key derivation and has no impact for any
> IO operation.  (Please read cryptsetup FAQ document, I think many things are  explained there.)

I understand.
I've read the cryptsetup FAQ but will try giving it another read,
perhaps things could be clearer.


On Sat, Sep 10, 2022 at 1:28 PM Milan Broz <gmazyland@gmail.com> wrote:
>
> On 10/09/2022 09:26, doffloster@gmail.com wrote:
> > Hi Milan,
> >
> > I appreciate your reply.
> >
> > Note that I don't have a very good knowledge in crypto.
>
> Then it is always better use defaults :-)
>
> >
> > I prefer sha512 over sha256 only because I've read that it is slightly
> > more difficult for GPUs to brute force, because they normally have
> > 32bit operations.
> > Links to two sources (same author, "Thomas Pornin"):
> > https://security.stackexchange.com/questions/86082/hashing-algorithm-for-cryptsetup
> > https://security.stackexchange.com/questions/40208/recommended-options-for-luks-cryptsetup
>
> Both are obsoleted for LUKS2 as we switched to Argon2 from PBKDF2 for keyslot
> password key derivation. This is what is important here.
> (Argon2 is memory hard algorithm and uses internally Blake64b hash.)
>
> For the remaining use of hash (digest, AF, checskum etc) there is no reason
> to use anything else than sha256. Of course, you you can, but it will not improve
> security of your device.
>
> > I don't mind the relatively minor performance impact for read/write operations.
>
> These are not used for data, only for key derivation and has no impact for any
> IO operation.  (Please read cryptsetup FAQ document, I think many things are explained there.)
>
> m.



-- 

Best regards,
David.
