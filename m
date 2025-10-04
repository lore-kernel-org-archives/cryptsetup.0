Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6791A4A3C
	for <cryptsetup@lists.linux.dev>; Sat,  4 Oct 2025 00:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759538211; cv=none; b=tBqDC7R/ZIrvel8AIaLV8VcmhMCC2qX0PIrc+IFxEp9Lsf7VgmKXfAb3KL/IohgWhqkfnefkKGL+ohwp6F2Bt1HBCCn4i5lKKQx4ZNPMtkaaeexWvYwFQZSA7NE5mkMl/iUSjuL+bAzjiQt0XRKTZbCmxy3uS3rJxFas6reT9OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759538211; c=relaxed/simple;
	bh=1qJtY+qyghMPZfaXTAUHaNV2RlB4RVPuRRb75VxSZt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYMjLcMDUY0JZ2JaQtnqpql+sNnV1WfzF87FEr0T9b9jQOLTDq1LmBweEqfO/ACChrzJqrslLr84IyuyI0gdE18AJqLoGDVMVHTWnA5Uj8/lye+tp3+cqoqekbVkP9Jyls2clv+QjHPtsfgfiCEBcjjVPMvHGv8UnxcegGlGkWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuaOkGRe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuaOkGRe"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e6c8bc46eso17408175e9.3
        for <cryptsetup@lists.linux.dev>; Fri, 03 Oct 2025 17:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759538207; x=1760143007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25GgLrSspi/xpkiCXQev3tGI/h/vO3sFHKhdJVjfzEo=;
        b=PuaOkGRefBW6cgAaLo9Vu0SqWYDfzzAfsuHYyarUSeGRDjvKko+deT39re0zjcSPDm
         cvmOn0uPlCHEIhZEqW3jkWBFxyDyC1JsAmx0EV0rH6SL5eWSJslKCop/V6TTpnFJ/RJY
         jvtFRtM+1/2YXklb32bpCcbLw0jZkCaJY1K1E02DUDif1XJOTKCo614NLNQNUslXwcGn
         LrpAKTUijGATfP2rSWGPT6j1NkOWK+f7oh1cSfDu9FYUyfbOsZiWOeHAprzWfakTNkEs
         g7bvf8Zy0W7gPbOJYA7jS+oCnq4HnNTPKuirDow8fOl8PzofZF99FpYWIjkEmII+CrPd
         0amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759538207; x=1760143007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25GgLrSspi/xpkiCXQev3tGI/h/vO3sFHKhdJVjfzEo=;
        b=YD3C9GBOxgx2q8fcc7ngJU3ohMlYkJbulsvk5K9kU5JbQItw9YnCxx0oe203FLvWEx
         SAQN6WNvPDS60j53YvQ2b4s0nD4k4QcZQrZDOq0pL0ZumvzjBDPc+Nd8L1NvJzZrkeJj
         SYp9kaA0D3nu6toSiiHl/EzoRHywIeKYwepeQaJJ9uIxqZFVXES44r6bUlClY2XdRcE7
         8NA+at31Mpewm4NV/pVMIZJAvfdsg8l6J14kXTwA4LuVcUqgYpdw6/4aXQRW7Hk9BcK7
         7HhtWBjUC363FezHJMBEd5rFqKDTFIzFBCtsoZUPx0wjENurP7TLUG5iQ9+KkX6K8nra
         0quA==
X-Gm-Message-State: AOJu0YwIaIMm/OWydTXcGiwaTupKnAJ5diS5kKYKithppZHZW1b5Qv3A
	zn8bQOPe0xXWUhmZNbfqRRuIoUUEK1ChiWt8ipKxTY48TaMkr50DNKK+Saw8zQ==
X-Gm-Gg: ASbGncu2oh9PrdcfUPzGt57LTHLR+CkRjKQt+GOV329cI8ydWdbpjLgyrxLhelXwt0g
	yncGOhDjp/TwfvcUDZKD3mbBF6vHK8okUKruAJprg6CMwK1/UB8kV3RS6z+a3k3990H35ttPAMA
	ZgzlzgmkoiVgT7B2V+h9BaH2/ASIWbsoT0OKon2XIu2/torOMhVxOhcyGKMr7LPK9O87mwFTQik
	vDLNBbZEAlKbkU4C+gVzcrFgHmnIb1KUw7rxu6w4YrtXnb5RqwFSd4XzJ8jCcR1WwBqY5Fcv97Y
	Zfeyd39xZBV/9VfYSBmzSjCO9zuLkyLMxad/ZtSeqjTN/9ouVxb/RfhV0hwNofCLIrs1JZut9pZ
	Qg6NAGVGTizC8cklxDmn/iFhtu2IziKMKvZMbj26qHYcr/X8dKqfr4/aHhv1k
