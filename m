Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4935764A
	for <cryptsetup@lists.linux.dev>; Thu,  9 Feb 2023 16:36:22 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id p26so8014566ejx.13
        for <cryptsetup@lists.linux.dev>; Thu, 09 Feb 2023 08:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-language:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VsMst8gW1Pxu/KOX5DEfD3JHwt9CXI/UEnWu05LqM6g=;
        b=ZAHN3Z05FMpuwebh/vkIklrG2BHaBSm+ClLHwL5ZKLFJpUmV+iRmqF740kBVeVnscV
         3RDHTe+QilUfgs4Y5VYIOACF1KlPIWc707sd/qA48FtX/JchnCenmyJv5E3hCxK0sj7I
         gH2S7hNkQxCO/ThkAbrdvMA0aL4TIVYLxK7QGTvy8Z1Pv2rHwM1tplgZVgcWAjELsfNx
         ZG2ZZa+XU8EUYTiNZVGgCDMdwFnh71v442reQhldkUugnth8mqfKGKxmScZb5Mpn80X8
         YI801pdlXnqhHEcUBrwSar2fDJcT7g11nNnJsiaKPh8W7EilY2MMcWJnqcGiyjvsVzsk
         ypVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsMst8gW1Pxu/KOX5DEfD3JHwt9CXI/UEnWu05LqM6g=;
        b=kqiZOu1Hy9bC5giApO6XFcP9mP7uDGLRemrIOt/z16pz1qWRcCEqpBfA8sP/FGMKqg
         FuY+C0BQI9H1oODN/xcJ/3DeiBSeXBUYXmJ/A6wVy+GctHw9L7oeRjm/6//B/fih3F47
         SGwXjIL+9AB6+tj6nep3hwVqvXQObMMHl8iAwlPuK/3IzJU/V0i3lGpZRxMcRtgVQ51K
         q+Fcavvr6xBBRaFc/4513o5N5U1SJvus9DCUy9n40nmv3Ofb6VD8J8nBrO4xUekeBtRp
         4i8dN+m0N/Vxtq0lk5JSmvscrH23qEIdvBXosV8YADPxqIfRvhOe10VpNNl+T+ghHJsk
         FD8Q==
X-Gm-Message-State: AO0yUKUdtYX1MWQReKLuAoLAdtCDgoL0MRusfTVx0Ph94CuV+GjeLpiQ
	Hg2rtg5cO6174/DHt2MxubXbTEM3PRE=
X-Google-Smtp-Source: AK7set9gkNSI5WNvdsjSAV3/h98+l+GIU1yi+B4NpEI4A0ns+IyXQzESlh+hs2DQ1ZUpv62+VeCqYg==
X-Received: by 2002:a17:906:6a1b:b0:8af:b63:b4bf with SMTP id qw27-20020a1709066a1b00b008af0b63b4bfmr7378250ejc.27.1675960580528;
        Thu, 09 Feb 2023 08:36:20 -0800 (PST)
Received: from [147.251.42.107] (nbbroz2.fi.muni.cz. [147.251.42.107])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709066a8b00b0087f68a2681bsm1087471ejr.96.2023.02.09.08.36.19
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 08:36:19 -0800 (PST)
Message-ID: <bcf06d0a-8c0d-1e03-d84d-c78ab46eb393@gmail.com>
Date: Thu, 9 Feb 2023 17:36:11 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Milan Broz <gmazyland@gmail.com>
Subject: [ANNOUNCE] cryptsetup 2.6.1
To: cryptsetup development <cryptsetup@lists.linux.dev>
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8vduVqW508vSVL5uQ20xnLNo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8vduVqW508vSVL5uQ20xnLNo
Content-Type: multipart/mixed; boundary="------------AjsBjBqMvhC177KNHEkcOyBM";
 protected-headers="v1"
From: Milan Broz <gmazyland@gmail.com>
To: cryptsetup development <cryptsetup@lists.linux.dev>
Message-ID: <bcf06d0a-8c0d-1e03-d84d-c78ab46eb393@gmail.com>
Subject: [ANNOUNCE] cryptsetup 2.6.1

