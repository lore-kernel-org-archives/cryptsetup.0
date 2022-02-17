Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6031C3D6A
	for <cryptsetup@lists.linux.dev>; Thu, 17 Feb 2022 19:06:16 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id d10so9469779eje.10
        for <cryptsetup@lists.linux.dev>; Thu, 17 Feb 2022 11:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to
         :content-language:cc;
        bh=mdQgPE+MN4QXHCuZfmZr4u+SAK0aRFpH7cy102uny4s=;
        b=lovDBq9Erxlw4cKfCvIYc4CcTnSbbCtrpjWaUDMz00ZUyXGIYzIuHQ4ayzSrtFhhxf
         pBkAnsZLMvhX5hcZA6otjJpEinMLld4xepz5JHofTqS7YDTxeiOCzKiVX18HTgnNnxps
         BxKY18hJh2xJR5ydT/8TXMjQRtYQyjP06XfoAos/VWFb891aTfKTioo2Px1kab0w7aov
         c5N+b0Qn8FiIUCzeJ435ZuofpUNdzwHT9IkhdNx3j8M8XjJtyXxmVaQYcvTwxIkUKfrM
         MalLK6hIWVnDc8eU50+lNwAHVOqc1ESx7MxSMbq5gPckkBkvWcodBjB/XbRqffV1gI1X
         aaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:content-language:cc;
        bh=mdQgPE+MN4QXHCuZfmZr4u+SAK0aRFpH7cy102uny4s=;
        b=AVU+M2CDNIR+R0bPm/mkBM7wOvfj+GtVqtsUDXwxWPHEOwAfuyr7hCgMvB8KCRO0uS
         jqOBsjoISNWzZA96WkpRyC8ohbVPgAIAPf3aWSE7USP+djzksx7jdGe++79gWkiDjBaF
         jLnzFXdWdltJiejMOUbXN0QVpUzTrlUQydQ6Rkm72dS1yW+Ytma/3R4xiwqFr5I3/kpO
         5bTqtcZ0nqr6RVQ9mPjciwm4Z5lldyMY1cQ485k5ozI7SeSVr4RW0M3CiResVylWsmac
         /TdDbO+6Z7FqC7XoSsCbNrOTNdSYLW9sqpSCMNmO6rBhZjpPnFckA38huLEkbfrkdQjB
         GdmQ==
X-Gm-Message-State: AOAM533joU25JPJdj+82WjBecY2vw3EG8FyTvsIb8eax0aCRbo5cJ91K
	bZwN1Rk8nssp5Y+nln+zAic=
X-Google-Smtp-Source: ABdhPJz4mZPoxPTj/F/hc3ejJunRwV/8KTjie4cNRFNXc1jNIsyPb+N/OzWVPWfA2zN3SqMau36cQg==
X-Received: by 2002:a17:907:1384:b0:6cd:5c6a:eec0 with SMTP id vs4-20020a170907138400b006cd5c6aeec0mr3635144ejb.35.1645124774509;
        Thu, 17 Feb 2022 11:06:14 -0800 (PST)
Received: from [192.168.2.27] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id j5sm1464417ejs.69.2022.02.17.11.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 11:06:13 -0800 (PST)
Message-ID: <82c29d3e-7b15-dcb1-8f00-450b6eb336f3@gmail.com>
Date: Thu, 17 Feb 2022 20:05:53 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
From: Milan Broz <gmazyland@gmail.com>
Subject: New cryptsetup development list
To: dm-crypt <dm-crypt@saout.de>
Content-Language: en-US
Cc: device-mapper development <dm-devel@redhat.com>,
 cryptsetup development <cryptsetup@lists.linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C8w92hyBx71fPxVzbGuVcyg7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------C8w92hyBx71fPxVzbGuVcyg7
Content-Type: multipart/mixed; boundary="------------yqyfB77wE6lLWa2tyPJl8IVR";
 protected-headers="v1"
From: Milan Broz <gmazyland@gmail.com>
To: dm-crypt <dm-crypt@saout.de>
Cc: device-mapper development <dm-devel@redhat.com>,
 cryptsetup development <cryptsetup@lists.linux.dev>
Message-ID: <82c29d3e-7b15-dcb1-8f00-450b6eb336f3@gmail.com>
Subject: New cryptsetup development list

