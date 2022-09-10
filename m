Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80596A40
	for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 07:27:10 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id n23-20020a17090a091700b00202a51cc78bso1161535pjn.2
        for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=x/MDF86QDcfZjHjmskg9dOPrxByx2NsrzJtjEyRspYk=;
        b=Ko+OYUfxsWNjvxlzoob3bf/O8UsK4cFzG38KdlLb8vEy/RSZoZ7Hi1Zsh71k1m/GLr
         JCgIOL+rpN2Vbb0YkJGbYxQ5nwz1tJJBQx2FxozOUDG2OH4rlTrNaqgp7ob2Gy+39X9T
         rAfKcF3reMqiBKL79dl8AKDHmyoz4nhYaIOY1uzSMiXNppoGqdrMV1Tfmlgjd1GwH8UB
         0g3ctdQVVnyxcQ8dGt+E1+2YESB9gCG6QPMi4c4lUKhkWrnYqf2S8FH+2glfOVGOcbbz
         IhrwN+5vzgxRxAzt24G6G6/NTtlG+FDfyE36/B+PNQNHjLJ5DaK2Bpn+y5i6W6gMqTIc
         SWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=x/MDF86QDcfZjHjmskg9dOPrxByx2NsrzJtjEyRspYk=;
        b=rqlPgdVNaq8ZM/ZU8SGB5lVfX6i58zhBQzY+DYeix6VoCs1CU9vNaEgy62wJk5GTIV
         5vk2CDlxJk9n6FWuPXtU3FcRs2ZDgsxXe1bw9tY4kOEJY0zXFig2EjeGAJZ3yBAZ5UuQ
         Opz86EEA5aSbRemwtD661M0n94Iiq6KiAn7HAp3CQeKhPSZ8ujhXC8+egs6zw8c3vUKB
         jnEoeBhjLLBEhGBzu05nAOcPkFodMRKizo+4m7TZ/N0oaRfkqbapKKu2Tj0uQAbPUdGP
         nBlgEmcupkFWuRS2v8prh+NvBXsPlXqzzKaGECD4SBfDCzlbRlPx6NrGyfgJi1z2IHFR
         2ZdQ==
X-Gm-Message-State: ACgBeo0j/E47/mx8w6lkKx82+vr+yvpWXUBrM+zreu1gPBzH1dWjYThC
	jDOVjwHlmcSpXa7IAEIW/okJWgPUCZ5WJxZ4b14=
X-Google-Smtp-Source: AA6agR5RGNwYVMOmkAIZtMBeCf4FFvuXc6yknelF41iYXtEx5XlRvC6ZaDmvlrffeAdN6FP9618RuYdELNvKHNWUxS4=
X-Received: by 2002:a17:902:f7d2:b0:176:ca6b:eadb with SMTP id
 h18-20020a170902f7d200b00176ca6beadbmr17436098plw.173.1662794829802; Sat, 10
 Sep 2022 00:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACHosL-Nxs5dHJddw8RjqnK4d7OewzA2FT6G1ZQcAhw=PzLLpQ@mail.gmail.com>
 <7f403984-bd0d-9b75-d0eb-0cacbb41810d@gmail.com>
In-Reply-To: <7f403984-bd0d-9b75-d0eb-0cacbb41810d@gmail.com>
From: "doffloster@gmail.com" <doffloster@gmail.com>
Date: Sat, 10 Sep 2022 10:26:53 +0300
Message-ID: <CACHosL8YcOXCouZvhTX4rn_F7buVj7tdiefEbHvgGwbfC3t-CQ@mail.gmail.com>
Subject: Re: sha256 in "AF hash" despite using sha512 during luksFormat
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Milan,

I appreciate your reply.

Note that I don't have a very good knowledge in crypto.

I prefer sha512 over sha256 only because I've read that it is slightly
more difficult for GPUs to brute force, because they normally have
32bit operations.
Links to two sources (same author, "Thomas Pornin"):
https://security.stackexchange.com/questions/86082/hashing-algorithm-for-cryptsetup
https://security.stackexchange.com/questions/40208/recommended-options-for-luks-cryptsetup

I don't mind the relatively minor performance impact for read/write operations.

> it is much
> faster to try to decrypt some sector where you can detect correct plaintext
> than to use slow digest PBKDF2 here.

Do you mean that in the given scenario it is much faster to find the
LUKS master key by decrypting a plaintext sector which is encrypted
with AES rather than trying to find the LUKS master key via PBKDF2?
Which means that in the given scenario AES is "weaker" than PBKDF2?
Also, I assume it is difficult to find an encrypted sector which has a
high chance to be plaintext when it is decrypted.
I assume that plaintext sectors probably are the least common type of
sector (there are images, videos, executables etc. which easily take
space on the storage )

Best regards,
David.






On Sat, Sep 10, 2022 at 8:25 AM Milan Broz <gmazyland@gmail.com> wrote:
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
>
> The digest hash remains the same. it is changed only if the digest
> is recalculated later (reencryption).
>
> (In LUKS1 there was only one hash algorithm used for everything,
> in LUKS2 you can have different algorihms per keyslots, digest and AF but
> for digest and AF there is no API co change it later.)
>
> BTW SHA512, specially for AF, is overkill, it will not help anything.
> Why do you want to use it there? The whole idea for AF is just to
> diffuse the key on a larger area - any hash algorithm here works ok.
>
> For digest it has no security improvement either, as the input is
> randomly generated key and if you want to run bruteforce on it, it is much
> faster to try to decrypt some sector where you can detect correct plaintext
> than to use slow digest PBKDF2 here.
>
> m.



-- 

Best regards,
David.
