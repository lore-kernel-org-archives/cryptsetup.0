Received: from out-37.mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16791263BD
	for <cryptsetup@lists.linux.dev>; Tue, 25 Jul 2023 19:49:00 +0000 (UTC)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rjp.ie; s=key1;
	t=1690314539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dljrriTRZvESwfFvREFnulvBjBz77/9R5lxxJ8hATKA=;
	b=a2xT8+8PenTQPYUTLt3mV+zRrChGTSMV/Xqk2aYSu21Yjr7DZ3Pf7VQL9lQ2QQlLGkujgc
	qvnAZ6pfGXQIsmgVY1fT82oBG9xkdGXmJM6QsEqq+Ky4usMv1e/QvhoA4QBmtaGXAvQjtJ
	R05OSKOYIRpT0oPT1eV42BVnt1YdWFs=
Date: Tue, 25 Jul 2023 19:48:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ronan Pigott" <ronan@rjp.ie>
Message-ID: <85b99cefc9505c90db6010c60d66992e88ae1db0@rjp.ie>
TLS-Required: No
Subject: What is the aes-xts key-size?
To: cryptsetup@lists.linux.dev
X-Migadu-Flow: FLOW_OUT

Hi cryptsetup,

I'm confused about the doubling/halving behavior of aes-xts mode.

When I run cryptsetup benchmark, it indicates that aes-xts 256b is narrow=
ly the
fastest on my machine:

#     Algorithm |       Key |      Encryption |      Decryption
        aes-cbc        128b      1987.5 MiB/s      7633.5 MiB/s
    serpent-cbc        128b       136.7 MiB/s       991.3 MiB/s
    twofish-cbc        128b       300.7 MiB/s       651.5 MiB/s
        aes-cbc        256b      1501.7 MiB/s      6416.8 MiB/s
    serpent-cbc        256b       136.6 MiB/s       981.6 MiB/s
    twofish-cbc        256b       293.1 MiB/s       645.3 MiB/s
        aes-xts        256b      6089.6 MiB/s      5870.8 MiB/s
    serpent-xts        256b       868.9 MiB/s       885.9 MiB/s
    twofish-xts        256b       594.4 MiB/s       597.1 MiB/s
        aes-xts        512b      5441.2 MiB/s      5601.0 MiB/s
    serpent-xts        512b       867.0 MiB/s       881.4 MiB/s
    twofish-xts        512b       591.5 MiB/s       608.8 MiB/s

However, I still don't understand what should I use as the argument to
--key-size.

The man page says:

> For XTS mode you can optionally set a key size of 512 bits with the -s =
option.
> Key size for XTS mode is twice that for other modes for the same securi=
ty
> level.

The arch wiki [1] says:

> By default a 512 bit key-size is used for XTS ciphers. Note however tha=
t XTS
> splits the supplied key in half, so this results in AES-256 being used.

This post on stack overflow [2] says:

> Likewise, if you specify --key-size 512, then a 512-bit key will be loa=
ded via
> cryptsetup, but XTS-AES will split it into two 256-bit keys.

all of which have failed to clarify this confusion for me, because I don'=
t know
what is being tested in the benchmark.

What should the argument of --key-size be, 256 or 512, to achieve this su=
perior
performance?

[1] https://wiki.archlinux.org/title/Dm-crypt/Device_encryption#Cryptsetu=
p_usage
[2] https://superuser.com/questions/1428775/what-is-the-default-encryptio=
n-key-size-for-dm-crypt-cryptsetup-in-luks-mode

Thanks,
Ronan
