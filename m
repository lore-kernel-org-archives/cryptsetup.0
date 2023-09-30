Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CDC156D8
	for <cryptsetup@lists.linux.dev>; Sat, 30 Sep 2023 16:45:52 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4053c6f0db8so146564715e9.3
        for <cryptsetup@lists.linux.dev>; Sat, 30 Sep 2023 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696092351; x=1696697151; darn=lists.linux.dev;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NUu5tjodlGRRsr/2BaNoC9WVTeXtW9ye4vKNiN4U1g=;
        b=H1SaTFPJukl3Q2m0Fvz4+y6tF+YqojgQVaEiWafoU0Z3vDGKl9t1Oqx7SzRZ8EYWk3
         2MR8nqQjB3mkioElbdk67BcucLSobEE1UN6trYfwX58jAKThdNXZSst9NCPzc+iFbD8U
         CGVnH0URQScj5iYENn1EM2hQpITQgX32qLqkRBtXkrUU6s2WYjUUdlGSL6Sj9IDzlbgs
         h0tBYkmMe6Utlj4ZnlYH7rGQdtzyI9T1Z6287M7xeUl3Udxko5Lodi+lQGumhxaOVB1j
         nF8ygjLvBfMhAAJhM8DLYJAGn6yBJyraLysM9SfHbFcOiX5/xJow7TfN9uYLoatGHjpG
         kvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696092351; x=1696697151;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2NUu5tjodlGRRsr/2BaNoC9WVTeXtW9ye4vKNiN4U1g=;
        b=dszssGS2cH95Myb3M36f/zgnLnix9Yt2uGx0MjAS92AX3v7Q27VbQVZyD3iOutVscc
         AcH6HIm8V2kxog6pGS2/h1zdORJGkqodOXtjnnFjZEM1+TOn3NVDRhO+ykugE+9DFFrm
         DSe2FPh8hAiG2L7Iyq1y9z5CxHUi2YB58KGtEZsvGjJRVEbQQthBbqI0dm8W30rg1fxn
         mcfVx3jnwdWxJN4D0KOWAbTspjID410z2I8wtanH5hiiYNY7oiOGNUhKkU8tkG7Nr/HY
         VApqEXesNDPM8h2XPbwqXeSe+Ypae1kQiewADxV5nM2NTUGJPFLXSePUzMN9uekrumKT
         wz/A==
X-Gm-Message-State: AOJu0Ywv/OB9iT2oi3i5jhHKXuS6cFQO0ZUOYdHsRdum9lO3oicJUtd+
	1GzRhY0kAN7DPNZsr3pwm2NnROZ7XXw=
X-Google-Smtp-Source: AGHT+IFa1DNCFvy5FSPgOCazs2DhK5AcMCJSSmtCwzuxlOGRrCV/hDBxYSpdQFpkEij2jWlNyVttLw==
X-Received: by 2002:a05:600c:ac1:b0:402:f501:447c with SMTP id c1-20020a05600c0ac100b00402f501447cmr6586420wmr.0.1696092350564;
        Sat, 30 Sep 2023 09:45:50 -0700 (PDT)
Received: from [192.168.8.101] (89-24-32-180.nat.epc.tmcz.cz. [89.24.32.180])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c020b00b003fe2b081661sm3701238wmi.30.2023.09.30.09.45.49
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 09:45:50 -0700 (PDT)
Message-ID: <6ebb0f69-892f-41bf-bf72-e868734d8c85@gmail.com>
Date: Sat, 30 Sep 2023 18:45:49 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: cryptsetup development <cryptsetup@lists.linux.dev>
From: Milan Broz <gmazyland@gmail.com>
Subject: Cryptsetup 2.7.x plain type default cipher and hash will change
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

As RIPEMD160 hash will be phased out soon, we must change
default hashing algorithm for plain type in cryptsetup.

(There is nothing related to LUKS; plain type is the old simple
wrapper around dm-crypt mapping.)

While at it, we also change the default cipher from AES-CBC with ESSIV
to AES-XTS with plain64 initial vector (the same default as in LUKS,
just with 256-bit key size, thus AES128, as XTS uses two keys).

As this is a backward incompatible change, we will also add a warning
if an open command is used without explicit --cipher, --key-size,
and --hash options. (These should be already mandatory for /etc/crypttab
plain type use).

You can still use whatever mode and hash you want, but it must be explicitly
specified on the command line (and must be supported by used cryptographic
library or kernel).

Plain mode with passphrase is actually not a good practice as it directly
derives key from passphrase and no standard password-based key derivation
algorithm is used. You should prefer LUKS anyway :-)

Also note that if keyfile is specified for plain mode, there is no password
hashing at all (keyfile is used directly as the encryption key).

For more info, please read issue 758
https://gitlab.com/cryptsetup/cryptsetup/-/issues/758

The draft merge request for planned change is here
https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/543

For downstream maintainers:

To update stable distros, you can still configure old defaults with configure options
  --with-plain-hash=ripemd160 --with-plain-cipher=aes --with-plain-mode=cbc-essiv:sha256

If you see problems with this change, reply to this mail or comment on the issue
mentioned above. We postponed this change already for several years, though.

Milan

p.s.
Cryptsetup 2.7.0 release candidate/testing is planned in the next few weeks.

