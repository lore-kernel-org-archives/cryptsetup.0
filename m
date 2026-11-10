Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287353;
	b=K7z3dH5d/l5i/ez3WGE4gcHaxLWGKgHeoAQAAx4VnyONqCflrI+OvqIi60cqLfxQDGZN
	 YjeIT7fnolaZoMD+zWRUGo0deu4eUOziStAbaL3XwSFk3v0hvtKiKuIndZn9ryQSn0x0o
	 hKzoR53WVeR6tUflDF/+Q48qAEtptcl+5lm2bGhVsJAGRTs1eI/awnoGJMT5IlZ2aSKmU
	 N1DvwtX4ReRlknsIz1dsVbRepXMOhMOE81jWgDE27shGkWU5s1oqoUlRO4Fbde0h/Wr+2
	 wZWt1w8H7pdZrnc333sq1Qzo5PSNK6R6SUpxK8Fp+bV9PXTmiz+AXpFVgEysWwAzE5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
	 MIME-Version:From:To:Date:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=fNhlSxM/S0RlUexinQBeTEwfNRrR2oNaaSd5BPADc4k=;
	b=xsiS5O8zJN4ef/RZ5e6L8o6NRh3NTmdxG6M3HrE6YK9kCgq0XYP5vgYMo6uLRs9vBz/T
	 XnugMUVkEz7vI1NCypEWoZbT9c1Nh4M98EUjgq6Ek1ve/mkm5362w9PPKEgfllgd97D1e
	 v6hevNr+YsgDRMqiEgRTgV5xY4MvmYPwEBthGkGWG9eW0Hv/cLaSsmJ6iYzYzAwuTakrN
	 QMMHrQLSNx2LzHWo27MWgOXsb8muiFhf6MuS9yr7gG+ch0QMG47ys6MEBx1xwtUb5QYJq
	 9OjgY2eN3ynZUOxsbC1pmKWT5gdzTSppZrjBR75iClmUoPksZvbtmFYe+dWb9HmeJYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rokUMd+f;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D4606A31C
	for <cryptsetup@lists.linux.dev>; Tue, 10 Nov 2026 05:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rokUMd+f
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1344202f8f.1
        for <cryptsetup@lists.linux.dev>; Mon, 09 Nov 2026 21:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794287351; x=1794892151; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:subject:date:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNhlSxM/S0RlUexinQBeTEwfNRrR2oNaaSd5BPADc4k=;
        b=rokUMd+f/5wfAiyCQ16Vv1kPypMDy2GlgAhyyHm61xF6J8kc1lypMRtzGbysMMMigf
         sXCgMCjDdXgP34W8uHgBNcdf8baRHiM8HeM3OdUM2LkWDEWyElsPS7FFs2wknSXNkqvV
         GPTcEl7jfF3flaKUZ/vzDZrsKsXWjuJUH13RfzOkwHHUUHqzvmZd2V3f2PfLhtvWP4C6
         +UWfRJqYXtJzCRwGpKfY/f4DSvZvbunir7r6rAm4UjIkRdlit2xm5sNmSxLCsvDsx2AW
         krB29/mxoUcNUdbXT1YZpV0pHJVCz2jkWR61zpZnuJS3C3dY9K1u2vE8R38a6PodNhY6
         3fZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287351; x=1794892151;
        h=content-transfer-encoding:content-type:subject:date:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fNhlSxM/S0RlUexinQBeTEwfNRrR2oNaaSd5BPADc4k=;
        b=T2S3+MzY3ezhstumlZZn1RiMWayyop6DZGk1GRFXzkXAMfTRxNsImGT3m8nc8AfZvF
         Jsm0VsjfXXbnTsNaYkYtx8rYC3zvFTrCDXpuQ4UUZdgwudulxyu0NQNTgbJA9/ngXbVb
         5hxLT7IwVTv6UrTwC5huhFonEnE0baZ56YEdruoYpaVHp+iSRsgORvcc7/xc6zeF2qGR
         YFCXEJuz5Hw2JgiI0Q3IhCE0ShFwabSyn6Nte9X8zhyk1HPEUA72n8DDK5LZ25F3s8xi
         c2+0p+CZ5HWYKloM8a/OR5lhpEpoTvzwVTE1tBq6HZERrXQkKRIyC5+SXeUYCV2lCjNC
         EFQQ==
X-Gm-Message-State: APuU4Z9eRc5Esg6nCqoig4s7+v5Pe0+VpfwkZVwfS22AyQGJSMlUmQmn
	87JknOu4T4bohMqZrPQKOMAhu3JKjbYfri5YNJhLN65p6vxTr/7jDrTP3LeFjSqantg=
