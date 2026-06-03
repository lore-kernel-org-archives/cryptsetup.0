Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CFF30FF08
	for <cryptsetup@lists.linux.dev>; Wed,  3 Jun 2026 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490615; cv=none; b=G0bZ5cooUC+/0R/5jCFiWnPEDv7UKEIjIYFipvQqEXXDl9nqmqVqjBL9JyIppNCyXANhzcngd8K5uybg/SDF9kRfx/V1xm6aYDIHjB+tYfkklSrLrbc8RKpCjX873ukfCRVJ9KToPgQlldwSkIZMAyEK2jT+XWsiFfcvngeeS4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490615; c=relaxed/simple;
	bh=EWXgJwxpNmdQNn6RORPSYd/nPD2Z8oldD3n0EBExMbs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=f7T+GTNm8LMY4jQ6SCpmwPdwK8MvRArVexfkffoK7UgrYwQMyjoHFGQJSa4i1nTUh7/P4u/7RgOF59rU5QAhpMmvTMCLXxFI6cMXTeSKckCyjORWP4UI30XWILxuTzAlNEFTdliHqWr/QRPoKYGURpCexcoLg69bBy+q1Vc29kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Ah4zeMGI; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ah4zeMGI"
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C8BBE3F466
	for <cryptsetup@lists.linux.dev>; Wed,  3 Jun 2026 12:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1780490604;
	bh=LHKU/o+lXm2neOna8YwUihdEvKop97tkOHZNIh6YGyw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type;
	b=Ah4zeMGI5DZZgimjCVmvqzDuSppZ3aI2tnPQGGfcyguXfNFwHVqeiKkYuKouuPrNG
	 iHS5Da+oT3F8PR4LN3iPLLhOpj6rRv0iVe8gT9t266bFJdrlWurmfwA0T5I1JEgVw/
	 4qIIYpjUA+np2ccXIKZ6vQoytBk+VT5WBeYxqOZvYxRW0KY/+pcq2/eHtMtNZl8u3g
	 mJSr9nalUanQxH6YvK9A3EYJ0EWUEm2udCeHIaxCsC8On0ZZIfj2hxRK/+V7AKMiK0
	 qGJvDmdnsyneHGCPYpcu9+VlmqKn+99k5ZQmlYcCPIpwmuRGs0qQzpBaaWB+oQMWPw
	 o7HvvEGPQALRnwnlLxH8iMC7fRu+A8qbT2R/VeUmbaJpu1pHNnMgtZS/VS1iAKbuAc
	 M0LI4U676kob1zPa1ZYBFt+vof2+ZvNJNZSYvvg2W/udXoH6/hOkKIRQXaxCoGaDxW
	 D23n+bGDyZrz5zbta5/mzluC3mQzAUAOATIORj5hYL1Retpm4tSEOLYoWIPY6gPUWF
	 HMGcQruMpzn1VIXNFC8yQnbQkQh6pE0bcKmMrYIRLNJ2sIHIPAX/RXwTxJYONVeIX4
	 vf+vIaF9g4NVv6kyxsWmnOdhsBCINX9je53+hi+5bocOG9HO+ww+BAsMW/10G2h6j3
	 s4A1ih2tDcknom4DU0E1o3pY=
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-45eec2ba533so4599709f8f.3
        for <cryptsetup@lists.linux.dev>; Wed, 03 Jun 2026 05:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780490604; x=1781095404;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LHKU/o+lXm2neOna8YwUihdEvKop97tkOHZNIh6YGyw=;
        b=GjJk5dRZosDp5v7/xUzTKMmK6XbYlA2+1kRT1T4qonoK5uK7H6zJbmMlliH9HWRVIs
         B0QtBZAzTPlmU4tn2Il65gmAAMq+VBAQHvH4r8xBomra1rIaZClcTS4vLtE3TlbaNB79
         5GuXNoMpouZwLcQp6rDL0pxuCQIxBqrzIT1S9k6C42qpBY2NxGod8VcgRDkezf1dqeTy
         FRuxa2eANGAFhMZAzrr+zaZecqAL+7TDmNtKz8kp/cA8xarISWM4l+p7PiOXaa5/4ocP
         UWiWegG9XR5X0Y+J+BOK6uk3WHphbcmxZvDGtcCLKavU7yTZsbUtZZW5lA4LrwaBhNd6
         XiBw==
X-Gm-Message-State: AOJu0YxHrJNYt7HjEPc1hgg4WfQA9T8rYHSgqb7/WN+vmwS21g+XeGDz
	NSH/iC1EDc2lxxm9bCTZMdC/E1rYFSw9lf9GbABNBcVtvEQGqkvUKfth6uZMbfzwkwP02bIdGBF
	LxcnQtomCVASdxo3pj1yaOMnZjfKP1gok2noG+CAv3jmbErWcL2m8Y/SZLLq3lHUwP3ik/1K/rM
	JmKfFDUoWT9Do=
