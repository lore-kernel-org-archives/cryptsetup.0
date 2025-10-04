Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC44A3C
	for <cryptsetup@lists.linux.dev>; Sat,  4 Oct 2025 00:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759538205; cv=none; b=lrnEWJ94r6ps7sfZmhuRbjkXB56J9BbsVWtMJMNwthHJ/MRcAC9qoSBX4wD4XSmzSdEop6Ci77Qkc9/0rLDo7sFmC8gwGckFfXUV4YYswikJtTeYzwz2KBRsWGl38SP9pFH3k/FQws2y6rk7+KtqpGMmb2Tx6+Qzyxo7Fzfo4Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759538205; c=relaxed/simple;
	bh=iSLy1fgG+FyrQE4dzdIDw092TY9zDkMCHyMZcUKnnrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMPK17syXou4tedHu33P+9nJ5US017q2fNY6N6npjDAtDjSYm/ED5Ob5IhU5GXXV9RdC1l63qB2mN+3f0otSj73l2vq19KGhfiEpcpTAGEZKYrzdxWWTzHIOHICPcIXXwa0I+8amrlz0/aJu9DF3kpTnLBZDuNqjMK1ncxA8VGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EveEVPfx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EveEVPfx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so13873155e9.0
        for <cryptsetup@lists.linux.dev>; Fri, 03 Oct 2025 17:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759538201; x=1760143001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/5GmG7byE4LsTQo9YFTyrALfnKENk6lQD3FD/DgmkA=;
        b=EveEVPfxEb76I+3S/lMRQn7tj6VOiH4QjiQS116BD6R7ygNZ6K0mpJ69nKtkfeDmZX
         Qx3UA+4fEryW8S+gIJxyvN8IZ8hwFNqOJEHOxjQVHpfcbdKj/mPbiIdeeLcjEsFTdJbZ
         aL0ar3LUMU/GjKfH5f5KtHcJdDUJyPbTYH38oWNI76yddlaDEZiv8CkA4NGeRJLzrwcH
         vIrAnPg061Yx0EWLkJZTZXvFoXuMReRVtqqIbezUqMQYuscsIF1FBMMWH90mgT86Ed7b
         1kTgwTowafc1OotDSPww2iaUhFvADnsrv7J4f6fyr3ByGqHdDCugt0swpnlgFTeEwvpC
         LlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759538201; x=1760143001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/5GmG7byE4LsTQo9YFTyrALfnKENk6lQD3FD/DgmkA=;
        b=d4F8k/AtKgAlSmNc04aj940ybiXwxlkvypTeXA2NamiZfNbJD2nvOwx+tdi4XI5Cjs
         /4O7who4n5fGAWOTMEPWu6m2mj+o0yCZQODQq99W/Td4V4FNH3bS+vgBKn8CqItYUo0R
         ZiFkt8q4ykO6FHvOOU4I1oeIm07jotXfTN0f9Y4t1Jkuhv7sf8jgHyJvWYzgmN2i/5Dn
         Smfm3mjbBO8c6KHXRCuP6evf+/j8ip1KSqseSDjulcrWi9R0SE/ZsD7bqhMa2veZxe3x
         qfSdNF6z/smPxUP1RcAfxDkfNO43CaKneX4vMEdHkLu26qQ1qvTDSsL1CryZ+7W2uK9q
         iEXw==
X-Gm-Message-State: AOJu0YxsbI2QqBwwK7g3zKVgcEdaGmvUnbucU71khKgtgJhl/lTKTDgF
	ofn4p7BM2H9Nj1wTmBNWvEpf5pqrvB/RSb60p17eUujNvwaSt2SlyIvSLkSRqw==
X-Gm-Gg: ASbGncsPy5GIJhKHFWMwvQpXxnp4n0l6ipFYQFckBpC6LsRXaZIiVnQGHeZkmuAvz6B
	7H8JC9PEa2sNoxwTmtO7MndqbQxJlBdv8SM+GwWKZr0/RBFMMyzWTs5w73fFyZeqn4N8bvnya5d
	oSkpZB9S32K1++iZdzTW4xmZ+wtuvNTzd6AHLm2/N6kxxdVNWCZJT5vPVPDq7JwUdBzNr3CyqgH
	hGJ+n/bIRPI53UJj9xWoc6Y3+dG83PRNP3wWMLkLjGMGOlQnWa3vPIbk4cI72BXafnj5oyNPe4b
	/RcKlYvYEhX9sfTIHBm0RLmS6QerhLU/oLCpMhBGTLKqJ6iUTXG69IuhXFryCLarvyI7IXjr1Zf
	XNfq3+yMbVYhGZF7MUOlKo+JD68fDmUsoKzsPyGJiONmGhBU545BmWwoao+bL/Ub9f0bX2ZU=
