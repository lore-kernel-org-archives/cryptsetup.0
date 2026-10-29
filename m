Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274854;
	b=gq+G3LkZ0PnSWtprnw6rGAdcHW5AiZlQLB6TGO02UXnc/CSVgRHI228SlrY7SORaZvOX
	 h4Ji8xJg25HQTqUiDTx5Zsr5C/Zy+E4c23YW8vhFIujS7nObiIinZf4tpT+lB5hCRlUc8
	 g/otAhO1xswKLYK0+hHpbQxIx8goyJA9inXAnatjO3WVhdWfQC4lqBRip3N7/VTDFmGxK
	 IcK9d6JtM5Tiy9EOifRyymdhRJwlIZLttyXqdDBsEYEWIr4ZILNyrQAMx+Pt6kOMR4RcF
	 Xj5An5JVt9TLmW6SGZhKT3gwGrFZ6BxYmojVOgY8uEIlG3L0qkRMA5BCsou/QAOwszw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UldoOLys9YxzGS3kJGzpu7bjhC8R3kgViB5yPQoLF/s=;
	b=coFUuC3S37roztwo8lj6CvbHX1AQUFPUH8GLu50F9MK6vW9I1SuJfDuJukmabx/dPTM9
	 d+vpvW4y4nkE+C1crTbDAUs5cHcfs6UxAFbArqPN72WBaE06E7gaBHgPPq2RuYvUyxn+n
	 QDB38JDIYXb6pVtVxUeLdQGwVPvSouYFoQh5BPmN7Ewb9X06M1/m5UxJjk9BHbQ49v4pZ
	 a3PVl8a8vf641IryxxtLL1wBhX+hksy49Hcd49nXbrlq2/rchfpawxY/3h13YCXuqgg2U
	 cqFo/rtuhSD5O3XUbAm3LC5euWCwAqZccCE8sgxjepu/D88Nm/C93jDl/Cfziy/zkIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdkjzshS;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98477606A31E
	for <cryptsetup@lists.linux.dev>; Thu, 29 Oct 2026 11:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98477606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdkjzshS
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a610c7e61cso1323115e9.3
        for <cryptsetup@lists.linux.dev>; Thu, 29 Oct 2026 04:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793274852; x=1793879652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UldoOLys9YxzGS3kJGzpu7bjhC8R3kgViB5yPQoLF/s=;
        b=XdkjzshS0FdTTp9LEN7j7chgtrJHcwLtL7D/K7Nm8yJyep6mjPBNx2COpfKG73D8Ap
         tDek2GwBRUw8WXn3jyQ6tJ3UZGA0GKYgDAqNW886gQXtufCFlrQVFwCJWO/kWMRKKjWl
         ma5duxXWH+hXoRjPLV80A0d43Ki+xJ4DEtCuYBkqnEdfF7RtWr8Xflxr0w+uzeOTP6Vv
         8LlqtAWqV7dhMn16GEykjcmOXbB/QVVFNWkKdYt5ATR8x6D84Kwp5mWX0BerviV0CccL
         y/irVe/+X/L/kJsH+dZ+xkPV2kd8/45hucrN/JJ9820qH+TPrI9oDRJo+bJH4nVRix4m
         97Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274852; x=1793879652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UldoOLys9YxzGS3kJGzpu7bjhC8R3kgViB5yPQoLF/s=;
        b=D5vomMzM08GnChyXRjt/OTaR2xd82wQWkMZU8kT9ZNW3vyi2ol+cjcTm7pBmvFd7ZF
         w/QKQnZkr7/83S40Psq7AkEpUqGX5maZsiwyC+Bf5P0P7TXaeM2tgyVQ9CR+usv8dVy5
         LBENlXMtuGkVat8uXITBS6oUIiMnXm1pffmBVYiTQS2RA0OMTvDPebcQRrWKn6tF2fyG
         ojFuOtOYcmBfOffYfbVhv/ZM79ZcZuSQkLuBGXtUAjxvV/yVsBS5miedwgfiess6+228
         TovjMr92x0Z7aeU7qFJiwWKCLWvfaeZE59RdF1kA/yrXoNBZ/ceGCibwoImTLbKDKXHA
         ILuA==
