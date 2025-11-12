Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320C31F09B3
	for <cryptsetup@lists.linux.dev>; Wed, 12 Nov 2025 05:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762924727; cv=none; b=YgjoijxhmWlq6Ru1JGaEtz5VgUWa/ICII+/xmTD5v4EXgRhleDhLxXLDH1b7s3rO0KqQF1uN6DERjP7Zmv3AL5nRriXT3Lxhah8ZjL9Kzy/5C9XuhIbA7ltSCsQlVQZUW3e2vOoXQBu3MLhGCRHFBl0VfwO4N+AdoCXmSbn7dP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762924727; c=relaxed/simple;
	bh=c6/7tzoz4PT3gVjKzbmDjcFcQEgyG78OrsyW90YOUEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Mlct3RcDVDH+9ZIloQxjzCUKIuhMZZelpa2dJ1H3pxX5RQkNwGlpkgv5cA0S2rZuxbK8maVftJg4RllWdX35PkDVQBuzqtDAV06eI5ovdoqLKirBGQihE/uiTp88PjKdAFQzhvZbuhIzraCZyce4rfCyl20mX9oPBphTaToZkwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkS/L63R; arc=none smtp.client-ip=209.85.166.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkS/L63R"
Received: by mail-il1-f193.google.com with SMTP id e9e14a558f8ab-4346dfd5b44so124055ab.3
        for <cryptsetup@lists.linux.dev>; Tue, 11 Nov 2025 21:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762924725; x=1763529525; darn=lists.linux.dev;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ezl4SSQLTdq74CW82/F96/qsFWv/FcEbMyqJZMgIA2A=;
        b=MkS/L63RA+2acDAvdL8irmiUWAYhNaecWIelaF1U3ZmLoO4Vx0kcEN7Ot4Mo1pwwMf
         sUHsSV9r4TJ+fpwRiOgYIbJd6jQzdvGBk5NYSC0p+liejOfsbdptRXNAph7OXThJP7HJ
         8VJQlsxjJms2P2ba9nRg7Ytf/VaIUWuYpos2MfG0iIZ+pV53qIa8/xdDORTjYBopJwO9
         d4R7BSm3CvqoEcPYh4CEyxcuIr2mlzwp0fk2DepBFFYS1XEaNDJzZ8qkwYSIEauu6i8O
         hJBXBVqZbO3sWvQKLQTwG8OYMaUqCmzD1uhRzdO9o/S0wbPLq4YsU18sr1Fv3uxE535y
         7PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762924725; x=1763529525;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezl4SSQLTdq74CW82/F96/qsFWv/FcEbMyqJZMgIA2A=;
        b=CjiwtY6YAO330qNXb51hC8ITXTp3lfZyfWCRktrXPcuBT0j+K5fQ/Z/Jg2mfMYSqMe
         /gZ6AYUB7C3jQEH0P0dGoUtGNRfTPYI5VXYkCHtFBK7N2kuQz/5amOh2q5Q+Wz9EDRCH
         IemAs3THm656ojYHc9M2nwccIrmOgQlht4OPy1Al8edkZF4DrAx8ZE/sQ1/8iy1mp0E6
         /2dh0MsqxBpmpgnTZR+TnZC0JnolenV1x0akbclubVaW1ULUFQk88lseufybb9ylHj1V
         k9N8ZaISup+MGYVm+4qkX8Pos0Nl1btiaVO6aw+zGCXcY5f9Hq7WZDY/xhksCN+gCpXt
         9Yeg==
X-Forwarded-Encrypted: i=1; AJvYcCUl4LJiMzVsEVbpPM2erzgDsHqU+IxXAzyOW6Kqdqgc1KEieykpALlby2AqPIKX6OKlI4hKPw7Skyup@lists.linux.dev
X-Gm-Message-State: AOJu0YzF40SQBDEKgC6XGn60nOpHBgNCGeQrN59Coaxg3ibCuSazQtP8
	o5zGR8hZ6JonZ3fhDsX6DBObvh9L6fU5jYjiJB74JJiFaqoh9iBD2DFv
X-Gm-Gg: ASbGncsnOt6tjO2T5YnYUem/K0jlUrCAcj2qv6ULxi2cVcaSFAReDSZ8mBJwBYPnYmn
	3DDvQT4fKkzdjwg0cviSGsu67785gUTXZBIuJa8jTksRQT3KqMTxac6E3xdfrKIyqe4LKtzBTCk
	oi2p4VgsLYI+F7FrNjXvKZkNIq1qNL+YoaSt/G5eM8SKCdeNIQiJIFO5bNTmpuCAoY6VKColU02
	msgXXfsn52kH/cuLcVmVxJtQMUv8mEqxcc/zCrQ0rMjoDFyW41TTheFZGwW6ZPSGRiJFaX/SzPi
	jES4FqnmOI3CpmIxW5+ALpXiGp/mqJJ3yNZKV0oEr4eojK5kVgHqP/Otm1i6K813OzK+v0Vxyh4
	+GzVYYjLY27b3LimU3g1isUTuOFv29k7f/y4ZBtl+Z3h09uUNeArGjrgtUXxd/etYNviEvDzKz5
	UalP+PuXcE
X-Google-Smtp-Source: AGHT+IG+CGWHKYLx/mgjt5y0vC6+WM/NIsUYelFqXQlQ4OGrBX/1QS3A/YpW77DPQRnBU2qp1nCKvA==
X-Received: by 2002:a05:6e02:3807:b0:433:2421:d752 with SMTP id e9e14a558f8ab-43473de377cmr8414505ab.7.1762924725169;
        Tue, 11 Nov 2025 21:18:45 -0800 (PST)
