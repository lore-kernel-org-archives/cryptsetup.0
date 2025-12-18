Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213A8257448
	for <cryptsetup@lists.linux.dev>; Thu, 18 Dec 2025 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766076748; cv=none; b=gnKTloJz+Rx0ug9Zt9F3qm3h3Uz7RM43N5clFWlV43ZhwO5XHJqFYklIf3k1xpooaoAYTJTb/RF5CGBw51VAN75bOHuhn7Tsm2XhBLZWTxi0vqlavz2M3eT3okjwVrMVswMabRQrGgcsWxj6v1Y6lL+of+HGdgCwKaEVath/WFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766076748; c=relaxed/simple;
	bh=8Ig0tmE0+/mL0P3j/CSTIleXx577PJe/MjQkn/jizLo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=ulzlKQymHloshaGxeidgoKgTUFxd/f8WR+92umIQQTtBW/8wle36M16UkqjzzJC9bKp4bLz0wCoRyE0Ox96r/a0Hk/yxqkcn01tzOpNUt6ljj8aKcagY1/auA9cy1I5dOYot0ZWb/5WIACVTQSgp75u1yWMXFATyy5t65f/DBNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeVSfa6e; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeVSfa6e"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso3847255e9.2
        for <cryptsetup@lists.linux.dev>; Thu, 18 Dec 2025 08:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766076742; x=1766681542; darn=lists.linux.dev;
        h=autocrypt:content-language:to:subject:from:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Ig0tmE0+/mL0P3j/CSTIleXx577PJe/MjQkn/jizLo=;
        b=eeVSfa6ef8eVGpjha69gP+YDYOO+d9Awa/RLgFtguGSCsUBor27Kdiy0XhFL23GSaw
         qISG93yCJlzXOw3jjEpFfvNS7cxiBs8AjunRYN1tzL+duU4jVFrvTJD2WEKQ3b9zcbho
         VABk0l0/k/yOE+djho7IGXsY2iANgivuRwtMssdnqDKhVo/F/jWK7su92+4IoKVavbju
         sNS4dq6ocDxI9XxWv1fW98b5XKxnYICiLVZgAw/tUaLQ7kNj4MBguRyX830TePrnQ0V7
         LJB+uS6OVFkQc2YAEFBKjSHyxJXNLc4vRPGqKmBnD7Iwqlzx5tNXe0BkTR+kRCy0iQJd
         2Gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766076742; x=1766681542;
        h=autocrypt:content-language:to:subject:from:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ig0tmE0+/mL0P3j/CSTIleXx577PJe/MjQkn/jizLo=;
        b=umyrZHQjek+BPRQbY333uOw9PcYH1Oze4mpFJlSuJsPplzdGsrmP72DQ136AuZhzRS
         5eV3lCjSf4mxTcwte1Q7109XMlsNwIJvvQBvBE48cmirqioD7NmKGw+FRn+GGE7iml6z
         dUZlU7LWBPJqsb2s2T2YeDWDgYaXlyOSjzyeiuuGjH3aeJIYCN4CHthDjM+M1nLVmE55
         9iNBnhwZovh0V6TkAikYcfCIamzqM6xB6ddyDu/iXY8Hq1V039c19cY2L2RPxkdTGtQ8
         MHY+csT866Zz1xTVf6xCr7JIiKICGI8p3ZK42s6ElrbOtXhDDheAkbNXz2Ra60B9jWBk
         6SYw==
X-Gm-Message-State: AOJu0YxHZnaTEPRyy4nUwWr7gFCuKYEVDDwZ7Gltyn4wjahZ3l4NbvNA
	UJ+dC3+DGo8wtD2kgV5xc0CNgOsqZ3krgeTKlMPniipou4OTaGcfqsBRGyNIcw==
