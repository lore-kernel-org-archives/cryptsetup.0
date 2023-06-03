Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6AFEA0
	for <cryptsetup@lists.linux.dev>; Sat,  3 Jun 2023 08:29:22 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f730c1253fso1483685e9.1
        for <cryptsetup@lists.linux.dev>; Sat, 03 Jun 2023 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685780960; x=1688372960;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ES6rZi/J1lD0SMlDJGiwR1qdIlu7sGotskjJO75Bm/k=;
        b=mdl0q8KoKQ4zXJ/LkvCSebDU4sPYqbj6k0q81X6H9MG82FKU0efMHaU7c2oXWOvsh0
         DiYj8psXzKDUC71mCXHSy7U90R9/J4Hol6I/VPN0T5tZIc5s66YJ7yPplzq+7IkcFeW9
         wYYq+dw9QIydZrfCGtkH3CLBgADikoyX4uq1cIvoCvX9TaqPw7HozsUPqbv/QAoaPH4N
         yJ9BgLTArV75IClDzz1vuvr9TsCZhstYCqmmQWziMR9jDioMqUcz5XIXGC54INXanykM
         PeCfj+k3wxPHsHkk00rWgu03raC2JzcggZJ/bYSVlAflDdjXDk4YjSGun+v4VtOusL44
         I+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685780960; x=1688372960;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ES6rZi/J1lD0SMlDJGiwR1qdIlu7sGotskjJO75Bm/k=;
        b=BEZ1ShRB7P8l73LGLCa/eW2/oBy39DqYzuINmFxknLxWLeg12ypFXH+zS1u+qrVzKJ
         E6XrDM8JGanRnUrOxUIoh5z+mWV4zuy8CrBmSxbSSdQvSRSBJyu8lBvRulzsQiWu0u/z
         ZLAN4L0chzFqQOjqygHv1eZgHFJXcQQmSa+atdA8QxxzBLyeZKF7XddUtwsuMBcxf3aL
         g3Kxn/F5VT1DGsHieSyb0y8lr8a9hrOiTdKaga5HpKECVMcsn8rTeEkGbe6aYqKqgA+n
         LDkuYQfSlMpYlfC8AF574xP8bQ67iFCjbOPLb4KNd9xRA4pH2gpPmxJM8FOU4HgxBuUK
         sd9g==
X-Gm-Message-State: AC+VfDySPXuU6IsG1hSWn0335MZwPzcBROwKXNvGVOk9FP+rktX4Wq7Q
	lMFCUzwd8WcgdRZcoGprhU0glaxbJUk=
X-Google-Smtp-Source: ACHHUZ4s9E/KvmQqemsFiZSsSRdC+ZAMrv49ArkMhSzjSQj38sc5YOcPgO5NeFX9hyqow/5Hk+6sdw==
X-Received: by 2002:a7b:c4d7:0:b0:3f6:683:628b with SMTP id g23-20020a7bc4d7000000b003f60683628bmr3601368wmk.3.1685780960174;
        Sat, 03 Jun 2023 01:29:20 -0700 (PDT)
Received: from [192.168.2.30] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id bg22-20020a05600c3c9600b003f4283f5c1bsm17621424wmb.2.2023.06.03.01.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jun 2023 01:29:19 -0700 (PDT)
Message-ID: <a4bc8457-c127-55b2-5a65-388c3d836bf2@gmail.com>
Date: Sat, 3 Jun 2023 10:29:18 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: How to protect header and on.... paper?
Content-Language: en-US
To: Felix Rubio <felix@kngnt.org>, cryptsetup@lists.linux.dev
References: <7ea9a3bc2101154ba3f65e6f55c6fdc4@kngnt.org>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <7ea9a3bc2101154ba3f65e6f55c6fdc4@kngnt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 6/3/23 09:29, Felix Rubio wrote:
> I have setup a my FDE using LUKS, and tying the decryption key to my
> TPM+recovery key. Now I am wondering: I know I can get a backup of the
> LUKS header on a file, store it somewhere and done... but what happens
> if the USB is corrupted by the time I need it? what if I put it on an
> optical disk and has been scratched? This kept me thinking: is there any
> possibility/process to have the required information for the header
> printed on paper, that could be stored on a safe?

You cannot have full text backup of LUKS keyslot metadata, but you can dump
volume encryption key that allows mapping data device without LUKS header.

Actually, paper backup was motivation for --dump-volume-key option, use:
  cryptsetup luksDump --dump-volume-key <device>

(in very old cryptsetup use --dump-master-key instead)

There is no automated script that maps dm-crypt automatically from this
info, but it is quite trivial and should contain all info dm-crypt needs
to decrypt data area.


You can also dump metadata keyslot info with luksDump command, for LUKS2
even in JSON format:
  cryptsetup luksDump --dump-json-metadata <device>

NOTE - this contains only configuration, not the binary area content
of keyslots (but it can be useful anyway).

Milan
