Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794713818;
	b=PU5sOsJr7BxV71hAQGyLLOxejHga86Z9zZEvXXeii/MZHDGt/yXr3Vk+lBlVN0L+WrTL
	 NbCXanTLMgJWM6047W5v69UIvCWmbtcvYIQZigHaEC+74JMVo3rAYuONY1KNocOYSjMzx
	 7zJ1p1dK04NJwnwJjTXnxFSuRddOOQf4K/KD4neSrocIhWyIYmxwB1vibHxz4ujWN8uSk
	 IvzLS1t5z1cURPZPbG/bTesaZYHaRgzvBfny67LUS1pYoCaKNqYmX1eAaF9dJkdkxeCkV
	 ck/wexwXspEGP7EVK/d+2b8jqZn9JcQLC0WyLGh0ieTp0biuP2FxNUybPp8R1E5LCKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794713818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=JVgi5qkCZ1TV5nUAOiOQn/W2xEaZHx7ptfnUWb01arw=;
	b=RilWNhjivMzLZwf3UnoKf9zVUKc2w098CP4tZgScx63xPSqIuI8y36G6VFVKZYYyiu+V
	 cYHfQZ9qpwDpVeF1tW/c5JOZEQ2Teh6JyV1grh32OEvgAStsf37NaIjAhuvE3aBBJdL6N
	 T2hweK7KnFk2b/uMT3ou4OHMKlfoTJeHXpsp3uUUg7r3mr0oo8Rr5d9yEhktpTjmV3Mlg
	 IA8NCHnALCScWYbbMaGOdQaP+jBL9eLvgfGKjoTgt+U4O8OKzob+Ujo5yXjzIsaJIqeM5
	 aR6LrO6wZx3QGl6v5OYKN4HmjST7sC6hE7bRgJPnfQv6hB8Fa7QYw/Y7+hKrlvgmDDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixiTB5XT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D544E606A327
	for <cryptsetup@lists.linux.dev>; Sun, 15 Nov 2026 03:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D544E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixiTB5XT
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-716ea2598eeso2232744eaf.0
        for <cryptsetup@lists.linux.dev>; Sat, 14 Nov 2026 19:36:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794713817; cv=none;
        d=google.com; s=arc-20260327;
        b=WC6SNahG+2ipLIWN1FaSWEKTn/lcJcVv2DM+ASIpmhdPBcC3fhqWjVRDu3ycmnoKZl
         96T3p6tVP4l8nRHureXuAIkNncH/rzHHYEsWq5ghO50ya82bzJVDsFu6XQBsA5yEPUoc
         VWb9oUR1eKjKsilMBi0BFG+oAc3qpsboLe/ySq/jCIqbTHhzcxJ7i30XY+s3Zx65r5ha
         Gj11VaaDYNXIpyvvFnPyWLq8JUfLSuPPlKN/k+qYjRLEewCeV1Gpov03ZOmAEjwYYr4z
         Xm1VraPJphZnFlE1HY6wSq8G/QhVYrp+z0CWwSMo7how9VNuCS3MtOY90dxc4pkuoQa0
         Ko6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JVgi5qkCZ1TV5nUAOiOQn/W2xEaZHx7ptfnUWb01arw=;
        fh=7CeQXh2vBXPpYmy0ZcqDAlKw7/XvmHDO2gf+Y/nh2g8=;
        b=E9DfOgPpscFRnKdgDWdtMesE7VCXY1f3kv33sxherii8lqSY339C51fG1Jm87V5j7p
         5H7SXr5Rlh5uesXSjWgASPHr62H3d7oMTJHRnBCod0ZO8vX0Cc2tsjUD9N4stmwzpvSo
         lMhewN5xbzFc6HCb4XnkCSHBuOXXIAYcNlV8bhNX7FqIQgibOw2NuyoStXcmj8vzSesQ
         6Tl2GfaK9UysZKJy//Z2sDr5JcTZjU1zeOWZd0sVtsWlKApxYTIP1cJADgSX90zu9Fja
         I3nXp8jHMxdindhUXzszI471dGxQz0meCrQynV1+IM78QKpBc9Zu7becC3xMD2k8ewDD
         QRAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794713817; x=1795318617; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JVgi5qkCZ1TV5nUAOiOQn/W2xEaZHx7ptfnUWb01arw=;
        b=ixiTB5XTaPb888nqWoUdq0FXen+PNsRHXsmkPSaB+CxMRrZ9F3KgSIs/C49EiTA+EO
         47lDZZowx5Mf3OOW2rSwXNmwEsQMoC+qNl4HHCPmehfVYXfqj+JjVDWB5loDGDYjFY8c
         vPCOrE3jG8x5WvyCh/kwKswnNT86QV6eENtQWWp5LQE8271DyrYZEfza3tQbIE6VHGze
         ZPrLOnxs1rIOHp7PZPz3+W85tKdJ1W7bhUerKnav7e3/nYZjHQteQA/lb0FletxD9ucl
         Yy+13zwEEYWZeNMnQ//EpjPpFxBKraNzu/bEImY12P2yj7in9M3BBhJX92s4fpi5D8WA
         zRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794713817; x=1795318617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVgi5qkCZ1TV5nUAOiOQn/W2xEaZHx7ptfnUWb01arw=;
        b=OalohaNtqMPg9vRNLKJpdBrQ+iM+sLA3cwpRRjrvkon4Nxga2h8zz/to7qMaT7P8iP
         JA7lhVLpRQVECEen+jbx6KLt6d2CR9rVZ7FgFbfuRtYeXHOI8nfjvQG79b11qGkw8qcx
         S6If8+hIH4KrLW9scDDD9mQokHWLxgGqoaUss0EbCoBYk5dnvHr+/DE+FPfD0RRkmnpw
         Je6drnBee7FinkWH5EIOLaynAtzQ6KChZ01UVk9vP6z068gMI1ynWMA1KgGp3tMbnTNo
         FkdXQ46U16f7c8eNLZHcmpLUbEULpB5bg3XJ44sc5dKFQqbynxP8uGz5ecDQVUxvKgU7
         W4Zw==