X-Gm-Gg: AY/fxX6dd0IM+iMjcUZQS3lhVrB+wuFSjftSEn2nw2lhISw8mZs6F2W/bwKA5f6/nlu
	67HrzbZK2xjW08nGmOgXyfViI6Y5pDZZEybIhGvNYB4AMoG2ecNR177/uxq+yvbeLYAnUO0ADj5
	O59ExJT+dHxXuyqa02nXHSPVb1C8VQbfqmwnp2qoe58cVlepC8EOoxTGKMcQbMoBpPil32WAZgC
	mGl/a9qoNmGiIRFcFe6YXl4sImcaWUKrCduc1ooU2uplU4oLFNEeFtvcsajcDku8BP+M0DzkN/1
	R1xhGHnzRq8nGTQHzaZH9szdDKUEhD0XFRQ4JnAPnlVAwDS+ZCo+6eqMGzaNT3JtoLOI5lyVwj6
	Nrjq8FGCHuT0JeHKNyvKpSipzKFZ8F4X45ycdj1Egghknu3DGlQwEbx/v1GFlHcH22z+ccLKcVi
	ETrsQVtUUAFt+riDhSy0YtYrXvWlnQD98ObUjg
X-Google-Smtp-Source: AGHT+IHjgjY1kjaYR2HjipJq49bo7vynZzODhapQR2Zb0iylUvtv4Z09X7LbHGPZQ4A3beLTu5HdMg==
X-Received: by 2002:a05:600c:45ca:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-47a8f8a80bemr219327025e9.1.1766076741775;
        Thu, 18 Dec 2025 08:52:21 -0800 (PST)
Received: from [192.168.2.23] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a3ec73sm16580155e9.5.2025.12.18.08.52.21
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 08:52:21 -0800 (PST)
Message-ID: <7fe4047c-55fc-4594-bd0e-2a017ab60be6@gmail.com>
Date: Thu, 18 Dec 2025 17:52:20 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Milan Broz <gmazyland@gmail.com>
Subject: [ANNOUNCE] cryptsetup 2.8.2
To: cryptsetup development <cryptsetup@lists.linux.dev>
Content-Language: en-US
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------H8MYCRVTrx0wA9xsKQ0X1Bo3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------H8MYCRVTrx0wA9xsKQ0X1Bo3
Content-Type: multipart/mixed; boundary="------------fyXw0We7HnGHe0nekKQHvodB";
 protected-headers="v1"
From: Milan Broz <gmazyland@gmail.com>
To: cryptsetup development <cryptsetup@lists.linux.dev>
Message-ID: <7fe4047c-55fc-4594-bd0e-2a017ab60be6@gmail.com>
Subject: [ANNOUNCE] cryptsetup 2.8.2