Received: from kf-m2g5 ([2607:fb90:cf2c:12ad:3e02:9a49:f465:3655])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4347338d4d7sm6753305ab.20.2025.11.11.21.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 21:18:44 -0800 (PST)
Date: Tue, 11 Nov 2025 23:18:35 -0600
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: linux-mm@kvack.org, cryptsetup@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, adrelanos@whonix.org
Subject: Hard system lock-ups when using encrypted swap and RAM is exhausted
Message-ID: <20251111231835.1232ad8f@kf-m2g5>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z4RQJJ68rzCF8i_e+DrlMou";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/Z4RQJJ68rzCF8i_e+DrlMou
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Not sure if this is a memory management issue, a LUKS issue, or both,
so I wrote both mailing lists.

I'm seeing an issue with both the latest mainline kernel (6.18-rc5) and
Debian 13's 6.12 kernel package. When physical memory fills up, the
entire system locks up hard, as if it hit rather severe thrashing,
despite the fact that there appears to be disk cache that can still be
evicted, and there is ample amounts of swap space remaining (gigabytes
of it). This issue did not occur with the 6.1 kernel in Debian 12. I'm
seeing this occur in very low-memory Debian VMs, with between 512 and
900 MB RAM, running under VirtualBox and KVM. (I suspect, but have not
verified, that I'm seeing similar behavior under Xen as well.) These
VMs generally use a swappiness of 1, though I have seen a lockup occur
even with a swappiness of 60. The filesystem in use, in case it
matters, is ext4.

To reproduce on a system running Linux 6.18-rc5, with :

* Follow the steps from
  https://gitlab.com/cryptsetup/cryptsetup/-/wikis/FrequentlyAskedQuestions,
  section "2.3 How do I set up encrypted swap?", but creating a
  swapfile rather than a swap partition. I created an 8 GB swapfile
  with fallocate. Reboot the system when done.
* In a TTY, open a terminal multiplexer (or something you can abuse as
  one, Vim works well), and open two terminals. In one terminal, run
  `htop` so you can observe memory and swap usage.
* In the `htop` terminal, sort by M_RESIDENT.
* In the other terminal, create a new file `test.py`, that will
  gradually fill memory at a relatively fast pace and print an
  indicator that it's still alive. I used the following code for this:

    import time

    count =3D 0
    mem_list =3D []
    while True:
        mem_list.append([x for x in range(2048)])
        count +=3D 1
        time.sleep(0.002)
        print(count)

* Run the script with `python3 test.py`.
* While the script runs, observe the growing memory usage in `htop`.
  Swap usage should start at or near 0, RAM usage will gradually
  increase. Once RAM usage starts getting high, some data will start
  being swapped out as expected, but after a short while the whole VM
  will lock up despite there being gigabytes of swap left. (On my KVM
  VM, the last time htop updated its screen, it showed RAM usage of
  712M/846M, and swap usage of 328M/7.40G. The python3 process
  running the script was consuming 551M memory. The VM is entirely
  unresponsive. Incidentally, the python3 process also was in
  uninterruptible sleep when htop last updated its screen, but that
  could mean nothing since it might have come out of sleep between the
  last screen update and the VM lockup.)

Under Bookworm with Linux 6.1, the Python script would occasionally
freeze, but the VM would remain responsive, and the script would
eventually resume. Even with kernel 6.12, both unencrypted swapfiles and
swapfiles that are technically unencrypted but live on a LUKS volume
both behave as expected. It's only swapfiles that are themselves
encrypted that seem to trigger these lockups.

I haven't looked at the code at all, but it seems like maybe memory
LUKS needs available in order to operate is being consumed, thus
making it impossible to swap anything in and out of the swapfile? That
seems like it would cause these symptoms or similar, though I don't
know.

Let me know if I can provide any further information on the issue. I'm
happy to bisect the kernel if it will help.

--
Aaron

--Sig_/Z4RQJJ68rzCF8i_e+DrlMou
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmkUGKsACgkQpwkWDXPH
kQk4ARAAqk9d7FDHR97lXxeh1nY89u028mDQ/739cRtbBMzWbgbiEsNkgGPq+L+M
Umbu80ExIyDXuNEE2fxWsYvqguj4YI9nuOFHIX+PGIGagiYFlwWlnaQcrmO8PmA4
A9qXirRq+PxxBYMwsEcS++DafDtoH54fHMGjhKf8KCi/DmwES4bdbWkHRiYojmYE
CpjyvLuCXOiXMe/pAgzfp++EpBX1AiF948MFKf6/a4qagycypVrX8AWluIVwEjBw
w40yZjZ5t5Fwm6F86VfnalBf+YGFOeiLUbPe/+deYmhQUHSc8RXGq7SBaYJJhCpq
lE90ypvTOCRnhGSe8PaTOvekAJhCzVCFqyUmgsUHAkb7uOKcdiaNVKJdpS9q6ZWf
UF5vhWZ8AEe2qyISOQW4cFRsNF4MMxyJsDbi5XAJDii1UP+RoAJfcdvljVKfSfnD
A5VXJAMmtCUFak67VYp7Cr8787LOs84b1HtjLpGH+aWOx4csJWKyKwq8KBbxayon
DHW36A/8546cgHR2/P8ke8Hfi5QI+qq6v8M0ACCoYUsKXw/MSttNa4H7To0F+MW7
9XUYisaBv/h0NM38aVl1E6FnRM/9HlBzUYmGVJLGg02IIZkqM77l0eJHhz1wVnm7
+h7ExBaCaI57vjOkHGm2dH1XitrwKCjAWf4nVlzs+P8hOzLDSFM=
=xCmb
-----END PGP SIGNATURE-----

--Sig_/Z4RQJJ68rzCF8i_e+DrlMou--
