Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D495669
	for <cryptsetup@lists.linux.dev>; Wed, 15 Mar 2023 16:50:11 +0000 (UTC)
Received: from [192.168.192.146] (port=46540 helo=nx64de-df6d00)
	by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <gszymaszek@short.pl>)
	id 1pcTvV-0001mJ-9A; Wed, 15 Mar 2023 17:24:33 +0100
Date: Wed, 15 Mar 2023 17:24:31 +0100
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Martin Olsson <martinolsson311@yahoo.com>
Cc: Arno Wagner <arno@wagner.name>, cryptsetup@lists.linux.dev
Subject: Re: Password hash as LUKS key
Message-ID: <ZBHxP1L7FMpfW600@nx64de-df6d00>
References: <1738775229.2387123.1678372528163.ref@mail.yahoo.com>
 <1738775229.2387123.1678372528163@mail.yahoo.com>
 <20230310011952.GA1141@tansi.org>
 <885982240.717525.1678893078734@mail.yahoo.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mHjt/TxWxMKXi8ab"
Content-Disposition: inline
In-Reply-To: <885982240.717525.1678893078734@mail.yahoo.com>


--mHjt/TxWxMKXi8ab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 15, 2023 at 03:11:18PM +0000, Martin Olsson wrote:
> printf "%s\n%s\n%s\n" "12345" "$y$j9T$35ITJ7yCc3kFUsasf3QDa/$n.HqacKYHPIE=
E6VxIHhT2vW8.7vfh.fn008SQS5ETb9"| sudo /sbin/cryptsetup luksAddKey /dev/sda3

 1. The format string contains three %s conversion specifications, but
    you provide printf with only two operands. Please try something like
    the following in your shell:

        printf '1. %s 2. %s 3. %s\n' FIRST SECOND

    This is probably not an issue since IIRC luksAddKey only asks for
    the new passphrase once, so it should ignore the next empty line.

 2. In double quotes, a dollar denotes a variable name. For example, in
    "$y$j9T", the shell replaces $y and $j9T with the values of the
    respective variables. Since they are probably not defined, they are
    replaced with empty strings instead. I think the actual password you
    set with the above command is
    "5ITJ7yCc3kFUsasf3QDa/.HqacKYHPIEE6VxIHhT2vW8.7vfh.fn008SQS5ETb9".

Good luck!

--=20
Grzegorz Szymaszek

--mHjt/TxWxMKXi8ab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmQR8T8ACgkQeE9lGUIc
pz5Yuw//fdG8JV3P8Alg+XUKf4r2Xc8gAj41cTEkpA8qZMaW1eqwtnvZlcnVhSue
JGGTm3jwh7cjml7pLupS4HRcT02YGkf+C3ejBJbX0zQsT1G/5QbytQ66YxavJkYZ
cDGowPqCIqaDyB3IS02xSbhOLwulBXaLUnGntES24IceqDCSiY6GqBu/42DxcFcg
MdcaMbl+jGkMwf13O8yPmXFBE9qC62g1v0GnVEV6+aKtr7d+kvSIYXZCQ6kIEuqv
YJ2cb2V53/6grdCy4sK5G/esq3Xtlt+rRo3DNfBk6sMa8HRgeZxqGxXnWl/c2oCI
/2ylYyzMcKuPqFGZi9wCAZmr8Ng90aa/Kisp4mQ4R3yg+CMT/1YrhO8CnGKioeSj
8ZlGONIlbAQMrDwcmSmNI5JTQ9hMw6zhcba0BExZBW2HWHlfSIbI3Il5+RWH2p00
/gUBhsK/2TcIosFhKL3K7HBZAFc1W+8qQhgNJj8bAGfP+V0nF7+OaDrL0Ti8yyF+
kRCsvtpaWYW7FPVYuLYP2DIsDLnYkueMV9sw8y6E85vW6nMaqtf/RVLWz42tSOMd
8LICbiYSM/ZJEgGTBPut2jV0w9+G/DMPcSdz4D0XFgWCsetk6CyKgHTxSEYwGFOe
pMUZIhbhJpSugZS9KqySEfVnAL93pdquF+p0BUF+YpTwIAPOG8Y=
=PbbJ
-----END PGP SIGNATURE-----

--mHjt/TxWxMKXi8ab--
