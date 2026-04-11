Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386CF13A3ED
	for <cryptsetup@lists.linux.dev>; Sat, 11 Apr 2026 21:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775942508; cv=none; b=rlKcvTCus598N6a1REXLIwiSbsuaxYWdcWeoxN/ERbmqaHsEIwcaYgebSWGhd6C5YXZV0DFgDCVwN/QqqO+y3qnwDmx92x7tLVFWGuLrpzy8/GLADRARhEzqyJRnDui4cmjLmSqNjoaJZ1H++aGsfmGnrmZklBjtVjkwK4UHLHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775942508; c=relaxed/simple;
	bh=6b5mHgU5fiKFcORQeVUEefGNrN3ZnzObrHIr4HqLnko=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qc973UEdZGI3wC4keyvW/9xjD2hmWDG2YYaZN8GDgFwgzV1rwPcuX+H7ipTxjzCBZeXkIYrMw8Rv212gwIFDNWVyDk8hzRSUa+cE0AbmLIceDGLutY7JHti1WNbug4Qya7XCa7/DZ8Uq3L16+C1xWzf6M/7NC6RsbmcvNaxg1QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8V2rt86; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8V2rt86"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d03db7f87so2026099f8f.3
        for <cryptsetup@lists.linux.dev>; Sat, 11 Apr 2026 14:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775942505; x=1776547305; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ctWTH7uJG1O14LOJYV6mKEeDwxIgcTC2tqFb01s6jKE=;
        b=S8V2rt86v2OnG4xxykwXrNJybcZmvTDHbhFKFwO3YRmkXJLPz0WF6aBQZHe43d8J7q
         cIGmWBKflMAF0QiISKmT8lY3gj5vFoGPKKpSm0lNcLboBI55Xa40I8grYtP/8UjeR9B4
         KuBins1fJcgnwK2WE0q79C6DlNGVvDgZntwQLy9yrxfrWR9HoetCGL1BfqoHZVU6dzpC
         O1bPUCo9oazHOhCGPegPL9hiKTdYBA44B+GSt17c0bUfzcywkB5yY6F1ZDYsz/Jogf0l
         PBpxNkAufJGUkSy5CrYuOiHEoZPevNMwLmPs1pwygRi/8bYamdy0cfD++Jqagej7bujb
         IdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775942505; x=1776547305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctWTH7uJG1O14LOJYV6mKEeDwxIgcTC2tqFb01s6jKE=;
        b=LmNf4WD2cnGPKF25uVejb87CXJKxGQMogMbMswfN4ZP5t3uFf7yWLJLEeNJ4yj9Yxl
         dQlSZOHeWwbKMY9sahbtJto17gRZAPtJyjgNCMEjsuq6Blx4qmgslFcJrGJ3D7yww9wa
         DAVfc+7SpvNNhhKEhtOIz0Pbq6B2s5sbKpyestA4CiRvh3lJ8ngWl59t20a/LQde8q0E
         YqZSxdlNSfU17iV83qzSDqw6ix717iercNwyDRYkByDLkgSqXmnUDmI0Zn1InNFJaGpv
         aPaYmQyNWEgpBf6M5FKeKxO0tMvEB4uC+gYcdR2DvktGaBcMoR4By6+HAmowE+OCGzXX
         sU0w==
X-Forwarded-Encrypted: i=1; AFNElJ8B/IBka6hpH6xGhCxW30PCoN2vqqj5XR+JgZLbJ58UYwmU4E+AK6fTbSgte6rWCxYrdwwGWkmooWB9@lists.linux.dev
X-Gm-Message-State: AOJu0Yy87yL4XY5Sm3yM6cYy1f4J/GH+03ZDp/XBi1Zx/jDF7O+AwlSk
	DvThc6nagyrhgk0y31N8KPtHZObUzNesoCxxmM+W7VqbDHKPOyLL5Brl
X-Gm-Gg: AeBDievBeoI7jxtdkZ8I7nrSVSjd5gGNP79DeF8MWbMQirGyPCzMVJHdUS2harXqfAV
	8Ap0LtRgh+JK9Km0lN1VH7B2Um+LD+0GB+6rbZB/4/51ON5juUdLQaddEiEEddT1XE5PiKflROh
	2DI1FbHYnEsSm8G0tOOokVuDUSGC3A4IiXZWF0/oketRjnC3Px0nUeJaSc9H8lKOi+CbjVSCtp/
	7YSwo7BC58OSioXAHuqfVkNfH+bo9kCrJqKIMaKy1aIUw650UZglDJIofLVcs1SqZ53pLLAnsUR
	wHb+c/cVcTQUR0NfmxAi4r/cgLvvVpNC0VWgSRFGzvisZeVScm1cvS52TY4EWq3uJ+dTgcLyaIL
	cv8hpxejKKzGp5O/eICrlPViclQ+LbigWDwhbZbH22xnnoU7viz/uG+XlsVZrw4FGBwFuo3jt52
	PHZgoPR0RsaEVkBbcepd2TvhU6OoBNmhZiKnfsqU9DZai60U7htDAna3xl2o8Cs2LjtXijKyFzN
	MDJeLo=
X-Received: by 2002:a05:6000:4211:b0:43d:7275:c1eb with SMTP id ffacd0b85a97d-43d7275c413mr537279f8f.39.1775942505393;
        Sat, 11 Apr 2026 14:21:45 -0700 (PDT)
Received: from [192.168.8.101] (78-80-20-202.customers.tmcz.cz. [78.80.20.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2e4csm20298191f8f.2.2026.04.11.14.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 14:21:44 -0700 (PDT)
Message-ID: <42b530ab-3f92-4aae-9714-076dbccaf0f0@gmail.com>
Date: Sat, 11 Apr 2026 23:21:43 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to use a keyfile
To: j4ck32 <j4ck32@gmail.com>, cryptsetup@lists.linux.dev
References: <CA+vw=V+c4SP+dPwY6oYk=V+QQS=797XuqSRan8N5vSSFwvN8aw@mail.gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <CA+vw=V+c4SP+dPwY6oYk=V+QQS=797XuqSRan8N5vSSFwvN8aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/26 8:50 PM, j4ck32 wrote:
> Hello,
> 
> I have a strange problem with my LUKS setup.
> 
> I can successfully add a keyfile to my LUKS container, but when I try
> to open the container with it the keyfile is rejected.
> I made many attempts with different iterations, but the result is
> always the same.

This should work. Could you try to add "--pbkdf pbkdf2" for luksAddKey?

This will use old PBKDF2 (as in LUKS1) for keyslots.

If it works, I strongly suspect you have issues with hardware.
Specifically if you say "sometimes it works" - this must work always,
it is a deterministic algorithm.

I have seen this several times (note new keyslot use a lot of more memory
that could trigger the issue).

Milan

