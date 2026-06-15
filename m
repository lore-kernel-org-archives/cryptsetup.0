Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAF6211A14
	for <cryptsetup@lists.linux.dev>; Mon, 15 Jun 2026 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781515993; cv=none; b=WZwzOrHIJrwXyB6kk5QgTuHEy5WBk9gz1CIWKXI/Q/+kPYZ5id3Tsx+sCupFrybps8MEf3ZfLPmhk9iGjqQJaCk+ip6Iig8uHU6+Tf78e/K2ueTeUcYB/BNml/gZI8AxkZZfNNaYc2VqsJ0il8BpwIPNTrKscAvvJYE7KmWVlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781515993; c=relaxed/simple;
	bh=HKIaPHZn1LJQ68AyFArhVyBRKLo556ij/YVCurONMCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=cDkfL40U43GFdvoDhkyiWGByF1tdy9484P4LNGI2VElSFS1lenXkljWTHyk/tKPrim5nXq/Hlw3PLn2mJcUgEAFU/WD7BRD5S4FwciytzcX8xOZn7Vf9dWDfSUnmeqnqqzKHKZkVWk+l11WXGOHkcBQghPWfpBz3yDhHtNqg4pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hPwLxHNX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hPwLxHNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781515991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v49giEwCQOHROPlvlBw8c1pbST0f9M/iWiFDU0YjRN8=;
	b=hPwLxHNXP+DzlKxQneiYw+qLtYHaLU0nZiitpx5VQWlqrkADOc7XQMd8qTfwbcN53+Oq0C
	H3IST8XpojKjwNB3bMGER8iRwG03ZB9H0xv2yuUXNnrXVfX2utJ6DQ0EkoLWuVz0ggeWcw
	lgR8kb0n/+fgi/RE3Rmr+8srBLO+o7E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-fRiHHHVdPrCQbM1_R8i24w-1; Mon, 15 Jun 2026 05:33:09 -0400
X-MC-Unique: fRiHHHVdPrCQbM1_R8i24w-1
X-Mimecast-MFC-AGG-ID: fRiHHHVdPrCQbM1_R8i24w_1781515988
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-beb1f622263so253727966b.0
        for <cryptsetup@lists.linux.dev>; Mon, 15 Jun 2026 02:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781515988; x=1782120788;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v49giEwCQOHROPlvlBw8c1pbST0f9M/iWiFDU0YjRN8=;
        b=anascn9PNKrndPw6jzez5ffNNNfBGqyIhD4LQsK1hQLP+sBc6Ulspe9RbnSBHgdxQ+
         5j/U/mY2bktMGf698BzXipQ1JPI/g8nJUSrDfDrvLCrsWaTpY0sQYGzBbCmkR9kkIO7M
         u44O3GHPMx7JlGqJKJj92VGaS/WmTAxWa5c3yrVn4mTOr1zOkM82KYzMcKHou4lD4Sla
         z0Nt2mRpw1j6xIZfeHq9Ag6SW4U/x05nzTULHAIcfrfmcmI1Z7Dw7hpDRCoDPR3UU1mI
         dMu2jMs3jQRHcCvQwGFgXeKqzauiddS7+smsMTog4RcNNX9ehfZaJPbv+F92bWb5KYaX
         saBQ==
X-Gm-Message-State: AOJu0YzehpbTpLabVEqVLoh97KGRS5gWBY06Di6bTNfO7prJuSOXrO6v
	xoX1zj1ho6jegZmYbROTu94Tr7/MnW2SZ80wN3s6ZQlQu4ZX5gqPzvo12C2a1gclbYP5ucn9MXq
	gDMdAhWR3ckR1ngvz9y+n+JuSwblxXTpOwptI8MsRYnv2FEnFJ8sb+7r+0ljVATp4cGmZjLGmVM
	QywAegXyrABHBzsV/UPefgXglBVOXzH0pwF75QR6Xbwy9Z
X-Gm-Gg: Acq92OGDcqKi66lgzD4lZB+74ZmhJRWL+XDTUiBcyCDNf79r0FPJTfzhdrPCwybW3va
	yE9+3nlG4due8oI9Qp3UHwXjKccXTWYXwSkLt/auax70xuT93O4Y/XzDF25CmW131vSypFwjyXf
	TdD9V72hXgkhByfnefvlk9SsE8PjZt4TUspVHN2agcBycBd9q8eke4qPVosZ/53dvaq+kiZkl/g
	ei8NyWTfNiRZnoDzieBLbTNLa4bpZwmzEacp9IQ3c96fYnF9n7M0c7ILTMf61Vo9iEJY7H8FrHB
	z1r+bcxP5pHf3x3Nl0d8WbN7E00vf1TgWtYYc7mtPJdWxL4yhH3SbWPmPpH7mI2UtDLTM2IxBXC
	WNLUNwAcsMjg=
X-Received: by 2002:a17:907:28c7:b0:beb:2de3:1ba1 with SMTP id a640c23a62f3a-bfe2841225emr428806566b.11.1781515988479;
        Mon, 15 Jun 2026 02:33:08 -0700 (PDT)
X-Received: by 2002:a17:907:28c7:b0:beb:2de3:1ba1 with SMTP id a640c23a62f3a-bfe2841225emr428804466b.11.1781515987806;
        Mon, 15 Jun 2026 02:33:07 -0700 (PDT)
Received: from [10.43.17.192] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8e1db3esm427179066b.56.2026.06.15.02.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 02:33:07 -0700 (PDT)
Message-ID: <488b1720-619f-475f-b5a8-2e6ca855b8b8@redhat.com>
Date: Mon, 15 Jun 2026 11:33:06 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What does cryptsetup luksAddKey --new-key-description do?
To: Cryptsetup <cryptsetup@lists.linux.dev>
References: <OuyYP0g--F-9@tutanota.com>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
Cc: Borden <borden_c@tutanota.com>
In-Reply-To: <OuyYP0g--F-9@tutanota.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xTx6qveyajw8wp1j4w7o9mqN4NGtKW2gMEsYtEzB0KQ_1781515988
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/06/2026 03:32, Borden wrote:
> I can't seem to figure this out through the usual means. `man cryptsetup-luksAddKey` says:
> 
> --new-key-description text : Set the key description in the keyring that will be used for new passphrase retrieval.
> 
> ... which I assume is the kernel's keyring. Passing --new-key-description="Value" yields:
> # Verifying key from keyslot 0, digest 0.
> # Requesting key Value (user type)
> # keyring_request_key_id failed with errno 126.
> Failed to read passphrase from keyring.
> # Rolling back in-memory LUKS2 json metadata.
> # Releasing crypt device /home/me/dev.img context.
> # Releasing device-mapper backend.
> # Closing read only fd for /home/me/dev.img.
> Command failed with code -1 (wrong or missing parameters).
> 
> luksAddKey works fine without --new-key-description. I'm trying to understand what this parameter does and how it should work. I'd also like to ask that the manpage be updated to explain this parameter a little more thoroughly. I'm not sure how I am supposed to know what I'm doing wrong with the documentation. AI said it should work, so there must be a problem with my bash or cryptsetup installation. Something's obviously missing.
> 

It reads a passphrase for a new keyslot from a kernel keyring key with 
the description provided as --new-key-desription value argument.

I'll improve the man pages description to make it clear. Feel free to 
open new issue on https://gitlab.com/cryptsetup/cryptsetup

With regards
O.

