Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca [69.165.217.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C4A1F61D
	for <cryptsetup@lists.linux.dev>; Mon, 16 Oct 2023 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlinx.bc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=interlinx.bc.ca
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from pc.interlinx.bc.ca (pc.interlinx.bc.ca [IPv6:fd31:aeb1:48df:0:3b14:e643:83d8:7017])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by server.interlinx.bc.ca (Postfix) with ESMTPSA id 5A6832F385
	for <cryptsetup@lists.linux.dev>; Mon, 16 Oct 2023 13:57:01 -0400 (EDT)
Message-ID: <633010a561869f927fc1f208f5cf4ae6a2c9587f.camel@interlinx.bc.ca>
Subject: online encryption progress
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
To: cryptsetup@lists.linux.dev
Date: Mon, 16 Oct 2023 13:57:01 -0400
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dF/5k+DBx1uPTVXZdXwA"
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-dF/5k+DBx1uPTVXZdXwA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

I used:=20

# cryptsetup reencrypt --encrypt --init-only --reduce-device-size 32M /dev/=
md0 md0_encrypted
# cryptsetup reencrypt --resume-only /dev/md0

to encrypt a device online.

I can see that it's encrypting:

# cryptsetup status md0_encrypted                                          =
                                                                           =
             =20
/dev/mapper/md0_encrypted is active.
  type:    LUKS2
  reencryption:  in-progress
  cipher:  aes-xts-plain64
  keysize: 512 bits
  key location: dm-crypt
  device:  /dev/md0
  sector size:  512
  offset:  32768 sectors
  size:    7813643952 sectors
  mode:    read/write

Is there any way to know how far from complete it is?  I.e. percent
done, etc.?

Cheers,
b.


--=-dF/5k+DBx1uPTVXZdXwA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEE8B/A+mOVz5cTNBuZ2sHQNBbLyKAFAmUteW0ACgkQ2sHQNBbL
yKDg8Af/aQHE2iS1/vah5wFffCxH6mieZgKdcObNZCsiaXkUh2MnwqPvN1p/daZr
FMxJeP6WXM6cUJEtJUjS6Y/VOf169cDLxGYrN4u2YnKSuzN8FlgQo1GyDSpIHvRN
e4RnD+hXTgkykIo/mip/pTWnMKtcAOgZu4dks4H5Ug4I+6xoDUQT540UycmZ4NdM
AtUh6J62owuMMa5ACdbnp5UBNy5E+eY5AePzEjX18x1gCDZG5dkZnwIU3UYFaV6R
PBWlWv3xY27z/9RarmR/gS3zAXSTuD3Pw0qwF0d2OpsVNaQfH0zIsaGRew+sTT//
ahRSgtFgKDk0fp5Qh0tiJhcNu/THzw==
=bCXl
-----END PGP SIGNATURE-----

--=-dF/5k+DBx1uPTVXZdXwA--