X-Gm-Gg: Acq92OGtQl1wFWYvjiqu53sPWWmjlqnL6stBvs71tZ4TVkWRCuwwFKJL/1CglvEVb/T
	XIDOLaSWSNH9ZoRl6Nu2gwgqD7Dgvh+0oM4BuCVlcHclZ/EBYrMnR14te+3qW2FxdUOJtai+QVS
	Wf9utUxp6DO7wBFA4Z0Gr6v90w4uQv6E/fuZpnr9DgQRLJPmWRvAUxu04IqA9Kg7JYubq2kizAo
	F6D7SAU4q5KAKQSoDj4EPO23VUsNRIWyfotvr7Yrn99O43IzvnWRbC4wbrm41Zj7wrCrVbtW3tr
	ZsCGI7M1uoCGpRmbBIoyIkD8ZcMo83fYrh3+0baw0zWnKzCrgYjh146LTT0XQiJCXplGCosnxWq
	KOEtpT6ouUiOlBGkJHrU1f+1SQgwY4Y1keM0vlEVIbfrJ9r5i1+N8n9SAkgqqSddSP/xU31XXGX
	dPEP71StkSt8ZKwX1SeANR
X-Received: by 2002:a05:6000:60a:b0:45e:f4f7:7cad with SMTP id ffacd0b85a97d-46021980b94mr4532817f8f.39.1780490604468;
        Wed, 03 Jun 2026 05:43:24 -0700 (PDT)
X-Received: by 2002:a05:6000:60a:b0:45e:f4f7:7cad with SMTP id ffacd0b85a97d-46021980b94mr4532778f8f.39.1780490604036;
        Wed, 03 Jun 2026 05:43:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8f4f:fc00:2569:8eeb:9624:bdc3? ([2a01:cb19:8f4f:fc00:2569:8eeb:9624:bdc3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2ec711sm7115339f8f.12.2026.06.03.05.43.23
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:43:23 -0700 (PDT)
Message-ID: <ac44ad4e-e9ec-4ab4-ac8d-6b545ece7d2d@canonical.com>
Date: Wed, 3 Jun 2026 14:43:22 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: cryptsetup@lists.linux.dev
From: Frederic Hoerni <frederic.hoerni@canonical.com>
Subject: reencryption with multi keyslots in batch mode
Autocrypt: addr=frederic.hoerni@canonical.com; keydata=
 xjMEadS0IRYJKwYBBAHaRw8BAQdAW/GkWfvxpXdIaOrchDbHVLO9xMnp3oHJpqjOVUjTOdfN
 L0ZyZWRlcmljIEhvZXJuaSA8ZnJlZGVyaWMuaG9lcm5pQGNhbm9uaWNhbC5jb20+wpkEExYK
 AEEWIQRbtAD/Ny9UK4YMzm4kkcChcjqtkwUCadS0IQIbAwUJCWYBgAULCQgHAgIiAgYVCgkI
 CwIEFgIDAQIeBwIXgAAKCRAkkcChcjqtk2NNAQCrL6jIJ/F8RMowkcwx3dQqyiVJv5gvIbxd
 S3WuKut79wD+PaJy16Y8v7Ve29A1NgBWb8YDc7DkWWHPadfcXU6gZAbOOARp1LQhEgorBgEE
 AZdVAQUBAQdAj7udSgU+c6qgap1JWUeFkmj4oavjC72Kklwk3aCe3z0DAQgHwn4EGBYKACYW
 IQRbtAD/Ny9UK4YMzm4kkcChcjqtkwUCadS0IQIbDAUJCWYBgAAKCRAkkcChcjqtkzY+AQDP
 59nYHgp6sL8G8T86PB5yPeUp66k1ETQFDkEW52uodQEAjwzjsIlhmJogOI3KbnYFgwkOl7Rx
 bJuA1Yc+ya62Rwk=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

If we want to reencrypt a disk that has several keyslots (main and 
recovery keyslots), I believe the only way is to do it in interactive mode.

But in some cases, we would like to do this in batch mode. We could 
imagine a scenario like this:

1. Setup of the use case (no modification of cryptsetup needed so far)

# Initialize LUKS container
dd if=/dev/zero count=200 of=disk.img bs=1M
echo 0000 | sudo cryptsetup luksFormat --keyfile-size 4 \
                                        --key-file - \
                                        disk.img
# Add two keyslots
echo -n 0000x111111 | cryptsetup luksAddKey --key-file - \
                                             --keyfile-size 4 \
                                             disk.img
echo -n 0000222     | cryptsetup luksAddKey --key-file - \
                                             --keyfile-size 4 \
                                             disk.img


2. Reencryption (this step needs modification of cryptsetup)

echo -n 0000x111111222 | \
     sudo cryptsetup reencrypt --key-file - \
                               --keypipe-sizes "4,7,3" \
                               --batch-mode \
                               --force-offline-reencrypt \
                               disk.img

3. Verify all keyslots

for passphrase in 0000 x111111 222; do
     echo -n $passphrase | cryptsetup open disk.img --test-passphrase \
                                                    --key-file -
done

Do you have any on-going work in this direction?
Are you open to contribution for that? (I already have a proof of 
concept for the above scenario)
Do you have any particular caveat about developing this feature?

Thank you
Frederic
