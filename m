Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9C13C3449
	for <cryptsetup@lists.linux.dev>; Mon, 20 Jul 2026 20:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579314; cv=none; b=cd/3eQey/zaahpNKolMaCp2JvIDMYbTVmtHXSZdLanZHHwo8LegN82MPvbePFJq7VGuelUN5owQSa06BJhtimhrAzv+WhBiuSki9cb3S52wp5g8Rmi91o7fZWxhIMLUOE9aW78uBnU+Pe9jtrBDzwMyzCIB+I1iQuBW2IPffzPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579314; c=relaxed/simple;
	bh=gfJ8kLV1ToVyegaK5H6KLU9tU4/+Kh13p8ab8ENnaZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UnhWZOYfqZ6kaAQiD7ayMIxNyzBKOHTk1mexHJ39FG2ULpVoHdPw7V+eSMRZ084ru7olI+ZMYEsx2qhHtGM0qN3mfros9DqHHOlHXVnxynOGnrzUqp3fEesd5Jw5XYzYSYIQsTUHNuNJOr2/hzx+hY+Wj1xIgP44d5BqLfxmUFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uo1HTiDc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uo1HTiDc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso21907415e9.3
        for <cryptsetup@lists.linux.dev>; Mon, 20 Jul 2026 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784579309; x=1785184109; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLL8aCl/3mqY5nSJS3rFhrEj5uf8U0z5ksO8YrySKls=;
        b=Uo1HTiDcLjwwOym2EUKNSFFBW3kuAevZTdqH4HX8aMxRulLb7hvtelhD+EVKNrEp16
         cZo4qKAv1cTakWhyjiKPwpZ1x7IFPWQOTiK/gB+8zj7AMv2ljJbBi9rpAx4WQFOYBeeB
         7czAw4DnLGC/8Ok25Bk+Pk8BsaAoAC+OWsjg2wnPXnh1DCucw0OW5H4ht49TzWu2UnQm
         BVS+9bR5g2Ns3h/k5EFmpbl6s4OgTOdhildGh3mabWewKeYYdktmjkUusY8M4dHiRWVE
         8SePOqYVkkLhL4Wo/Z+Vw+kmlaIRto8lQt1B09uRML+oPfcKAUPDumSIV0xacezkGYil
         IexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579309; x=1785184109;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLL8aCl/3mqY5nSJS3rFhrEj5uf8U0z5ksO8YrySKls=;
        b=gOlQMCHOZ/MsonNqOGliUUoNPd9vNyho4rMS0s4pNb3TYuAFS2qzKQ4z6mxVhnuk5Y
         CVhP+iN/0A0fk9piufV8XNS8fYsqShxyW6vbgfVe0XDEIkeelhJGckLEf0JmxKeLdfy+
         7JfFIgsbpl3osg/4uyz2sWu1iCZiMifm0TZFBnXqeFkhtFn5YPW3qUkftipAC2gx9BGK
         pwcz2zcjghFaRGKJsFlNRk68ymXXi8krXyZWEmsDZQR0r2tlNdvkACvymfaooNyfE4YV
         CxvtUKz9iMqAgsAj2jJY0BGVa3t8DpL7aWnscEEG5uYb2N98fAoWyGI0RbBt20HH7xPZ
         pukw==
X-Forwarded-Encrypted: i=1; AHgh+RrQ8x/qX7ZpbvVpZws3FmCF1H2MgKzYwrPfCDxFrdfjinruJzNfJzh9oRMN7mLsfLo9nk03UdgjYATU@lists.linux.dev
X-Gm-Message-State: AOJu0YyD3GJtx1930Z/TWM+mPmd/n8jgUksWbT4aZ68jcBQfENQM62fp
	6kYWHohI02X1wFTMQLNzznosHW1xalLZd+JxgS7R7HsIU4sCIzNIm4g6beIdbQ==
X-Gm-Gg: AfdE7cluVEOrZxXjjUdIRhxUzSTh/7VbG2Ru8ZEPIjBzQXwrHP1tcYjeaqdMZPVjnvt
	VwzyG57I6deI5lP5hv3yj8DFvTqnI5pKW/gAmRpxr9SGje8HmToQ3raW5S2XZ7RY5n0fN0pFHl1
	lQ6GOZ8eF1yLqmNV8jNTFkibvQF8TchLpl1YeOC4d0qZrjUBI/ZPRpDlyzS5JBZOd8R0IFAXHML
	OPC1JYZyIBZk0y8HlllHwLbUHEVWU0LwwSxuFryA/j9fGrSPFK278rxN7t1AjHq/9ZwiWWONJUw
	0k5l3yYkaVz2Lhr3QnTWKbWiFq3at1o78ZcrIewaDT33x2usVs6pJIxCOJlEfWtBkSbGko2xWhY
	R1guBvZZDbz2m4zKFKmr4bDZo0VTq6k3ma5s6Q/NzGkj8SKYMdW9rN5tCQ1m03zPKmalR+4wD+g
	WNN9ERt0oBlRQEP0SDXykREN9MI04=
X-Received: by 2002:a05:600c:1c0b:b0:495:46dd:e238 with SMTP id 5b1f17b1804b1-4954a50ea30mr199003405e9.30.1784579309207;
        Mon, 20 Jul 2026 13:28:29 -0700 (PDT)
Received: from [192.168.2.14] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49564011868sm32538145e9.3.2026.07.20.13.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 13:28:28 -0700 (PDT)
Message-ID: <1ddcf551-ae22-4677-9910-37aee6895422@gmail.com>
Date: Mon, 20 Jul 2026 22:28:27 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: luks2 + integrity + discard
To: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>,
 cryptsetup@lists.linux.dev
References: <al4RjyA894rnZxAK@lazy.lzy>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <al4RjyA894rnZxAK@lazy.lzy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 2:16 PM, Piergiorgio Sartor wrote:
> Hello,
> 
> I'm quite puzzled about the, apparently,
> missing support of discard (or trim) in
> case of encryption with integrity.
> 
>  From what I understand, which might be
> very wrong, both the encryption layer
> and dm-integrity should support discard.
> 
> Reading the documentation does not really,
> at least for me, clarify what is the
> reason why it should not be possible to
> have encryption + integrity + discard.
> 
> On the other hand, in case of integrity
> under the raid, with lvm and luks2 on
> top, it seems possible to have discard.
> 
> Can someone provide some clarification
> on this?

Discard (TRIM) is supported for dm-integrity
standalone mode. It is also supported for dm-crypt
standalone.

It is not supported for stacked dm-crypt over dm-integrity
(In authenticated encryption mode where dm-integrity only provides
interleaved metadata sectors for dm-crypt.)
(And it never will be implemented for this case.)

Milan