X-Google-Smtp-Source: AGHT+IF8Uh/l/J+sAEe0ESV8GshMIv28mDSQXmKE3rvfXNYYCdypKg0Tnj0+hzlBMFU6plFk7ZNU5A==
X-Received: by 2002:a05:600d:8110:b0:46e:6603:2a84 with SMTP id 5b1f17b1804b1-46e71151bedmr28491985e9.32.1759538207305;
        Fri, 03 Oct 2025 17:36:47 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:9d5a:ed00:f05f:1922:a66f:12b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a18b76sm152737795e9.18.2025.10.03.17.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 17:36:46 -0700 (PDT)
From: Kfir Kahanov <kfirka3@gmail.com>
To: cryptsetup@lists.linux.dev
Cc: Kfir Kahanov <kfirka3@gmail.com>
Subject: [PATCH 2/2] bitlocker: Add clearkey option
Date: Sat,  4 Oct 2025 03:35:54 +0300
Message-ID: <20251004003554.234647-3-kfirka3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251004003554.234647-1-kfirka3@gmail.com>
References: <20251004003554.234647-1-kfirka3@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to bypass getting the password.
---
 lib/keyslot_context.c     | 97 +++++++++++++++++++++++++++++++++++++++
 lib/keyslot_context.h     |  2 +
 lib/libcryptsetup.h       | 24 ++++++++++
 lib/libcryptsetup.sym     |  1 +
 lib/setup.c               | 24 +++++++++-
 src/cryptsetup.c          | 20 +++++---
 src/cryptsetup_arg_list.h |  2 +
 src/cryptsetup_args.h     |  1 +
 src/utils_arg_names.h     |  1 +
 9 files changed, 165 insertions(+), 7 deletions(-)

diff --git a/lib/keyslot_context.c b/lib/keyslot_context.c
index 1b137823..a6df53fb 100644
--- a/lib/keyslot_context.c
+++ b/lib/keyslot_context.c
@@ -304,6 +304,68 @@ static int get_fvault2_volume_key_by_key(struct crypt_device *cd,
 	return get_key_by_key(cd, kc, -2 /* unused */, -2 /* unused */, r_vk);
 }
 
