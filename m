Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B209FBF5
	for <cryptsetup@lists.linux.dev>; Thu, 16 Nov 2023 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDIdqN2V"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso64117066b.1
        for <cryptsetup@lists.linux.dev>; Wed, 15 Nov 2023 23:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700121367; x=1700726167; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wRyALaa9hSMEvebZbRpF9DzoHbJgWpIKNCgPvnfCZ0s=;
        b=NDIdqN2ViTY6lrhJ6fjiIf8d7SsqScMAu5QFI6moni88VI7WZaNT8XPW4USf8zM7F5
         cTqYt0C2E0/kAQa9jWVKK3otI1Cke3hVu4cm0w9yyt57c/B6csDpuEcc3x+HSOQSrgMK
         3K3w+z2GrRXBcAw6FMdGtTWlnQp/tCuCMbQ+7tEx8oSD9k9CFtE5+w2lLzSZeZmkAd8V
         LD8dBmvaoeBUJ5D5jVS7MbakyX97qrR2u+G4U3BqAA5zDiDPXbgcRqUXF2xxEvg+yE2+
         d7p7jPMTfRDKPunQ6hGxcjseXAPoPJQoUlV4LV9JmDizINyc9jy5jhyO8HOZomTYqkUZ
         QVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700121367; x=1700726167;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRyALaa9hSMEvebZbRpF9DzoHbJgWpIKNCgPvnfCZ0s=;
        b=bwhw8JWog0SkjO8TrjI9t3qb03sf1mRSB8uZUVqR+fkFbAKL3DFSqegfFTR+DBVgm2
         CmGIWFiSPx5hCc1/+bXx8CBxj4BEQ+7C459KMYIjuuQfGp1PQu2aCq6nsMstePfoglTW
         inhwItigzlyTV+7qFHs3YhJvqlS09BQXfUt/jaBR/89mrN0YodODS+sUVnFqCE0QOugv
         tkMFTlAmrbbW7DsdeMUnCEXRZbMC8cE0SSxzvvDJcjvh8SdDgMoauqIAC+SGPC42+fc5
         dbT+JjWblLWoeNjgQh3UlXhllU5LUNTMZRUWDE2xlVn0qgtr/skzzUklA5qfAQwo3+bu
         547w==
X-Gm-Message-State: AOJu0YyUfr0U6C4uh+MmKojK4gTPEa+YE39Vdk8fIczdP+d3cQXPf7n2
	3+CuM1xySbUgBExwS82wAK4sLQesZhg=
X-Google-Smtp-Source: AGHT+IErwHw9GvYEaGtYaWHUkHWgUhbXq5NQ3GTToS4Iod6dOvNPnNRIXp72UOJo7uo7hovmlQqBOg==
X-Received: by 2002:a17:906:6a1f:b0:9b2:df16:851d with SMTP id qw31-20020a1709066a1f00b009b2df16851dmr14997552ejc.57.1700121367405;
        Wed, 15 Nov 2023 23:56:07 -0800 (PST)
Received: from [192.168.2.30] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id lt7-20020a170906fa8700b009a1a5a7ebacsm7931392ejb.201.2023.11.15.23.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 23:56:07 -0800 (PST)
Message-ID: <a8d9b808-9dd3-4078-8636-a443f623e9e6@gmail.com>
Date: Thu, 16 Nov 2023 08:56:06 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problem after converting to LUKS2
Content-Language: en-US
To: Anton Avramov <lukav@lukav.com>, cryptsetup@lists.linux.dev
References: <72f6c041-14d4-473e-bcba-7bf3b9fd47aa@lukav.com>
 <979f56ca-14f3-46fd-9935-6365223ab3b8@gmail.com>
 <445d7af3-40b6-453d-b1c1-718f222407e6@lukav.com>
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <445d7af3-40b6-453d-b1c1-718f222407e6@lukav.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/15/23 16:34, Anton Avramov wrote:
...
>> Please post log from failing command (luksOpen?) with --debug option,
>> so we can see what
>> is failing and what exact version (toolss, kernel) you are using.
> Ubuntu 22.04.3 LTS
> 
> Linux  5.15.0-88-generic #98-Ubuntu SMP Mon Oct 2 15:18:56 UTC 2023
> x86_64 x86_64 x86_64 GNU/Linux
> 
> # cryptsetup 2.4.3 processing "cryptsetup luksOpen --key-file
> /root/.luks/.p2pool.keyfile /dev/sda1 CryptP2Pool --debug"

...

That log looks like a correct processing in open (with an incorrect keyfile).
(Or the convert process really corrupted something in keyslot...)

Could you please send luksDump (ans ideally also luksDump --dump-json-metadata)
output to check how it is exactly configured?

(You can send it in private mail if you do not want to share it in list.)

Thanks.
Milan
