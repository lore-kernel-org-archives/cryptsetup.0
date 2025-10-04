Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A7B19539F
	for <cryptsetup@lists.linux.dev>; Sat,  4 Oct 2025 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759607205; cv=none; b=TIa4yFLmibc7k/Ps3xfkj1SHsWJ78fBo4JfckQHB6d6nIBcRYeehTcYS+n5V7b8qThWH/awBk/JqRx5NjOh2uUySQiqDqZXoROwaGQ3/tHOB/LglYj4avAmmMe0xT+HPt6hgI1oqwM+QDOL0Q7vgfenuaXoq2dce3nerh0sGlwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759607205; c=relaxed/simple;
	bh=9ucHyaTiZdvMbyPW+WNkm+AzX6VVR368Z2VphI9C624=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPRQFXuS37egdCTKhwEe/45LW4a3sKAeEIcRA/rVRec0vrP0A8h/LyDNlYHNnl3MEwTunAwIQWSfaBs4sIrOaE+Y4EmzdnWBC9YqLXNz3OE2vqcZQSC3wWzfGsELDqhgqQBPcTUkw4Ttyo+TL1qVNSW9rHsrltEQ1a8+S0HGujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciyX9OlH; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciyX9OlH"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b456d2dc440so553253666b.0
        for <cryptsetup@lists.linux.dev>; Sat, 04 Oct 2025 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759607201; x=1760212001; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ucHyaTiZdvMbyPW+WNkm+AzX6VVR368Z2VphI9C624=;
        b=ciyX9OlHDh3hMmnsI6Og9QxJYMYJnHX/vZoRHGj1UTg7k9gE0em/hB2HEjOzAn2e0l
         dgK+4hYB72ruXYfypW3SnVrwEDDzgz/zmNE9dYT2Uaw7PNGHdEQFdVcmB48WTaQHMyms
         Or07Lcb1zqEJ5oy+zf9cHge3jrAD7Iit+B6n1VMPlxfra0AvpATJrxt2N48K45uZysM2
         nMwitjAwmvkphcPPDhVJBSgIE5wyYafpMz39AtAmGUbihAHeIHy8POZydp2uC+9gDidH
         nyWkWIV2ZRV8iOOaR7oH8oYGW4sCDqgnqyc35HzQ6tNj/jkXhUsRhj+RCS1kl4Rq33Q/
         kBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759607201; x=1760212001;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ucHyaTiZdvMbyPW+WNkm+AzX6VVR368Z2VphI9C624=;
        b=gZtGX7j7yZcxCUEQy2qj5PrEgCLIj6BoxOlupgC4kEhhXPu2cpGTqBVROIW3DRT3xA
         R54AvxshSjvfX1v482YDbaBh4mu884BzyPHYVZPIVZnn/jo9BMNUMzZcrcZsjTD0/vzh
         n0NmJFafoocZWLOBNphprEcKKcpEsAs7P87t7vUjS7uX5Emim6MAXkiLuedj8wI5gkh7
         LKbmq4KD2Z4Vj1Pjp/3Bo2D+MYhy6wRME/doKLQimvM/MeqRFAjWLBY+QmN/muy4BgzV
         mlr71iTsiYsD+cdD8kL9AJm6Rc607esWqaBDTQpWIrRM5CiyyJOKGIUqzfrxfx4j8HmG
         t81A==
X-Gm-Message-State: AOJu0YxvNF637zX72RUgA8Puila4spxMFPCPlooSxCi3mblzelf3TsIi
	E36x8YuBeD8vBxwV5ZL2SiUeXZ+CrUSGVlIOTsUzUBV9kIz/loeJJxwk
X-Gm-Gg: ASbGncuS+WArZIYflQjx9JWhcv/87Ziu9nwVaLInVT5mXNPDLzeC76bJmMy8VS2npQK
	wByRz/huoKu1BZxBuGp+h9FWzxqh4qx+J1D/m6izFKIoLTI2U8UkB7EOLuqNnhxLrah877RKhrc
	xnmnLQSHxfn9h3TKwM2yyiACWl+zeuJdd5fOYVkb/WQZEXdqlxZwrx3Vxd8rm2nh+hP85Rv1O28
	GTTv0NkuQXrvH85GI30gTYYM59cTROgQ8lX+qCeQJTOdqfiQhSCS3OHCUtwin+kZzlqXK9O34il
	9vIqCR6O7Xkts303CTNRPaEdE7DjapYpuTplnMj1HhGEo3JWFEUmj1dhEZ8KecFODEGZf18K1AL
	J37S0T+1PpCWCZtZqvwEfnCSZ5FjCLWWNNlDlmfx3kgSM6NwXsSTd/RPVndqMbEdXocpSmkKd
X-Google-Smtp-Source: AGHT+IG9UqMl7+QEUeican59IWtgKkJuSbG3Ls8p16sEWExHhD0WyOtn43ObUIBUyBewq4ml9ZUmNw==
X-Received: by 2002:a17:907:3c8e:b0:b3d:d547:8414 with SMTP id a640c23a62f3a-b49c439d843mr863696866b.55.1759607201367;
        Sat, 04 Oct 2025 12:46:41 -0700 (PDT)
Received: from [192.168.2.12] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b37bsm767544866b.53.2025.10.04.12.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Oct 2025 12:46:40 -0700 (PDT)
Message-ID: <2820a668-96b4-4750-9056-045c632eaa61@gmail.com>
Date: Sat, 4 Oct 2025 21:46:40 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Bitlocker: Support clearkey
To: Kfir Ka <kfirka3@gmail.com>
Cc: cryptsetup@lists.linux.dev, Vojtech Trefny <vtrefny@redhat.com>
References: <20251004003554.234647-1-kfirka3@gmail.com>
 <61a493d0-0236-4508-aec9-b29ea6433244@gmail.com>
 <CAGr_o3CFk+EaQ9uEXCbGWow9mE+P0AYinfqFytuRG0ckzGyCGg@mail.gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <CAGr_o3CFk+EaQ9uEXCbGWow9mE+P0AYinfqFytuRG0ckzGyCGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/25 9:28 PM, Kfir Ka wrote:
> I would like to create a Merge request but unfortunately I do not have
> the permissions to do so.
> It seems that you will need to add me as a developer in the gitlab project.

No, you can definitely create MR from your git tree and branch.

Please do so and if there is any problem, send me a mail.

Milan

