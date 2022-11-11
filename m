Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36E62F3F
	for <cryptsetup@lists.linux.dev>; Fri, 11 Nov 2022 13:22:30 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id l6so4467305pjj.0
        for <cryptsetup@lists.linux.dev>; Fri, 11 Nov 2022 05:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1dSPPp0+3dnHB7T0C9/cjjkXWUEXhFshuJWQZ1RKF30=;
        b=TieGLAau3qOQp/f3Qbbq58d/3T6v9SQVpa/xdp3xHBoRqOtOXvhTKbbTBycxTxR2nY
         GCOODSMmS7KlTNCnCmzrfuiADozWE0Q6dEgc/w8fIMtlacBH6zjzUvvWv2t2UvRK1CMW
         8U8sX3NLwHr9tz0CIgMdTAD4JBDlyIlLUD3/aSCtQWz3Q2NP7oj1SvJRzJpIZMJVegAN
         oW8CpC074P5s/CADxEA21jGx9mBfj95XC/oeyRxbC5bE97QfB1/RXRSjE2M5j8ZGkXrb
         50kbH5UWDPfGRBCagrozdDyMA5oubWT+HpVP9R2qwpfV5il8mHIVC64NxN26y6Z8ddR1
         Lgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dSPPp0+3dnHB7T0C9/cjjkXWUEXhFshuJWQZ1RKF30=;
        b=lcFYaQZ1LGQP7aey6vztImzgNm+RcGdaEVuNX1jzgN4LKBs6DhlRZ0NBDuLDoJhatW
         4UCUmX3qaI+pNb8hW506EwryxkyyXqz9iL03pAGMQRS3fnEpAN7fX2kUNLn4Qqhat8mH
         b2TBJwEFSiKzk68rMH3l3/LDSGei6cJuD63mmNUKPpuJEEAEMOzK0sbDaWUHCvViJNJM
         kogtWzJ/CXC8GRwgKm3m9MuUr1Wzail1aZ7TZkcGtD1zKFeDOwTCFO5zFPpxnxLDoMrg
         1UrrQxAUw6uMiELdJjGflWp6wTbkw8wf/VC47nrQpMloqRi0OneHb3pEPGScsbqs0OHv
         UPHg==
X-Gm-Message-State: ANoB5plcKXjNOXOjEZaM3EwZx0CsAwyNgCXN/ukS6JBO9Ii8npVmrHSY
	jv4g/37GDzxXN8KP68LA2RjsrlTEE1dEW/Gy8tD/05hN
X-Google-Smtp-Source: AA0mqf7E5r77XHoybiXu68scoLsIPJMWZeyJsFA0UJTxi5jtmvWQ0lbk4gmlRe+9Dy52x8XXY/yr6+DU0BRk+YElFjo=
X-Received: by 2002:a17:902:8489:b0:186:6e16:18dd with SMTP id
 c9-20020a170902848900b001866e1618ddmr2493284plo.131.1668172950157; Fri, 11
 Nov 2022 05:22:30 -0800 (PST)
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
Date: Fri, 11 Nov 2022 14:22:19 +0100
Message-ID: <CAN+za=PFWnZNtvHOpxhj4DJ14_YGCe1dpUyiPF8y0udKXyWQ4Q@mail.gmail.com>
Subject: Re: reencrypt: how to specify old and new key-files?
To: Ondrej Kozina <okozina@redhat.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey.

On Fri, Nov 11, 2022 at 11:39 AM Ondrej Kozina <okozina@redhat.com> wrote:
> Could you create an issue on
> https://gitlab.com/cryptsetup/cryptsetup please?

Done in https://gitlab.com/cryptsetup/cryptsetup/-/issues/785

Thanks,
Philippe.
