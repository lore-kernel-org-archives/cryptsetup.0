Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C17C7A
	for <cryptsetup@lists.linux.dev>; Thu, 16 Jun 2022 04:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655354688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=TBzSlhPIP2xlrbOk+kOpDh67JFm8S5RzWOhLTbN/2Fc=;
	b=OxZNnkDxrkChCgbld5rSLdWbJ75Xoj+Z9UyPCqD/q4d6OfrtJNAYb/TR73KwTaP47rmNa9
	r/mQkArkJqtp3Rlmv8sD9G+SC9vVLFL0oMRdlkhThVhlgxSxOdx2kWe8PHQI39folr+Ul0
	I5IlBTqiHcGuWMOo6+YIlhlTD2KU9KE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-Nfsdu7z8NKi3RpWNQ0rSZg-1; Thu, 16 Jun 2022 00:44:47 -0400
X-MC-Unique: Nfsdu7z8NKi3RpWNQ0rSZg-1
Received: by mail-pl1-f200.google.com with SMTP id c4-20020a170902d48400b001640bfb2b4fso294952plg.20
        for <cryptsetup@lists.linux.dev>; Wed, 15 Jun 2022 21:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=TBzSlhPIP2xlrbOk+kOpDh67JFm8S5RzWOhLTbN/2Fc=;
        b=xvqmzgg9GEG6iDbqaR9jChd+GuWOx9y/O3Vxel3jNXRMLlzpgV9a9ZrtqA0TFqOtwj
         QSsrKyLR/P8xAzCi7eD+tSqrqZMn6lXskPjC1PL0z2KivllHr1gX+aEIzxDg7xGIHWpS
         ENAWTSuvJbZ3NcCjT6rCRxI5DZtWwJllPs0YVUwD6IJKQcqyKO6AhKOXDRmJba+u7uE7
         GTZi1qYPfWXRmod0w+3ir1j1MEzrxx867IG+qJIuB3D8gZuL0VSsu20cbUz6wTcF6tfb
         WiVdu5JTnjhMXOsiP4fUSHrb2ug5Q+pF3aCyIfH19jGD15P0LV2UlPEtA4OFrqdQx9J+
         VqZA==
X-Gm-Message-State: AJIora8z0hN9HuUE4D7jQWNe/pBVZD3f3RS4p9lH2vfTrCA5ieW2jB0T
	+Hg1wIOY8V006ZQCau83d9/Ai6jLbpFWfzbjhYB70lXwGbBKojEockAPiVyvKiYcdgC1ow410lP
	L71jYNoUNDQKpmB1YSLX1A7RpV2hvROj9TmdQsvIyFhTs+28s5c4ltyLJHPR6J+UsiC4g
X-Received: by 2002:a63:296:0:b0:3fc:aa42:5e8b with SMTP id 144-20020a630296000000b003fcaa425e8bmr2818996pgc.519.1655354686263;
        Wed, 15 Jun 2022 21:44:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tldB86oEr6N9MOeFEd045bC2H+PBM8hy4Sh5bT1NJ4/s+7k6mogOwiJeuFalk64hZSgn2YUQ==
X-Received: by 2002:a63:296:0:b0:3fc:aa42:5e8b with SMTP id 144-20020a630296000000b003fcaa425e8bmr2818982pgc.519.1655354685820;
        Wed, 15 Jun 2022 21:44:45 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id bi16-20020a056a00311000b0050dc76281a4sm530576pfb.126.2022.06.15.21.44.44
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 21:44:45 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:43:39 +0800
From: Coiby Xu <coxu@redhat.com>
To: cryptsetup@lists.linux.dev
Subject: How to estimate the upper bound of the peak memory consumption of
 cryptsetup itself?
Message-ID: <20220616044339.376qlipk5h2omhx2@Rk>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=coxu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi,

Recently, I notice cryptsetup itself consumes significant amount of
memory (~256M) when estimating the memory requirement for dumping vmcore
to a LUKS-encrypted disk,

$ time -v cryptsetup luksOpen encrypted.img volume --key-file mykey.keyfile | grep "Maximum resident set size"
         Maximum resident set size (kbytes): 1309828
$ cryptsetup luksDump encrypted.img      
...
Keyslots:
   0: luks2
         PBKDF:      argon2id
         Memory:     1048576
         ...


So is there a way to estimate the upper bound of the peak memory
consumption of cryptsetup itself without running cryptsetup? 

Thanks!

-- 
Best regards,
Coiby