--------------fyXw0We7HnGHe0nekKQHvodB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhlIGNyeXB0c2V0dXAgMi44LjIgc3RhYmxlIHJlbGVhc2UgaXMgYXZhaWxhYmxlIGF0DQoN
CiAgICAgaHR0cHM6Ly9naXRsYWIuY29tL2NyeXB0c2V0dXAvY3J5cHRzZXR1cA0KDQpQbGVh
c2Ugbm90ZSB0aGF0IHJlbGVhc2UgcGFja2FnZXMgYXJlIGxvY2F0ZWQgb24ga2VybmVsLm9y
Zw0KDQogICAgIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L3V0aWxzL2NyeXB0
c2V0dXAvdjIuOC8NCg0KRmVlZGJhY2sgYW5kIGJ1ZyByZXBvcnRzIGFyZSB3ZWxjb21lZCAo
cGxlYXNlIHVzIHByb2plY3QgcGFnZSBpc3N1ZSB0cmFja2VyKS4NCg0KQ3J5cHRzZXR1cCAy
LjguMiBSZWxlYXNlIE5vdGVzDQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NClN0
YWJsZSBidWctZml4IHJlbGVhc2Ugd2l0aCBtaW5vciBleHRlbnNpb25zLg0KDQpBbGwgdXNl
cnMgb2YgY3J5cHRzZXR1cCAyLjgueCBtdXN0IHVwZ3JhZGUgdG8gdGhpcyB2ZXJzaW9uLg0K
DQpDaGFuZ2VzIHNpbmNlIHZlcnNpb24gMi44LjENCn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fg0KDQoqIEZpeCBjcnlwdHNldHVwIExVS1MyIHN0YXR1cyBmb3IgSFcgaW5saW5lIGlu
dGVncml0eSBkZXZpY2UuDQogICAgQ3J5cHRzZXR1cCBzdGF0dXMgZGlkIG5vdCBwcmludCB0
aGUgaW5saW5lIGZsYWcgaWYgdGhlIHVuZGVybHlpbmcgZGV2aWNlIHdpdGgNCiAgICBIVyBp
bnRlZ3JpdHkgdGFncyB3YXMgdXNlZC4NCg0KKiBGaXggTFVLUzIgZm9ybWF0IHdpdGggZGV0
YWNoZWQgaGVhZGVyIGFuZCBkYXRhIGRldmljZSB3aXRoIEhXIGludGVncml0eSB0YWdzLg0K
DQoqIEZpeCBQQktERiBzZXJpYWxpemF0aW9uIGZsYWcgZHVyaW5nIGRldmljZSBhY3RpdmF0
aW9uLg0KICAgIFRoZSAtLXNlcmlhbGl6ZS1tZW1vcnktaGFyZC1wYmtkZiBhbmQgQ1JZUFRf
QUNUSVZBVEVfU0VSSUFMSVpFX01FTU9SWV9IQVJEX1BCS0RGIEFQSSBmbGFnDQogICAgaXMg
bm93IHByb3Blcmx5IHN1cHBvcnRlZCBhZ2Fpbi4gVGhpcyBvcHRpb24gaXMgYW4gb3B0aW9u
YWwgd29ya2Fyb3VuZCBmb3Igc2l0dWF0aW9ucyB3aGVyZQ0KICAgIG11bHRpcGxlIGRldmlj
ZXMgYXJlIGFjdGl2YXRlZCBpbiBwYXJhbGxlbCAoZS5nLiwgc3lzdGVtZCBjcnlwdHRhYiBh
Y3RpdmF0aW9uKS4NCg0KKiBCSVRMSzogQWRkIHN1cHBvcnQgZm9yIG9wZW5pbmcgZGV2aWNl
cyB3aXRoIENsZWFyIEtleSBpbiBCaXRMb2NrZXIgY29tcGF0aWJsZSBtb2RlLg0KICAgIEJp
dExvY2tlciBkZXZpY2VzIHRoYXQgYXJlIG5vdCB5ZXQgZW5jcnlwdGVkIGNhbiBjb250YWlu
IGEgQ2xlYXIgS2V5IHRoYXQgaXMgbm90IHByb3RlY3RlZA0KICAgIGJ5IGEgcGFzc3dvcmQu
IENyeXB0c2V0dXAgY2FuIG5vdyBtYXAgc3VjaCBkZXZpY2VzIGFuZCBhbGxvdyB0aGUgdXNl
ciB0byBhY2Nlc3MgZGF0YSBvbiB0aGVtLg0KICAgIE5vdGUgdGhhdCB3aGlsZSBzdWNoIGEg
ZGV2aWNlIGlzIGRldGVjdGVkIGFzIEJpdExvY2tlciwgaXQgbXVzdCBiZSB0cmVhdGVkIGFz
IGFuIHVuZW5jcnlwdGVkDQogICAgZGV2aWNlLiBDcnlwdHNldHVwIHN0aWxsIGRvZXMgbm90
IGFsbG93IG1hcHBpbmcgb2YgcGFydGlhbGx5IGVuY3J5cHRlZCBCaXRMb2NrZXIgZGV2aWNl
cw0KICAgICh0aG9zZSBpbiB0aGUgbWlkZGxlIG9mIHRoZSBlbmNyeXB0aW9uIHByb2Nlc3Mp
Lg0KDQoqIEJJVExLOiBIYXJkZW4gbWV0YWRhdGEgY2hlY2sgYnkgcHJvcGVybHkgdmFsaWRh
dGluZyBCaXRMb2NrZXIgbWV0YWRhdGEuDQogICAgQml0TG9ja2VyIG1ldGFkYXRhIHN0b3Jl
IGNoZWNrc3VtcyBhbmQgYXV0aGVudGljYXRpb24gdGFncyB0byBkZXRlY3QgcmFuZG9tIG9y
IG1hbGljaW91cw0KICAgIG1hbmlwdWxhdGlvbi4gQklUTEsgY29kZSBub3cgcHJvcGVybHkg
dmFsaWRhdGVzIHRoZXNlIGFuZCB1c2VzIGEgYmFja3VwIG1ldGFkYXRhIGJsb2NrDQogICAg
aWYgdmFsaWRhdGlvbiBmYWlscy4gUHJldmlvdXNseSwgb25seSB0aGUgZmlyc3QgbWV0YWRh
dGEgYmxvY2sgd2FzIHVzZWQuDQoNCiogRml4IGRvY3VtZW50YXRpb24gdG8gZXhwbGljaXRs
eSBtZW50aW9uIHVuaXRzIGZvciB2YXJpb3VzIEFQSSBmdW5jdGlvbnMgYW5kIGluIGhlbHAg
bWVzc2FnZXMuDQogICAgTm90ZSB0aGF0IGR1ZSB0byBjb21wYXRpYmlsaXR5IHJlYXNvbnMs
IGNyeXB0c2V0dXAgYXJndW1lbnRzIHVzZSBrZXkgc2l6ZXMgaW4gYml0cyB3aGlsZQ0KICAg
IGludGVncml0eXNldHVwIHVzZXMgYnl0ZXMuDQoNCiogRml4IGhhbmRsaW5nIG9mIHRvby1s
b25nIGxhYmVscyBhbmQgc3Vic3lzdGVtIGZpZWxkcy4NCiAgICBMVUtTMiBsYWJlbHMgYXJl
IHN0b3JlZCBpbiB0aGUgYmluYXJ5IGhlYWRlciBhcmVhLCB3aGljaCBoYXMgYSBsaW1pdGVk
IHNpemUuDQogICAgQ3J5cHRzZXR1cCBubyBsb25nZXIgc2lsZW50bHkgdHJ1bmNhdGVzIHRv
by1sb25nIGxhYmVsczsgaXQgcHJpbnRzIGFuIGVycm9yIGluc3RlYWQuDQoNCiogT3B0aW1p
emUgcmVlbmNyeXB0aW9uIHRvIG5vdCByZXBlYXRlZGx5IHRlc3QgYWNjZXNzIHRvIHRoZSBk
ZXZpY2UuDQoNCiogQWxsb3cgdG8gdXNlIFBITUFDIChwcm90ZWN0ZWQgSE1BQykgd2l0aCBp
bnRlZ3JpdHlzZXR1cCBhbmQgY3J5cHRzZXR1cC4NCiAgICBQSE1BQyBpcyB1c2VkIGJ5IFMz
OTAgbWFpbmZyYW1lcy4gU3VwcG9ydCB3YXMgYWRkZWQgaW4gTGludXgga2VybmVsIDYuMTcu
IENvbmZpZ3VyYXRpb24gcmVxdWlyZXMNCiAgICBzdGVwcyB1c2luZyBzMzkwLXRvb2xzOyBv
bmNlIHRoYXQncyBkb25lLCBpdCBjYW4gYmUgaGFuZGxlZCBhcyBhIGNvbW1vbiBMVUtTMiBv
ciBpbnRlZ3JpdHkgZGV2aWNlLg0KDQoqIE9wYWwyIFNFRDogRml4IG1pc2xlYWRpbmcgZXJy
b3IgbWVzc2FnZXMgZHVyaW5nIHRoZSBzZWxmLWVuY3J5cHRpbmcgZHJpdmVzIGZvcm1hdC4N
CiAgICBDcnlwdHNldHVwIG1pc2ludGVycHJldGVkIHNvbWUgZXJyb3IgY29kZXMgd2hlbiB0
aGUga2VybmVsIGludGVyZmFjZSB3YXMgbm90IGF2YWlsYWJsZQ0KICAgIG9yIHRoZSBzeXN0
ZW0gY2FsbCBmYWlsZWQuDQoNCiogT3BhbDIgU0VEOiBFbnN1cmUgdGhlIHN5c3RlbSB0cmll
cyB0byByZXNjYW4gdGhlIGRldmljZSBhZnRlciB0aGUgUFNJRCByZXNldC4NCiAgICBVZGV2
IHNob3VsZCBub3cgcmVjZWl2ZSBjaGFuZ2UgZXZlbnRzLCBhbGxvd2luZyByZXNjYW4gb2Yg
cGFydGl0aW9uIHRhYmxlIGFmdGVyIFBTSUQgcmVzZXQuDQoNCiogRml4IHR5cG9zIGluIHZv
bHVtZS1rZXktZmlsZSBoZWxwIGFuZCBpbnRlZ3JpdHlzZXR1cCBtYW4gcGFnZS4NCg0KKiBG
aXggZGV0ZWN0aW9uIG9mIHN1cHBvcnRlZCBjb21waWxlciBhdHRyaWJ1dGVzIG9uIFBQQzY0
IGFyY2hpdGVjdHVyZS4NCg0KKiBGaXggY29uc3QgY29tcGlsYXRpb24gd2FybmluZ3Mgd2l0
aCBuZXcgZ2NjIGFuZCBnbGliYyBoZWFkZXJzLg0K

