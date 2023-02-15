Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3000D307
	for <cryptsetup@lists.linux.dev>; Wed, 15 Feb 2023 23:54:11 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id b1so377893pft.1
        for <cryptsetup@lists.linux.dev>; Wed, 15 Feb 2023 15:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:references:in-reply-to:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOaUjS1Z/NsC200rAiqHUVx5Ygku5xFn2taTR22NMHg=;
        b=p4pofE9Rt04CK/esRrmlbHotgadsmKcz3I9/8llXVMh4D7u5loQk3rfKzfgeas0FIx
         k35iOt/wImHWBdPAwniTKtFehhzKfsnAMMj1KWbW1+26aO0wM77DofHepLPyV690ZUNs
         4aJkrgvsn4unj4S19CNhtWIUN88P0BMDBoNsoKt4cC6Bm3H7Vj3oeIUMDldZtx6eiF22
         pk4MKRvCBG2jQD9ZTd/cgRTzapk6bK+c3cVJZEsrFqTnG/0sDilmA0VoJic41jn01r66
         r/7zpoz5/0Y2t/lDcFIu0CNgFsl6q7NTcGylH69YcIYs1/PxjGpjcCvGKroM2NnDseh6
         ZMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:references:in-reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOaUjS1Z/NsC200rAiqHUVx5Ygku5xFn2taTR22NMHg=;
        b=7rVrgGi3cqlQeVmtxVasG1UWDpUAsrcqB262aIxG0aVy8JN0qulN8weBNusbURELS2
         GdqBr2G9MlPO1PlQn6fL+Xri5NQXAhGQ9xAK+81YoJYvttp+1llpSkHPXhW1nWmnn9z4
         iJCY2H2G75z+ra7G79PWi7G5TzJXiEf0rklVD3WOMvhNtyCTSFlhWFXr33wtLOl0Xuq5
         rDoIP2IfVhAZ/aaK4lUj/TafMhvmlPGEWmJ4+Sw0lO2LEGHrJPVzXmyNgLuAzULsr7Wd
         7KCAzqI2LrR00julTaQNjCqhAYWzcor4TL9RZ9rYFvzgiBDfYLks15UCyQqzFZ7ZXU2E
         tUBA==
X-Gm-Message-State: AO0yUKWEfTjsga5hl4roXuW743j2zMTDktiWH2zHrDz9X/OM46Oy1f0a
	Wwn63XEkIaopA26xNDyRNnLxmC/4tM2d/NRUX0E=
X-Google-Smtp-Source: AK7set/V7DHqEA1OqJgWTJtbPFc7IqoWkPBkUwpySaMvVM9NcKwmSu7t7k6YOLfvYsgGqclO5ki0TFwRZIKZp4k/oVU=
X-Received: by 2002:a63:af1e:0:b0:4fa:d445:6486 with SMTP id
 w30-20020a63af1e000000b004fad4456486mr429324pge.51.1676505251219; Wed, 15 Feb
 2023 15:54:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:7022:f8b:b0:5e:61ba:8807 with HTTP; Wed, 15 Feb 2023
 15:54:10 -0800 (PST)
In-Reply-To: <CADo9pHjtMrBydk4wPpfeAkMRxBd9TTf_6AJx=a4dxRQB-y5i7g@mail.gmail.com>
References: <CADo9pHjtMrBydk4wPpfeAkMRxBd9TTf_6AJx=a4dxRQB-y5i7g@mail.gmail.com>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Thu, 16 Feb 2023 00:54:10 +0100
Message-ID: <CADo9pHjRi8w7-Toi_ybAJyHJxj_r_hMMaZeBdNekWvVgpPUNrw@mail.gmail.com>
Subject: Re: [Tp-sv] New: cryptsetup-2.6.1-rc0 (100%, 0 untranslated) - Swedish
To: =?UTF-8?Q?Diskussioner_om_=C3=B6vers=C3=A4ttning_till_svenska?= <tp-sv@listor.tp-sv.se>, 
	Josef A <josef.andersson@gmail.com>, droidbittin@gmail.com, 
	cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

MR sent: https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/489

On 2/16/23, Luna Jernberg <droidbittin@gmail.com> wrote:
> Hey!
>
> Had some spare time tonight, so finished up the Swedish translation
> for the new version of cryptsetup
>
> On 2/2/23, Translation Project Robot <robot@translationproject.org> wrote:
>> Hello, members of the Swedish team.
>>
>> The TP-robot is happy to announce the presence of a new PO file:
>>
>>     https://translationproject.org/PO-files/sv/cryptsetup-2.6.1-rc0.sv.po
>>
>> In this file 781 messages are already translated, corresponding to 95%
>> of the original text size in bytes; 27 messages still need some work.
>>
>> Josef Andersson is currently assigned for the translation.  Please
>> translate the remaining messages for the benefit of the users of the
>> Swedish language.
>>
>> Once the translation is complete, send the result to
>> <robot@translationproject.org>, using the Subject line:
>>
>>     cryptsetup-2.6.1-rc0.sv.po
>>
>>
>> You can find a tarball of the package at:
>>
>>
>> https://www.kernel.org/pub/linux/utils/cryptsetup/cryptsetup_translation/cryptsetup-2.6.1-rc0.tar.xz
>>
>> Thank you for all your work,
>>
>>                                 The Translation Project robot, in the
>>                                 name of your translation coordinator.
>>                                 <coordinator@translationproject.org>
>>
>>
>> --
>> Tp-sv mailing list
>> Tp-sv@listor.tp-sv.se
>> http://listor.tp-sv.se/mailman/listinfo/tp-sv_listor.tp-sv.se
>>
>
