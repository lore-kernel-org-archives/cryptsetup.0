Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356439;
	b=g8N7MHfydENK9mKRB0yV3TaAdZGJXsfDiMDgKqxGdW/MPDNu3sXFIGxk+cuz4DccSn5C
	 LwEF3YaD60cQC42Iv48NULq4kFmfbjFKYXFwpmd2CVYgC9aazye60tISHD/nNX4KcRoaw
	 3cPnE3RPIP6PPAWiKJKdv3BSmyw1IRt6Wi0AYoy3t/i/0cIbEWgbMkBaYodPj0P6zt5jN
	 /JSUwtQbm+jT1LMw9wYquBgv0xWMMwOT6Gixg5CfO/Tir1Mj+nugzwu6zmuEbxyHQjmrq
	 bDQosthwRkBUvU6pD3lZ9zNGoC1Ntrpe72hy2PvUFy8Xpe9fwdpCRuao+fm+B+J0AAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TihCOGu5fHJZ3de4HwA1B+DwH+BsVPEyVe6F2vW/KRI=;
	b=p027J8m1pNshMogno/FbdLlvbT5u+2C4jrHAovkhZWA1JaSYbrYWvivay8m1jpS4bLV6
	 M8Yjo+wA28iIUaugLzm5JAhDODdUEsVpVpGBuHMLbGKsGEEC8D/j70hTh6FS9R+RmgyuH
	 XOkO6GDGPcsfPbapnu6Lshy/jMM4ZzCCRXwUr75lzUBqqBGHpQ3AONl1eKAHwHjqXksLd
	 JVWTad71YBnc/xM4W68lHGRJZTyGyxTGdj+rMK8JLvUoGrAtmAOlbJZRH+D9jA7UtodvY
	 nJCPmazp3ZlyE5HfJJI0vp1ZPzH9m2ULHi1PSpDdItw9zZweSMqGci+MN/N4FFRs2aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YkvJAxwa;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40470606A31F
	for <cryptsetup@lists.linux.dev>; Fri, 30 Oct 2026 10:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40470606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YkvJAxwa
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so4809535e9.3
        for <cryptsetup@lists.linux.dev>; Fri, 30 Oct 2026 03:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793356437; x=1793961237; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TihCOGu5fHJZ3de4HwA1B+DwH+BsVPEyVe6F2vW/KRI=;
        b=YkvJAxwamxFekm8Gq1wExoRvVIWtScAVIz5Mp2j8amBi9l9kf3zIPyg12GZQt87i7n
         AJHmzQBEOkt09EgtP16AaetxAp267X12YowNwEhWS9+LBFwxw74iMsrzu3kt76EasK6+
         Tt2kxq0aR0DkMA3zN5tTDnq+/2W+d7I9DKxf90nBTjq8VroPl2OdgqBzrGu8STkwYMgx
         nmfRczW1+yXe9IoYlUBCly3Xqab4TtMqQFdRMqaP4aK8Kf3bYfTHcW7PLlOfmRtPmE/f
         agH5fWXJjIuPfy1Bi68c8mlYqyNbsza4b3Q+S5XxFKVDp0yrk9el+ZfL/rjuCeNPw8Je
         Ipdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356437; x=1793961237;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TihCOGu5fHJZ3de4HwA1B+DwH+BsVPEyVe6F2vW/KRI=;
        b=CsGtNb9yA5mo3HmZz8bmG0eFrO0ZFXiCSyuRUlSwVgMAPHVeRMXQaiSAAvWDfHbKva
         JxMPmvchx9VMR9Nt9sGMuIiwRFnPTV6dSR0b4vFSmPfj/EJXgdUlnK39JCWfIKzMGxgB
         lxxENWToZrd7bC4sjXXx6TTBIzk+5ojsPHGEn3XiPl/FNUuzT6JziEZvNz1BV2Ex+aJ5
         O3G4Boy8DFMNKPPWffAnyJQ+bK0UTPM4lvhAdstYBqZQLQYHA9W2YP62XBkSJ3PJBnTR
         XoNN4CL3kMlFQKuqw6CpzLk1TpYT+Z6OqS3a7rTl0Oq7S3UO5kT2LdO+rbf4iu2J41qa
         hbXg==
