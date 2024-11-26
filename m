Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF40E13C3F6
	for <cryptsetup@lists.linux.dev>; Tue, 26 Nov 2024 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732611221; cv=none; b=GGm/N7J1yWrTZvT9MgnNwHbZ0D57MZBbnAVBhxMu6MBd4v43CJ3NuczGs67ikGERFXRnFVNKh7kmrqY+8olJquPFfH5QjBKR11UyOmA4EJ0NAcWqp7Po4vdppAE/jqvqcWCTEkSEIMPAqL4DU85TpyuJ8hdpacagl04OPAZsJQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732611221; c=relaxed/simple;
	bh=8YWci4OmWKab1ZRkjkF5MYg4L9TCfm95FSzaLB80fTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UFJV7nRkM9c13hpd+rZ31P7KuBx+O2BIVqV52fHIC+XT3DWHsSTDy8vVKKYXZZ8M295PHFOd/TtRxUhhmVhCVfwfXHn0THAO13xw/ZtUOcXGK9IXlZqnxEu56iuO1t0u+lOu+QGQUTzDf6A+HpLFSS+C24h9SzHKEl7PXE8dmhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k79qrbdK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k79qrbdK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so917045e9.1
        for <cryptsetup@lists.linux.dev>; Tue, 26 Nov 2024 00:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732611218; x=1733216018; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i85cPEl7GYgualYRMFMMxEmef2xb0Az8dyyv38sGdhM=;
        b=k79qrbdKnU5LbVfnKl9YNthL5rzRpda14pXfC+LUiyimNmcUGT4r6Q8TVC1uW+sQHV
         oTOwZ8ui1KNnLw13+hxL+DzWvfBbk5Lgp/AMxeNXvRK/tBZTZp172xRTEw4i0Q3ejObM
         nGOfNwOxKm/oBr1q2u772QApS9vjseetO4zDt/lTmELuyFJ3ZSk3Nyu6KYKrMWNwTEju
         VKQMfJcmkaeGS8T2PgbN8Ztvyc1X5rWHk5Waj0mcH2dBgbRPzLfH5ne//xm958gvWcRF
         48Z8kXr92VRNMmWfpE/sUlKjDkLNkZjkWHOj/NR2uay4OwOHTu4VxejkCZnu3J+5BGz/
         k5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732611218; x=1733216018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i85cPEl7GYgualYRMFMMxEmef2xb0Az8dyyv38sGdhM=;
        b=BHiI/iZADLV+OAV6WBS6YGD/BsYHJJP0brHPTzhYX4XTrlFO71x0ke21uZygIkRWkK
         O63mDribGRTlmSdwVG+v/HgAyqZgOw4NE2T8JKAqOD7uaXTQF9xXKuq8B4/askwoVPcN
         OLrgPGhcsbzZZyt0+iL+KAAKsa4yysYiqa0uCIUobihxQUbUC3iBXcSE4xltQ/giZAmf
         yCRo/E33XR56gjmBaXjgxp+/k0a17+xDbWud5CQ3mc1TZMSJcSoMufGF4+iT7rK/END5
         G20YiYuCJLU152Y0U9m7VaI8RGmrRoqqIel5EpF/tGMDeOhU9nIfvyv6DFfdidNFUCEI
         peJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgthy87WA4L+QOHvH9pqIc9jiezP1Yka8KXLRwaEXT1GAeAPXbF6hPcQVxak80K3CE7chICTCasO0e@lists.linux.dev
X-Gm-Message-State: AOJu0YztOTQ9IerbCZZ39jJmx9dbDmNfXuEBxPAZM3w5k8lziYAdqnYO
	K2YSB/GLCDCTVvgonYuMdTHtd+lbaCtrHmRy5gW7KBTx6f/ZflLZ
X-Gm-Gg: ASbGncu8rdspaMND0jcnz88Ve2othYr1+WCUvcnTU+JiwYreREk7q6ul/XdS9JPYWp4
	fgDdU14gI38cn55xeB/vvLDCT1S97tUJjV6rJ+Dcpt9AwrlrRQoBZuXMIfXkZ8sVxTeAk4oZzch
	gdkvj0aPmXgYWQ8+Nopr78U5usuGkdNDhkULJmx2YpoMp8x0SGGMtDweMiN+JGgeM5W0Ou0GpYk
	uMClaOf2h0pw6wWy3veljkYdjxRDJdQoc3JFDQyG0/YhzHuZUVNzW4ucgLGAqb/lBqwduBdnW8=
X-Google-Smtp-Source: AGHT+IEnsAjihvRFSaPCkBZEkkcgk6uUnDQ+m8NKV7Vtrw7bTh/q45OFcLCSBhNWxBqXxTBlIfIuiw==
X-Received: by 2002:a05:600c:45c6:b0:434:a09c:4f9c with SMTP id 5b1f17b1804b1-434a4e9fe39mr18890405e9.16.1732611218204;
        Tue, 26 Nov 2024 00:53:38 -0800 (PST)
Received: from [192.168.2.30] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad658esm12983264f8f.8.2024.11.26.00.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 00:53:37 -0800 (PST)
Message-ID: <94a6a2f6-dc55-44ad-9172-6ac76e83abe3@gmail.com>
Date: Tue, 26 Nov 2024 09:53:36 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: LUKS and quantum computing
To: Patrick Callaghan <patrickc25000@hotmail.com>,
 "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
References: <PH7P220MB1325C03018B9E4F926B5127CED2E2@PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <PH7P220MB1325C03018B9E4F926B5127CED2E2@PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/24 11:13 PM, Patrick Callaghan wrote:
> If we use LUKS encryption with SHA-256 configured (i.e. the
> default), is this considered safe against attacks by quantum
> computers?

SHA256 has no problem, specifically if used for PBKDF2
(iterative hashing for key derivation).

Default LUKS2 configuration no longer use SHA256 anyway, only for
antiforensic filter (split key material among more sectors) and
this is not a cryptographically relevant operation.

We use Argon2 with Blake2 hash internally for PBKDF now in LUKS2.

> I ask because NIST suggests SHA512 in general for quantum safe
> algorithms (see "old Q17" in https://csrc.nist.gov/projects/post-
> quantum-cryptography/faqs) and we want to be LUKS quantum safe now
> and for several years to come, even if no practical attacks
> currently exist.
> 
> Note, the cipher we use is "aes-xts-plain64" so we have no question
> about this as AES with 256-bit keys is considered quantum safe.

The 256bit (2x256 bit for XTS) key is default, this is according to
what is suggested in general (even in the context of QC).
Otherwise there should be no problem with symmetric encryption related
to quantum computing.

BTW who is "we" in your pararaph?

Milan
