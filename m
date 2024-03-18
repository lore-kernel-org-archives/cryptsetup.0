Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21DF249EB
	for <cryptsetup@lists.linux.dev>; Mon, 18 Mar 2024 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710769538; cv=none; b=J7wcoRe9iJ0sGj+suYTKAlwDRrRiF9D7Or9L10DDCVZ1eRm8KJ/AEu5Koio1jLmFq2fdD02zbTBNnGFnt/0Swqrguk+2iYSiQJW6fui1NA3z/XbBhFBZTAL1srsevrSwubKSuwN2PCHbzeJQkOQHDyLu9mQ2tJ+bOj8BoHmeVGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710769538; c=relaxed/simple;
	bh=lzocNq3OYah0X4i0bXDsPhLJlYI402UXwUde+2HzDlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2vxNfErVqp7ceqfADgVql3QS1LOMc8hEw6Rh9nVc/uKrhhEawJ6n4OeLbDk4+DRiqCdhie7ND+mxwdaaELoKrUwBa2JWPpq161J8D1INTk8w3hf7dldUIX5mdxs96SVouoOI84q48432GHcYqPc3PB6iNkGBngGIW10DMAcIc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WLPUweBi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WLPUweBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710769535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Vlm5rzKWIu6osmI45+5BxjzSoEnI4zTFZ4pHZw/N2TM=;
	b=WLPUweBiPakavwDQ9J3z6SfQ2AmCU9itqu6EItLa2ebViYFu+B7OtxBMVzr4yqKNpgum+S
	x9Et2cYwfsL6OAg3DhglgeUGaSa5luSDXLm7nCGhJ15JDy9phooyNuBhCWb5tgFJuaOg10
	RmFAsKAh9nsXBCyAoELILh/D9Bz0hAM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-KfNleEJzP9KlZtNPCJby3g-1; Mon, 18 Mar 2024 09:45:33 -0400
X-MC-Unique: KfNleEJzP9KlZtNPCJby3g-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33ed0a8beb5so1959763f8f.1
        for <cryptsetup@lists.linux.dev>; Mon, 18 Mar 2024 06:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710769531; x=1711374331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vlm5rzKWIu6osmI45+5BxjzSoEnI4zTFZ4pHZw/N2TM=;
        b=IG4J7dWbU4Wj1K5KO0S6/LVusyHaokp0oxpA//oTC/7KdG3v0rWbIUIbIJuxvIqICW
         G0fir/m4SrzKwJX1fFXNgYHaZg0XPlDfWK44CIH+OO8tb5pHO8slxepwgsYldcLytbJr
         qH1KFn7gAWflRwP+S3BY/N/BKDLuQdkS+yybkWujXaR0OZ9a7NkF2Dem7u1DJdzJNh93
         h60dAafF8M9f/TP9Fmxf3UrX412xt9ES33eM+VhLNfYdVspM/uIosYyb5H8JJDOBhY11
         Rgpf9gOygcX+w/gUQ+Z4rL1s0Vw9vGorltZk4HG72JKL5ktzvKOG7CsMHav171IQixBj
         cG5A==
X-Gm-Message-State: AOJu0Ywu1y5U2v1hmUkRDaed4eRYuWffisqVL5HE7yyEMMHTOgIWlPjt
	H6GyJePkvvsiix+VHJ4Hk4LyZ22t2L27VaVhRI4lD9rvBah+x2EozGEdpejugKz8V3JRf3MdN/K
	uWzbbXWtlB68Zn4fDdOpTWvtxTLGa6B5HtcFzd2p3I1Hgv15DsMP4f1SPSfavd5ssI1nix+U2TP
	8j/XziDEfh0gEpYu7S3DUPo6H5isbNVrust6c3H111
X-Received: by 2002:adf:e64c:0:b0:33e:cf4d:c581 with SMTP id b12-20020adfe64c000000b0033ecf4dc581mr7311629wrn.41.1710769531440;
        Mon, 18 Mar 2024 06:45:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpAjhWiN9lNMfWrS5scIz/ZLC01UI13fEY789pejAk2RbqD3M1du3xf21/IB0Tt6TuGZ1iig==
X-Received: by 2002:adf:e64c:0:b0:33e:cf4d:c581 with SMTP id b12-20020adfe64c000000b0033ecf4dc581mr7311609wrn.41.1710769531021;
        Mon, 18 Mar 2024 06:45:31 -0700 (PDT)
Received: from [10.43.17.51] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id j1-20020adff001000000b0033e17341ebesm9841413wro.117.2024.03.18.06.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 06:45:30 -0700 (PDT)
Message-ID: <186111b2-f007-4812-8c62-0a8676d9528c@redhat.com>
Date: Mon, 18 Mar 2024 14:45:29 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: OPAL setup for a new drive without sedutil initial setup
To: Cryptsetup <cryptsetup@lists.linux.dev>
Cc: Nikolai Grigoriev <nikolai@grigr.xyz>
References: <NtEMHPl--3-9@grigr.xyz>
 <c238a50b-e382-4dec-9b4b-9c33e420b541@redhat.com-NtFh9t5--7-9>
 <NtGgb5H--3-9@grigr.xyz>
From: Ondrej Kozina <okozina@redhat.com>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
In-Reply-To: <NtGgb5H--3-9@grigr.xyz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2024 14:13, Nikolai Grigoriev wrote:
> I tried to enter a password expecting it to become my new Admin1 password. That did not work. The message was something like "Invalid Admin1 password or permission denied". I ran it with "--hw-opal-only" against /dev/nvme0n1p3. The drive us brand-new Crucial T500 2Tb. Never used sedutil on it. I will try sedutil now to see what is going on and to set my password.
Well, sedutils will ask for the Admin1 pin as well before it can report 
anything interesting (e.g.: list existing/active locking ranges).

Feel free to open an issue on upstream tracker: 
https://gitlab.com/cryptsetup/cryptsetup/-/issues, just add --debug 
parameter in luksFormat command.

Also the device model would be nice to further debug the issue provided 
it's this very device it does not work with (e.g. "nvme list" command 
output)

Kind regards
O.

