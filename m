Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4494379FA
	for <cryptsetup@lists.linux.dev>; Sat,  8 Jul 2023 15:41:05 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fbea147034so30030985e9.0
        for <cryptsetup@lists.linux.dev>; Sat, 08 Jul 2023 08:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688830864; x=1691422864;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRnf8iq9seK2K4yLOT8qWF90vGtQDWMPVJ6xdgIC/ok=;
        b=ayS/++v1Eoqp1WcL/Zz12P/l6NriHj0XjTwYf6S5awpFiMKHWUC//8TfrsKdJjdEtT
         mzqK7shK0VoJcCukT2Vm8MPnMvJkZ5BELeUiKGEc2SBgoH6/QLfkZLeZ8A5B4KKQadyx
         XDNtJJAgjEr8EsesAaZE+FuCzTVIdUrmuKUwsWdonlHvPqd7m/Pa0AY1koyweTevmVsP
         tH79iY8DFXXo1cJjeXfHWWLGUXZgHEnNqXUtEsko2bAp5DEpIfW/ONS+/hfSEhqh1CsI
         X+nYwL8BxwhgggeDumi/IA0Acqd6ObPxxE8rANc7UqYEE9MZ1KOl4Xk73Q5lzrVLcnGd
         4Tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688830864; x=1691422864;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRnf8iq9seK2K4yLOT8qWF90vGtQDWMPVJ6xdgIC/ok=;
        b=EOfHlbkm+tDp9zUUzKNpZbSgO+8yjwnih/bU4rICH2RLCls8TWpFL2FDE7a5ADcbrV
         3Rx7QpGyYW9uksghGgaf/J4ZLN0LuFfsQmJZDCcxiwDaMoDGqi+U3qcq5bdNqVsPmaNq
         1s8A23fmaJdXNIbOxMoUsgMRg07/gqDiS7KReGg48HI1l62Kcpd3DTVDySJ4YzL0GvVi
         MZYJGDF84oyTrLzIdy6dsQe+ptYxESTJBQARSLKJ3T8ravDutpYqmudewBRnOxLQnJwK
         wgzJDB1UMXVftto4u5yecPprGLAHfSKMh2anx8NDzacg68Bv9zzyMRLBBFYT+sskSE/9
         LYuA==
X-Gm-Message-State: ABy/qLZUkltXxV3r4j/tDBxj2BrpCQLB8adsTLIeZIHMNsxW+uVM0/kk
	PfHxWOXz/Xxzf5VB2CRCefoMIu8rA/8=
X-Google-Smtp-Source: APBJJlE7U7Z4wiubYKa7+h/Wo574+aj938Wm2pjSdg5/KG+R39Ubz5lDEuAfXfIqMRJrg9a6Vlg5tA==
X-Received: by 2002:a7b:cbd1:0:b0:3fb:d1c1:9b79 with SMTP id n17-20020a7bcbd1000000b003fbd1c19b79mr5998829wmi.30.1688830863949;
        Sat, 08 Jul 2023 08:41:03 -0700 (PDT)
Received: from [192.168.8.101] (37-48-56-15.nat.epc.tmcz.cz. [37.48.56.15])
        by smtp.gmail.com with ESMTPSA id u10-20020a7bcb0a000000b003fb739d27aesm5356493wmj.35.2023.07.08.08.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 08:41:03 -0700 (PDT)
Message-ID: <9e13a2a4-0173-453b-c7dc-67e83dc63c6b@gmail.com>
Date: Sat, 8 Jul 2023 17:41:02 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: When do any header interactions (read/write) occur?
Content-Language: en-US
To: Darek Hisc <darek.hisc@aleeas.com>, cryptsetup@lists.linux.dev
References: <168873868918.7.12128827004291450369.150072076@aleeas.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <168873868918.7.12128827004291450369.150072076@aleeas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/23 16:04, Darek Hisc wrote:
> Do I understand correctly that the header is only needed when booting the OS + executing any cryptsetup commands?
> If I have a detached header on a USB flashdrive, can I remove this flashdrive from the computer during routine work on the computer?

Basically, yes.

For deactivation you do not need detached header; some status commands will print only active status (not detailed info).

All keyslot commands (obviously) and luksResume will need path to header, though.

Milan