--------------yqyfB77wE6lLWa2tyPJl8IVR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCnRoZXJlIGlzIGEgbmV3IG1haWxpbmcgbGlzdCA8Y3J5cHRzZXR1cEBsaXN0
cy5saW51eC5kZXY+IGRlZGljYXRlZA0KdG8gY3J5cHRzZXR1cCBkZXZlbG9wbWVudC4NCg0K
UGxlYXNlIGNvbnNpZGVyIHN1YnNjcmliaW5nIGlmIHlvdSB3YW50IHRvIHJlY2VpdmUgbmV3
IHJlbGVhc2VzDQphbm5vdW5jZW1lbnRzIGFuZCBwYXJ0aWNpcGF0ZSBpbiBkaXNjdXNzaW9u
cy4NCg0KVGhlIGxpc3QgaXMgaG9zdGVkIGF0IGtlcm5lbC5vcmcgc3Vic3BhY2UNCmh0dHBz
Oi8vc3Vic3BhY2Uua2VybmVsLm9yZy9saXN0cy5saW51eC5kZXYuaHRtbA0KDQpZb3UgY2Fu
IHN1YnNjcmliZSBieSBlbWFpbGluZyA8Y3J5cHRzZXR1cCtzdWJzY3JpYmVAbGlzdHMubGlu
dXguZGV2Pg0KKFlvdSBjYW4gdXNlIGxpbmtzIGluIFVSTCBhYm92ZS4gRW1wdHkgbWFpbCBt
ZXNzYWdlIGlzIGVub3VnaC4pDQoNClVuc3Vic2NyaWJlIGJ5IGVtYWlsaW5nIDxjcnlwdHNl
dHVwK3Vuc3Vic2NyaWJlQGxpc3RzLmxpbnV4LmRldj4uDQoNClBvc3RzIGFyZSBtYWRlIGJ5
IGVtYWlsaW5nIDxjcnlwdHNldHVwQGxpc3RzLmxpbnV4LmRldj4uDQoNCkZvciBvdGhlciBp
bmZvcm1hdGlvbiBhbmQgaGVscCBhYm91dCB0aGlzIGxpc3QsIHNlbmQgYSBtZXNzYWdlIHRv
DQo8Y3J5cHRzZXR1cCtoZWxwQGxpc3RzLmxpbnV4LmRldj4uDQoNClRoZSBsaXN0IGlzIGVu
dGlyZWx5IG9wZW4uIE5vIG1vZGVyYXRpb24gaXMgaW4gcGxhY2UuDQpGb3IgcHJpdmFjeSBy
ZWFzb25zLCB0aGUgbGlzdCBvZiBzdWJzY3JpYmVycyBpcyBub3QgYXZhaWxhYmxlIGV2ZW4N
CnRvIGxpc3Qgb3duZXJzLg0KDQpUaGUgYXJjaGl2ZSBpcyBhdmFpbGFibGUgYXQgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvY3J5cHRzZXR1cC8uDQpPdGhlciBhY2Nlc3MgbGlrZSBOTlRQ
LCBBdG9tIGZlZWQsIG9yIGdpdC1iYXNlZCBhY2Nlc3MgaXMgYXZhaWxhYmxlDQp0aHJvdWdo
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnLyBzZXJ2aWNlLg0KDQpUaGlzIG1haWxpbmcgbGlz
dCBzaG91bGQgcmVwbGFjZSB0aGUgZXhpc3RpbmcgZG0tY3J5cHQgbWFpbGluZyBsaXN0Lg0K
DQpUaGFua3MsDQpNaWxhbg0K

--------------yqyfB77wE6lLWa2tyPJl8IVR--

--------------C8w92hyBx71fPxVzbGuVcyg7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEKikYJD/eRmSNBob52bBXe9k+mPwFAmIOnJgACgkQ2bBXe9k+
mPyjwhAAmfMKushuUXaKAv1bY2UrlKZRzT/yrfqzvfXt+xt1UYdg/l0t7K5V13Hc
ZlnhDjnsqhyD8Wkrrz3Ee6SxdZC73h4ig8ZaWGwTMxY07xqg/TyNPp7StFlL6Zfm
hU4G4fhRw6fzOh6cUCQFjaODMAaiqClgU5jedzSTRqsubwbM5PPqFaMtuO/EMGkH
coKSwskNbEnasKfxNuXMiOkxQUfalDJkwhKsSOdxsF7ZUUd29QNeDH7tLnErQBYe
d6sswN1H4lOeTKG/tHjhFaqMILRhnzQT1GKRidGyFus5DCXBeNhP1KXMD5d6Q2qn
vHRSQ2ATBa2KekWn73ZSU8DjhAjzpz1BJhAvg5v+y/qwQ/q45tXppLzEiI9of2qs
xcuR8lR+eWvsjQI2q/z1NSBOCvDcBbvivgiS+YzByMf3jSRugW+02eqOM/ZxXQpv
yLv7bUVKcdTux9pyWzUTzMfNyBf2noXNbtRrNdPgz+TLS2IaF1Ph7tNjzgirQfKd
N53MZc5P8uDBzqAr82yHlmmIjxmv7B1buLedmzfQQs8jEBM2lPC1c0pT+07TO0DC
qP+yd1wYSEu3xkxPhPh9ALj7SO1J0uzJeU3M/ujeXhaNAu1NQLo+1hb+uwGixJYh
Ll2/K2NRVxV1c8BzMSlCvhXM8Oh/W5KIPD5DNW5Phb9T6ZzCVwU=
=kWVy
-----END PGP SIGNATURE-----

--------------C8w92hyBx71fPxVzbGuVcyg7--