+/* Clearkey-specific functions */
+static int get_luks1_volume_key_by_clearkey(struct crypt_device *cd __attribute__((unused)),
+	struct crypt_keyslot_context *kc __attribute__((unused)),
+	int keyslot __attribute__((unused)),
+	struct volume_key **r_vk __attribute__((unused)))
+{
+	/* LUKS1 does not support clearkey protection */
+	return -ENOTSUP;
+}
+
+static int get_luks2_volume_key_by_clearkey(struct crypt_device *cd __attribute__((unused)),
+	struct crypt_keyslot_context *kc __attribute__((unused)),
+	int keyslot __attribute__((unused)),
+	struct volume_key **r_vk __attribute__((unused)))
+{
+	/* LUKS2 does not support clearkey protection */
+	return -ENOTSUP;
+}
+
+static int get_plain_volume_key_by_clearkey(struct crypt_device *cd __attribute__((unused)),
+	struct crypt_keyslot_context *kc __attribute__((unused)),
+	struct volume_key **r_vk __attribute__((unused)))
+{
+	/* Plain does not support clearkey protection */
+	return -ENOTSUP;
+}
+
+static int get_bitlk_volume_key_by_clearkey(struct crypt_device *cd,
+	struct crypt_keyslot_context *kc __attribute__((unused)),
+	const struct bitlk_metadata *params,
+	struct volume_key **r_vk)
+{
+	/* For BitLocker clearkey, call BITLK_get_volume_key without passphrase */
+	return BITLK_get_volume_key(cd, NULL, 0, params, r_vk);
+}
+
+static int get_fvault2_volume_key_by_clearkey(struct crypt_device *cd __attribute__((unused)),
+	struct crypt_keyslot_context *kc __attribute__((unused)),
+	const struct fvault2_params *params __attribute__((unused)),
+	struct volume_key **r_vk __attribute__((unused)))
+{
+	/* FVAULT2 does not support clearkey protection */
+	return -ENOTSUP;
+}
+
+static int get_verity_volume_key_by_clearkey(struct crypt_device *cd __attribute__((unused)),
+	struct crypt_keyslot_context *kc __attribute__((unused)),
+	struct volume_key **r_vk __attribute__((unused)),
+	struct volume_key **r_signature __attribute__((unused)))
+{
+	/* Verity does not support clearkey protection */
+	return -ENOTSUP;
+}
+
+static int get_integrity_volume_key_by_clearkey(struct crypt_device *cd __attribute__((unused)),
+	struct crypt_keyslot_context *kc __attribute__((unused)),
+	struct volume_key **r_vk __attribute__((unused)))
+{
+	/* Integrity does not support clearkey protection */
+	return -ENOTSUP;
+}
+
 static int get_generic_signed_key_by_key(struct crypt_device *cd,
 	struct crypt_keyslot_context *kc,
 	struct volume_key **r_vk,
@@ -629,6 +691,26 @@ void crypt_keyslot_context_init_by_key_internal(struct crypt_keyslot_context *kc
 	crypt_keyslot_context_init_common(kc);
 }
 
+void crypt_keyslot_context_init_by_clearkey_internal(struct crypt_keyslot_context *kc)
+{
+	assert(kc);
+
+	kc->type = CRYPT_KC_TYPE_KEY;
+
+	kc->get_luks1_volume_key = get_luks1_volume_key_by_clearkey;
+	kc->get_luks2_volume_key = get_luks2_volume_key_by_clearkey;
+	kc->get_plain_volume_key = get_plain_volume_key_by_clearkey;
+	kc->get_bitlk_volume_key = get_bitlk_volume_key_by_clearkey;
+	kc->get_fvault2_volume_key = get_fvault2_volume_key_by_clearkey;
+	kc->get_verity_volume_key = get_verity_volume_key_by_clearkey;
+	kc->get_integrity_volume_key = get_integrity_volume_key_by_clearkey;
+	
+	kc->get_key_size = key_get_key_size;
+	kc->context_free = key_context_free;
+	crypt_keyslot_context_init_common(kc);
+}
+
+
 static void signed_key_context_free(struct crypt_keyslot_context *kc)
 {
 	assert(kc && kc->type == CRYPT_KC_TYPE_SIGNED_KEY);
@@ -1196,6 +1278,21 @@ CRYPT_SYMBOL_EXPORT_OLD(int, crypt_keyslot_context_init_by_vk_in_keyring, 2, 7,
 	return _crypt_keyslot_context_init_by_vk_in_keyring(key_description, kc, false);
 }
 
+CRYPT_SYMBOL_EXPORT_NEW(int, crypt_keyslot_context_init_by_clearkey, 2, 8, struct crypt_device *cd,
+	struct crypt_keyslot_context **kc)
+{
+	if (!kc)
+		return -EINVAL;
+
+	*kc = crypt_zalloc(sizeof(**kc));
+	if (!*kc)
+		return -ENOMEM;
+
+	crypt_keyslot_context_init_by_clearkey_internal(*kc);
+
+	return 0;
+}
+
 int crypt_keyslot_context_get_error(struct crypt_keyslot_context *kc)
 {
 	return kc ? kc->error : -EINVAL;
diff --git a/lib/keyslot_context.h b/lib/keyslot_context.h
index a2e42b20..f373bf8d 100644
--- a/lib/keyslot_context.h
+++ b/lib/keyslot_context.h
@@ -175,6 +175,8 @@ void crypt_keyslot_context_init_by_token_internal(struct crypt_keyslot_context *
 void crypt_keyslot_context_init_by_keyring_internal(struct crypt_keyslot_context *kc,
 	const char *key_description);
 
+void crypt_keyslot_context_init_by_clearkey_internal(struct crypt_keyslot_context *kc);
+
 const char *keyslot_context_type_string(const struct crypt_keyslot_context *kc);
 
 #endif /* KEYSLOT_CONTEXT_H */
diff --git a/lib/libcryptsetup.h b/lib/libcryptsetup.h
index 77eb29ef..07b18f70 100644
--- a/lib/libcryptsetup.h
+++ b/lib/libcryptsetup.h
@@ -1352,6 +1352,17 @@ int crypt_keyslot_context_init_by_vk_in_keyring(struct crypt_device *cd,
 	const char *key_description,
 	struct crypt_keyslot_context **kc);
 
+/**
+ * Initialize keyslot context for clear key.
+ *
+ * @param cd crypt device handle initialized to LUKS device context
+ * @param kc returns crypt keyslot context handle type CRYPT_KC_TYPE_KEY
+ *
+ * @return zero on success or negative errno otherwise.
+ */
+int crypt_keyslot_context_init_by_clearkey(struct crypt_device *cd,
+	struct crypt_keyslot_context **kc);
+
 /**
  * Get error code per keyslot context from last failed call.
  *
@@ -1823,6 +1834,19 @@ int crypt_activate_by_keyring(struct crypt_device *cd,
 	int keyslot,
 	uint32_t flags);
 
+/**
+ * Activate BITLK device using clearkey.
+ *
+ * @param cd crypt device handle
+ * @param name name of device to create
+ * @param flags activation flags
+ *
+ * @return @e 0 on success or negative errno value otherwise.
+ */
+int crypt_activate_by_clearkey(struct crypt_device *cd,
+	const char *name,
+	uint32_t flags);
+
 /** lazy deactivation - remove once last user releases it */
 #define CRYPT_DEACTIVATE_DEFERRED (UINT32_C(1) << 0)
 /** force deactivation - if the device is busy, it is replaced by error device */
diff --git a/lib/libcryptsetup.sym b/lib/libcryptsetup.sym
index 3a54431a..f6463af2 100644
--- a/lib/libcryptsetup.sym
+++ b/lib/libcryptsetup.sym
@@ -61,6 +61,7 @@ CRYPTSETUP_2.0 {
 		crypt_activate_by_volume_key;
 		crypt_activate_by_signed_key;
 		crypt_activate_by_keyring;
+		crypt_activate_by_clearkey;
 		crypt_deactivate;
 		crypt_deactivate_by_name;
 		crypt_volume_key_get;
diff --git a/lib/setup.c b/lib/setup.c
index 37e6f7d9..1be05cfe 100644
--- a/lib/setup.c
+++ b/lib/setup.c
@@ -5707,6 +5707,20 @@ int crypt_activate_by_signed_key(struct crypt_device *cd,
 	return r;
 }
 
+int crypt_activate_by_clearkey(struct crypt_device *cd,
+	const char *name,
+	uint32_t flags)
+{
+	int r;
+	struct crypt_keyslot_context kc = {};
+
+	crypt_keyslot_context_init_by_clearkey_internal(&kc);
+	r = crypt_activate_by_keyslot_context(cd, name, CRYPT_ANY_SLOT /* unused */, &kc, CRYPT_ANY_SLOT, &kc, flags);
+	crypt_keyslot_context_destroy_internal(&kc);
+
+	return r;
+}
+
 int crypt_deactivate_by_name(struct crypt_device *cd, const char *name, uint32_t flags)
 {
 	struct crypt_device *fake_cd = NULL;
@@ -5917,7 +5931,7 @@ int crypt_volume_key_get_by_keyslot_context(struct crypt_device *cd,
 	struct volume_key *vk = NULL;
 
 	if (!cd || !volume_key || !volume_key_size ||
-	    (!kc && !isLUKS(cd->type) && !isTCRYPT(cd->type) && !isVERITY(cd->type)))
+	    (!kc && !isLUKS(cd->type) && !isTCRYPT(cd->type) && !isVERITY(cd->type) && !isBITLK(cd->type)))
 		return -EINVAL;
 
 	if (isLUKS2(cd->type) && keyslot != CRYPT_ANY_SLOT)
@@ -5977,6 +5991,14 @@ int crypt_volume_key_get_by_keyslot_context(struct crypt_device *cd,
 	} else if (isBITLK(cd->type)) {
 		if (kc && kc->get_bitlk_volume_key)
 			r = kc->get_bitlk_volume_key(cd, kc, &cd->u.bitlk.params, &vk);
+		else if (!kc) {
+			struct crypt_keyslot_context *kc_clearkey = NULL;
+			r = crypt_keyslot_context_init_by_clearkey(cd, &kc_clearkey);
+			if (r >= 0) {
+				r = kc_clearkey->get_bitlk_volume_key(cd, kc_clearkey, &cd->u.bitlk.params, &vk);
+			}
+			crypt_keyslot_context_free(kc_clearkey);
+		}
 		if (r < 0)
 			log_err(cd, _("Cannot retrieve volume key for BITLK device."));
 	} else if (isFVAULT2(cd->type)) {
diff --git a/src/cryptsetup.c b/src/cryptsetup.c
index bd2ee780..134162c6 100644
--- a/src/cryptsetup.c
+++ b/src/cryptsetup.c
@@ -508,6 +508,11 @@ static int action_open_bitlk(void)
 			goto out;
 		r = crypt_activate_by_volume_key(cd, activated_name,
 						 key, keysize, activate_flags);
+	} else if (ARG_SET(OPT_CLEARKEY_ID)) {
+		/* For clearkey, we don't need a passphrase - pass NULL to activate_by_passphrase */
+		r = crypt_activate_by_clearkey(cd, activated_name, activate_flags);
+		if (r < 0)
+			log_err(_("No clearkey protection found on BITLK device."));
 	} else {
 		tries = set_tries_tty(false);
 		do {
@@ -617,14 +622,17 @@ static int bitlkDump_with_volume_key(struct crypt_device *cd)
 	if (!vk)
 		return -ENOMEM;
 
-	r = tools_get_key(NULL, &password, &passwordLen,
-			  ARG_UINT64(OPT_KEYFILE_OFFSET_ID), ARG_UINT32(OPT_KEYFILE_SIZE_ID), ARG_STR(OPT_KEY_FILE_ID),
-			  ARG_UINT32(OPT_TIMEOUT_ID), 0, 0, cd);
-	if (r < 0)
-		goto out;
+	if (!ARG_SET(OPT_CLEARKEY_ID)) {
+		r = tools_get_key(NULL, &password, &passwordLen,
+				  ARG_UINT64(OPT_KEYFILE_OFFSET_ID), ARG_UINT32(OPT_KEYFILE_SIZE_ID), ARG_STR(OPT_KEY_FILE_ID),
+				  ARG_UINT32(OPT_TIMEOUT_ID), 0, 0, cd);
+		if (r < 0)
+			goto out;
+	}		
 
 	r = crypt_volume_key_get(cd, CRYPT_ANY_SLOT, vk, &vk_size,
-				 password, passwordLen);
+					password, passwordLen);
+
 	tools_passphrase_msg(r);
 	check_signal(&r);
 	if (r < 0)
diff --git a/src/cryptsetup_arg_list.h b/src/cryptsetup_arg_list.h
index 26652dd8..95b2c991 100644
--- a/src/cryptsetup_arg_list.h
+++ b/src/cryptsetup_arg_list.h
@@ -241,6 +241,8 @@ ARG(OPT_USE_DIRECTIO, '\0', POPT_ARG_NONE, N_("Use direct-io when accessing devi
 ARG(OPT_USE_FSYNC, '\0', POPT_ARG_NONE, N_("Use fsync after each block"), NULL, CRYPT_ARG_BOOL, {}, {})
 
 ARG(OPT_WRITE_LOG, '\0', POPT_ARG_NONE, N_("Update log file after every block"), NULL, CRYPT_ARG_BOOL, {}, {})
+ 
+ARG(OPT_CLEARKEY, '\0', POPT_ARG_NONE, N_("Open BITLK device using only clearkey protection"), NULL, CRYPT_ARG_BOOL, {}, {})
 
 /* aliases */
 
diff --git a/src/cryptsetup_args.h b/src/cryptsetup_args.h
index 43926f99..3ef58b61 100644
--- a/src/cryptsetup_args.h
+++ b/src/cryptsetup_args.h
@@ -43,6 +43,7 @@
 /* avoid unshielded commas in ARG() macros later */
 #define OPT_ALIGN_PAYLOAD_ACTIONS		{ FORMAT_ACTION, REENCRYPT_ACTION }
 #define OPT_ALLOW_DISCARDS_ACTIONS		{ OPEN_ACTION }
+#define OPT_CLEARKEY_ACTIONS			{ OPEN_ACTION, BITLKDUMP_ACTION }
 #define OPT_DEFERRED_ACTIONS			{ CLOSE_ACTION }
 #define OPT_DEVICE_SIZE_ACTIONS			{ OPEN_ACTION, RESIZE_ACTION, REENCRYPT_ACTION }
 #define OPT_DISABLE_BLKID_ACTIONS		{ FORMAT_ACTION, REENCRYPT_ACTION }
diff --git a/src/utils_arg_names.h b/src/utils_arg_names.h
index a01419d3..f50c26dc 100644
--- a/src/utils_arg_names.h
+++ b/src/utils_arg_names.h
@@ -20,6 +20,7 @@
 #define OPT_CANCEL_DEFERRED		"cancel-deferred"
 #define OPT_CHECK_AT_MOST_ONCE		"check-at-most-once"
 #define OPT_CIPHER			"cipher"
+#define OPT_CLEARKEY			"clearkey"
 #define OPT_DATA_BLOCK_SIZE		"data-block-size"
 #define OPT_DATA_BLOCKS			"data-blocks"
 #define OPT_DATA_DEVICE			"data-device"
-- 
2.43.0

