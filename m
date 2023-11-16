Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977C730659
	for <cryptsetup@lists.linux.dev>; Thu, 16 Nov 2023 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lukav.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lukav.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lukav.com header.i=@lukav.com header.b="OVC8i7KQ"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-77ba6d5123fso164988985a.0
        for <cryptsetup@lists.linux.dev>; Thu, 16 Nov 2023 05:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lukav.com; s=google2; t=1700140973; x=1700745773; darn=lists.linux.dev;
        h=in-reply-to:disposition-notification-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2oS5+ohLY/gPJcFMkeVlaNebF4HJqdhh3tJR9GY4LI=;
        b=OVC8i7KQobUhhD5DQ0yrkNwLmLfqhadon/8Sbk1sBSr6xo177XwGmh2hoRx6/8tsHx
         DwBen46n3wE4JKmhor9XY+LS0C5xedGDDXpc0uKRoWgAk64rPKM0K1JWU8FAiDThBimI
         /VnNuTPLSlhJAuHBlda/N3/J8B9nbJ4tlZKqvie5cSuMRc+SCYS8bgypEy7ierpyDREp
         sKnorpD2UFsRGbLLwPKUXHC/nqbX/zJu+CxKIRuBnAoA4ZNGwLAKlCHKaIHwlHnzMwDC
         cIaUOctM9eAajRYcpw8ksk8l37aVPHY9Z0WyDYngI8y9NK9F0DDzKuR56me4oKGgl2uU
         X/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700140973; x=1700745773;
        h=in-reply-to:disposition-notification-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2oS5+ohLY/gPJcFMkeVlaNebF4HJqdhh3tJR9GY4LI=;
        b=iAIbwXtM82FGj+wHtgeBLu9YnmH7dXcDsraMNWD1MmpoWq4kXNnqzT3J2LJcNSt8V9
         9Y91H8F87c/rQ3RlIKGxgL/FODWFdQJE/f0yduIihPuEPjiVoGogP2dODaRdkCTH4Gq4
         W5WzX5mxclURBPCOZg4Fx3sfBIO+ZLs2S+KMUMQoBCVs8bWnm6ociiy7cpGFQJE/kAIu
         haA7EgKT/j4zEEj/sUaPXV8UV/+4LrTrWB9G6J8kYKJU5eq5yaLBnYP7gwzofyWNMFQG
         INZAR5jqOXTkhAbuFiE7OPiFxe9cqQ1zKCqsrqgFQpwAnDWFRzMAWSDXaY+j7JwlbWQ6
         87xw==
X-Gm-Message-State: AOJu0YzUloftzJIoaY/RWN5xmAz2ZKobi0umNuYLIS7S45/NQ73iC+xn
	3612ILDs7HsgHLDU8pf3xyxxgJs52Yw0cIGi2klhWw==
X-Google-Smtp-Source: AGHT+IGxV5f1h47lYyG3kcJRYKiari+VQzOubHt35b7N6klH4AUSdGFmddFk5tKsZyNMkdH2kxcntg==
X-Received: by 2002:a05:620a:3187:b0:77b:d8e9:3bc2 with SMTP id bi7-20020a05620a318700b0077bd8e93bc2mr2324807qkb.28.1700140973202;
        Thu, 16 Nov 2023 05:22:53 -0800 (PST)
Received: from ?IPV6:2607:fea8:1bc3:fe00::a7d6? ([2607:fea8:1bc3:fe00::a7d6])
        by smtp.googlemail.com with ESMTPSA id dw1-20020a05620a600100b0076ce061f44dsm4314158qkb.25.2023.11.16.05.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 05:22:52 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------QcgC5iOQdHKCO2WWK3fZzLsI"
Message-ID: <bfc13ff5-da92-49ec-bcc5-5dc06a9423d1@lukav.com>
Date: Thu, 16 Nov 2023 08:22:51 -0500
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problem after converting to LUKS2
To: Milan Broz <gmazyland@gmail.com>, cryptsetup@lists.linux.dev
References: <72f6c041-14d4-473e-bcba-7bf3b9fd47aa@lukav.com>
 <979f56ca-14f3-46fd-9935-6365223ab3b8@gmail.com>
 <445d7af3-40b6-453d-b1c1-718f222407e6@lukav.com>
 <a8d9b808-9dd3-4078-8636-a443f623e9e6@gmail.com>
