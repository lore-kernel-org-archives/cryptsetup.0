Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756A746BD
	for <cryptsetup@lists.linux.dev>; Tue,  9 Aug 2022 21:54:13 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id gb36so24479825ejc.10
        for <cryptsetup@lists.linux.dev>; Tue, 09 Aug 2022 14:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=l8mItsoJ7etzPl1TkEcDBEUPOAPKpcnQ1A9L7bLe39A=;
        b=l/67mpgR3BjC95/tBf+Xl0WXwjM6QvdtUqNbvpQOu75OTPyNCakzZsGTiwnc9Wd62Y
         tS/vowTnmRZkwWkiG5j+2OAROf+7GnJpunGg9RtHIKr6isYNp/1gHekQnneTqkDKpgWW
         tfy3BQ14DvJrOOD8RZn4DasuumroAinpDG0CB408tf38I4sfT4v9WQMGT75T6kWl0EAr
         PfAW1mqM3/sHeW7pwmoUCs5Y/PKGRy+6TLHdLLEi7kLI8t/LBC9vzbNI/6yDi9Th1B3Q
         Y1ZczGEtF20NtpXu1/bGTSDKhDnfE8JcOXxPKvgi9FfCLM2DZSspsdJi7rb4yVfuROV1
         cMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=l8mItsoJ7etzPl1TkEcDBEUPOAPKpcnQ1A9L7bLe39A=;
        b=0NXxQG40F+y062eeF45PSnahPZkXm+VN/QE+g51BnlvoX25L8ySq0uNzAhk/WlAxuo
         hiR5k8upbBxMyBiGjyUOmr0GQaaUkIFesJ9cZ7EWCuTIT5DaESAYISNaJN4BWSRpxBt0
         oFIa1jIk2jmNWUWQA5YyvT7nMrp8kuZ3VwIFLWxQgljtpKzx3MikB577d+XQKW4UnN4T
         5axU2IcX6x0ESv+w4N0OzMxTijNGl2jrma03X6NBOcxYNnZ5pzixjn8jJtwWwRmt+jx8
         Srj9UYhbSHQMbEX+2S69+sx+Tipf66xBplawW51DT1XwPObTNeEM6YEOTC7CR2yffnx2
         qmmQ==
X-Gm-Message-State: ACgBeo20nXGdrnL8RnorKrL8LWfYxZCgcdYbE7YXEP7Qj6ZuytCKcB/R
	C/cbY0B3Dy7SueUbRLZapacj5kP0YdNf3De2//K4EVE7JsZKAnPuQMo=
X-Google-Smtp-Source: AA6agR6n7hnZvJYFOUgQDmCjM3NJUuGIb/4VYPX95FjWpz7GpaJUgczYj5y+Jp5CloXcAof/yZM6Kehx4TYRFBwgGsE=
X-Received: by 2002:a17:907:2722:b0:731:2aeb:7942 with SMTP id
 d2-20020a170907272200b007312aeb7942mr11297379ejl.734.1660082051155; Tue, 09
 Aug 2022 14:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "doffloster@gmail.com" <doffloster@gmail.com>
Date: Wed, 10 Aug 2022 00:53:54 +0300
Message-ID: <CACHosL9ri_XGPoLxsAb4vEnav1-w3B=YWCE1YidhRn-ONrW=fw@mail.gmail.com>
Subject: Bug: luksClose search LUKS header but it is detached
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

I noticed that cryptsetup LUKS extensions is searching for a LUKS
header in the device.
This is expected when the LUKS header should be in the device.
But I used a detached LUKS header, so I wasn't expecting to see
cryptsetup searching for the LUKS header in the device.

You can see that in the log file "log.txt" - in the URL:
https://drive.google.com/file/d/1DcrpklgE75oE5znAxHAlp9CPikkYbVq1/view?usp=sharing

You may notice that I used a "--header" flag, but I also tried without
it - still, cryptsetup behaved the same.

The incriminating lines from the attached log are as follows:
"
# Trying to read primary LUKS2 header at offset 0x0.
# Opening locked device /dev/sdb1
# Verifying locked device handle (bdev)
# Trying to read secondary LUKS2 header at offset 0x4000.
# Reusing open ro fd on device /dev/sdb1
# Trying to read secondary LUKS2 header at offset 0x8000.
# Reusing open ro fd on device /dev/sdb1
# Trying to read secondary LUKS2 header at offset 0x10000.
# Reusing open ro fd on device /dev/sdb1
# Trying to read secondary LUKS2 header at offset 0x20000.
# Reusing open ro fd on device /dev/sdb1
# Trying to read secondary LUKS2 header at offset 0x40000.
# Reusing open ro fd on device /dev/sdb1
# Trying to read secondary LUKS2 header at offset 0x80000.
# Reusing open ro fd on device /dev/sdb1
# Trying to read secondary LUKS2 header at offset 0x100000.
# Reusing open ro fd on device /dev/sdb1
# Trying to read secondary LUKS2 header at offset 0x200000.
# Reusing open ro fd on device /dev/sdb1
# Trying to read secondary LUKS2 header at offset 0x400000.
# Reusing open ro fd on device /dev/sdb1
# LUKS2 header read failed (-22).
"

Do you consider it to be a bug?

Best Regards,
David.
