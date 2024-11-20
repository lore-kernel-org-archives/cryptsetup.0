Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E753200CB
	for <cryptsetup@lists.linux.dev>; Wed, 20 Nov 2024 07:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732087408; cv=none; b=qg7rBksrnjAH5xEX/EyeIBdjikk3lKY9xsqsPRhKnl+80WYNgnS9cGqg5G1iC+bYj2gMAi09F74rDfwYya3ahqgS4S0zPJvYEjosrhjoJc2qbx+mRm2MKY9LLfg6CpoOlzXMBzPQd4z6zUUH7q1PACTJl+YAScTFrHY88YNBP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732087408; c=relaxed/simple;
	bh=RT5+WKBBOnWpmAmcRocmk2xE4muWoJquNfM02efugBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UuB1HiH6on7PZfDV0fndSdF3YeenNA3pzZ1LuYX+F450fRic5C66eYJJzVYNn/yQXk/rWQF2kszJcJo6FTnFXgP4HZyt8I2ik3LI6DgpplV2MzgzXtLmkeS6EyKX0HoVXCdXqQge569DIvHMrINQcNMHSdCf9bjidfB/4AyaU0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tw7Mco57; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tw7Mco57"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53d8c08cfc4so4097053e87.3
        for <cryptsetup@lists.linux.dev>; Tue, 19 Nov 2024 23:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732087404; x=1732692204; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:reply-to
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/OJlEQ+TX/bdqbta5FGpH/LALfmCu2CaD9CDA+pIIvM=;
        b=Tw7Mco57WL8vGkkC6nRlKmnqLQ0jkNEHH/xEFBd1fifzf/og26Cunsok2heAO2y7lG
         pNEadUnwNqLS4SBPsFiG61t0kOTvPsnTkLBnXof9wmzaLWG1BFU2xgM+ozGi4iWT/xeq
         X6lk0l7ABHG35Dv0+LAUYOcUp6jf5/3gh0OJX5ybwkqCEWnJo2cKwr9D31/m6JsliGpO
         HmADCZ6PIGrPtzOS5fy0Lhrh0IeiPI2Wx4nvS789/3Cl2V65Brse0JKsU0ZkQBPmDFNA
         pr4Pqmn1GO4DUHJc+pyPjuTZXp9qoNSTO3fVtz0gPVZb9NR5jFguLzMGPEaO8VHEOygB
         pNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732087404; x=1732692204;
        h=content-transfer-encoding:in-reply-to:from:reply-to
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OJlEQ+TX/bdqbta5FGpH/LALfmCu2CaD9CDA+pIIvM=;
        b=OaZAmxF7mICrPGoG15Q+XEaAl7doRTPsXAS2ftoDeznx6XwBljPse+6u+BtjVLbnL5
         mns1oMMT0gHcbRR4dk99089kSAuiUEwdDRhFbbH2OouZCSOttZ/2V8e1fZxrzdGXr6JE
         9SOlpJl/UFAPwWfiwOf2RotRjh9M8PEpOIBgYpseWrWkciDAdzXhpanw2NpTgHCOPjhl
         fKWsTWLSmqd9cvkBZVB4I+vitu9w9TdM+kHeL82xcrAElcKGploUW2UdbWPotBim7wj4
         0srEKE8yzS6dpJrfQL3von+37dzN01eN7cJiGL9FCbNfilPUS3vlJ08SU7UdbrI1dv3t
         C3pw==
X-Forwarded-Encrypted: i=1; AJvYcCUexlk+dg1ZKOIUamLz3MDaIhPLSpCyqglaHuiwS7c+asOEvqnhcZULfSDnrMe6f1jyRaERHNcUZ0FC@lists.linux.dev
X-Gm-Message-State: AOJu0YzB7iEnrTGK3TRUKUURRrj+WcH5jYhsSh0jMamNS7BCWuFa5DKj
	67x9vQXbKkpv3Ybe1eFu4FdfMGw1lNnIWU1DP6ja4BQyCUBvGy8J
X-Google-Smtp-Source: AGHT+IHrQ2iwn+IOSJwZQ/0su9CtUOpDtBj8eDqeFgzZ1loQyVzZW3UYfwMtipOjqGrmLtMum6E4Lw==
X-Received: by 2002:a05:6512:e95:b0:53d:abd2:d567 with SMTP id 2adb3069b0e04-53dc1328c82mr646740e87.4.1732087404053;
        Tue, 19 Nov 2024 23:23:24 -0800 (PST)
Received: from ?IPV6:2003:c2:1703:bc00:7c58:e230:8147:f4a3? (p200300c21703bc007c58e2308147f4a3.dip0.t-ipconnect.de. [2003:c2:1703:bc00:7c58:e230:8147:f4a3])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-433b45d4dd6sm9161265e9.24.2024.11.19.23.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 23:23:23 -0800 (PST)
Message-ID: <18b89d77-f0f0-43ec-94cc-9bea2dd762a0@gmail.com>
Date: Wed, 20 Nov 2024 08:23:21 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: can't mount LUKS partition with cryptsetup
To: =?UTF-8?Q?Michael_Kj=C3=B6rling?= <152cc69a347e@ewoof.net>,
 cryptsetup@lists.linux.dev
References: <36eee136-9d15-4f4e-ac0b-083e6d6c3f95@rptu.de>
 <5ade3686-267f-4882-968f-a06d4ebe9215@home.arpa>
Content-Language: en-GB, de-DE
Reply-To: 5ade3686-267f-4882-968f-a06d4ebe9215@home.arpa
From: Thorsten Giese <thorstengiese@gmail.com>
In-Reply-To: <5ade3686-267f-4882-968f-a06d4ebe9215@home.arpa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello there,

thanks for your support.

On 19.11.24 19:15, Michael Kjörling wrote:
> On 19 Nov 2024 18:06 +0100, from tgiese@rptu.de (Thorsten Giese):
>> [...] and read everywhere, that a dm-crypt
>> Partition ist mountable with "cryptsetup open" (to get my data).
> 
> Terminology: you _open_ a container, then _mount_ a possible file
> system within it. The two operations are distinct and not all
> containers will contain a file system; a canonical example of that is
> an encrypted swap partition.

You are right, my bad. I meant to open the container and mount it after 
that.

>> When presented with
>>
>> Enter passphrase for /dev/nvme0n1p3:
>> No key available with this passphrase.
> 
> As long as the header isn't corrupted (and what you posted _looks_
> sane at a glance), such issues are often caused by keymap differences.
> Try switching the keyboard layout to US English without dead keys and
> type the passphrase as normal; see if that helps.

Let me assure you, it is not the passphrase. I tried to type it plain 
and know about different keyboard layouts.

>> Before entering the passphrase it says something about /scripts/init-premount,
>> maybe there is a hint on how to mount it, but I can't find it anywhere.
> 
> That file is almost certainly within the initrd, which is why you're
> not seeing it at that path after boot.

I found it. It is a directory in /etc/ from which the initrd is build, 
but it is empty.

I managed to open the container. I added it to the /etc/crypttab of the 
working NVME and was presented with a second passphrase prompt. So the 
container was/is not corrupted. I ended up with two volume groups with 
the same name, but managed to get my data back.

But the inital question stands: Why can't I open the container with 
cryptsetup when it can be opened with the boot-mechanism?

regards
Thorsten


