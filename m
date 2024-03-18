Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139AD1D529
	for <cryptsetup@lists.linux.dev>; Mon, 18 Mar 2024 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710750993; cv=none; b=gGgufZ6WBQJ1qN4G62sJf9jdy5qh47X4UPv6Sl9MYlrvWhPiOFQMG0pjkInSY+aaL/bu0FEYmRbUgCGCiFWg0eXNMFgaLafAXfxjb6K7hnSgwINB7Jkhmm6ftlTh3m7S42+n4od2zABNsGmfEsVb5Rch7DsOxD3LVirzomAh29w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710750993; c=relaxed/simple;
	bh=QvBPmX6ohWtod/4HXx0UCQhVoqbN0ZcznhtPWAqPg1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=Eq6P0F7dyK+R3B45/3t3+wWEVsd42Oa1QJyrkc2KtgxKk6KQJXTylKhafQ0nk4sXo9NpAHtJlCw12u8VZsBkWBCPbI7wTUnNe9vABPZjV4SxaSqNh8y3qSewG2EFT2UhscCnLidRCCak5vKugFU1AybtKsBVNJX8IVotdGczKdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CvmSJlZ+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CvmSJlZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710750990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NkGQNrU8Alate1C3fJcyrxWZH56QEsbwcS3f8FgSaU4=;
	b=CvmSJlZ+s7gNg/HgNHNY1HhhgkY/ooVQroeptmhwvWKc3tcZnm1NIlFUZdteR2qGBBS5NK
	9ItIWl8sn9Y4irYrHspmJvD+kyDuVNYcm3WODZpVBmKPxk4Oex/7I+Zb7HE0g9EbLckz9N
	qs5TUrllk49K7lwaSlvZOHLYyGMI6OA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-5DqJz0VeOJS2y4I1QXqJsQ-1; Mon, 18 Mar 2024 04:36:29 -0400
X-MC-Unique: 5DqJz0VeOJS2y4I1QXqJsQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-513d3f026d4so3058688e87.3
        for <cryptsetup@lists.linux.dev>; Mon, 18 Mar 2024 01:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710750987; x=1711355787;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkGQNrU8Alate1C3fJcyrxWZH56QEsbwcS3f8FgSaU4=;
        b=KxafrvcHOcdbXJccYJNvsiK5PETYFj/7SsyEQBHrk+sU2CxBgdG13f/xlc9h97/IFA
         U28DbObX6cc1HzPg6FzU5ch5eXho47E+7z1u5Rz+dN1VoP9bC9/I1Cvva7ey6/uKJlxy
         hBUB2I25VIFBj0+7judD+9/f1QXb2Oq4/Fud2zXA+FxVpITwli35/tGzq60EgZSbM1os
         /m6CkVNM2JhdzH8GJ3MlmPDE6vHIvSfm9f+Y7sNvIkGQvxdE4whQjmtf9iHD99Z2/b9r
         G5fiGqbPyHEGhJY8wyCoO1mfBRJCJRwEPn8hMyU5pZCtiaosoPttqB3xzlc+tdC9EruI
         Pd1g==
X-Gm-Message-State: AOJu0YwEafLwQ0h2QH8GF4VqXy+ZeKXkJB2rNmeHXrLrn5hw4JBTKM9y
	djgX4Z4V7uPFtWwDkB9KMEdrJq4USpryYQR4Y+Zfzj65MMvWUSBn3KQS8BI3J9/2S9fdWk4Zoow
	swPMu3r2Je+/beOeUkPHyOlNTRFrQJIBPqYxqe5HHRfGUaWoXZY54e3dao41OL6qYZt/89bKtmT
	Nyki/IDEieUIk4RHU+8by78QhevVWaV+uUGp+/W6yJ
X-Received: by 2002:a05:6512:470:b0:513:cf52:3c15 with SMTP id x16-20020a056512047000b00513cf523c15mr6958923lfd.49.1710750986962;
        Mon, 18 Mar 2024 01:36:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbu2ytNivc4x8+fTaEpE0v5fT/f/tYTNkEKUi+wBZf3JSeagzc+P6H//jPpZOTwOiNvw81pg==
X-Received: by 2002:a05:6512:470:b0:513:cf52:3c15 with SMTP id x16-20020a056512047000b00513cf523c15mr6958901lfd.49.1710750986502;
        Mon, 18 Mar 2024 01:36:26 -0700 (PDT)
Received: from [10.43.17.51] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id o14-20020adfe80e000000b0033e8c50fc3fsm9217074wrm.90.2024.03.18.01.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 01:36:25 -0700 (PDT)
Message-ID: <c238a50b-e382-4dec-9b4b-9c33e420b541@redhat.com>
Date: Mon, 18 Mar 2024 09:36:25 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: OPAL setup for a new drive without sedutil initial setup
To: Cryptsetup <cryptsetup@lists.linux.dev>
References: <NtEMHPl--3-9@grigr.xyz>
Cc: Nikolai Grigoriev <nikolai@grigr.xyz>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
In-Reply-To: <NtEMHPl--3-9@grigr.xyz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/03/2024 03:21, Nikolai Grigoriev wrote:
> Hello,
> 
> I was about to set up a new machine and I was about to use OPAL the "old" way. And then I discovered that cryptsetup now supports OPAL! Thanks :)
> 
> However, something is not clear to me from the documentation. When I tried "luksFormat", I was prompted for both passphrase and OPAL Admin password.  For the former it is clear, this is the passphrase for LUKS2 itself. However, I never configured OPAL on this drive, thus, it does not have an Admin1  password (and SID) set at all.
> 
> Does it mean I still need to  use "sedutil-cli  --initialsetup" before using cryptsetup or...or I do not understand what  is expected :) The documentation seems to suggest that this password needs to be provided only when initial setup was  done. Should I enter an empty one then? And if so, what my actual Admin1 password will be after setup is complete?

Cryptsetup does the initial setup automatically provided the device 
report itself as yet uninitialized.

IOW, it should work on SED OPAL devices in both states. Either, you have 
to provide existing Admin1 PIN or you are setting a new one during 
luksFormat command.

Kind regards
Ondrej

