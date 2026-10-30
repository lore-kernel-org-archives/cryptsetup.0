Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793375592;
	b=D1iU6cDSiXIwD2gMvcQlqBP0CFOl/bzvaLxvu9e65TGYRRu9u8eEaM2o2u6c08iZeRX1
	 CW0GHgRb+zAWd2VaEj9bQD3ibGatShfvgFCtpQW19jwydtwZsOKXicdPabkX2AHBK20OP
	 iImjhhQa/0dRkdskWdMSydieoSt9dCPDTv9jKcUXOtdaaGnyxCKOsh9ZivJJxCec0Twue
	 nvvNDHqmwQiVcKVGGNlYatGKOSSBQeZOXtOQtVsIiU0+TIfTt4IIHAdNPd2EANzR4SJ4P
	 lKBGHvObZ/zGjzKYNFVwLfV2CwNDKY9fGknGzORE5aPhKg1Z5GVn97Ux5TJRQ4OxbBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=6Rq1yMOxDjvQPThwcGwIFvV5Q5uMqUSm0cqr5AFrnLs=;
	b=FKR7eYnkm6Qv6hrl5tKvU2ZJDuU3ebAktDK/NGHTq93Z24R++ySxJGUih1Gx5azHCmHV
	 BSKNIc63LcOJQwPokxjrxGkL5ucKGkUchlUENBfSIane40alY3x+M9769O35litgikm6Q
	 5umZiCtiV3hi+zpFKMfX82RfpjmtX+BCn26DO39uO/Mt+JgKkEVLbc5pP9byWVaNEJwmG
	 MoCvn5MPKo/grIpWbzuo6OSp/0E6IvwdaH8WLNOQP7mfolkGA/sQewaFpXzfXevJDrLPU
	 DMXJBMtt69fHUB6j/lE6xcoKEIP3f27b4aIs7EbEx9zbf2B/c7+2dvSBw983Sqmuh5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G6SCGgYx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD018606A31C
	for <cryptsetup@lists.linux.dev>; Fri, 30 Oct 2026 15:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD018606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G6SCGgYx
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8a376759900so1501627b3.3
        for <cryptsetup@lists.linux.dev>; Fri, 30 Oct 2026 08:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793375591; cv=none;
        d=google.com; s=arc-20260327;
        b=fH6LLOiXnxCTbLOiO5kYDVeQgS3DJ+uOX3t9h3wg0kbNNWIqfKhgscFMRkX8rO1eNM
         hUGbsvDd2mP8Jvug/hkaeShRruwtemalsT6ip9pPrx220Ekh0FS6/l15RIj6GVaaWy/U
         mWO0ErG4LlPi3Idm0znJ5u28chcbAbfwfm/Ar8MOARr/8IMLVn22Ck0GfG9Vu5sHRRSI
         Ndy1Uv5FyA2JGXs/ACdHZl6fNS1OkyhzJtbFkwkn36mL9melj8KudV9/S3MgTg47k02I
         QWw64PUgk1PugWeSL5Btu7qdh+jpxj+MX4oH7t2QCDCC1I+ypPUe9Qh2s0Vx9MLyQGu1
         VxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Rq1yMOxDjvQPThwcGwIFvV5Q5uMqUSm0cqr5AFrnLs=;
        fh=wDW+69BXdBDBu96a/du9fHRw36ZO1yF13s3DAOaJGO8=;
        b=V7ZDD+zfbF1b7TiIvxBqzZPFRfrmd1c4bFpr446CBPFlUsfR9LNVPFzDVnr0+2JLwp
         l+VtshKC1MCddoxgNC/xPFeVQ87yTdvDJzI2XxyDDJ/OqyVpw7oorIbwjICghgFbaVvX
         WNtCfXdQEavBDLBg6kg0KDO/QQ2UA1HghFL5G3iPI6Q7YZU5VNBtt2bv8pbRNQlFS09i
         x2+ydPNzJyHGGkp672lcXySv0avy11aU8R0Ypu/eCZ6b3AiqI4j2a2qzIVNrnt4CrAF8
         mOBTztLh3p+gPxIHrGP6pVgAkYJY/f0hGwB349d5uGeC5+8LqyI4hpAPuT9YCASSyNBQ
         Y4nA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793375591; x=1793980391; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Rq1yMOxDjvQPThwcGwIFvV5Q5uMqUSm0cqr5AFrnLs=;
        b=G6SCGgYxnYRi+tg3O5tO5XdzM7OENIkYgn6z3CW8oIC/qQk/FtK8GuAD/URbLUvhEv
         IluJ9Nj5OaK1l+rUHb+FjEHpUS1p+NhFzSGcjL7kV99QcgRG1SrdkVy3b7abwU+gBsXO
         zOjZJIACZbpl++wTjMfcozH7VQTm11MlivtCZfOvDubZwLIXRRMis/ZoRDaSy56Nq/z4
         VKGsRGy99t6km5uxM+nHYjrwlm2wY9ayyAWbqNhh27vZoS4EoTIOyuLRA9MHofbto6Rw
         Xmz92VwiiQgqNkjle9n/lcZO0LRdD71dJ8hu9TY/HDWNzZJrUJGIZeDA7xonqngiR1jI
         5INw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375591; x=1793980391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Rq1yMOxDjvQPThwcGwIFvV5Q5uMqUSm0cqr5AFrnLs=;
        b=PNEQv3IW9OEjJpYM6SzSwIKXnUPmLTLIFgpXfHQyzCcGo2/LLUaVN1rWmmxPIvc+a7
         aCbCuXzBCjZENwXQYRZoN3JTfNe/MAbtuad7AkF79Qt71JmUKqfVhyRJOYpFzw3opVnq
         Hla5eGd/8zvB4UNSsVbQpfaR12dIpWi0KdvH2wRRnlD6f3lslphIRdJAQB1eocSTsiwW
         vquuBgyWUQ7MgxBJOsr9EZ1JBSOXNBGRWgWSuYvN0bBN6rvQiehrb/PtkKrfHPJrnZfl
         9ILWxV3ZkQhXd7WmJCM/+KLFFzcgAxa2Dnw/gmueLej8RpcBJhMqxlDyaYQqgoifbIIt
         egcg==