X-Google-Smtp-Source: AGHT+IFIG+eElQV7a2QACAn8OEu56o7LLFinjr/GIL/nttmYcTZpcD71kAsSm5AMrFIPKerwDnfdMQ==
X-Received: by 2002:a05:600c:1d12:b0:46e:32d4:46a1 with SMTP id 5b1f17b1804b1-46e7113f48fmr27927905e9.22.1759538201369;
        Fri, 03 Oct 2025 17:36:41 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:9d5a:ed00:f05f:1922:a66f:12b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a18b76sm152737795e9.18.2025.10.03.17.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 17:36:40 -0700 (PDT)
From: Kfir Kahanov <kfirka3@gmail.com>
To: cryptsetup@lists.linux.dev
Cc: Kfir Kahanov <kfirka3@gmail.com>
Subject: [PATCH 1/2] bitlocker: Support clearkey
Date: Sat,  4 Oct 2025 03:35:53 +0300
Message-ID: <20251004003554.234647-2-kfirka3@gmail.com>
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

Clearkey does not mean partially encrypted, and may be on fully
encrypted volumes.
---
 lib/bitlk/bitlk.c | 106 ++++++++++++++++++++++++++++++----------------
 1 file changed, 69 insertions(+), 37 deletions(-)

diff --git a/lib/bitlk/bitlk.c b/lib/bitlk/bitlk.c
index bc3a55bb..11edd7d9 100644
--- a/lib/bitlk/bitlk.c
+++ b/lib/bitlk/bitlk.c
@@ -264,10 +264,11 @@ static int parse_vmk_entry(struct crypt_device *cd, uint8_t *data, int start, in
 	bool supported = false;
 	int r = 0;
 
-	/* only passphrase or recovery passphrase vmks are supported (can be used to activate) */
+	/* only passphrase, recovery passphrase, startup key and clearkey vmks are supported (can be used to activate) */
 	supported = (*vmk)->protection == BITLK_PROTECTION_PASSPHRASE ||
 		    (*vmk)->protection == BITLK_PROTECTION_RECOVERY_PASSPHRASE ||
-		    (*vmk)->protection == BITLK_PROTECTION_STARTUP_KEY;
+		    (*vmk)->protection == BITLK_PROTECTION_STARTUP_KEY ||
+		    (*vmk)->protection == BITLK_PROTECTION_CLEAR_KEY;
 
 	while ((end - start) >= (ssize_t)(sizeof(key_entry_size) + sizeof(key_entry_type) + sizeof(key_entry_value))) {
 		/* size of this entry */
@@ -324,17 +325,13 @@ static int parse_vmk_entry(struct crypt_device *cd, uint8_t *data, int start, in
 			crypt_volume_key_add_next(&((*vmk)->vk), vk);
 		/* clear key for a partially decrypted volume */
 		} else if (key_entry_value == BITLK_ENTRY_VALUE_KEY) {
-			/* We currently don't want to support opening a partially decrypted
-			 * device so we don't need to store this key.
-			 *
-			 * key_size = key_entry_size - (BITLK_ENTRY_HEADER_LEN + 4);
-			 * key = (const char *) data + start + BITLK_ENTRY_HEADER_LEN + 4;
-			 * vk = crypt_alloc_volume_key(key_size, key);
-			 * if (vk == NULL)
-			 * 	return -ENOMEM;
-			 * crypt_volume_key_add_next(&((*vmk)->vk), vk);
-			 */
-			log_dbg(cd, "Skipping clear key metadata entry.");
+			/* For clearkey protection, we need to store this key */
+			key_size = key_entry_size - (BITLK_ENTRY_HEADER_LEN + 4);
+			key = (const char *) data + start + BITLK_ENTRY_HEADER_LEN + 4;
+			vk = crypt_alloc_volume_key(key_size, key);
+			if (vk == NULL)
+				return -ENOMEM;
+			crypt_volume_key_add_next(&((*vmk)->vk), vk);
 		/* unknown timestamps in recovery protected VMK */
 		} else if (key_entry_value == BITLK_ENTRY_VALUE_RECOVERY_TIME) {
 			;
@@ -1249,6 +1246,43 @@ out:
 	return r;
 }
 
+static int get_clear_key(struct crypt_device *cd, const struct bitlk_vmk *vmk, struct volume_key **vmk_dec_key)
+{
+	struct volume_key *nested_key = vmk->vk;  // First key in chain
+
+	if (!nested_key) {
+		log_dbg(cd, "Clearkey VMK structure incomplete - missing nested key");
+		return -ENOTSUP;
+	}
+
+	struct volume_key *encrypted_vmk = crypt_volume_key_next(nested_key);  // Second key in chain
+	
+	if (!encrypted_vmk) {
+		log_dbg(cd, "Clearkey VMK structure incomplete - missing encrypted VMK");
+		return -ENOTSUP;
+	}
+	
+	log_dbg(cd, "Clearkey VMK structure: nested_key=%zu bytes, encrypted_vmk=%zu bytes",
+		crypt_volume_key_length(nested_key),
+		crypt_volume_key_length(encrypted_vmk));
+	
+	/* For clearkey protection, we need to decrypt the encrypted VMK using the nested key */
+	/* and return the decrypted VMK as vmk_dec_key */
+	struct volume_key *decrypted_vmk = NULL;
+	int r = decrypt_key(cd, &decrypted_vmk, encrypted_vmk, nested_key,
+			vmk->mac_tag, BITLK_VMK_MAC_TAG_SIZE,
+			vmk->nonce, BITLK_NONCE_SIZE, false);
+	
+	if (r == 0 && decrypted_vmk) {
+		log_dbg(cd, "Successfully decrypted VMK using nested key");
+		*vmk_dec_key = decrypted_vmk;
+		return 0;
+	} else {
+		log_dbg(cd, "Failed to decrypt VMK using nested key (error: %d)", r);
+		return r;
+	}
+}
+
 int BITLK_get_volume_key(struct crypt_device *cd,
 			 const char *password,
 			 size_t passwordLen,
@@ -1261,6 +1295,8 @@ int BITLK_get_volume_key(struct crypt_device *cd,
 	struct volume_key *recovery_key = NULL;
 	struct bitlk_validation_hash dec_hash = {};
 	const struct bitlk_vmk *next_vmk = NULL;
+	bool is_decrypted = false;
+
 
 	next_vmk = params->vmks;
 	while (next_vmk) {
@@ -1298,8 +1334,18 @@ int BITLK_get_volume_key(struct crypt_device *cd,
 				continue;
 			}
 			log_dbg(cd, "Trying to use external key found in provided password.");
+		} else if (next_vmk->protection == BITLK_PROTECTION_CLEAR_KEY) {
+			r = get_clear_key(cd, next_vmk, &vmk_dec_key);
+			if (r) {
+				/* something wrong happened, but we still want to check other key slots */
+				next_vmk = next_vmk->next;
+				continue;
+			}
+			is_decrypted = true;
+			open_vmk_key = vmk_dec_key;
+			log_dbg(cd, "Extracted VMK using clearkey.\n");
 		} else {
-			/* only passphrase, recovery passphrase and startup key VMKs supported right now */
+			/* only passphrase, recovery passphrase, startup key and clearkey VMKs supported right now */
 			log_dbg(cd, "Skipping %s", get_vmk_protection_string(next_vmk->protection));
 			next_vmk = next_vmk->next;
 			if (r == 0)
@@ -1308,19 +1354,22 @@ int BITLK_get_volume_key(struct crypt_device *cd,
 			continue;
 		}
 
-		log_dbg(cd, "Trying to decrypt %s.", get_vmk_protection_string(next_vmk->protection));
-		r = decrypt_key(cd, &open_vmk_key, next_vmk->vk, vmk_dec_key,
-				next_vmk->mac_tag, BITLK_VMK_MAC_TAG_SIZE,
-				next_vmk->nonce, BITLK_NONCE_SIZE, false);
+		if (!is_decrypted) {
+			r = decrypt_key(cd, &open_vmk_key, next_vmk->vk, vmk_dec_key,
+					next_vmk->mac_tag, BITLK_VMK_MAC_TAG_SIZE,
+					next_vmk->nonce, BITLK_NONCE_SIZE, false);
+
+			crypt_free_volume_key(vmk_dec_key);
+			is_decrypted = true;
+		}
 		if (r < 0) {
 			log_dbg(cd, "Failed to decrypt VMK using provided passphrase.");
-			crypt_free_volume_key(vmk_dec_key);
+
 			if (r == -ENOTSUP)
 				return r;
 			next_vmk = next_vmk->next;
 			continue;
 		}
-		crypt_free_volume_key(vmk_dec_key);
 
 		log_dbg(cd, "Trying to decrypt validation metadata using VMK.");
 		r = crypt_bitlk_decrypt_key(crypt_volume_key_get_key(open_vmk_key),
@@ -1379,8 +1428,6 @@ int BITLK_get_volume_key(struct crypt_device *cd,
 static int _activate_check(struct crypt_device *cd,
 		           const struct bitlk_metadata *params)
 {
-	const struct bitlk_vmk *next_vmk = NULL;
-
 	if (!params->state) {
 		log_err(cd, _("This BITLK device is in an unsupported state and cannot be activated."));
 		return -ENOTSUP;
@@ -1391,15 +1438,6 @@ static int _activate_check(struct crypt_device *cd,
 		return -ENOTSUP;
 	}
 
-	next_vmk = params->vmks;
-	while (next_vmk) {
-		if (next_vmk->protection == BITLK_PROTECTION_CLEAR_KEY) {
-			log_err(cd, _("Activation of BITLK device with clear key protection is not supported."));
-			return -ENOTSUP;
-		}
-		next_vmk = next_vmk->next;
-	}
-
 	return 0;
 }
 
@@ -1589,11 +1627,5 @@ int BITLK_activate_by_volume_key(struct crypt_device *cd,
 				 const struct bitlk_metadata *params,
 				 uint32_t flags)
 {
-	int r;
-
-	r = _activate_check(cd, params);
-	if (r)
-		return r;
-
 	return _activate(cd, name, vk, params, flags);
 }
-- 
2.43.0