X-Gm-Message-State: AFq9FYKWx1uLC6gBlWp+UK4jtgLMmscbaaCZ09BrQPUdnz7KDkcsb/eA
	PswmxtF6H/aDXbF9PYSlCbMYtZMyeM6Bh+jdZ/0KAHPIOXYOrw+AudiL+m+gNQ==
X-Gm-Gg: AYBFou0bXXERelOCDnqh5uUBYqn42EsfdNJKWo38syJy2LpgoZK7NByLcfo1cpHEHts
	hOsU/quYnjLLKp44oSiERYr+zs211kDUdEjXtVZ6JYCkFejt9qnVYR3LnAJpwIe0KC9HEgWPK53
	7jU53nyOuhLgmanrCGhzDhC8YnZqHZz2ppxMOKKnIkCb3DvM4uJVeKxHbQ/eI+EROHyxButKOdE
	f9K6dm3s3yKVluvQUdHUPrSkODPT85+XjLVq3H2xFqrlqgxaERsYWmcmXo0M4t+Km4aZCIznGqV
	R1XFNBek1OQolutlllEEooQaU5Na0l2ZHW3XArIz5+A7PLvj8qZGnSctRGTD3MbecQsIbFhlatl
	cXqYBzSIYGyjFnGfSfrkw8LPI0smEpZw3UB7weviqCXfIL9G+vExVBjUpxq4OIZikPw5LAAqPT/
	aJlFEqyNJ9eCqIKwKVOqe3xHrmZS9bxWyxn3xe3rB/00W7YfvVlmflo9QQAxFagatSVMhXxTHiF
	vbEkdlqDFCVkOA7YJOXLTRzNXkF5ywVm1KCHxM3dc87cMtmxz5pO81AR3z2gtV0KDxkoQZDXqyY
	VZdaahMHJ1S8ndckHvIAzh/8q85mElUWrFpt8y1dYiCqKk9T0w==
X-Received: by 2002:a05:600d:115:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4a966773af2mr77069915e9.2.1793274851546;
        Thu, 29 Oct 2026 04:54:11 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92de010bcsm102460215e9.0.2026.10.29.04.54.10
        for <cryptsetup@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:54:11 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: cryptsetup@lists.linux.dev
