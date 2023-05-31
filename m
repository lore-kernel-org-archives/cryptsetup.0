Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E38F51
	for <cryptsetup@lists.linux.dev>; Wed, 31 May 2023 10:45:44 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5149c76f4dbso5843648a12.1
        for <cryptsetup@lists.linux.dev>; Wed, 31 May 2023 03:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685529943; x=1688121943;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A1pfdIZsMBNLnkoxItO0qL358d0TriqJ2pkdWwaC+/4=;
        b=OqXH4JVfF5AJjDwMdd0PiJs2rN2qYSI3Vmvc5dkD6HYrVx0NitEH9nutEcJH2I2bpV
         9pkbSGHAhV+VCupMsZlPULh4C9jMLGfRsgdKrFYYwWzydFoP13CPs+TxnSc9EPBhMLLJ
         Ep5Xzun4X7DjUYRQx8/woUZg4nzllsiBiKy9bqlzJVyIu5bhDUGE+XNALzaF9NkK2D+Z
         njsR0OnaeLRJn9KkTRiyTWMsGj4Ak9RgncJ08EGgyi0T/GvaxIczgPKaeh2Qih38HxSy
         Qcr40XFM6Wc6ZP76ippw5tc0DstXfip11KzKThYQUYCfWZ2CATF9z0zfWTqKT6KBGaYS
         rJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685529943; x=1688121943;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1pfdIZsMBNLnkoxItO0qL358d0TriqJ2pkdWwaC+/4=;
        b=l9/0yinj9RiWQ4FaAAVolzGcUK0SCkDCvPpzGtoyse7fdhGl2evLEZSsZjKqmyna5D
         2crwuaTBHWlAuvY/egFCS9YmN73Oo9TuPpWlSLaC/t1dEbbHsoPRwf9T8ZGQx3DNXEWH
         y6TX5aEO6nqzBov343hjBYCrtNZ6BahxrWl/wi+1kplyRRkYgoix7ZN23bkQU1F2kh9e
         Ckkyfzt1HWVNvPHcTQojilszHJ85xMuldxKpKzSgel09xwbhK0Y/gmOeEak1MLR7Tm6t
         YhdkQueLtO59Mh9xqVsDqZvtiXLSZyYhIcqPC1CeAWotlR7WXXHTWxD3zBLvwkPJkX/e
         UzBg==
X-Gm-Message-State: AC+VfDwKKx6C3HYoFi/G7Y6Q0ucFJXsuddnkB/Il9q6m8D72bkLu+R2n
	UoSCvQGdNpQInS8fIrQBOab2i2PS5QM=
X-Google-Smtp-Source: ACHHUZ5ITl1eZBisF1322t8aUNZs0RcW8W2ES1pMiTTJhOxphaaMWLPk0GqaiCa7nlMrbD5eShiUMQ==
X-Received: by 2002:a17:907:ea7:b0:974:1ef1:81fb with SMTP id ho39-20020a1709070ea700b009741ef181fbmr4480909ejc.22.1685529942757;
        Wed, 31 May 2023 03:45:42 -0700 (PDT)
Received: from [147.251.42.107] (nbbroz2.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id oy11-20020a170907104b00b0096f7e6d0063sm8731724ejb.75.2023.05.31.03.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 03:45:42 -0700 (PDT)
Message-ID: <177b0fcf-1cb0-be45-5f4c-4038f785a1da@gmail.com>
Date: Wed, 31 May 2023 12:45:41 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: DM-Integrity Under RAID Without Journalling
Content-Language: en-US
To: Russell Harmon <eatnumber1@gmail.com>, cryptsetup@lists.linux.dev
References: <CA+zrezRB-PewcH_-h8PZmGOc1RVBwdS-uReago8XXLkVTw+EDg@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <CA+zrezRB-PewcH_-h8PZmGOc1RVBwdS-uReago8XXLkVTw+EDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 5/29/23 04:02, Russell Harmon wrote:
> Hey all,
> 
> I'm looking to use dm-integrity with its journal turned off as the
> backing devices for a RAID-6 array. This is with two goals:
> Closing the RAID456 write hole (md.4 section "RAID WRITE HOLE").
> 
> 1. Detecting (other kinds of) silent data corruption coming from the drive.
> 2. The resulting configuration will have no journaling (both for
> dm-integrity and for mdraid).
> 
> If I understand things correctly, it seems like this covers all the
> cases I listed. If there's data corruption (either via the write hole,
> or coming from the drive), periodic scrubs will detect and repair the
> corruption (since mdraid will consider the corrupt data invalid).
> 
> Does this seem like a correct/valid combination to achieve my goals?

The dm-integrity journal ensures that all sectors data + metadata(auth. tags)
are modified as atomic step (it is not stored in one place).
In the case of power fail it uses either old or new versions.
I do not think RAID keeps this relation correct after power fail
(or another abrupt failure like kernel crash that happens during a write operation).

IOW, power fail can create a new corruption (note metadata are updated
in chunks that includes auth. tags for other sectors).

> Aside, I see the value of dm-integrity's journal (in non-RAID
> configurations), but what's the point of the bitmap? It seems like
> that just reintroduces the potential for undiscovered data corruption
> on the drive (e.g. if there's data corruption in an unsynchronized
> region, at the next boot the corrupted data will falsely be considered
> valid).

Well, I would like to know either :-)

There were some plans for dm-integrity bitmap in LVM LVs as some performance
trade-off, but AFAIK it is not implemented yet (?).
I just added support for integritysetup, so we can use all kernel available
features, but I never understood why bitmap mode was implemented in the first place.

Milan
