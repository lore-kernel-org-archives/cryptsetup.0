Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A63B24F4F
	for <cryptsetup@lists.linux.dev>; Fri, 11 Nov 2022 18:12:04 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id io19so4810034plb.8
        for <cryptsetup@lists.linux.dev>; Fri, 11 Nov 2022 10:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VYJ5VL/Hgh9A/Gjrwt1UfXdHpR/T6yFIEIU26E0ENLI=;
        b=U8gc72xGDUO+XA9Xw7fp39yqUqmwAa/TzX+BIYskPtoCAC3GKY9qowv/wkFLrG7++q
         KBrQZRSux2AriMreChWcOppA5rXhnOzg5vFCcpSnE2M0XSGjGLtssRHciD/I2HmYHVn0
         PF3ZuRmVLIB24dlLjFr0mKIHkaUDHMD3R1Mi01vxqR3PVD9rWhMyXwPhLTGtKGtqjH8Z
         MDzsK7r9fo2xYSFto2golY5Jj1RVXaCIwpWWIwx20IjMS3/7wwlwqiqDafq0bUdtN6TO
         yCN3IfWoRg083OBiUV3nltvZZajneI7kgh+cw9XrM36LWyQt3ffAHjINHkVx/kDBpeH4
         KO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYJ5VL/Hgh9A/Gjrwt1UfXdHpR/T6yFIEIU26E0ENLI=;
        b=7RhnAgvwXBrs530RJp5K6HL+inFbg2zOVPQI6NCNDIV2FffsjbCTqg9UyprO0hhYsZ
         9tP2I1Ovnkb+2y+NSRcUMNOJx8QJwggV9EbAdGxhL8Jb/ZF9muHTwUrltVV+nqhg39q6
         7LOqQwD8eVO8IpXGAuCEu6CtLdVcOp/p4fbB/YoEVQh/RiRJpwTHX6X6K8AJWcPdS4Qk
         bzegB3weLHQHCtgnWDEScGIbnD8AZLEuuQsxTEw+4XgbHljtoX3VB6bMIGBmVYZ0/S9e
         yTfNmUgpT7QooSOm9mjetA3YnzRsNsEALjqndmCmU82lKXs9n1XivQRpRDdTGG/7Rbma
         H2kQ==
X-Gm-Message-State: ANoB5pm1S7NM83ZHBjx1exHXl74Eb3Xuq5zcq8h+HT+JJYizY4fppOtL
	mm3zID4URDmTkuNJUoU5qhGD/XDH+8JJnI8dq+0=
X-Google-Smtp-Source: AA0mqf43BpP8oT+keeVYW3/AMb9ZsdJoC04zBGHtIcGHXppfMxlB4jhPCox8kqjPPPhkYI+gRikEXSRhuK3gkX8ADiA=
X-Received: by 2002:a17:90a:7186:b0:20d:7c09:c92d with SMTP id
 i6-20020a17090a718600b0020d7c09c92dmr3094491pjk.95.1668190323930; Fri, 11 Nov
 2022 10:12:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN+za=OaHi939USLRp8DttVjamBx7qSxOp-LPm6uNtMN7oek8A@mail.gmail.com>
 <37ecbf51-9c83-eb17-ef98-a68a9975ecd8@redhat.com> <CAN+za=P-XaUsM2Xjy2Bip64PHKvYxCi8_d1wKiN_1o9AhEheLg@mail.gmail.com>
 <480cac2f-f20a-e769-f33f-3d1a57e62b01@redhat.com>
In-Reply-To: <480cac2f-f20a-e769-f33f-3d1a57e62b01@redhat.com>
From: Philippe Cerfon <philcerf@gmail.com>
Date: Fri, 11 Nov 2022 19:11:52 +0100
Message-ID: <CAN+za=OQGkWPiiket8_7kG3UgboDqTJ+-cdaBVoC4xdgSUQzww@mail.gmail.com>
Subject: Re: reencrypt: how to specify old and new key-files?
To: Ondrej Kozina <okozina@redhat.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

One more thing which is a bit confusing to me:
- There's luksChangeKey (and the somewhat overlapping luksConvertKey)
which changes a keyslot key/passphrase and/or its KDF algo/params.
- cryptsetup reencrypt, also allows to change the KDF algo/params (but
not the keyslot key/passphrase), which makes that part of identical to
luksConvertKey.


With all of them (luksChangeKey, luksConvertKey, reencrypt), what does
cryptsetup do when I don't specify the --pbkdf / --iter-time /
--pbkdf-memory / --pbkdf-parallel / --pbkdf-force-iterations options?
- For reencrypt the manpage says that for --cipher, it would use the
existing algo when really re-encrypting and the default when freshly
encrypting.
- But what about these options, when I don't specify ANY of the KDF
algo/param options? Do they use the same than what's been there
before? Or the default?
- What, if one specifies ONLY SOME of them? E.g. it was previously
PBKDF2, and I do only --pbkdf argon2id  OR  only that and
--pbkdf-parallel 4 - will the others get defaults?

Tanks,
Philippe
