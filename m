Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0628F5A
	for <cryptsetup@lists.linux.dev>; Tue, 22 Aug 2023 09:32:10 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-76da9fa9b66so95288685a.1
        for <cryptsetup@lists.linux.dev>; Tue, 22 Aug 2023 02:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692696729; x=1693301529;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=62xS9sloG/vYltlpuwIkH2CYKqmNIc7ek3pwMB6iyiE=;
        b=ARozHoTsGIKiIMHMXT99UlfJdEdx5mj5TpSugHpfyaC2XyMBWM8vSNJF2e/ldTstNN
         VskiawY6iujX+e/wIPNPvzdKoqHpfopoGiCgvJcjtjB4YXLi8kvv9wdP/4M/XU1rml1J
         Zi+cqalEw8ooiijZGKLunVlaCooFmAz4i3ReK0dXmswpPSDUeNV8Ylynmdmuletw5E6y
         q3ioTm1vvPbz2X/CWd2IiQA6VTM9DiKoxvbbJJnry1SU7Ue7mWeaFMM5H9do3OIF6Ny/
         DbkC3M93YuoLf9ZqAz2uWbWU7u37nC275jNEWAkn6fOvIcymMSrlRXclygTulokJbx7u
         kcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692696729; x=1693301529;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62xS9sloG/vYltlpuwIkH2CYKqmNIc7ek3pwMB6iyiE=;
        b=RGDCpeTyjarYZfeJs0xq4jH3/ybLz8eGZo2y1e0lmZHEG1CrPCwvjaNEY+0mYkxOrM
         E5/KuOnAJFPyTgJx2tab+7v6HT2t0y7IHRPPegfrNzCyExDCAVQq5/rjQ5vA+UICsNLR
         SvSxzzH5y2ctUxSzNeVWjMUA3JcSOsF86iniIlBhahDHteHKR13Xq1AEBM+WcHiJ/Lxe
         gNCzKGcSiwANYIeO6vV80h/A+l7Eqh24ijjbZPjug+5tdeGL4+ouQkZBH2Mi/SW815jy
         +xsKUvnYt8Cr7CcF91vrY/48QRgtHNbZrgAXRC+SvGdkozv886h3SwrIJRUDeiqOjHn1
         u5OA==
X-Gm-Message-State: AOJu0YwQSXtELUjvmTHBol936THwtEKGH/CUvKtEuiTzk9bJ99CBCSaH
	NgjxsjDknViAigDu2QUD6P6u44Hsrdviv1HqjZZAceaI3s8=
X-Google-Smtp-Source: AGHT+IGDJG+AjHmwom3TvNOG8sSp6ODgOdydHzMtua++NbkVySQFoPVOTvg9Ue+qOgwpV1Mgp4xne47rjyckk2mz+Ps=
X-Received: by 2002:a05:6214:419e:b0:649:c06e:78cd with SMTP id
 ld30-20020a056214419e00b00649c06e78cdmr8844573qvb.22.1692696729386; Tue, 22
 Aug 2023 02:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Kent Larsson <kent.larsson@gmail.com>
Date: Tue, 22 Aug 2023 11:31:33 +0200
Message-ID: <CALmZR2OZ0sKRui1Eu1FxQzBCBhvHHXbsHipGq+jfPUcteROS9A@mail.gmail.com>
Subject: Unlock a Veracrypt/Truecrypt partition which uses a keyfile with a
 passphrase from /etc/crypttab
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi! I have a Veracrypt (/Truecrypt) volume, which I can successfully
unlock manually by providing a key file and passphrase:

    # cryptsetup --type tcrypt --key-file /.keyfile open /dev/nvme0n1p5 shared
    Enter passphrase for /dev/nvme0n1p5:

Only root has `rw` on the key file, a binary file of 64 bytes.

    # ls -l /.keyfile
    -rw------- 1 root root 64 aug 21 08:09 /.keyfile
    # file /.keyfile
    /.keyfile: data
    # du -b /.keyfile
    64 /.keyfile

Is there a way to unlock a Veracrypt (/Truecrypt, `/dev/nvme0n1p5` in
my case) partition that uses a key file with a password in
`/etc/crypttab`?

I have tried constructing a file with the structure
`{passphrase}{newline}{key file contents}` and manually using it to
unlock as above, but I still got the passphrase question. To create
that file, I did the following:

    # echo 'mypassword' > /.keyfile_psw
    # cat /.keyfile >> /.keyfile_psw