X-Gm-Message-State: APuU4Z/60JiGNPR1C6jdPSKAKdhFypRiJngPcHT14TZUyOXT7N0SPRrx
	E1UCY5XKJrQEyjsvdKxl+PdcmAGLoU8FOmCA7Hwcskzo/l/BaI2lU3EF2oAulUtYIrDFytUya6b
	0cE7MEt6U+CZTRMzUbrjhBa7W/OAKAB4=
X-Gm-Gg: AYBFou1QOWer3qZ877zvqROw+Jfdj5BuGECwo4aFL28PWi2vezn6P8Bfi11LsasXFC6
	Cf2hG9fp/3NFL/ojpdR/+EFTiOuCDVGHdbUCNeBS1yNimOwPzL3N9wSmm00yDz0g+ulvSbv3Fm1
	v76kM/4W5b9oY+5fay30FJzVp0WwRYbEjghl6NHErn3ds0OuoWODckzZ2h0UyRNapiz3sI+02qL
	Z0S+aRIckY3Xka4/Msoya9Qn/dJFGC4+NeGI7uGJzi50I5vybm21WFmw6Ug8GShtTWlEe2NJPZY
	Pq6TZ53Nnlhnfz1zNiFfSWdMhcQCKs0AD1G+LcyEDMBEoXX9iQGseuSGy2TU1ti344wTfKXMdge
	sjC8acyAklSLmCCC4bHBv/U/mWGJyRiLLClAHJujn+nhPPkAdKgqkFgv5z3a9jqkstmuWNOyG7v
	RmcZaQS8GP8SU7fuzV0LmaNA5ip7Ks1ii0Oc9LVFf+rcNMl4xi1cI=
X-Received: by 2002:a05:6820:c319:b0:71a:e7ec:1cf1 with SMTP id
 006d021491bc7-71ae7ec243fmr511906eaf.28.1794713816726; Sat, 14 Nov 2026
 19:36:56 -0800 (PST)
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Post: <mailto:cryptsetup@lists.linux.dev>
List-Help: <mailto:cryptsetup+help@lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
List-Owner: <mailto:cryptsetup+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAB9Cg3=1UKw0KHYDh42P69wPDm1DABfLNDsftjdTJp6s6YvE2A@mail.gmail.com>
 <e9143d96-db6f-46dd-8804-10254d859864@redhat.com>
In-Reply-To: <e9143d96-db6f-46dd-8804-10254d859864@redhat.com>
From: xeyrion@gmail.com
Date: Sat, 14 Nov 2026 21:36:45 -0600
X-Gm-Features: AclHuK_673STj3taz14fTzfr_wB6V0Ms3nKlGKDvqJT4RWn9pnVuiIuENupY-DE
Message-ID: <CAB9Cg3mL=UTS2zgvi3LNC9BmbJLp=6ALrK79YADpDEd1Rv4DVQ@mail.gmail.com>
Subject: Re: Rotating OPAL range key
To: Ondrej Kozina <okozina@redhat.com>
Cc: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That merge request seems to be exactly what I am looking for. Thanks.
I will keep an eye on it.

What makes it less useful without SUM? Does it not address the exact
use case of rotating a compromised LUKS key and the corresponding
OPAL2 user pin?

Re: sedutil, I was referring to '--setPassword' command to change the
user password.


On Thu, Nov 12, 2026 at 11:23=E2=80=AFAM Ondrej Kozina <okozina@redhat.com>=
 wrote:
>
> On 11/11/26 18:02, xeyrion@gmail.com wrote:
> > Hello,
> >
> > If my LUKS key gets compromised and I am using '--hw-opal-only', what
> > is the procedure to do proper key rotation?
>
> >
> > I can rotate LUKS key using 'luksChangeKey', but as far as I can tell,
> > that will keep the OPAL range key unchanged. And since nothing is ever
> > reliably deleted on flash drives, OPAL key is still available with the
> > compromised LUKS key, making the rotation moot.
> >
> > Since OPAL range key can be trivially rotated using eg sed-util, is
> > this just a missing feature in cryptsetup, or is there any technical
> > reason why this cannot/should not be done? If it's a missing feature,
> > are there any manual workarounds possible? Can a new OPAL key somehow
> > be "injected" into LUKS key slot?
> >
> > Thanks in advance.
>
> There is planned support for User authority PIN rotation, via
> https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/976
>
> It will be mostly beneficial for OPAL2 devices with SUM support, but it
> can be used also with regular OPAL2 devices.
>
> What sed-util command did you mean exactly?
>
> With regards
> O.
>