--------------AjsBjBqMvhC177KNHEkcOyBM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhlIGNyeXB0c2V0dXAgMi42LjEgc3RhYmxlIHJlbGVhc2UgaXMgYXZhaWxhYmxlIGF0DQoN
CiAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9jcnlwdHNldHVwL2NyeXB0c2V0dXANCg0KUGxlYXNl
IG5vdGUgdGhhdCByZWxlYXNlIHBhY2thZ2VzIGFyZSBsb2NhdGVkIG9uIGtlcm5lbC5vcmcN
Cg0KICAgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgvdXRpbHMvY3J5cHRzZXR1
cC92Mi42Lw0KDQpGZWVkYmFjayBhbmQgYnVnIHJlcG9ydHMgYXJlIHdlbGNvbWVkLg0KDQpD
cnlwdHNldHVwIDIuNi4xIFJlbGVhc2UgTm90ZXMNCj09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KU3RhYmxlIGJ1Zy1maXggcmVsZWFzZSB3aXRoIG1pbm9yIGV4dGVuc2lvbnMu
DQoNCkFsbCB1c2VycyBvZiBjcnlwdHNldHVwIDIuNi4wIHNob3VsZCB1cGdyYWRlIHRvIHRo
aXMgdmVyc2lvbi4NCg0KQ2hhbmdlcyBzaW5jZSB2ZXJzaW9uIDIuNi4wDQp+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4NCg0KKiBiaXRsazogRml4ZXMgZm9yIEJpdExvY2tlci1jb21w
YXRpYmxlIG9uLWRpc2sgbWV0YWRhdGEgcGFyc2VyDQogICAoZm91bmQgYnkgbmV3IGNyeXB0
c2V0dXAgT1NTLUZ1enogZnV6emVycykuDQogICAtIEZpeCBhIHBvc3NpYmxlIG1lbW9yeSBs
ZWFrIGlmIHRoZSBtZXRhZGF0YSBjb250YWlucyBtb3JlIHRoYW4NCiAgICAgb25lIGRlc2Ny
aXB0aW9uIGZpZWxkLg0KICAgLSBIYXJkZW4gcGFyc2luZyBvZiBtZXRhZGF0YSBlbnRyaWVz
IGZvciBrZXkgYW5kIGRlc2NyaXB0aW9uIGVudHJpZXMuDQogICAtIEZpeCBicm9rZW4gbWV0
YWRhdGEgcGFyc2luZyB0aGF0IGNhbiBjYXVzZSBhIGNyYXNoIG9yIG91dCBvZiBtZW1vcnku
DQoNCiogRml4IHBvc3NpYmxlIGl0ZXJhdGlvbiBvdmVyZmxvdyBpbiBPcGVuU1NMMiBQQktE
RjIgY3J5cHRvIGJhY2tlbmQuDQogICBPcGVuU1NMMiB1c2VzIGEgc2lnbmVkIGludGVnZXIg
Zm9yIFBCS0RGMiBpdGVyYXRpb24gY291bnQuDQogICBBcyBjcnlwdHNldHVwIHVzZXMgYW4g
dW5zaWduZWQgdmFsdWUsIHRoaXMgY2FuIGxlYWQgdG8gb3ZlcmZsb3cgYW5kDQogICBhIGRl
Y3JlYXNlIGluIHRoZSBhY3R1YWwgaXRlcmF0aW9uIGNvdW50Lg0KICAgVGhpcyBzaXR1YXRp
b24gY2FuIGhhcHBlbiBvbmx5IGlmIHRoZSB1c2VyIHNwZWNpZmllcw0KICAgLS1wYmtkZi1m
b3JjZS1pdGVyYXRpb25zIG9wdGlvbi4NCiAgIE9wZW5TU0wzIChhbmQgb3RoZXIgc3VwcG9y
dGVkIGNyeXB0byBiYWNrZW5kcykgYXJlIG5vdCBhZmZlY3RlZC4NCg0KKiBGaXggY29tcGls
YXRpb24gZm9yIG5ldyBJU08gQyBzdGFuZGFyZHMgKGdjYyB3aXRoIC1zdGQ9YzExIGFuZCBo
aWdoZXIpLg0KDQoqIGZ2YXVsdDI6IEZpeCBjb21waWxhdGlvbiB3aXRoIHZlcnkgb2xkIHV1
aWQuaC4NCg0KKiB2ZXJpdHk6IEZpeCBwb3NzaWJsZSBoYXNoIG9mZnNldCBzZXR0aW5nIG92
ZXJmbG93Lg0KDQoqIGJpdGxrOiBGaXggdXNlIG9mIHN0YXJ0dXAgQkVLIGtleSBvbiBiaWct
ZW5kaWFuIHBsYXRmb3Jtcy4NCg0KKiBGaXggY29tcGlsYXRpb24gd2l0aCBsYXRlc3QgbXVz
bCBsaWJyYXJ5Lg0KICAgUmVjZW50IG11c2wgbm8gbG9uZ2VyIGltcGxlbWVudHMgbHNlZWs2
NCgpIGluIHNvbWUgY29uZmlndXJhdGlvbnMuDQogICBVc2UgbHNlZWsoKSBhcyA2NC1iaXQg
b2Zmc2V0IGlzIG1hbmRhdG9yeSBmb3IgY3J5cHRzZXR1cC4NCg0KKiBEbyBub3QgaW5pdGlh
dGUgZW5jcnlwdGlvbiAocmVlbmNyeXB0aW9uIGNvbW1hbmQpIHdoZW4gdGhlIGhlYWRlciBh
bmQNCiAgIGRhdGEgZGV2aWNlcyBhcmUgdGhlIHNhbWUuDQogICBJZiBkYXRhIGRldmljZSBy
ZWR1Y3Rpb24gaXMgbm90IHJlcXVzdGVkLCB0aGlzIGxlYWRzIHRvIGRhdGEgY29ycnVwdGlv
bg0KICAgc2luY2UgTFVLUyBtZXRhZGF0YSB3YXMgd3JpdHRlbiBvdmVyIHRoZSBkYXRhIGRl
dmljZS4NCg0KKiBGaXggcG9zc2libGUgbWVtb3J5IGxlYWsgaWYgY3J5cHRfbG9hZCgpIGZh
aWxzLg0KDQoqIEFsd2F5cyB1c2UgcGFzc3BocmFzZXMgd2l0aCBhIG1pbmltYWwgOCBjaGFy
cyBsZW5ndGggZm9yIGJlbmNobWFya2luZy4NCiAgIFNvbWUgZW50ZXJwcmlzZSBkaXN0cmli
dXRpb25zIGRlY2lkZWQgdG8gc2V0IGFuIHVuY29uZGl0aW9uYWwgY2hlY2sNCiAgIGZvciBQ
QktERjIgcGFzc3dvcmQgbGVuZ3RoIHdoZW4gcnVubmluZyBpbiBGSVBTIG1vZGUuDQogICBU
aGlzIHF1ZXN0aW9uYWJsZSBjaGFuZ2UgbGVkIHRvIHVuZXhwZWN0ZWQgZmFpbHVyZXMgZHVy
aW5nIExVS1MgZm9ybWF0DQogICBhbmQga2V5c2xvdCBvcGVyYXRpb25zLCB3aGVyZSBzaG9y
dCBwYXNzd29yZHMgd2VyZSB1c2VkIGZvcg0KICAgYmVuY2htYXJraW5nIFBCS0RGMiBzcGVl
ZC4NCiAgIFBCS0RGMiBiZW5jaG1hcmsgY2FsY3VsYXRpb25zIHNob3VsZCBub3QgYmUgYWZm
ZWN0ZWQgYnkgdGhpcyBjaGFuZ2UuDQo=

