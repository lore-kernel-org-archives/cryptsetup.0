Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E1C367F4D
	for <cryptsetup@lists.linux.dev>; Mon, 29 Jun 2026 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751327; cv=none; b=JhTUxrV4MuXRDeeocjMBxJ6SG2t2pCSe9zHiHI8s3Mo4YdzrgAjz32TY4S/JCllGvG4pKlR1m0U0XtRE/FeuCS5cZdbtltGuan1Z9EQFSZf8LXknp4xY0WI+RkPI9K7T3q9yST0l59Fqa7trgayLCiC5E2N8Zg89l/bdiIdwEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751327; c=relaxed/simple;
	bh=/U2NfVDmWlr6A0T8hlRDNyjFZChvM3XM8DLH2aOFMho=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GYGb+qdzm0mfmm6SikYjkHynd30mcYWhx62MNVYvTRS3XyrEq8e9fNDsKT7TUixki4hyO0GdoVogtdll4KV+mIBlFksA7EyJ/hsiikOjC+aSu1QGXpO8RttiDF07llu0UD/VBwY0Q2DYu4yesz4GvGmU6Bc+DsloqF2mSTt9wuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyfrZbo1; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyfrZbo1"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-470174001a0so1618535f8f.0
        for <cryptsetup@lists.linux.dev>; Mon, 29 Jun 2026 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751324; x=1783356124; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vqp7KlySqdi++IRWznyOIAviS1AxNa+D2rg4Dk/pdwM=;
        b=HyfrZbo1TmaG3IfsxjYLXQm8k65iYvFwe4m80gecTCiQD8HwAJLhizgI1PGEn95+xD
         9TDSEA4AQFEGd28jixfcSyxS9wzPDwnNrWRLpHD4BRi9EFjIZqtK5bc9DQEDBfxSB6b1
         9SjxrAeu9gJf3a9CbQjpaE27m6RJI8BuWgaYR50KLWbnjJoNHK7Cqbg8BQa8QfJxu84Z
         hjGbEumD5mgP5WP2FyjpXUFekS54bKD65oDGfNdvLXnMpIH84qKP4IBSJmMszMejdFyz
         xohcxAEe6ywV1YlA9zE8Sg2poZGO9L1UQSSPGFpPwd/tGQeuPAuc8V52L6NCnX61/sbF
         IOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751324; x=1783356124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqp7KlySqdi++IRWznyOIAviS1AxNa+D2rg4Dk/pdwM=;
        b=U5ZI2KQ31YxOz0XOUsxbz9QfwSAzpWmb53gchYkRLaGoqdaqHCkM0M19mr8EUhzZRh
         SJTTnmuUdFYrOvYyJBHfyI+7KEwpK+wfyNYSs6/cQn0eqnGmevRObTMe+bpdKqmhSJEu
         aefCfFshsOfymBe8VmLqCqZ1krnwjThyFB9q6sILU89tU1yz2Raa0aHU+X2CSUnE335p
         /kD3fyf1evlEQc2TQ4W5kFbe+CT31JQbhLzxHPx9I+ZZLf7HXEsUqKZHbsp5fHtr91KZ
         8G1MKFIXMEzunajCc9teBEtbRTqQCofsqDPhJUdCWdEpWlxTpD0mAeomFRLA8/No/JJE
         Oa2w==
X-Forwarded-Encrypted: i=1; AHgh+Rrac8i6wj0dvf4fXH7+5lEziAjchfio0EApM3QhPLzBOohOIqibYx5Rm9e0gB4T8BldUAbMJtOt+7kW@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+tpYZ9GBwXknpg9/eUeJIiniTzSdcK94GJfZkk/UCM6FMuDPL
	SzXvs6J4QjRlfMUPxhuXQMNCYunW7Vo+9WOouDz5RaWJhpfSrU7EUhRr
X-Gm-Gg: AfdE7cn93Rk/EIgLY+YaONr7wbzTjayskUHXqJAiRfhyQKBCqx/EMtaDmwE+yiAfhHZ
	FwfOZhT8FBwdXqfjlmefpxRRPyF8+Nt0WSx9Z4EZBfXOHQpViJFwWtRZfT52wJv+VOZt6zj5As/
	5gHaoPHVdmynbkg5v09ZHWf2HMwM6DHHdNpCMgoIKCS6537i3s+A8vM03P3wWRMcK1xTFsaT/XT
	bSb30RXlz01kAQO6RagwcsSLba5ruOT+f8kuI0I7hoFuPHDOmbcOGFjdvYfP1PPYkmBSlLG6rYb
	GW9daUi5nsPbD0Igd/km0WeKgkZCpBZz5cNLEgyft60fpyhmHJ6Oky8ptMQXN8revUZpKOE26vl
	400wYSeBkAv8pKm3etxQeLn3Nf5yk992WkTA6NnSk15BRPq31KK4uDklk3bKxnNBs3nuPcYVP2J
	E0g3Spy3W6kEs0BEc/w6Nwri81rffry+uM/jfDEA==
X-Received: by 2002:a05:6000:25f1:b0:469:d892:9cfb with SMTP id ffacd0b85a97d-46dbf30358bmr26899571f8f.10.1782751324306;
        Mon, 29 Jun 2026 09:42:04 -0700 (PDT)
Received: from [192.168.2.14] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm27737470f8f.0.2026.06.29.09.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 09:42:03 -0700 (PDT)
Message-ID: <eeba13d0-3337-4213-8751-53de0838c474@gmail.com>
Date: Mon, 29 Jun 2026 18:42:03 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [feature] PQC KEM
To: cyper@tutanota.com, Cryptsetup <cryptsetup@lists.linux.dev>
References: <OwJ5x3r--N-9@tutanota.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <OwJ5x3r--N-9@tutanota.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/29/26 6:27 PM, cyper@tutanota.com wrote:
> Interested in introducing a new LUKS2 "xwing" keyslot type unlocked by an X-Wing
> post-quantum hybrid KEM (ML-KEM-768 + X25519, draft-connolly-cfrg-xwing-kem)
> instead of a passphrase to encrypt the kek (volume key)?
> 
> 1) asymmetric model won't shine in single user case but will be attractive in multiple user/image enrollment cases.
> 2) if per-device fresh wrapping key is desired
> 
> 
> I've implemented such keyslot type and tested.  But don't know if the aforementioned two cases is worth discussion.

This is typically something that should be done through LUKS2 external token while keeping keyslot
encryption as it is defined in LUKS. (Maybe you did it that way, no idea.)

Anyway, what security issue this solves (except "it is PQC")?

Milan