X-Forwarded-Encrypted: i=1; AKwUvByYNRFuThqxHALMKEcRoTSjW/wP/hklEeOF9R+PXgTZPUAc0ERA3eYPw2Ob8ug1u5v79zieQECpwPn7@lists.linux.dev
X-Gm-Message-State: AFq9FYLe15bHpy1dXU39PEnFQd8EzkHKDh0RY/p1vDgyyqPFBdg3S4SP
	t2PIgBx5LOJtGaxiwAZpoF3KIKK5wvdo8j/A3Gs1M/drzXMINT/jSZGuY6wjLQ==
X-Gm-Gg: AYBFou0lVSC9sJqcqLDtIkaQmMJCo1dYuml8sui2eTui0G4oj6iGelYkUexH5Wr/0t+
	fUPyYQsYncS8tK4h0vXwTHy6NmtcayNQJoJ2qngOarzPv4fvH6czBwzZrbogi3Xt0yEh8H0le3O
	FQvRi/mtRSxjcDc4rwsyvetTV0CmxPG4QRIQjDOUX2UN17Gle/rfTk51FHRB0HQXqHpThr3Bxdq
	AfNab9mLE6uION9x1s/mB7MGzf0afP60fBVs1990QLwHnR/0tfunA9HckAt4UEtNZhVLml4ydvO
	RIUI1gNgEMN5f89eyszRehuvkL2iBhdnU3YeJ1IjDJnKjWbwExiWLpQVRp8dKvXYb4qN78X+Tu+
	aaiPSORmyA4k4PGMRPIjWH0WgQrHmln+hAHrr/4hNfOHEiHgtQs7qp77vr5r/JGfG7Hb4sNdjZ+
	3Fm7Ysx91efAJV9G279N9VeNzOs2KqLJw4Dafci0W8/YJdYsO3knaJcErW5t9XNFnlPELJKPrbS
	VVgl5ci1xWwukaE5FNocKFsR+3Xu09Y8QU7+OQX/DOR00TRCQUiGZcGxqv7C3R8awUc2Ck0tpFd
	PE9U0vjFiFPdMWOqr/9ieLSSgfi3/JxeQ51/qYPAnr13oStC5Jp8fA==
X-Received: by 2002:a05:600c:3b1a:b0:4a8:b8b4:6226 with SMTP id 5b1f17b1804b1-4ac18c73d17mr36065045e9.28.1793356437295;
        Fri, 30 Oct 2026 03:33:57 -0700 (PDT)
Received: from [192.168.2.14] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm2369076f8f.42.2026.10.30.03.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:33:56 -0700 (PDT)
Message-ID: <a19090a8-06f1-43c3-8d10-dd20e58230aa@gmail.com>
Date: Fri, 30 Oct 2026 11:33:56 +0100
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Post: <mailto:cryptsetup@lists.linux.dev>
List-Help: <mailto:cryptsetup+help@lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
List-Owner: <mailto:cryptsetup+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Allow encryption sector size up to 64 KiB for plain
 devices.
To: Itai Handler <itai.handler@gmail.com>, cryptsetup@lists.linux.dev
References: <20261029115338.3599814-1-itai.handler@gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <20261029115338.3599814-1-itai.handler@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Could you please submit this as merge request to project
   https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests

That way we get full CI run and can do review there.

If it is not possible, please let me know, I will create MR myself.

Thanks,
Milan


