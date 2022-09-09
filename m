Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AD7612F
	for <cryptsetup@lists.linux.dev>; Fri,  9 Sep 2022 20:38:43 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id jm11so2810574plb.13
        for <cryptsetup@lists.linux.dev>; Fri, 09 Sep 2022 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GKczUxbh7qx6G2ZZuvgywE7YNOJFHuW6KgJowDMm1i4=;
        b=fZoC/9EQxMW2m+skNcF2NUiDkkMlxjMY7R2m72lJxFHzSyXM4pCdW/h4pXdg5RymOH
         8t9m3mvDxKu3NkAr/dyGZwU1GVmwtcIPpjpuoGpfMjN+AZJq9qcJcPLOl76CIsdtCmdH
         yAkXKsXW9x9azOEF5JMdWjTHNoBE3l00e41e1uxR2PCd/rx1e2o9yLcatrhjT3zuSGIi
         dxigpvifOWmun8/sXmmf6wKkt4xf5Yw852VlsAXCA2ZFEVjivAj+EqjJnuSi6noSat1L
         +ojJe8vaPw2KwIewKDEP/ivUm86sdhJpEkjUs4fXE0jdDVpKNiITGv+i6hQnrOnJ1Sti
         C/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GKczUxbh7qx6G2ZZuvgywE7YNOJFHuW6KgJowDMm1i4=;
        b=KQTeWiu+ryS7w+2VCpM1RIxknOqibJxns5OxGrzxBtItR2NRuS+QGlvNIHHy+Nv7fL
         5jhL+jWvbj7TubS7B2CpyDgVIqJtG7MK/GXlZt7vRUPy5QNJJ0GCRM4TSj6ZJgk/4N6G
         2tE7uHbd/XEIhif/ZWsyKck9mmkBwhBwjQHTmxLCklH3GCr/yvWLqPVNRZf7PmAOSFkM
         Gi0kUbzLcT1I0+e/jAFfRHhgVI3RZRct5bQiSmt6+3eO3JjTxlHZAZHWj1Vin+GrHOOu
         rcfC5Ax+4QykoNJtcx8NKX8vInRu6oL91DzLHDi6dh+XUTdoUluWkAASwgNDUdm/XVnV
         oXDg==
X-Gm-Message-State: ACgBeo05ZvGkPgMeA23JFe1YXYPtYRq3KF4VSi9z7KCQ9ZmzmbYCM6Hk
	6k8uWTtoqnmpcf4W0JmCHk9pVNYxu7SerhBj0npK7/7M0dHWUg==
X-Google-Smtp-Source: AA6agR5ES9to24X7E4kqbHNGXc77x7Wu2jm5i3A+90lHLEtlHakLIZvAEeFxehN1UEf3e+3eJcr2LXKlr3AkZC90YX0=
X-Received: by 2002:a17:902:a409:b0:176:a717:4d5d with SMTP id
 p9-20020a170902a40900b00176a7174d5dmr15095725plq.148.1662755922838; Fri, 09
 Sep 2022 13:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACHosL8qEEToama-927w8JciczidoeSPFM_a-SF5zWEVZUabLQ@mail.gmail.com>
 <421c9a4d88161535ce20fc90b3b57199de77b478.camel@scientia.org>
In-Reply-To: <421c9a4d88161535ce20fc90b3b57199de77b478.camel@scientia.org>
From: "doffloster@gmail.com" <doffloster@gmail.com>
Date: Fri, 9 Sep 2022 23:38:26 +0300
Message-ID: <CACHosL_pEoFibzKwvwRbXcWiHL+shG+b4Br9GRpJURvHAHqLuw@mail.gmail.com>
Subject: Re: cryptsetup mistakenly includes newline character in passphrase
To: Christoph Anton Mitterer <calestyo@scientia.org>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Christoph,

I understand.
Then it seems that I got confused.

Thanks.

Best regards,
David.


On Wed, Sep 7, 2022 at 7:03 PM Christoph Anton Mitterer
<calestyo@scientia.org> wrote:
>
> Hey.
>
> In your script, you create the volume via:
> > printf "%s\n" "${PASSPHRASE}" | cryptsetup "${cmd_cryptsetup_params[@]}" --type=luks2 luksFormat ${DEVP}5 -
>
> With the "-" in the end meaning "read the key file from stdin"... so it
> takes up everything presented (up to some compiled-in maximum).
>
> There you have a trailing "\n" in the printf.
>
>
> When opening you also read a keyfile from stdin, but you don't give a
> trailing "\n":
> > printf "%s" "${PASSPHRASE}" | cryptsetup --verbose --debug --key-file - open ${DEVP}5 debug_open
>
>
> Cheers,
> Chris.



-- 

Best regards,
David.