--------------fyXw0We7HnGHe0nekKQHvodB--

--------------H8MYCRVTrx0wA9xsKQ0X1Bo3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEKikYJD/eRmSNBob52bBXe9k+mPwFAmlEMUQACgkQ2bBXe9k+
mPzSPQ/+JEi51cqTMpCG8T3MhlaG5JBrTV6dIi0DtodO2IpFtJdGbRBpAw79PWr2
coed5jFEQBZiEaIKii1p9+QpcYoKJQLPEmjauu3WxTGtihTdDQZdFtosFJ/soQhB
/D8uwqd1bEjSG9saZew6xuRHD2SnWx2wza4yLW/C/yesMf3nqxbMYboQSZDLgfvY
fOoXdeJdA3q6oB1A3HjhZUhFPLM8M2gOkZ/m31vgFnGlcYK7harfcqQpVBxN/GgO
Xh+jHdyM1BN5xXzvILnc7LitHIjat06rO+U8f78YUYHlHqdwMWMp6pAL/s69CZpN
USk9NaEUZmpyM2U2XRZ4aEm2gg8/z1PpvT+2bqjlDLYir2Y+jRYV1OB9knuxHOU1
f8I8in5cSAx71+ddoRtbYsxpAErU/qzwrF4QJA6G4FhjbyqWLNMBrKu/lSbNS91V
D1PXetvgYCwdEoboMxPfAsRpJkoCWk4Z28oOnONHmTmT7bIW/w0EQtOtgcTd4V6P
qWHzJIn8qE2hNFgAMr85CvaD16q436fPyBfxUYFBNDBnHpcydgpqQCgKdS8dJP/0
5evXZfpEWb4QWhpuGt6ynho4tNYugMO4ZksMV3njW7xefCgXvRS2XNHRgXRMTSdw
9qQAHgrB0FX5j5kfI0TqW7JM7POMOEXZCBTRGTl3VwHoefMDcq8=
=4rnP
-----END PGP SIGNATURE-----

--------------H8MYCRVTrx0wA9xsKQ0X1Bo3--