On 10/29/26 12:53 PM, Itai Handler wrote:
> Linux kernel commit 1acc65c30f85 ("dm-crypt: allow encryption sector
> size up to PAGE_SIZE") raises the encryption sector size limit of
> plain dm-crypt devices from 4096 bytes to the page size (dm-crypt
> target 1.30.0).
> 
> cryptsetup still caps the sector size at 4096 bytes, so it is not
> possible to set up a plain dm-crypt device with sectors larger than
> 4 KiB, even on systems configured with pages larger than 4 KiB.
> 
> For plain devices, raise the cap to 64 KiB, the largest page size that
> arm64 or ppc64 kernels can be configured with. LUKS stays at 4096
> bytes. The kernel still enforces its own limit; if it refuses to
> activate the device, report whether the sector size is larger than the
> page size or the dm-crypt target is older than 1.30.0.
> 
> Assisted-by: LLM
> ---
> This makes the dm-crypt change [1] usable for plain devices. LUKS stays
> at 4096 bytes. cryptsetup does not check the page size or the dm-crypt
> version before activation; the kernel decides, and cryptsetup only
> explains a refusal.
> 
> Torn sectors after a power failure came up in the review of the kernel
> patch. The existing note under --sector-size in cryptsetup-open(8)
> already warns about them, and the kernel documentation now describes
> what each cipher mode does with a torn sector.
> 
> [1] https://lore.kernel.org/dm-devel/20261004101622.2184287-1-itai.handler@gmail.com/
> 
> Testing, in QEMU on x86_64 with 4 KiB pages and on arm64 with 64 KiB
> pages:
>   - Linux 7.3 (dm-crypt 1.29.0) and a Linux 7.4 merge window kernel
>     (65ba8f34ec88, dm-crypt 1.30.0): compat-args-test, device-test and
>     api-test pass.
>   - Linux 7.3: plain devices with 8, 16, 32 and 64 KiB sectors are not
>     activated. The error says that the sector size is larger than 4096
>     bytes on arm64, and larger than the page size on x86_64.
>   - 7.4 merge window: on arm64, plain devices with 8, 16, 32 and 64 KiB
>     sectors activate with a matching logical block size, and data
>     survives reactivation. Mapping the same ciphertext with 4096-byte
>     sectors shows that the kernel encrypts 64 KiB units. On x86_64 the
>     same commands fail with the page size message.
> 
> When activation fails, for example with --sector-size 65536 on x86_64,
> the error is followed by "The device size is not multiple of the
> requested sector size." unless the device size is a multiple of 32 MiB.
> That line is wrong, but it does not come from this patch: after a failed
> activation, dm_create_device() compares the device size in 512-byte
> sectors with the sector size in bytes.
> 
> This patch was prepared with the help of an LLM, as the Assisted-by
> trailer says.
> 
>   lib/libcryptsetup_macros.h |  1 +
>   lib/libdevmapper.c         | 12 ++++++++++++
>   lib/setup.c                |  2 +-
>   lib/utils_dm.h             |  1 +
>   man/common_options.adoc    |  5 ++++-
>   src/cryptsetup.c           |  8 +++++++-
>   tests/api-test.c           | 12 ++++++++++++
>   tests/compat-args-test     |  5 +++++
>   tests/device-test          | 25 +++++++++++++++++++++++++
>   9 files changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/libcryptsetup_macros.h b/lib/libcryptsetup_macros.h
> index a2dfba3c..d1febcb5 100644
> --- a/lib/libcryptsetup_macros.h
> +++ b/lib/libcryptsetup_macros.h
> @@ -38,6 +38,7 @@
>   #define SECTOR_SHIFT       9
>   #define SECTOR_SIZE     (1 << SECTOR_SHIFT)
>   #define MAX_SECTOR_SIZE 4096 /* min page size among all platforms */
> +#define MAX_PLAIN_SECTOR_SIZE 65536 /* plain only, kernel requires page size >= sector size */
>   #define ROUND_SECTOR(x) (((x) + SECTOR_SIZE - 1) / SECTOR_SIZE)
>   
>   #define MISALIGNED(a, b)	((a) & ((b) - 1))
> diff --git a/lib/libdevmapper.c b/lib/libdevmapper.c
> index 9357967d..8b4e0e65 100644
> --- a/lib/libdevmapper.c
> +++ b/lib/libdevmapper.c
> @@ -164,6 +164,9 @@ static void _dm_set_crypt_compat(struct crypt_device *cd,
>   	if (_dm_satisfies_version(1, 28, 0, crypt_maj, crypt_min, crypt_patch))
>   		_dm_flags |= DM_CRYPT_INTEGRITY_KEY_SIZE_OPT_SUPPORTED;
>   
> +	if (_dm_satisfies_version(1, 30, 0, crypt_maj, crypt_min, crypt_patch))
> +		_dm_flags |= DM_CRYPT_PLAIN_SECTOR_SIZE_UP_TO_PAGE_SUPPORTED;
> +
>   	_dm_crypt_checked = true;
>   }
>   
> @@ -1822,6 +1825,15 @@ int dm_create_device(struct crypt_device *cd, const char *name,
>   		if (dmd->segment.u.crypt.sector_size != SECTOR_SIZE && !(dmt_flags & DM_SECTOR_SIZE_SUPPORTED)) {
>   			log_err(cd, _("Requested sector_size option is not supported."));
>   			r = -EINVAL;
> +		} else if (dmd->segment.u.crypt.sector_size > crypt_getpagesize()) {
> +			log_err(cd, _("Kernel does not support encryption sector size larger than page size (%zu bytes)."),
> +				crypt_getpagesize());
> +			r = -EINVAL;
> +		} else if (dmd->segment.u.crypt.sector_size > MAX_SECTOR_SIZE &&
> +			   !(dmt_flags & DM_CRYPT_PLAIN_SECTOR_SIZE_UP_TO_PAGE_SUPPORTED)) {
> +			log_err(cd, _("Kernel does not support encryption sector size larger than %u bytes."),
> +				MAX_SECTOR_SIZE);
> +			r = -EINVAL;
>   		}
>   		if (dmd->segment.u.crypt.sector_size > SECTOR_SIZE &&
>   		    dmd->size % dmd->segment.u.crypt.sector_size) {
> diff --git a/lib/setup.c b/lib/setup.c
> index 2374656c..672f91e3 100644
> --- a/lib/setup.c
> +++ b/lib/setup.c
> @@ -1670,7 +1670,7 @@ static int _crypt_format_plain(struct crypt_device *cd,
>   	if (!sector_size)
>   		sector_size = SECTOR_SIZE;
>   
> -	if (sector_size < SECTOR_SIZE || sector_size > MAX_SECTOR_SIZE ||
> +	if (sector_size < SECTOR_SIZE || sector_size > MAX_PLAIN_SECTOR_SIZE ||
>   	    NOTPOW2(sector_size)) {
>   		log_err(cd, _("Unsupported encryption sector size."));
>   		return -EINVAL;
> diff --git a/lib/utils_dm.h b/lib/utils_dm.h
> index eee31a78..64b51140 100644
> --- a/lib/utils_dm.h
> +++ b/lib/utils_dm.h
> @@ -68,6 +68,7 @@ static inline uint64_t act2dmflags(uint64_t act_flags)
>   #define DM_VERITY_ERROR_AS_CORRUPTION_SUPPORTED (UINT64_C(1) << 31) /* dm-verity restart/panic on corruption supported */
>   #define DM_INTEGRITY_INLINE_MODE_SUPPORTED (UINT64_C(1) << 32) /* dm-integrity inline mode supported */
>   #define DM_INTEGRITY_DISCARD_KEYED_SUPPORTED (UINT64_C(1) << 33) /* dm-integrity discard keyed supported */
> +#define DM_CRYPT_PLAIN_SECTOR_SIZE_UP_TO_PAGE_SUPPORTED (UINT64_C(1) << 34) /* dm-crypt sector size up to page size supported, used for plain devices only */
>   
>   typedef enum { DM_CRYPT = 0, DM_VERITY, DM_INTEGRITY, DM_LINEAR, DM_ERROR, DM_ZERO, DM_UNKNOWN } dm_target_type;
>   enum tdirection { TARGET_EMPTY = 0, TARGET_SET, TARGET_QUERY };
> diff --git a/man/common_options.adoc b/man/common_options.adoc
> index ecc72196..5abd6cde 100644
> --- a/man/common_options.adoc
> +++ b/man/common_options.adoc
> @@ -949,8 +949,11 @@ endif::[]
>   ifndef::ACTION_REENCRYPT[]
>   ifdef::ACTION_OPEN[]
>   Set encryption sector size for use with _plain_ device type.
> -It must be a power of two and in the 512 - 4096 bytes range.
> +It must be a power of two and in the 512 - 65536 bytes range.
>   The default encryption sector size is 512 bytes.
> ++
> +Encryption sector size larger than 4096 bytes needs kernel 7.4 or later (dm-crypt target version 1.30.0) and the system page size must be at least as large as the encryption sector size.
> +Such a device cannot be activated on systems with a smaller page size (for example, x86_64, or arm64 with a kernel configured for 4096-byte pages), so it is not portable between systems.
>   endif::[]
>   ifdef::ACTION_LUKSFORMAT[]
>   Set encryption sector size for use with _LUKS2_ device type.
> diff --git a/src/cryptsetup.c b/src/cryptsetup.c
> index 77e4e9a9..20e73521 100644
> --- a/src/cryptsetup.c
> +++ b/src/cryptsetup.c
> @@ -3679,6 +3679,9 @@ static const char *verify_reencrypt(void)
>   	if (ARG_SET(OPT_NEW_VOLUME_KEY_KEYRING_ID) && ARG_SET(OPT_KEEP_KEY_ID))
>   		return _("Options --new-volume-key-keyring and --keep-key cannot be combined.");
>   
> +	if (ARG_UINT32(OPT_SECTOR_SIZE_ID) > MAX_SECTOR_SIZE)
> +		return _("Unsupported encryption sector size.");
> +
>   	return NULL;
>   }
>   
> @@ -3704,6 +3707,9 @@ static const char *verify_format(void)
>   	if (ARG_SET(OPT_DISABLE_SUM_ID) && !ARG_SET(OPT_HW_OPAL_ID) && !ARG_SET(OPT_HW_OPAL_ONLY_ID))
>   		return  _("Option --disable-sum must be used with --hw-opal or --hw-opal-only");
>   
> +	if (ARG_UINT32(OPT_SECTOR_SIZE_ID) > MAX_SECTOR_SIZE)
> +		return _("Unsupported encryption sector size.");
> +
>   	return NULL;
>   }
>   
> @@ -4045,7 +4051,7 @@ static void basic_options_cb(poptContext popt_context,
>   		break;
>   	case OPT_SECTOR_SIZE_ID:
>   		if (ARG_UINT32(OPT_SECTOR_SIZE_ID) < SECTOR_SIZE ||
> -		    ARG_UINT32(OPT_SECTOR_SIZE_ID) > MAX_SECTOR_SIZE ||
> +		    ARG_UINT32(OPT_SECTOR_SIZE_ID) > MAX_PLAIN_SECTOR_SIZE ||
>   		    (ARG_UINT32(OPT_SECTOR_SIZE_ID) & (ARG_UINT32(OPT_SECTOR_SIZE_ID) - 1)))
>   			usage(popt_context, EXIT_FAILURE,
>   			      _("Unsupported encryption sector size."),
> diff --git a/tests/api-test.c b/tests/api-test.c
> index eece721b..63b56acc 100644
> --- a/tests/api-test.c
> +++ b/tests/api-test.c
> @@ -362,6 +362,18 @@ static void AddDevicePlain(void)
>   
>   	CRYPT_FREE(cd);
>   
> +	// encryption sector size, activation with more than 4096 bytes depends on kernel page size
> +	OK_(crypt_init(&cd, DEVICE_2));
> +	params.sector_size = 131072;
> +	FAIL_(crypt_format(cd, CRYPT_PLAIN, cipher, cipher_mode, NULL, NULL, key_size, &params), "sector size too large");
> +	params.sector_size = 12288;
> +	FAIL_(crypt_format(cd, CRYPT_PLAIN, cipher, cipher_mode, NULL, NULL, key_size, &params), "sector size not power of 2");
> +	params.sector_size = 65536;
> +	OK_(crypt_format(cd, CRYPT_PLAIN, cipher, cipher_mode, NULL, NULL, key_size, &params));
> +	EQ_(crypt_get_sector_size(cd), 65536);
> +	params.sector_size = 0;
> +	CRYPT_FREE(cd);
> +
>   	// default is "plain" hash - no password hash
>   	OK_(crypt_init(&cd, DEVICE_1));
>   	OK_(crypt_format(cd, CRYPT_PLAIN, cipher, cipher_mode, NULL, NULL, key_size, NULL));
> diff --git a/tests/compat-args-test b/tests/compat-args-test
> index 793ecf6d..237eb398 100755
> --- a/tests/compat-args-test
> +++ b/tests/compat-args-test
> @@ -251,10 +251,15 @@ exp_fail luksFormat DEV --type luks1 --pbkdf-force-iterations 1001 -i1
>   
>   exp_fail open DEV NAME --sector-size 1024
>   exp_pass open DEV NAME --type plain --sector-size 1024
> +exp_pass open DEV NAME --type plain --sector-size 65536
> +exp_fail open DEV NAME --type plain --sector-size 131072
> +exp_fail open DEV NAME --type plain --sector-size 12288
>   # bug
>   # exp_fail luksFormat DEV --sector-size 0
>   exp_fail luksFormat DEV --sector-size 511
>   exp_fail luksFormat DEV --sector-size 8192
> +exp_fail luksFormat DEV --sector-size 65536
> +exp_fail reencrypt DEV --sector-size 8192
>   exp_pass reencrypt DEV --sector-size 1024
>   exp_pass luksFormat DEV --sector-size 1024
>   
> diff --git a/tests/device-test b/tests/device-test
> index c6e745da..c296ecdc 100755
> --- a/tests/device-test
> +++ b/tests/device-test
> @@ -94,6 +94,7 @@ dm_crypt_features()
>   	[ $VER_MAJ -gt 1 ] && {
>   		DM_PERF_CPU=1
>   		DM_SECTOR_SIZE=1
> +		DM_PLAIN_SECTOR_SIZE_UP_TO_PAGE=1
>   		test -d /proc/sys/kernel/keys && DM_KEYRING=1
>   		return
>   	}
> @@ -112,6 +113,9 @@ dm_crypt_features()
>   
>   	[ $VER_MIN -lt 26 ] && return
>   	DM_PERF_HIGH_PRIORITY=1
> +
> +	[ $VER_MIN -lt 30 ] && return
> +	DM_PLAIN_SECTOR_SIZE_UP_TO_PAGE=1
>   }
>   
>   format() # format
> @@ -143,6 +147,7 @@ check_io()
>   	dd if=/dev/zero of=/dev/mapper/$DEV_NAME bs=1M count=32 oflag=direct 2>/dev/null || fail
>   }
>   
> +export LANG=C
>   [ ! -x "$CRYPTSETUP" ] && skip "Cannot find $CRYPTSETUP, test skipped."
>   [ -n "$VALG" ] && valgrind_setup && CRYPTSETUP=valgrind_run
>   if [ $(id -u) != 0 ]; then
> @@ -341,6 +346,26 @@ else
>   		$CRYPTSETUP close $DEV_NAME || fail
>   	done
>   
> +	# Plain device sector size larger than 4096 bytes needs dm-crypt 1.30 and page size >= sector size
> +	PAGE_SIZE=$(getconf PAGE_SIZE)
> +	for S in 8192 16384 32768 65536; do
> +		echo -n "[$S]"
> +		if [ -n "$DM_PLAIN_SECTOR_SIZE_UP_TO_PAGE" -a $S -le $PAGE_SIZE ]; then
> +			echo -e "$PWD1" | $CRYPTSETUP open -q $PLAIN_OPT $DEV $DEV_NAME --sector-size $S || fail
> +			check_sector_size $S
> +			check_io
> +			$CRYPTSETUP close $DEV_NAME || fail
> +			continue
> +		fi
> +		OUT=$(echo -e "$PWD1" | $CRYPTSETUP open -q $PLAIN_OPT $DEV $DEV_NAME --sector-size $S 2>&1) && fail
> +		if [ $S -gt $PAGE_SIZE ]; then
> +			echo "$OUT" | grep -q "larger than page size ($PAGE_SIZE bytes)" || fail
> +		else
> +			echo "$OUT" | grep -q "larger than 4096 bytes" || fail
> +		fi
> +	done
> +	echo -e "$PWD1" | $CRYPTSETUP open -q $PLAIN_OPT $DEV $DEV_NAME --sector-size 131072 >/dev/null 2>&1 && fail
> +
>   	echo -e "$PWD1" | $CRYPTSETUP open $PLAIN_OPT $DEV $DEV_NAME --iv-large-sectors >/dev/null 2>&1 && fail
>   	for S in 1024 2048 4096; do
>   		echo -n "[$S/IV]"
> 
> base-commit: bae21790d59897ac50e5471f953f76b3a58aeeb6