Content-Language: en-CA
From: Anton Avramov <lukav@lukav.com>
In-Reply-To: <a8d9b808-9dd3-4078-8636-a443f623e9e6@gmail.com>

This is a multi-part message in MIME format.
--------------QcgC5iOQdHKCO2WWK3fZzLsI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023-11-16 02:56, Milan Broz wrote:
> On 11/15/23 16:34, Anton Avramov wrote:
> ...
>>> Please post log from failing command (luksOpen?) with --debug option,
>>> so we can see what
>>> is failing and what exact version (toolss, kernel) you are using.
>> Ubuntu 22.04.3 LTS
>>
>> Linux  5.15.0-88-generic #98-Ubuntu SMP Mon Oct 2 15:18:56 UTC 2023
>> x86_64 x86_64 x86_64 GNU/Linux
>>
>> # cryptsetup 2.4.3 processing "cryptsetup luksOpen --key-file
>> /root/.luks/.p2pool.keyfile /dev/sda1 CryptP2Pool --debug"
>
> ...
>
> That log looks like a correct processing in open (with an incorrect 
> keyfile).
> (Or the convert process really corrupted something in keyslot...)
That key was used for years and I've checked several times in 
/etc/crypttab that this is the correct one.
>
> Could you please send luksDump (ans ideally also luksDump 
> --dump-json-metadata)
> output to check how it is exactly configured?
I'm attaching both.
>
> (You can send it in private mail if you do not want to share it in list.)
It's OK. I'll be retiring this disk even If I manage to salvage the 
data. It we find and actual problem it would be better to have the 
information publicly available .
>
> Thanks.
> Milan

Thank you again for all your time and effort.
Anton

--------------QcgC5iOQdHKCO2WWK3fZzLsI
Content-Type: application/json; name="sda1.luksDump.json"
Content-Disposition: attachment; filename="sda1.luksDump.json"
Content-Transfer-Encoding: base64

