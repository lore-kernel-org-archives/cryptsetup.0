Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B454EB8
	for <cryptsetup@lists.linux.dev>; Mon, 14 Feb 2022 22:55:49 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id j12so16923821qtr.2
        for <cryptsetup@lists.linux.dev>; Mon, 14 Feb 2022 14:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=NH5qNNZClVd72JPta7kq6ueQd+VREWU9jGfZC5rae08=;
        b=N+305vS91utv4U3hvpneJm7GwLNGhjWNvqDs41p5f9FCQfdViKoiUKpi7xP4GvoR7Q
         7+Vwp3l/BE5hiv2pMmY3/EKefqS8WCEuwGmgeiolaC2cnsKoNvuloFsgdt5hUr2UVdJO
         EPtw5tyvS/PsG4hS6gLkoGt6r2c4cIKhPIxZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=NH5qNNZClVd72JPta7kq6ueQd+VREWU9jGfZC5rae08=;
        b=yJ7/PlXXikWftVY1ueOZihs0Z87u1WJPVKtCSOsf8aBUNSJDDvrNa5IXl2gM9L3tm2
         NU6EDVyuBB8EbKE4WrPVBK//frzTZmArcr9XkEsnZCLE/FzSGNYirkkVODMv01sYlwMC
         LpHAQg3DGOWQwHv2JnOOhatRfdRHAZJJaLrbJmdtrFSJBxEua7jY10MYaN2TiB1P4jGM
         6g5YPmt8Do02tW4DQtv/Ma/Xx/SZBWbYSY5E2T9yEm75Xmh2omjENEbJXVwyFozUk9bK
         meMwGIZJ14AJ1UGhWg8BZWKycT8zM6jdQeT8pZI/bZpx44SaxAkl3M6v+tOOVlAtS2R1
         k8xA==
X-Gm-Message-State: AOAM531XJ/IIqQwke1GM3DthcmKy84p10Lm1lajTBJS0xBkB1aXjmO0j
	8a//mBaQg861Rtnq7VEjyrN2OTOWrvTOJA==
X-Google-Smtp-Source: ABdhPJw+6bfScrZ1pWAIKvm0nZQsHZbA0mfAXDgIrVt+0U0TQ7c0rS1ifgxhEGdnUTAXTFgAb3KpsQ==
X-Received: by 2002:ac8:5952:: with SMTP id 18mr907432qtz.340.1644879347972;
        Mon, 14 Feb 2022 14:55:47 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-127.dsl.bell.ca. [216.209.220.127])
        by smtp.gmail.com with ESMTPSA id o13sm19019480qtx.22.2022.02.14.14.55.47
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 14:55:47 -0800 (PST)
Date: Mon, 14 Feb 2022 17:55:46 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: cryptsetup@lists.linux.dev
Subject: Test delivery to new list
Message-ID: <20220214225546.k7jnqp7fgny35rcq@meerkat.local>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

This email is to test delivery and start the archive for
cryptsetup@lists.linux.dev.

-K
