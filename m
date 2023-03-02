Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ECC110B
	for <cryptsetup@lists.linux.dev>; Thu,  2 Mar 2023 16:24:10 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id n8so5821450qkp.5
        for <cryptsetup@lists.linux.dev>; Thu, 02 Mar 2023 08:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677774249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0HWlTbIDunbCSXyrm7aG3VSDcrZzIMl/fMOyOShZ2ec=;
        b=C9v9TmZTKbOekZFV0Ju1gZYXhKwKSALKywB7OPPCN6hX9/qYK6s27wx4PLGheuKNau
         kr8bIwiQmlBBg2lhwvzfQTvzNeLDZYn2c8/TLx6kfHXA1U8A3L8aJrIlKdTh3L7KqYM/
         +HzmvO7E0iSR1VzPx1es5Io9WRwMfUHMicX5kFpMwjeQzjcP9AG+zfbR9N/o58OrPSSX
         ZaK/7+3L6S09x3nUt+RFb0YdigG/4JYdShJxXCnrMw+6HwpeYF/eOCUC2fQKwawO2nDg
         sWoEnxr0UVS5/G6wsnGI9bgSJeYQXlTqkvDinUKHE1e6EhBgj4ab/Qj1JBntSQRdBCcR
         w1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677774249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HWlTbIDunbCSXyrm7aG3VSDcrZzIMl/fMOyOShZ2ec=;
        b=mXs/WNIeDNDE0LBeSozY5U0GHPSjMqdIoCKZM12jEhU2VWMUbN4otNQnVKt08IE6tt
         ukAuJVPiKHKtBqd9Eyn7uS272rLgLAoC2sjS985wzGRzF7aHVerCGRM1etMiMhssCDN+
         LA/pQtfWl7tB/j11ue9oBWEsoBd7SuW3EfLRey282koOX19FuEZfkQTuz0wWfViwzo9S
         UlL+LNLAMr42jLq43EXLsMx3hIuzuiytXA+5vaMXJVkhWB2VvAISbkERkq7mRZnoW0F0
         1oXVt4vmwjg6358FJMp5GwLc+pKiS4FXIL+kjHzUVk3vbsmQ0rwf+2JPsKL49l/Tq5ob
         jDUw==
X-Gm-Message-State: AO0yUKUT17e5eyiBkPzwU+EbL3pmGyEpS0DiBDgi5Ur1ZYbEeAHhUW3V
	IwenEqPj921n3KohRUtu1z3eBzoGPdf01MXTA70=
X-Google-Smtp-Source: AK7set+/aS9UUOlcz0IUNORxj6OyjNlAdi1Nb3wnd+PpD/sirHMY53KegtU65qphzJ8XzbQjvnWRDF/WXuSPSS8ov34=
X-Received: by 2002:ae9:c002:0:b0:742:412d:1dc6 with SMTP id
 u2-20020ae9c002000000b00742412d1dc6mr2685174qkk.14.1677774248978; Thu, 02 Mar
 2023 08:24:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD-Ua_hj1hkymLbyEyT-eNyCj_naiqHqg7nr3nos8tp9XCERDg@mail.gmail.com>
 <64fc6294-ca5e-f7a9-302f-63b09d569586@gmail.com>
In-Reply-To: <64fc6294-ca5e-f7a9-302f-63b09d569586@gmail.com>
From: Lars Francke <lars.francke@gmail.com>
Date: Thu, 2 Mar 2023 17:23:33 +0100
Message-ID: <CAD-Ua_h2GDZexz=DC3YA88nO-OhXKyGp1v2D6rWvHHQVwtCgFw@mail.gmail.com>
Subject: Re: cryptsetup - No key available with passphrase
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Milan,

thank you for the quick reply. I did try that but unfortunately:

root@archiso ~ # echo 'a' | cryptsetup luksFormat /dev/nvme0n1p5
WARNING: Device /dev/nvme0n1p5 already contains a 'crypto_LUKS'
superblock signature.
root@archiso ~ # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot
No key available with this passphrase.


I also just used the `echo` method to make it easier to replicate.
The same happens when I just press "a" on my keyboard and hit enter.

What makes it even weirder is that it did work _once_:

# echo 'a' | cryptsetup luksFormat /dev/nvme0n1p5
WARNING: Device /dev/nvme0n1p5 already contains a 'crypto_LUKS'
superblock signature.
# echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot

I'm at a loss but will now read the section in the man page that you
referred to.

Thanks again,
Lars
On Thu, Mar 2, 2023 at 4:01 PM Milan Broz <gmazyland@gmail.com> wrote:
>
> On 3/2/23 15:03, Lars Francke wrote:
> > Hello,
> >
> > I am trying to setup LUKS (and I've done it like this in the past,
> > like...two weeks ago and it just stopped working) and am running into
> > the following issue:
> >
> > root@archiso ~ # echo 'a' | cryptsetup  luksFormat --batch-mode /dev/nvme0n1p5 -
> > root@archiso ~ # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot -
> > No key available with this passphrase.
>
> This is just a little bit confusing handling of end-of-line if used with "-"
> (see section "Passphrase processing for LUKS" in man cryptsetup).
>
> The first command will create passphrase "a\n" (including \n !) while the second
> command will process only "a" (you can to use --key-file=- there for luksOpen,
> it has different syntax.)
>
> But just do not use "-" here, cryptsetup will do what needed automatically.
> Also batch mode is implicit if it detects pipe input, so just use:
>
> # echo 'a' | cryptsetup luksFormat /dev/nvme0n1p5
> # echo 'a' | cryptsetup luksOpen /dev/nvme0n1p5 cryptroot
>
> and it should work as expected (password will be "a").
>
> Milan