X-Gm-Gg: AYBFou0sYCrnbKSXT6AKd+p/QyWEXlNZR7F2Ki45npOPo6NtX0YluIbAF+mSkUl37NF
	x87NrDlMQB/k0xavI8kkeH/rrcvM06bIx5QCVr946ZEmdz54BNTUXeKzu1PxzZdpy8bwVvBbNJL
	o3hX6vxCxBwTMdxg3ZLMi/jYtw22JiVHh3qbKg4ge8OkU1PHLkuGnBghqSAgRJmi22VXk6yE9wx
	toXdzQ+oZm6klFbXnc+QwQ04UndfD6/aPz0hp7TP/3wqrKdb1PW4M806mFKj2iPLL/YtfoU+8cv
	P8nnMftZKzWkbibg8+C82C3o3Ubti2ZrkBtx164IRb42BVpCCtBW1/OfOeVoGoFOXP363oxvI0f
	fE2uXOHK1jSP0wQ+E+WJMJNeBLxFrH7SZkslQ7Sg9n22TyNYMCo2cMPcjg6w2CuAqBoZRMfC684
	Tya+XyBt81EatZh8NicDO0qCAa/BI52m8dSQcrYLWDBx+MAYS7BuTjD3MC6wEqAwykhqSs8vu+a
	lfh2SYleysM0rVfnfvnZMB+v56iT2hvSZrZKtIxww0Ij6rBfCEBU1SpVuIsdIkys+cxaIjY/7/T
	010kzr1YBYOWRYvWJt/yZGXVjahPGm1U/1rZW7vBXIL9B3JNuEBbUA==
X-Received: by 2002:a05:6000:402b:b0:48e:e98:8b6a with SMTP id ffacd0b85a97d-4982b848ec1mr2822370f8f.4.1794287351570;
        Mon, 09 Nov 2026 21:09:11 -0800 (PST)
Received: from DESKTOP-52F5LT2 ([105.112.179.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc8fsm2639543f8f.30.2026.11.09.21.09.10
        for <cryptsetup@lists.linux.dev>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 09 Nov 2026 21:09:11 -0800 (PST)
Message-ID: <6af2a6f7.b659fc54.892c0.fe7e@mx.google.com>
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Post: <mailto:cryptsetup@lists.linux.dev>
List-Help: <mailto:cryptsetup+help@lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
List-Owner: <mailto:cryptsetup+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: bapcoenergies989@gmail.com
To: cryptsetup@lists.linux.dev
Date: 9 Nov 2026 21:09:11 -0800
Subject: =?utf-8?B?VmVuZG9yIEV4cHJlc3Npb24gb2YgSW50ZXJlc3QgSW52aXRh?=
 =?utf-8?B?dGlvbiBCYXBjbyBFbmVyZ2llcyDigJMgMjAyNi8yMDI3?=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

RGVhciBTdXBwbGllciwNCg0KR3JlZXRpbmdzLg0KDQpXZSBhcmUgcGxlYXNlZCB0byBp
bnZpdGUgeW91ciBlc3RlZW1lZCBvcmdhbml6YXRpb24gdG8gcGFydGljaXBhdGUgaW4g
dGhlIFZlbmRvciBFeHByZXNzaW9uIG9mIEludGVyZXN0IChFT0kpIGZvciBCYXBjbyBF
bmVyZ2llc+KAmSB1cGNvbWluZyBwcm9qZWN0cyBwbGFubmVkIGZvciB0aGUgMjAyNuKA
kzIwMjcgcGVyaW9kLg0KDQpUaGlzIG9wcG9ydHVuaXR5IGlzIG9wZW4gdG8gcXVhbGlm
aWVkIGNvbXBhbmllcyB3b3JsZHdpZGUuIE9yZ2FuaXphdGlvbnMgaW50ZXJlc3RlZCBp
biBjb2xsYWJvcmF0aW5nIHdpdGggQmFwY28gRW5lcmdpZXMgYXJlIGtpbmRseSByZXF1
ZXN0ZWQgdG8gZXhwcmVzcyB0aGVpciBpbnRlcmVzdCBieSByZXF1ZXN0aW5nIHRoZSBW
ZW5kb3IgUXVlc3Rpb25uYWlyZSBhbmQgRU9JIGRvY3VtZW50YXRpb24uDQoNClNob3Vs
ZCB5b3UgcmVxdWlyZSBhbnkgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiBvciBjbGFyaWZp
Y2F0aW9uLCBwbGVhc2UgZmVlbCBmcmVlIHRvIGNvbnRhY3QgdXMuIFdlIHZhbHVlIHlv
dXIgaW50ZXJlc3QgYW5kIGxvb2sgZm9yd2FyZCB0byB0aGUgcG9zc2liaWxpdHkgb2Yg
YSBzdWNjZXNzZnVsIGNvbGxhYm9yYXRpb24uIFlvdSBjYW4gYXMgd2VsbCBzZW5kIG1l
IHlvdXIgZW1haWwgSUQgc28gaSB3aWxsIHdyaXRlIHlvdS4NCg0KV2UgbG9vayBmb3J3
YXJkIHRvIHlvdXIgZmF2b3JhYmxlIHJlc3BvbnNlLg0KDQpSZXNwZWN0ZnVsbHksDQoN
Ck1yLkZpcmRhdXMgUGFudGhha2kNClByb2N1cmVtZW50L1N1cHBseSBDaGllZiBQcm9j
dXJlbWVudCBPZmZpY2VyDQpCYXBjbyBFbmVyZ3kuDQpFbWFpbDogdGVuZGVyQGJhcGNv
Z3JvdXBiaC5jb20NCkFkZDogUC5PLiBCb3ggMjU1NTUgQXdhbGkgLUtpbmdkb20gb2Yg
QmFocmFpbg0KV2Vic2l0ZTog8J+MkCB3d3cuYmFwY29lbmVyZ2llcy5jb20=

