Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750C47B
	for <cryptsetup@lists.linux.dev>; Mon, 12 Dec 2022 08:10:34 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id m19so11698750edj.8
        for <cryptsetup@lists.linux.dev>; Mon, 12 Dec 2022 00:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqzYWhlsA+7mlASnTGH2JlNftqT+BUN7RDjFJ8KdYX4=;
        b=jJQGhl6vEllmrgil1xuILUIc5Zz77vE0roWlpEKrbnxul6MTuTFNX2HWHYDVJ8izx0
         FZaU3Q5mtQxaxBuBzN8yL2Vj+Nr5odPE2Lem628JUQILlu7tYCzpy8gvSEo16csX5DMt
         gTEkaCmFv1Q0BU7kN5ryCezs2rX5XfYOZZ6ZF6sujWI+LYBr2B6DZVdpKfmIdRKgZiEr
         lloYADAtD/SfjzvP7R+j0X6gbNFbFXcqbWHJrSDz3OJCn4ZrJuFO+u//kLl/1ELa+ckK
         P2wuZUCxa68FzEs3RNsVrsccu+MxsnR5fjFhWDlGZEK7c5coMogc+bmhrdaouw+y13yw
         zZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqzYWhlsA+7mlASnTGH2JlNftqT+BUN7RDjFJ8KdYX4=;
        b=odxra9TEIyUevo04KUsKRrDsg+GmJ29JNr9xssCd61GVtO6kp9uRas6IT59RH1qDV3
         +dRV55zLbHNp+bSSRvF65FauwWzg3YeaLavLeRSrp/XB5J7kTt2nXlDPjy3MlGy5DZmt
         FFdjcM/HjjKcAu8XI6bUT2ySKI8MM/mVMdX1Zsjw/F4N0t+/SrlYFklftDHBuXGKVDEN
         3HnSPr6EdVLZqLVe1T+TFUgQyUSH/il5Wf3mSOL/ks+xuMMazpApaX7vvKBu2iMgdubV
         Xo3jO7nuHYhFZHz5BCEitdKrG5WoSUiIxkb8KabgdIHBH7B77dIqQ3VjHyf9hll+nhvj
         yiTA==
X-Gm-Message-State: ANoB5plXKiTu5yKp4th3ytZ5CfTq6k13LHvjwn0DBTD1tMzbzxYLc/4Y
	HKGWdT9wCR7yiy0lcu/3M5maDwUJh00=
X-Google-Smtp-Source: AA0mqf6nDWLquGhHYbyBFUK5SFt5sotbYI9p02sp1RGUSM6p0q3S4UvYfYMEMuclsvkpKdFzfMrvxQ==
X-Received: by 2002:a05:6402:2986:b0:45c:835b:7991 with SMTP id eq6-20020a056402298600b0045c835b7991mr12226629edb.18.1670832632563;
        Mon, 12 Dec 2022 00:10:32 -0800 (PST)
Received: from [147.251.42.107] (nbbroz2.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id q26-20020aa7da9a000000b0046b25b93451sm3522363eds.85.2022.12.12.00.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 00:10:32 -0800 (PST)
Message-ID: <70676296-dc41-b8f5-cb4d-6b7657e8a806@gmail.com>
Date: Mon, 12 Dec 2022 09:10:31 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: LMS verification support
Content-Language: en-US
To: "Mike Luken (mluken)" <mluken@cisco.com>,
 "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
References: <95080015-BD73-49C4-88D0-23502B75A532@cisco.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <95080015-BD73-49C4-88D0-23502B75A532@cisco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/2/22 16:06, Mike Luken (mluken) wrote:
> NIST and NSA have both recommended the use of the LMS algorithm for
> firmware and software signatures and verification.  NSA stated
> vendors should have this supported in products in 2025.  What are the
> plans to add LMS support into the kernel for things like secure boot
> (I guess this is done via the SHIM which I don’t know if this is
> covered by kernel.org or not) , signed kernel modules and IMA?
This is really not a question for this list, I guess you should write
to some kernel list (I guess kernel-integrity, archive here
https://lore.kernel.org/linux-integrity/ )

Milan