ewogICJrZXlzbG90cyI6ewogICAgIjAiOnsKICAgICAgInR5cGUiOiJsdWtzMiIsCiAgICAg
ICJrZXlfc2l6ZSI6MzIsCiAgICAgICJrZGYiOnsKICAgICAgICAidHlwZSI6InBia2RmMiIs
CiAgICAgICAgImhhc2giOiJzaGEyNTYiLAogICAgICAgICJpdGVyYXRpb25zIjozMTQ4ODc2
LAogICAgICAgICJzYWx0IjoiWklTbVRwSmxMQU1Db21XMnNpZDF6SWJLcjhSV3hLbWZmRUJm
dUZJdWlHOD0iCiAgICAgIH0sCiAgICAgICJhZiI6ewogICAgICAgICJ0eXBlIjoibHVrczEi
LAogICAgICAgICJoYXNoIjoic2hhMjU2IiwKICAgICAgICAic3RyaXBlcyI6NDAwMAogICAg
ICB9LAogICAgICAiYXJlYSI6ewogICAgICAgICJ0eXBlIjoicmF3IiwKICAgICAgICAiZW5j
cnlwdGlvbiI6ImFlcy14dHMtcGxhaW42NCIsCiAgICAgICAgImtleV9zaXplIjozMiwKICAg
ICAgICAib2Zmc2V0IjoiMzI3NjgiLAogICAgICAgICJzaXplIjoiMTMxMDcyIgogICAgICB9
CiAgICB9LAogICAgIjEiOnsKICAgICAgInR5cGUiOiJsdWtzMiIsCiAgICAgICJrZXlfc2l6
ZSI6MzIsCiAgICAgICJrZGYiOnsKICAgICAgICAidHlwZSI6InBia2RmMiIsCiAgICAgICAg
Imhhc2giOiJzaGEyNTYiLAogICAgICAgICJpdGVyYXRpb25zIjozMDg4NTg4LAogICAgICAg
ICJzYWx0IjoiQUt1QW8wcTlPZDlOLzZRN3BxemtDMzZYZ1NzcHhjTWxOVHBTSnVuZTZHMD0i
CiAgICAgIH0sCiAgICAgICJhZiI6ewogICAgICAgICJ0eXBlIjoibHVrczEiLAogICAgICAg
ICJoYXNoIjoic2hhMjU2IiwKICAgICAgICAic3RyaXBlcyI6NDAwMAogICAgICB9LAogICAg
ICAiYXJlYSI6ewogICAgICAgICJ0eXBlIjoicmF3IiwKICAgICAgICAiZW5jcnlwdGlvbiI6
ImFlcy14dHMtcGxhaW42NCIsCiAgICAgICAgImtleV9zaXplIjozMiwKICAgICAgICAib2Zm
c2V0IjoiMTYzODQwIiwKICAgICAgICAic2l6ZSI6IjEzMTA3MiIKICAgICAgfQogICAgfQog
IH0sCiAgInRva2VucyI6ewogIH0sCiAgInNlZ21lbnRzIjp7CiAgICAiMCI6ewogICAgICAi
dHlwZSI6ImNyeXB0IiwKICAgICAgIm9mZnNldCI6IjIwOTcxNTIiLAogICAgICAiaXZfdHdl
YWsiOiIwIiwKICAgICAgInNpemUiOiJkeW5hbWljIiwKICAgICAgImVuY3J5cHRpb24iOiJh
ZXMteHRzLXBsYWluNjQiLAogICAgICAic2VjdG9yX3NpemUiOjUxMgogICAgfQogIH0sCiAg
ImRpZ2VzdHMiOnsKICAgICIwIjp7CiAgICAgICJ0eXBlIjoicGJrZGYyIiwKICAgICAgImtl
eXNsb3RzIjpbCiAgICAgICAgIjAiLAogICAgICAgICIxIgogICAgICBdLAogICAgICAic2Vn
bWVudHMiOlsKICAgICAgICAiMCIKICAgICAgXSwKICAgICAgImhhc2giOiJzaGEyNTYiLAog
ICAgICAic2FsdCI6ImFmeUN4ajVsN1BiaXpxcUxkQU53QjlxNFhhT0ZicmhicjdNSTJTb3ho
c3M9IiwKICAgICAgImRpZ2VzdCI6IlpMOFBoeXJSMUU0Rk1rMW96eEEyc3FpeXNGdz0iLAog
ICAgICAiaXRlcmF0aW9ucyI6MTk2ODA0CiAgICB9CiAgfSwKICAiY29uZmlnIjp7CiAgICAi
anNvbl9zaXplIjoiMTIyODgiLAogICAgImtleXNsb3RzX3NpemUiOiIyMDY0Mzg0IgogIH0K
fQ==
--------------QcgC5iOQdHKCO2WWK3fZzLsI
Content-Type: text/plain; charset=UTF-8; name="sda1.luksDump.txt"
Content-Disposition: attachment; filename="sda1.luksDump.txt"
Content-Transfer-Encoding: base64

