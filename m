Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E524DDB5C
	for <cryptsetup@lists.linux.dev>; Tue, 22 Sep 2026 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071594; cv=none; b=KSl5shJCPekgK5NnXJ2yKsPvFe2zlY1fFRphTiOHpeMKh8KykyKCOkxCqG/+va8FbffYES4jaym05uKZD3TtAV4IruUxr82AT1xRw0PEU53E+rAQ1GVLerVOxywUrcMQpgKUajUK7M9FVUWI1IrwB98p/M8uDPBIpaHGJQa4hcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071594; c=relaxed/simple;
	bh=xhtr+TEwX4KPyZHnXlJdDXouchMlPdX9CdoqLNsFmYw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=m1JyZ09Zz2bRMfjg13MDjl1iE6lufqii/7jkvMRspwREMKHL0E4CRIwczwUyAF73b1rxWJoE1u/gvXdMSxLuP5RQmacI4Wr7rkUV5tbe8kE+G4nEKavDZKEVrteqAvAf8mt4Pkb+QwP1xfzBUJ7NCxL8dMYAkqQe3N3eHD1YkJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8Yoh5sm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8Yoh5sm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d0726cdbcso2123045e9.0
        for <cryptsetup@lists.linux.dev>; Tue, 22 Sep 2026 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071591; x=1790676391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YCS1UFOnTpwAxcMdPGUUbMbRnIPDetL/Q8BvtS7dkt4=;
        b=D8Yoh5sm7Nk7xcm5O+htPB0Zl5v6fF8f8fIhSVRzC4xa9p7lXw4LwNLBAXA2WG4jo/
         gfHaM6W6kJe7F5jRHVIl8hE7lNxCJJLRFOXcUINtBdyPqBiBSpN7P/v4dQV5f8HAVDKn
         y/8QoRw6KvRmwTppB2y/izvhAVke91tlUj1FkVKm7+KTersU2y4RtJCXJlZRW6lZ+oJf
         lInDOJSkyVvlMxPRyBlUNTmhOn5eXzmO0Wm6VqgVzOsddkc5L8rYNzLyIv43bBay8wxV
         9uhbZtoROV+3ClRIQ+BH6VXjyjunBU3hgEL/bLdS0OnocUTCrR3LkSHj7h+//d2Fze8L
         U/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071591; x=1790676391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YCS1UFOnTpwAxcMdPGUUbMbRnIPDetL/Q8BvtS7dkt4=;
        b=bO5d1ly3MIDIaHywx7ly1nt+ZFVC+rwOMqYlZxq1mg0fPiSyERW01R8dUr8WZwC1Zt
         QzCJpaUei7Z6HY1Kf8fljuD7xdivEObTUwHHUS95pJsGBWojFm3IiBRpBcI5+sGH8dUA
         5E84aXNcIIQOk/eMCdWeaZWCYrJoQF6vkNmomoqzAMCz90SJnHLvsdCZsfiYB2LGoajg
         VO68F03xfFBy8pHMQs801u0ooGLEw8u+2+qFRNNd/LUbY2szNVJdoztWnleY3ZTnQz1t
         /YMFyVaGqSAX5JDLXgNtA6wHYwID+nh+5ELtjf2T0A1eijUIsbzSnz0u1yuq9wMS+A9B
         I1WA==
X-Gm-Message-State: AFuF++l8xkLbkjBskmqrm5w9my3L7ILG1JDPnuSJS0tdnZocAB+S+g6H
	/lYqg3zz6vOttK0d3bf64/Mj9Uv4lMwd2nk9jDfYz02srV1vj5ipeMOEQrB6UA==
X-Gm-Gg: AYBFou105HQlaaIWtI1Oo7LPd12YUTl0Y9ZEWdQDmYGF7T6NLWzVrdXmwAQqiydemwc
	WLo5ZBZOQfdGPhZD6r92Rs0m00wGKlKghiMdJ3H9HaL2wjnmj0Uq6JBqkxlC1nmW5zXS6zIsyBj
	Nz/ZFwKSc35LdvGdXsuAbd1lcqZmQoGb0adslRztJ0ORQPhFt/RsicAS4dAAApnW7tYS6XSlft5
	3ekIELLBI3hAMYoUVI1IFdR2jDF2KDdgSVPEq69r50jfVrCivvCHx2Bm9TPcAm+KJhs+HreMBwE
	IbYyC7GU/bnN9irBza/mrNpkpsqHJl3oo1Asa0OqIz4uZaegJjV4Xo8kxzbOCltWC4RVczLc1Yo
	XrKBWkIbjtU8ShcugPQvF/PeTl2OYvSdmD5Q9W92zhWErZM8E47PgsIsiJ8XZzifumXjLvh0k+R
	u3vpnU5ijbjCl5DYlAJX3gHfN3CC86mX7+x991WSmiQ50j7qWIJidRT/zWKiyjqGttlq/Uz+LWO
	z2fV70KiCV1zUiA5Xg=
X-Received: by 2002:a05:600c:6992:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49fc7b7a756mr233791995e9.0.1790071590877;
        Tue, 22 Sep 2026 03:06:30 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaafa9cfsm44065645e9.4.2026.09.22.03.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:06:30 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: cryptsetup@lists.linux.dev,
	Milan Broz <gmazyland@gmail.com>
Subject: [PATCH] Reject LUKS2 header with out-of-range encryption sector size.
Date: Tue, 22 Sep 2026 13:05:54 +0300
Message-Id: <20260922100554.28692-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LUKS2 keeps the encryption sector size in the segment metadata.
MAX_SECTOR_SIZE (4096 bytes, the smallest page size among the platforms
cryptsetup runs on) is the largest value the format allows, because a
LUKS device has to remain openable on all of them.

Writing a header enforces that, through LUKS2_check_encryption_sector(),
so cryptsetup never produces one that exceeds it. Reading a header does
not: hdr_validate_crypt_segment() only requires "sector_size" to be
non-zero and 512-aligned. A header carrying a larger value - after
metadata corruption, or from anything that wrote it other than
cryptsetup - therefore loads without complaint, and luksDump reports it
as a valid LUKS device:

	sector: 65536 [bytes]

Activating it then fails, but only because dm-crypt applies a 4096-byte
limit of its own. A constraint of the LUKS2 format is in effect being
enforced by an implementation detail of one kernel target, which is the
wrong place for it and leaves the tools reporting such a device as
valid.

Check the limit where the rest of the header is checked, so that the
same rule applies to a header being read as to one being written.

This cannot reject anything cryptsetup has written. LUKS1 is unaffected,
its encryption sector size is always 512 bytes.

Assisted-by: LLM
---
 lib/luks2/luks2_json_metadata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/luks2/luks2_json_metadata.c b/lib/luks2/luks2_json_metadata.c
index c532576..bb88846 100644
--- a/lib/luks2/luks2_json_metadata.c
+++ b/lib/luks2/luks2_json_metadata.c
@@ -555,7 +555,7 @@ static int hdr_validate_crypt_segment(struct crypt_device *cd, json_object *jobj
 	}
 
 	sector_size = crypt_jobj_get_uint32(jobj_sector_size);
-	if (!sector_size || MISALIGNED_512(sector_size)) {
+	if (!sector_size || MISALIGNED_512(sector_size) || sector_size > MAX_SECTOR_SIZE) {
 		log_dbg(cd, "Illegal sector size: %" PRIu32, sector_size);
 		return 1;
 	}
-- 
2.34.1

