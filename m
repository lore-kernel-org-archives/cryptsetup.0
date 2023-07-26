Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4363AE57F
	for <cryptsetup@lists.linux.dev>; Wed, 26 Jul 2023 16:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
 s=s31663417; t=1690387840; x=1690992640; i=blobfish@gmx.com;
 bh=tkIFOmOadxeMWeMPmMY9Z4rZLPThrIreMMS/c5tjIuU=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=rSVFVj84vvn+BpnSWlD0biDMs752DkkqwgF4WLQuRm2cFjVQiGGGy/9ENABYrYKuDtXLfGz
 O+64H5I3XmWEvx7MM6dOHFY801JTSyhuNMjDsEcJ0R1FbPCGSX+sDZr8n8eCYuAXc++P3GFNW
 wCkw0ILH+TQTg7O4ip1oaKHNm8mdSQNnVoJg8tmfXXukKiYvF2RZOlMXqWC711uxRD+SPbaZI
 vjVoSj801OrXBpHKlCoSnnRDV6MXuBhC6gLQlF4JOkqikb5lhKPdMiG92Fl78JEcy1n8vgUL+
 9YYAXFZSzQhrBRlIS1qiFfX9FVtlkQ+nLRZpYU0btu9aZk9T2epw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from laptop.localnet ([146.70.57.18]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MkYbu-1q2KA53jXK-00m4vF for
 <cryptsetup@lists.linux.dev>; Wed, 26 Jul 2023 18:10:40 +0200
From: blobfish <blobfish@gmx.com>
To: cryptsetup@lists.linux.dev
Subject: Re: Looking for confirmation as I enter the acceptance stage.
Date: Wed, 26 Jul 2023 12:10:37 -0400
Message-ID: <3286045.aeNJFYEL58@laptop>
In-Reply-To: <a8146e16-1d32-4952-9b38-af1affefb1cb@home.arpa>
References:
 <2159917.irdbgypaU6@laptop> <4863669.GXAFRqVoOG@laptop>
 <a8146e16-1d32-4952-9b38-af1affefb1cb@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Provags-ID: V03:K1:nrrMmQZrmhVLpv413CIIV1Zw+Rn9sDTufsjDiBSlXQni5Via1d0
 W0pVVnD8LxPAuc+noGNBWNr3mJkTfIWjTawsu5tu7HN/+WJiCzQNZaSA6h08clj2+qXA0ad
 XsLpkxLAoHQCi6GNUo1tTcGkGX4IsEdZfu1LuHcFuJfcFIv8kwFBJKVppAOuy6NdpCLa8ha
 z8zNh0zVfRwezhV5mW7Pg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yR+RrftFrX4=;6dXrIBSEGP4KCVclLK0XrLzeH/W
 O7U+DBMtwBz2kJSthXovMtEGw+rqQ+hqraeS5RdBrCFDiRioHGGxcEUZpZcgJHGvdknOJ7Ut9
 4TbgUr0vIR2nDBno3piJTcLqOGQj1H6ztay6BsUsVdyu0Lci4o1N8pziSC+iop0D/eu0sybhN
 60ZuuVbTPduc48KO8YswEsYfjSzS4NWC5EEQ+21gPgJJO1zRmaaJy4jQ3+U/sjS5vgPCf9TP/
 tDtTZ6eYK0YlF+VNZ9mPfRuH0djc3dHlA8OZXzWHYAqGUaLdfKNOL03JNmAUU0pBbXjcPb82M
 rlBO2FbTuRXZ5W1Rp2/easEyqEn60eYaI6VXGQm1nIBeFdy31JfLe9EeNvmaamrFnehKCaoNY
 MYDjvZqyNG4rynBytJ5GgHcygpz9SFKcuUOirmt+oUuTSGMHDY9DL24tWn1lZVDLTaYdKQIiZ
 9Afj8XVOeEc8OqIpRXVZkWs4dFi4fMx8FwlLmpdULdGukY2z3KcJtfKQ5AdCjfXzj1Ui5jvzQ
 mxmRGXwh9/gqr9slQnQtg7BNRGJ9jKSKxA3Wuhplpsa4oopa6zSQv516sw/bGNDyNM50UIiU9
 dTOhFjLhfWysOFfxAYfBNhcAQ01D0+XkmMoD7rL3v1MC26Iy1OQww8PawjDzz+06Gk2Z5wazG
 wQ+ufVxfi6gJnCzK0QVfHrf2Dbhm0ipEsDvaBHr2tFU4m/DaNs37SRH5V7oa4FONKQ11qhARH
 f4jHXq4SUEWkxj9tqi08fhJBMq2SgyVmDU7W2WCiH+48vQlFVAfKpGAc1/hYk83ku4TY4HBd8
 CRSlYlPxqYUHQeb8H/+AB3VFKvCaNilLB9+zmDw9QUYFTcthRmHdRvQ9gV43FrV7YTdiE2UkI
 HJa0CHq1m3HFwyoGmkeNTmHOvVd7ZQo0x7A9BlgwIWEA/oFgPDEkaBsZhUjr0TrnTtzeO9y+z
 3onwdvcL2bLORKDMxOCn9Cily8A=

On Wednesday, July 26, 2023 11:50:35 AM EDT Michael Kj=F6rling wrote:
=20
> That is an EXTREMELY good sign; it means that cryptsetup is happy with
> the LUKS header itself. Having run that, try
>=20
> sudo file -s /dev/mapper/mapped1
>=20

command: sudo file -s /dev/mapper/mapped1
result: /dev/mapper/mapped1: symbolic link to ../dm-4

just a symbolic link so

command: sudo file -s /dev/dm-4
result: /dev/dm-4: BTRFS Filesystem label "mediaLibrary", sectorsize 4096,=
=20
nodesize 16384, leafsize 16384, UUID=3D0e2b9dfb-46ca-4064-bd09-826431b4eafb=
,=20
6943296638976/8001469083648 bytes used, 1 devices

another good sign!




