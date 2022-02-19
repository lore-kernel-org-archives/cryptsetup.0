Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988365137
	for <cryptsetup@lists.linux.dev>; Sat, 19 Feb 2022 09:34:12 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id l67-20020a1c2546000000b00353951c3f62so8020854wml.5
        for <cryptsetup@lists.linux.dev>; Sat, 19 Feb 2022 01:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=CMSZ2MDYM7y4urXj79F9JtlHHNacm0G4na8icjSyu50=;
        b=UB+aGJ0d9D9YhmahQ637WRr1JrlqH8kuUbe6E3lCu9NLeedraqsfxpDMPj2gErzOO7
         6ixknqhCotj0fa7gWN2qIB4rIMORmmqMndF+EyLXQjOkx9gHZQeP9K+YpTaNK1YYIvhl
         9/tvAz+2FYju6GaDz8Pq467suQrY4gTqt4p9bYE5tyM4TAWVatSJyLfukn8mdfttgpGw
         Wc8XC+JFZlV1c/Lha4xKQ66Dwx3PCvrgdf8Oxqki8tm0Zhd6FWSOdIdvQ2+LgHnd9p3N
         io8eJWQmdBJWAdUM3Df23wt6U3Ya84RNH1W3yn4db7n6BRVo/GL12hCn0A3W/nIKmtF1
         6ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CMSZ2MDYM7y4urXj79F9JtlHHNacm0G4na8icjSyu50=;
        b=lU3o0OU55at+zCvr8XLx8KVpBu2blI5RdGBY5wBnwyS/zcghDBbxeUEBvORiXW5Yqw
         H7DzTG8quhU04ttzlW7MVWnQXl/weDbLIey0SW2JR5SeeaxS7i4bxfCtj40kxVq85FzP
         MCVre0cO+AABU8RdzBoceVbNttPoy3jrOExUSSmVBytQQddBwyTlTksuGj+ehugva554
         dIB/w4CYqz0JSI7sX+OxTSkRSrHRvpi2yXqW/fX/Jw+FegJWULCZJEvL/6vFAACulveO
         32+CHxsWXC8G/PQ20c6c3PCTjrr255RZ12Dj9jLnk2BLWhKzsiHHolHwXEfNjFJLGfST
         KBrw==
X-Gm-Message-State: AOAM530TIEA+1CN0Qvxj8PwBZG3Q+lT8NDpI09+q3ZsoYB11EIovhgb0
	7WZi1aj/hGkMZuDTHbGjiknmlvfl9rI=
X-Google-Smtp-Source: ABdhPJyOxC1vOt5C2H1vd27/MKRFp92l3xrVh27x0Ug8+HnNk6MEJBs2qUrVlcx7WaYXQBLJV1gQ+w==
X-Received: by 2002:a7b:c4cc:0:b0:37d:1e42:4ed5 with SMTP id g12-20020a7bc4cc000000b0037d1e424ed5mr14128835wmk.133.1645263250767;
        Sat, 19 Feb 2022 01:34:10 -0800 (PST)
Received: from [192.168.8.100] (78-80-123-227.customers.tmcz.cz. [78.80.123.227])
        by smtp.gmail.com with ESMTPSA id o8sm1764176wmc.46.2022.02.19.01.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Feb 2022 01:34:10 -0800 (PST)
Message-ID: <24e9d0db-696c-66cf-46b7-061c2c8674ee@gmail.com>
Date: Sat, 19 Feb 2022 10:34:08 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [dm-crypt] New cryptsetup development list
Content-Language: en-US
To: Maxim Fomin <maxim@fomin.one>,
 "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>,
 "dm-crypt@saout.de" <dm-crypt@saout.de>
References: <82c29d3e-7b15-dcb1-8f00-450b6eb336f3@gmail.com>
 <BzIwjC2M51LuNupbxKSwacIsPL6XZqefmenfoSp2a_vm8FHoaTwX4usbRInKzSPcDkIRp8SKea2UDMrgIJKuFqiY97rtDcYIoXv6xQIVjOo=@fomin.one>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <BzIwjC2M51LuNupbxKSwacIsPL6XZqefmenfoSp2a_vm8FHoaTwX4usbRInKzSPcDkIRp8SKea2UDMrgIJKuFqiY97rtDcYIoXv6xQIVjOo=@fomin.one>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/02/2022 08:08, Maxim Fomin wrote:
> 
> So, from now cryptsetup is offtopic at dm-crypt@saout.de?

No, that list still exists. You can use that for anything
you want, but I would prefer we switch to the new list.

There were several outages, and we perhaps lost several
emails.

That said, thanks Jana for administering it for years,
but this does not scale anymore.
It runs on a private server, list archive and web
administration is not fixed for months, mails are waiting
in moderation queue quite often, etc.

For dm-crypt (kernel), you should use the dm-devel list anyway,
as some RH people maintaining dm-crypt were not subscribed
to this list anyway...

Milan