TFVLUyBoZWFkZXIgaW5mb3JtYXRpb24KVmVyc2lvbjogICAgICAgCTIKRXBvY2g6ICAgICAg
ICAgCTIKTWV0YWRhdGEgYXJlYTogCTE2Mzg0IFtieXRlc10KS2V5c2xvdHMgYXJlYTogCTIw
NjQzODQgW2J5dGVzXQpVVUlEOiAgICAgICAgICAJZTY5NTlkOGMtZjgwNi00MmQwLTkxOTUt
MmExMmNmZDY1NjgyCkxhYmVsOiAgICAgICAgIAkobm8gbGFiZWwpClN1YnN5c3RlbTogICAg
IAkobm8gc3Vic3lzdGVtKQpGbGFnczogICAgICAgCShubyBmbGFncykKCkRhdGEgc2VnbWVu
dHM6CiAgMDogY3J5cHQKCW9mZnNldDogMjA5NzE1MiBbYnl0ZXNdCglsZW5ndGg6ICh3aG9s
ZSBkZXZpY2UpCgljaXBoZXI6IGFlcy14dHMtcGxhaW42NAoJc2VjdG9yOiA1MTIgW2J5dGVz
XQoKS2V5c2xvdHM6CiAgMDogbHVrczIKCUtleTogICAgICAgIDI1NiBiaXRzCglQcmlvcml0
eTogICBub3JtYWwKCUNpcGhlcjogICAgIGFlcy14dHMtcGxhaW42NAoJQ2lwaGVyIGtleTog
MjU2IGJpdHMKCVBCS0RGOiAgICAgIHBia2RmMgoJSGFzaDogICAgICAgc2hhMjU2CglJdGVy
YXRpb25zOiAzMTQ4ODc2CglTYWx0OiAgICAgICA2NCA4NCBhNiA0ZSA5MiA2NSAyYyAwMyAw
MiBhMiA2NSBiNiBiMiAyNyA3NSBjYyAKCSAgICAgICAgICAgIDg2IGNhIGFmIGM0IDU2IGM0
IGE5IDlmIDdjIDQwIDVmIGI4IDUyIDJlIDg4IDZmIAoJQUYgc3RyaXBlczogNDAwMAoJQUYg
aGFzaDogICAgc2hhMjU2CglBcmVhIG9mZnNldDozMjc2OCBbYnl0ZXNdCglBcmVhIGxlbmd0
aDoxMzEwNzIgW2J5dGVzXQoJRGlnZXN0IElEOiAgMAogIDE6IGx1a3MyCglLZXk6ICAgICAg
ICAyNTYgYml0cwoJUHJpb3JpdHk6ICAgbm9ybWFsCglDaXBoZXI6ICAgICBhZXMteHRzLXBs
YWluNjQKCUNpcGhlciBrZXk6IDI1NiBiaXRzCglQQktERjogICAgICBwYmtkZjIKCUhhc2g6
ICAgICAgIHNoYTI1NgoJSXRlcmF0aW9uczogMzA4ODU4OAoJU2FsdDogICAgICAgMDAgYWIg
ODAgYTMgNGEgYmQgMzkgZGYgNGQgZmYgYTQgM2IgYTYgYWMgZTQgMGIgCgkgICAgICAgICAg
ICA3ZSA5NyA4MSAyYiAyOSBjNSBjMyAyNSAzNSAzYSA1MiAyNiBlOSBkZSBlOCA2ZCAKCUFG
IHN0cmlwZXM6IDQwMDAKCUFGIGhhc2g6ICAgIHNoYTI1NgoJQXJlYSBvZmZzZXQ6MTYzODQw
IFtieXRlc10KCUFyZWEgbGVuZ3RoOjEzMTA3MiBbYnl0ZXNdCglEaWdlc3QgSUQ6ICAwClRv
a2VuczoKRGlnZXN0czoKICAwOiBwYmtkZjIKCUhhc2g6ICAgICAgIHNoYTI1NgoJSXRlcmF0
aW9uczogMTk2ODA0CglTYWx0OiAgICAgICA2OSBmYyA4MiBjNiAzZSA2NSBlYyBmNiBlMiBj
ZSBhYSA4YiA3NCAwMyA3MCAwNyAKCSAgICAgICAgICAgIGRhIGI4IDVkIGEzIDg1IDZlIGI4
IDViIGFmIGIzIDA4IGQ5IDJhIDMxIDg2IGNiIAoJRGlnZXN0OiAgICAgNjQgYmYgMGYgODcg
MmEgZDEgZDQgNGUgMDUgMzIgNGQgNjggY2YgMTAgMzYgYjIgCgkgICAgICAgICAgICBhOCBi
MiBiMCA1YyAK

--------------QcgC5iOQdHKCO2WWK3fZzLsI--
