Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFB23C17
	for <cryptsetup@lists.linux.dev>; Sat,  1 Jul 2023 07:50:26 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fba5a8af2cso27647395e9.3
        for <cryptsetup@lists.linux.dev>; Sat, 01 Jul 2023 00:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688197825; x=1690789825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JAfouDq3p7AIdduQMV5Ve28Rfg/XfvbSZ3RlykRa2zY=;
        b=qSjIPJaDdF3hNOxCf9h8QVSJnOyL7/E1qZq20DkKkUWuCyCbI/35foVxmYzBifOqLB
         L84f/OUHJdIW/HANo8+UNWzmbmv5x2ZYE2tvaQkuvL7Bap/tR7BzxZSQ3efR4ZdYq7CZ
         wio05v0LZHc82EePDRfzkfqLXgri6HA1oAMMBh4ePna/5EM6EQ2EMFjXS8zhCu4bzjDt
         EycKz+JEQUH7NFer54maAPAfa/jUyYaaf+hoLAHGCOvSdk7WVd+FIjrndFaxlBBcU/we
         57ec3HrjLftkVuco6QyYGZXlYuJmhF3OsCcxj6xG5aKPobslsPNh4l1YjQs/ewUkxyIL
         7PNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688197825; x=1690789825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JAfouDq3p7AIdduQMV5Ve28Rfg/XfvbSZ3RlykRa2zY=;
        b=F7PnvZrJDOuV5nwedA8Os3abiMd7MW7RqUiubZk2r7/pu1lPrgrtORFJq/Z6nKNuV5
         KwEWFpHzz+TOgO+zdGUfuBlnw04bkyewXdYM/0XRrQKXhGp+w8T+X62P36qasHF9s7e7
         G2WMn8gd3zqXEBlw+SIeAZrgavWCA5UY2Yp6ToYBlA4F6yyss2lR4qGJnV2YLRPglYCa
         h9/7slQUKwFf/Ss5nD0SkiUIkOvK2kk7bjC7JF89hvZKocO7yNXxCD+3b40Ugauewl/4
         Ohtu+rynupv4LhYQ+fKNNNyYg+hdBUXb5QmDRplh6Okv2lL23WpiZNUAFaZOhHZx2lCV
         ZniA==
X-Gm-Message-State: AC+VfDxAjwgvKGTV2dvZq9U6O5lEoHs4Bz+ICSKZieIGp5I8DWUMzoNz
	nAlusofw5lryrLk3mLdwaTM=
X-Google-Smtp-Source: ACHHUZ7k07quiQw5bvZ6kwoehREilps5lcZQ5uiaB+CSWn5sgTSnX0pOeuLWCqX0D4jAvDNek6r/nw==
X-Received: by 2002:a05:600c:2117:b0:3fb:a616:76b6 with SMTP id u23-20020a05600c211700b003fba61676b6mr3165743wml.40.1688197824730;
        Sat, 01 Jul 2023 00:50:24 -0700 (PDT)
Received: from [192.168.8.101] (37-48-42-197.nat.epc.tmcz.cz. [37.48.42.197])
        by smtp.gmail.com with ESMTPSA id u12-20020adfdd4c000000b0030903d44dbcsm20306202wrm.33.2023.07.01.00.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 00:50:24 -0700 (PDT)
Message-ID: <baaf0d13-97a2-8846-ca4f-8f89d96ef499@gmail.com>
Date: Sat, 1 Jul 2023 09:50:22 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: Problem after detaching the header
To: Darek Hisc <darek.hisc@aleeas.com>, cryptsetup@lists.linux.dev
References: <168806625127.6.2008140751957055524.147127853@aleeas.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <168806625127.6.2008140751957055524.147127853@aleeas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/23 21:17, Darek Hisc wrote:
> Hi
> 
> I am trying to move my current included header from sda2 to a separate raw (no file system) partition of device sdb1, but after removing the original header the system does not start and stops at the initramfs console.
> 
> OS: LMDE 5 (Linux Mint Debian Edition = de facto Debian 11)
> Standard LVM installation on LUKS2
> 
> I did the following steps:
> 1. cryptsetup luksHeaderBackup /dev/sda2 --header-backup-file /header.img
> 2. dd if=/header.img of=/dev/sdb1
> 3. option luks,discard,tries=3,header=/dev/sdb1 > /etc/crypttab
> 4. update-initramfs -u -k all
> 5. cryptsetup luksErase /dev/sda2

Just a comment here:

- luksErase will destroy keyslots (key material), but still keeps LUKS
header on the device, including UUID (so you can reference the device through UUID
even if it cannot be unlocked without detached header)

- after you dd the LUKS header, UUID is of course no longer recognized, but,
as you used another device for LUKS header, the new one will have former UUID
Check that UUID is not referenced in config. (Also you can change it with
luksUUID command)

But as Arno said, this is really question for your distro (note that cryptab
file can be managed by systemd, but there are also non-systemd versions).
Also without console log it is not clear what exactly fails.

Milan

> 
> Up to this point, everything works fine and the system boots up properly
> When, according to the instructions in the https://gitlab.com/cryptsetup/cryptsetup/-/blob/main/FAQ.md I do:
> 6. cryptsetup luksDump /dev/sdb1 > Data segments: offfset: 16777216 bytes
> 7. dd bs=512 count=32768 if=/dev/zero of=/dev/sda2
> the system no longer starts.
> 
> Have I screwed something up or am I missing a step?
> Please help!
> 
> Darek
> 
> 
> 