X-Gm-Message-State: AFq9FYJivHCyWSp52Ide39jsqHjJAgM86MNePcEaA87iWlsNF53epbK5
	CUIhERhUng0GsvxFiG2z9UaTvQbv2Ce2f2ll7/e1hPE/f+BPDXZyKPsZFrEtNX4jUnlgzBzS9f8
	HodXKImR51Mgvy8+w+5RvIgpHuQ3etMNlt9fH
X-Gm-Gg: AYBFou0wTyJyTbHKbN07z2D4KZORhUys7oEn7qozFofHWlkPeNdkmcw0xYV25fGID48
	r1GejUFc2ritYdadc7ijoyEAOT+kHvwlyUZUyKC/UNRS6L3l7qYaiWV9OC/AI7XbsgtM9SCGE9i
	WziZpBjBpbu1/GBM/wkkMbOeCZ8+99se5vJsUtM6EnsAM4ASnv0MnEjQpRMNEBtRtgOEdFiDBAY
	Sw37V7lx9kCS5hGAtzMCymS0jnlSgI7hyRnzNeGYYf0nfor5yzdcFKo3FT48UcRoKPEE2nhSuW4
	wqZwwda7gMFHJrRD9Ui7/5wZ3a0ZppvpqVQquYajn8K6KqS2b4i+nRJ5O9SrWlUzzmJ+4IrWJ9b
	nSbaX6+NaGDHAOgEG5ZI4PeMW5VsQd+VdXdY=
X-Received: by 2002:a05:690e:b89:b0:679:9f7f:5668 with SMTP id
 956f58d0204a3-67ba4d38bf9mr3422206d50.2.1793375590833; Fri, 30 Oct 2026
 08:53:10 -0700 (PDT)
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Post: <mailto:cryptsetup@lists.linux.dev>
List-Help: <mailto:cryptsetup+help@lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
List-Owner: <mailto:cryptsetup+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029115338.3599814-1-itai.handler@gmail.com> <a19090a8-06f1-43c3-8d10-dd20e58230aa@gmail.com>
In-Reply-To: <a19090a8-06f1-43c3-8d10-dd20e58230aa@gmail.com>
From: Itai Handler <itai.handler@gmail.com>
Date: Fri, 30 Oct 2026 17:52:59 +0200
X-Gm-Features: AclHuK-b9hyh76-1yvj2zJpafem4hWNxqRiE-gdhAUlWX8WGs-TiWnamARNb2HM
Message-ID: <CAFpOueQgZF4rws6MWcGX0YonwsOsXVVCAvYV5FkkkpGC6jZUWA@mail.gmail.com>
Subject: Re: [PATCH] Allow encryption sector size up to 64 KiB for plain devices.
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 12:33=E2=80=AFPM Milan Broz <gmazyland@gmail.com> w=
rote:

> Could you please submit this as merge request to project
>    https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests
>
> That way we get full CI run and can do review there.

Hi Milan,

I've submitted the patch as a merge request for review:

https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/979