Subject: [PATCH] Allow encryption sector size up to 64 KiB for plain devices.
Date: Thu, 29 Oct 2026 13:53:38 +0200
Message-Id: <20261029115338.3599814-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Post: <mailto:cryptsetup@lists.linux.dev>
List-Help: <mailto:cryptsetup+help@lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
List-Owner: <mailto:cryptsetup+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux kernel commit 1acc65c30f85 ("dm-crypt: allow encryption sector
size up to PAGE_SIZE") raises the encryption sector size limit of
plain dm-crypt devices from 4096 bytes to the page size (dm-crypt
target 1.30.0).

cryptsetup still caps the sector size at 4096 bytes, so it is not
possible to set up a plain dm-crypt device with sectors larger than
4 KiB, even on systems configured with pages larger than 4 KiB.

For plain devices, raise the cap to 64 KiB, the largest page size that
arm64 or ppc64 kernels can be configured with. LUKS stays at 4096
bytes. The kernel still enforces its own limit; if it refuses to
activate the device, report whether the sector size is larger than the
page size or the dm-crypt target is older than 1.30.0.

Assisted-by: LLM
---
This makes the dm-crypt change [1] usable for plain devices. LUKS stays
at 4096 bytes. cryptsetup does not check the page size or the dm-crypt
version before activation; the kernel decides, and cryptsetup only
explains a refusal.

Torn sectors after a power failure came up in the review of the kernel
patch. The existing note under --sector-size in cryptsetup-open(8)
already warns about them, and the kernel documentation now describes
what each cipher mode does with a torn sector.

[1] https://lore.kernel.org/dm-devel/20261004101622.2184287-1-itai.handler@gmail.com/

Testing, in QEMU on x86_64 with 4 KiB pages and on arm64 with 64 KiB
pages:
 - Linux 7.3 (dm-crypt 1.29.0) and a Linux 7.4 merge window kernel
   (65ba8f34ec88, dm-crypt 1.30.0): compat-args-test, device-test and
   api-test pass.
 - Linux 7.3: plain devices with 8, 16, 32 and 64 KiB sectors are not
   activated. The error says that the sector size is larger than 4096
   bytes on arm64, and larger than the page size on x86_64.
 - 7.4 merge window: on arm64, plain devices with 8, 16, 32 and 64 KiB
   sectors activate with a matching logical block size, and data
   survives reactivation. Mapping the same ciphertext with 4096-byte
   sectors shows that the kernel encrypts 64 KiB units. On x86_64 the
   same commands fail with the page size message.

When activation fails, for example with --sector-size 65536 on x86_64,
the error is followed by "The device size is not multiple of the
requested sector size." unless the device size is a multiple of 32 MiB.
That line is wrong, but it does not come from this patch: after a failed
activation, dm_create_device() compares the device size in 512-byte
sectors with the sector size in bytes.

This patch was prepared with the help of an LLM, as the Assisted-by
trailer says.

 lib/libcryptsetup_macros.h |  1 +
 lib/libdevmapper.c         | 12 ++++++++++++
 lib/setup.c                |  2 +-
 lib/utils_dm.h             |  1 +
 man/common_options.adoc    |  5 ++++-
 src/cryptsetup.c           |  8 +++++++-
 tests/api-test.c           | 12 ++++++++++++
 tests/compat-args-test     |  5 +++++
 tests/device-test          | 25 +++++++++++++++++++++++++
 9 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/lib/libcryptsetup_macros.h b/lib/libcryptsetup_macros.h
index a2dfba3c..d1febcb5 100644
--- a/lib/libcryptsetup_macros.h
+++ b/lib/libcryptsetup_macros.h
@@ -38,6 +38,7 @@
 #define SECTOR_SHIFT       9
 #define SECTOR_SIZE     (1 << SECTOR_SHIFT)
 #define MAX_SECTOR_SIZE 4096 /* min page size among all platforms */
+#define MAX_PLAIN_SECTOR_SIZE 65536 /* plain only, kernel requires page size >= sector size */
 #define ROUND_SECTOR(x) (((x) + SECTOR_SIZE - 1) / SECTOR_SIZE)
 
 #define MISALIGNED(a, b)	((a) & ((b) - 1))
diff --git a/lib/libdevmapper.c b/lib/libdevmapper.c
index 9357967d..8b4e0e65 100644
--- a/lib/libdevmapper.c
+++ b/lib/libdevmapper.c
@@ -164,6 +164,9 @@ static void _dm_set_crypt_compat(struct crypt_device *cd,
 	if (_dm_satisfies_version(1, 28, 0, crypt_maj, crypt_min, crypt_patch))
 		_dm_flags |= DM_CRYPT_INTEGRITY_KEY_SIZE_OPT_SUPPORTED;
 
+	if (_dm_satisfies_version(1, 30, 0, crypt_maj, crypt_min, crypt_patch))
+		_dm_flags |= DM_CRYPT_PLAIN_SECTOR_SIZE_UP_TO_PAGE_SUPPORTED;
+
 	_dm_crypt_checked = true;
 }
 
@@ -1822,6 +1825,15 @@ int dm_create_device(struct crypt_device *cd, const char *name,
 		if (dmd->segment.u.crypt.sector_size != SECTOR_SIZE && !(dmt_flags & DM_SECTOR_SIZE_SUPPORTED)) {
 			log_err(cd, _("Requested sector_size option is not supported."));
 			r = -EINVAL;
+		} else if (dmd->segment.u.crypt.sector_size > crypt_getpagesize()) {
+			log_err(cd, _("Kernel does not support encryption sector size larger than page size (%zu bytes)."),
+				crypt_getpagesize());
+			r = -EINVAL;
+		} else if (dmd->segment.u.crypt.sector_size > MAX_SECTOR_SIZE &&
+			   !(dmt_flags & DM_CRYPT_PLAIN_SECTOR_SIZE_UP_TO_PAGE_SUPPORTED)) {
+			log_err(cd, _("Kernel does not support encryption sector size larger than %u bytes."),
+				MAX_SECTOR_SIZE);
+			r = -EINVAL;
 		}
 		if (dmd->segment.u.crypt.sector_size > SECTOR_SIZE &&
 		    dmd->size % dmd->segment.u.crypt.sector_size) {
diff --git a/lib/setup.c b/lib/setup.c
index 2374656c..672f91e3 100644
--- a/lib/setup.c
+++ b/lib/setup.c
@@ -1670,7 +1670,7 @@ static int _crypt_format_plain(struct crypt_device *cd,
 	if (!sector_size)
 		sector_size = SECTOR_SIZE;
 
-	if (sector_size < SECTOR_SIZE || sector_size > MAX_SECTOR_SIZE ||
+	if (sector_size < SECTOR_SIZE || sector_size > MAX_PLAIN_SECTOR_SIZE ||
 	    NOTPOW2(sector_size)) {
 		log_err(cd, _("Unsupported encryption sector size."));
 		return -EINVAL;
diff --git a/lib/utils_dm.h b/lib/utils_dm.h
index eee31a78..64b51140 100644
--- a/lib/utils_dm.h
+++ b/lib/utils_dm.h
@@ -68,6 +68,7 @@ static inline uint64_t act2dmflags(uint64_t act_flags)
 #define DM_VERITY_ERROR_AS_CORRUPTION_SUPPORTED (UINT64_C(1) << 31) /* dm-verity restart/panic on corruption supported */
 #define DM_INTEGRITY_INLINE_MODE_SUPPORTED (UINT64_C(1) << 32) /* dm-integrity inline mode supported */
 #define DM_INTEGRITY_DISCARD_KEYED_SUPPORTED (UINT64_C(1) << 33) /* dm-integrity discard keyed supported */
+#define DM_CRYPT_PLAIN_SECTOR_SIZE_UP_TO_PAGE_SUPPORTED (UINT64_C(1) << 34) /* dm-crypt sector size up to page size supported, used for plain devices only */
 
 typedef enum { DM_CRYPT = 0, DM_VERITY, DM_INTEGRITY, DM_LINEAR, DM_ERROR, DM_ZERO, DM_UNKNOWN } dm_target_type;
 enum tdirection { TARGET_EMPTY = 0, TARGET_SET, TARGET_QUERY };
diff --git a/man/common_options.adoc b/man/common_options.adoc
index ecc72196..5abd6cde 100644
--- a/man/common_options.adoc
+++ b/man/common_options.adoc
@@ -949,8 +949,11 @@ endif::[]
 ifndef::ACTION_REENCRYPT[]
 ifdef::ACTION_OPEN[]
 Set encryption sector size for use with _plain_ device type.
-It must be a power of two and in the 512 - 4096 bytes range.
+It must be a power of two and in the 512 - 65536 bytes range.
 The default encryption sector size is 512 bytes.
++
+Encryption sector size larger than 4096 bytes needs kernel 7.4 or later (dm-crypt target version 1.30.0) and the system page size must be at least as large as the encryption sector size.
+Such a device cannot be activated on systems with a smaller page size (for example, x86_64, or arm64 with a kernel configured for 4096-byte pages), so it is not portable between systems.
 endif::[]
 ifdef::ACTION_LUKSFORMAT[]
 Set encryption sector size for use with _LUKS2_ device type.
diff --git a/src/cryptsetup.c b/src/cryptsetup.c
index 77e4e9a9..20e73521 100644
--- a/src/cryptsetup.c
+++ b/src/cryptsetup.c
@@ -3679,6 +3679,9 @@ static const char *verify_reencrypt(void)
 	if (ARG_SET(OPT_NEW_VOLUME_KEY_KEYRING_ID) && ARG_SET(OPT_KEEP_KEY_ID))
 		return _("Options --new-volume-key-keyring and --keep-key cannot be combined.");
 
+	if (ARG_UINT32(OPT_SECTOR_SIZE_ID) > MAX_SECTOR_SIZE)
+		return _("Unsupported encryption sector size.");
+
 	return NULL;
 }
 
@@ -3704,6 +3707,9 @@ static const char *verify_format(void)
 	if (ARG_SET(OPT_DISABLE_SUM_ID) && !ARG_SET(OPT_HW_OPAL_ID) && !ARG_SET(OPT_HW_OPAL_ONLY_ID))
 		return  _("Option --disable-sum must be used with --hw-opal or --hw-opal-only");
 
+	if (ARG_UINT32(OPT_SECTOR_SIZE_ID) > MAX_SECTOR_SIZE)
+		return _("Unsupported encryption sector size.");
+
 	return NULL;
 }
 
@@ -4045,7 +4051,7 @@ static void basic_options_cb(poptContext popt_context,
 		break;
 	case OPT_SECTOR_SIZE_ID:
 		if (ARG_UINT32(OPT_SECTOR_SIZE_ID) < SECTOR_SIZE ||
-		    ARG_UINT32(OPT_SECTOR_SIZE_ID) > MAX_SECTOR_SIZE ||
+		    ARG_UINT32(OPT_SECTOR_SIZE_ID) > MAX_PLAIN_SECTOR_SIZE ||
 		    (ARG_UINT32(OPT_SECTOR_SIZE_ID) & (ARG_UINT32(OPT_SECTOR_SIZE_ID) - 1)))
 			usage(popt_context, EXIT_FAILURE,
 			      _("Unsupported encryption sector size."),
diff --git a/tests/api-test.c b/tests/api-test.c
index eece721b..63b56acc 100644
--- a/tests/api-test.c
+++ b/tests/api-test.c
@@ -362,6 +362,18 @@ static void AddDevicePlain(void)
 
 	CRYPT_FREE(cd);
 
+	// encryption sector size, activation with more than 4096 bytes depends on kernel page size
+	OK_(crypt_init(&cd, DEVICE_2));
+	params.sector_size = 131072;
+	FAIL_(crypt_format(cd, CRYPT_PLAIN, cipher, cipher_mode, NULL, NULL, key_size, &params), "sector size too large");
+	params.sector_size = 12288;
+	FAIL_(crypt_format(cd, CRYPT_PLAIN, cipher, cipher_mode, NULL, NULL, key_size, &params), "sector size not power of 2");
+	params.sector_size = 65536;
+	OK_(crypt_format(cd, CRYPT_PLAIN, cipher, cipher_mode, NULL, NULL, key_size, &params));
+	EQ_(crypt_get_sector_size(cd), 65536);
+	params.sector_size = 0;
+	CRYPT_FREE(cd);
+
 	// default is "plain" hash - no password hash
 	OK_(crypt_init(&cd, DEVICE_1));
 	OK_(crypt_format(cd, CRYPT_PLAIN, cipher, cipher_mode, NULL, NULL, key_size, NULL));
diff --git a/tests/compat-args-test b/tests/compat-args-test
index 793ecf6d..237eb398 100755
--- a/tests/compat-args-test
+++ b/tests/compat-args-test
@@ -251,10 +251,15 @@ exp_fail luksFormat DEV --type luks1 --pbkdf-force-iterations 1001 -i1
 
 exp_fail open DEV NAME --sector-size 1024
 exp_pass open DEV NAME --type plain --sector-size 1024
+exp_pass open DEV NAME --type plain --sector-size 65536
+exp_fail open DEV NAME --type plain --sector-size 131072
+exp_fail open DEV NAME --type plain --sector-size 12288
 # bug
 # exp_fail luksFormat DEV --sector-size 0
 exp_fail luksFormat DEV --sector-size 511
 exp_fail luksFormat DEV --sector-size 8192
+exp_fail luksFormat DEV --sector-size 65536
+exp_fail reencrypt DEV --sector-size 8192
 exp_pass reencrypt DEV --sector-size 1024
 exp_pass luksFormat DEV --sector-size 1024
 
diff --git a/tests/device-test b/tests/device-test
index c6e745da..c296ecdc 100755
--- a/tests/device-test
+++ b/tests/device-test
@@ -94,6 +94,7 @@ dm_crypt_features()
 	[ $VER_MAJ -gt 1 ] && {
 		DM_PERF_CPU=1
 		DM_SECTOR_SIZE=1
+		DM_PLAIN_SECTOR_SIZE_UP_TO_PAGE=1
 		test -d /proc/sys/kernel/keys && DM_KEYRING=1
 		return
 	}
@@ -112,6 +113,9 @@ dm_crypt_features()
 
 	[ $VER_MIN -lt 26 ] && return
 	DM_PERF_HIGH_PRIORITY=1
+
+	[ $VER_MIN -lt 30 ] && return
+	DM_PLAIN_SECTOR_SIZE_UP_TO_PAGE=1
 }
 
 format() # format
@@ -143,6 +147,7 @@ check_io()
 	dd if=/dev/zero of=/dev/mapper/$DEV_NAME bs=1M count=32 oflag=direct 2>/dev/null || fail
 }
 
+export LANG=C
 [ ! -x "$CRYPTSETUP" ] && skip "Cannot find $CRYPTSETUP, test skipped."
 [ -n "$VALG" ] && valgrind_setup && CRYPTSETUP=valgrind_run
 if [ $(id -u) != 0 ]; then
@@ -341,6 +346,26 @@ else
 		$CRYPTSETUP close $DEV_NAME || fail
 	done
 
+	# Plain device sector size larger than 4096 bytes needs dm-crypt 1.30 and page size >= sector size
+	PAGE_SIZE=$(getconf PAGE_SIZE)
+	for S in 8192 16384 32768 65536; do
+		echo -n "[$S]"
+		if [ -n "$DM_PLAIN_SECTOR_SIZE_UP_TO_PAGE" -a $S -le $PAGE_SIZE ]; then
+			echo -e "$PWD1" | $CRYPTSETUP open -q $PLAIN_OPT $DEV $DEV_NAME --sector-size $S || fail
+			check_sector_size $S
+			check_io
+			$CRYPTSETUP close $DEV_NAME || fail
+			continue
+		fi
+		OUT=$(echo -e "$PWD1" | $CRYPTSETUP open -q $PLAIN_OPT $DEV $DEV_NAME --sector-size $S 2>&1) && fail
+		if [ $S -gt $PAGE_SIZE ]; then
+			echo "$OUT" | grep -q "larger than page size ($PAGE_SIZE bytes)" || fail
+		else
+			echo "$OUT" | grep -q "larger than 4096 bytes" || fail
+		fi
+	done
+	echo -e "$PWD1" | $CRYPTSETUP open -q $PLAIN_OPT $DEV $DEV_NAME --sector-size 131072 >/dev/null 2>&1 && fail
+
 	echo -e "$PWD1" | $CRYPTSETUP open $PLAIN_OPT $DEV $DEV_NAME --iv-large-sectors >/dev/null 2>&1 && fail
 	for S in 1024 2048 4096; do
 		echo -n "[$S/IV]"

base-commit: bae21790d59897ac50e5471f953f76b3a58aeeb6
-- 
2.34.1

