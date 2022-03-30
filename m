Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776477C
	for <cryptsetup@lists.linux.dev>; Wed, 30 Mar 2022 11:32:49 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id h4so16266731edr.3
        for <cryptsetup@lists.linux.dev>; Wed, 30 Mar 2022 04:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=sdZllzAggfFk0NcIxigOvKbuxb6rX7gN0eHKv+z7DCQ=;
        b=MNSZM/H56NhE/OP3V5R0u7hrulDfilBwwZ4uiN6Dg1oIWpIyf5LpW8C8px5raLYe76
         lWg4odw/Xk/6bGGbq4gEPURYmoNr/TABPwyxtofq15ZpS9lgAynUXO2ef99WD/gCEVRr
         P/ODxwB2HsineoSaeLXS7sk9SIooQyrTDn0fd0jTsinXyz2og5siVwlB10Pa/fCF6iGE
         A9U1YVwlHno50SXeZi5geZKZv6PtEmSgIKBq8EmFPQr3WilY7cOU7yU5Kq/JicYdUMXM
         N8DopG3cP0BAUU22w0n0Cg/fPTy0NoqmUVUSFNL0TqQVjTv+6EjKhbu4dD9PMTIlwOjL
         5r1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=sdZllzAggfFk0NcIxigOvKbuxb6rX7gN0eHKv+z7DCQ=;
        b=PxkGZmfZmOjM66oBuiSZTqCPxAO/xjTeO5eGKdMXIgCATrmzMVWAMabu16frNdZjd7
         Y3LlqHKRdATF4d7S6BIFmq/YSIZql1PnD1sGQkv0g3RwoBP1K6gS/+BKp3U9jV0JZs4o
         PDWhf5elcTmjCruXKReFH3DCNJW0NwQvKhyL/VsS1YgDRpn2gBM6z471/aDl68mlhgVi
         ddqGIbO18+5bIlJoX4NT8vF8IL5xqjznQSJux1A5T7wHk0TcpnWtZY7g89gqUjrKZia5
         aon7xqt7tHE52ZZ15ogS2VZG4XG1oUXN7GvolA0KWiLOLXOiQ9S91ooYYGSdVOAEOYRJ
         rrRg==
X-Gm-Message-State: AOAM531MnJBjBNksUG+lgrrQd4oE1YpWFsdQMOJrGq6R/dEao6hHyfVf
	IpPNSxyIJ7DMecGMQ1BmUVKndqisbZs=
X-Google-Smtp-Source: ABdhPJxmcU1L1T3QMAGO1NSO8vz3ytPmcY9NKs/8ueLFG4Ie6fhZIFB80aRZ1LXI9/o9M244I0RqLQ==
X-Received: by 2002:a05:6402:42c2:b0:419:1997:62b9 with SMTP id i2-20020a05640242c200b00419199762b9mr10173810edc.97.1648639967580;
        Wed, 30 Mar 2022 04:32:47 -0700 (PDT)
Received: from [192.168.2.27] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id qb24-20020a1709077e9800b006e029bd4c24sm8134177ejc.193.2022.03.30.04.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 04:32:47 -0700 (PDT)
Message-ID: <70f2c6a0-b239-a3a3-bc6c-c0af224bc6ca@gmail.com>
Date: Wed, 30 Mar 2022 13:32:45 +0200
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: cryptsetup development <cryptsetup@lists.linux.dev>
Cc: dm-crypt <dm-crypt@saout.de>
From: Milan Broz <gmazyland@gmail.com>
Subject: Cryptsetup git main default branch
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I changed the default branch name in cryptsetup git
   https://github.com/mbroz/cryptsetup
to "main" branch -  the former "master" branch will be keep in sync with it.

The same applies for mirror on GitHub (https://github.com/mbroz/cryptsetup).

It will stay this way at least for one year from now, so everything should work.
But better update your git or scripts now.

Thanks,
Milan