--------------AjsBjBqMvhC177KNHEkcOyBM--

--------------8vduVqW508vSVL5uQ20xnLNo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEKikYJD/eRmSNBob52bBXe9k+mPwFAmPlIPsACgkQ2bBXe9k+
mPy8zBAAx9YTWE/KcBVAHwh5u9u1cMn4Yia529Rza86BoVd1pX7T4dh59d/2OYJ/
vkYw20stb9x91TIfKnuYLQqBgPMSnYzQ3H98nao/x+oa3DA32YlZOxcW0fLyhExC
gTBPKA9IZoy5EXPPw91KpXYRBm0PlmuH1lCcRAVa6fAvd1HkqFfGgZBKQUthZ+Bz
lGUkQRSKWZLbmU7yw2gEeMHvq/nrtgTFUn5N+g8xNi+6OYuiUy8bwGb2tA6UnIq1
QIE6SV7ViTWgd9E1sCFTV8HxwcHRd52lkQDxc5DcNn6fF3CZt5O9LPf/0FnttIha
ZtFrjnPnhoFXu4Pzitb1WH8Sxf0NzBTHn9PaBdNzKkptmS3X1lwvChPjfHHvn42w
mrCk930Frbf/6YNVpIbnogvl5QZXtl/S/qKsb3T5EXsdVYWPmph7XMcLhtaN7d1d
2ThQsv6eCCZYVR/x6qumVHZX4h2q25bbEWpmi1Ygt2hVGLAlZBaBQkkGwBMEFl0P
yyxmmK1FbamOJebHVBi9nZ6/RnARTB6an2zMWQTt0C1q0j8qe4yrgUP0Vh5BNOkM
iRCGBW/UTOltQdZtoelKMOluNVuP9E0Hf/7flySaeRnMAVRXPkjxRU9skrsitjsu
80CrpYW+0qDqtRpQMFfwxTc+TkjnhcVCrLAkfQW79HUAnWo+TG0=
=40Vy
-----END PGP SIGNATURE-----

--------------8vduVqW508vSVL5uQ20xnLNo--
