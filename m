Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A813D74
	for <cryptsetup@lists.linux.dev>; Sat, 17 Sep 2022 18:15:30 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso2934086pjk.0
        for <cryptsetup@lists.linux.dev>; Sat, 17 Sep 2022 11:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8VmOny/RuViKm9WKKjvyED7Murb+6oTs3XyedVk4uXQ=;
        b=e46hHSiUi2ZOIwK0e4YAh+vXf20FEpXz/acf0dq7+9G16Si4rCsw52czNtdOktXYvu
         p6N3zhYkepyrkljocAWEyHtNdFIQF+nBqak7SvH9LHJ4zgyfCU8qXBXF/yeP2a317FZh
         /LYYBr5/psrNUk+Rf/Rvm/o8FnuX+wh0TZGN1anJAyKUeXByItsd6JR3HrQj2pMmkA8F
         u9PsxAyMgoTM4MWaC2C9Dp6DTbugMOHGpEpFeB5UDQSnyTMXr5aBUh0IrQpD0NZSXj7x
         XO2bVR6B9gsDY1078q54bT3AqBPZbI5VyqT44WWm1aaEveQ4bOfvoy1N/CjPDAqGh4U9
         nxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8VmOny/RuViKm9WKKjvyED7Murb+6oTs3XyedVk4uXQ=;
        b=7aI/sd9zSu/9BbwX2Z4eql/4MNajtZklUBybyoshqHD8gGdbY4vHcVJp1sOrLp0ISQ
         xX66wqE7fwLrbJnERxC1S+ZuezI6zCS6c2bpAlaoOSbiFTYPQh6jGm61dxW57nx66R5U
         Lc6SKitDguXOciwSjwlLRbqH73h+QPtgoKMsLPB69IXYrm8zK4EpD25iTTeQJeLZMSSs
         gQCrAmYhVDgDmBJXsZ7FCmwbETaW6wyfr886SHxxvaEqY0rRfXQkJayI+f6BH2i4B+Sk
         FJ38DSminU0v9w+mvR5d3WQd6z1cPp9rwK9KyKEzcsUX1kz2JeEdZaQzVlCR495KuN/m
         RATw==
X-Gm-Message-State: ACrzQf2e7RbXhnrqZloWgeMVRlUkbwwOOVN2k+ewJgf9DNrIIDpy8ikj
	NxRwQYnGmhsToy3RT3tjzEZHycJdppSUvRSQNhfjsbMnr40=
X-Google-Smtp-Source: AMsMyM6uHioC8onNJ1Ii80uXyqNC2aw/VoQiHbHzpKFzXoNNMpFdGJw/q0kuTj+sDx7zCqfOW6iKcXny9S4Sk5aKf90=
X-Received: by 2002:a17:90b:3e87:b0:203:19a9:e534 with SMTP id
 rj7-20020a17090b3e8700b0020319a9e534mr11397398pjb.222.1663438530220; Sat, 17
 Sep 2022 11:15:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACHosL-Nxs5dHJddw8RjqnK4d7OewzA2FT6G1ZQcAhw=PzLLpQ@mail.gmail.com>
 <7f403984-bd0d-9b75-d0eb-0cacbb41810d@gmail.com> <CACHosL8YcOXCouZvhTX4rn_F7buVj7tdiefEbHvgGwbfC3t-CQ@mail.gmail.com>
 <8d17f923-271f-d0a2-f28a-5cbc910b6513@gmail.com> <CACHosL_rLDJss0N1rmszEEtsaxpTdXwV9mXHbTNMWO62AauYTQ@mail.gmail.com>
 <aef47dfb-e253-114e-e4a1-fa6c4bf369f1@gmail.com>
In-Reply-To: <aef47dfb-e253-114e-e4a1-fa6c4bf369f1@gmail.com>
From: "doffloster@gmail.com" <doffloster@gmail.com>
Date: Sat, 17 Sep 2022 21:15:14 +0300
Message-ID: <CACHosL8fho_0m=cgCzL69Bnp5TG0CkB0p48JvkJiN1CTRABC-A@mail.gmail.com>
Subject: Re: sha256 in "AF hash" despite using sha512 during luksFormat
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup development <cryptsetup@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

I understand.
Thank you for all the help!

On Thu, Sep 15, 2022 at 5:17 PM Milan Broz <gmazyland@gmail.com> wrote:
>
> On 10/09/2022 14:53, doffloster@gmail.com wrote:
> >
> > Do you mean that the choice of 'sha512' for the flag '--hash' is
> > reducing the security strength?
> >  From what I could understand, it shouldn't reduce the security strength.
>
> No, I said it will not increase security (while it can increase processing
> time and keyslot storage space).
>
> > I executed "cryptsetup --help" and found that the following default
> > values are defined:
> >
> > "
> > Default compiled-in key and passphrase parameters:
> ...
>
> > As far as I understand, for LUKS2 the default PBKDF algorithm is
> > 'argon2id' and default hash is 'sha256'.
> > So, I only changed the default hash to 'sha512' by using the flag
> > '--hash', though I didn't change the PBKDF algorithm, so it should
> > stay the default value, i.e. 'argon2id'.
>
> Yes, it is visible in the luksDump output.
> SHA hash was used only for AF for that keyslot.
>
> > Also, I didn't find any mention of the 'Blake64b' hash.
>
> Sorry, my mistake, I meant Blake2b; it uses 64bit words.
>
> See Argon2 RFC:
> https://www.rfc-editor.org/rfc/rfc9106.html
>
>
> Milan



-- 

Best regards,
David.
