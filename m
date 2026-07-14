Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A875A364038
	for <cryptsetup@lists.linux.dev>; Tue, 14 Jul 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024874; cv=none; b=WPmXnt5LKZf9ev5BNAMpn5SkV4c+K95A4OK6k+ERGIJ8pdvv9YBBJdWLIilhgabxP1fVRGPYNP6/IsYGtoDvNwZeRvW9K1ujGdGyhlgXTMH8U3nepRNL+O1NDSFg840BvT5GH+U/J1ygokJ9ziq8P4l4QxDI7Nel51YX58DVf9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024874; c=relaxed/simple;
	bh=/fF/T41pC2nqWrQ1NcarZZJwsxqUbxIUF7dgMv+XM5M=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Content-Type; b=PnMpDQBVttKhQ8HcNRn8sJzqxtbLz55WzLyLKhGfez0E4v0b2DHYu2rQWRl+SQWwJmaytnggKFljeE+pnxhxa4S+3G4VBbiL89f3ka/8rGWJJK3IgVfR9MjDQYH4uWL8DMt0pS4eyMsOQTut7rJGX3gXK7Nu/GNuTRZhNSSIbbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=johan.melkonyan1@web.de header.b=VCoxcK5V; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=johan.melkonyan1@web.de header.b="VCoxcK5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784024865; x=1784629665; i=johan.melkonyan1@web.de;
	bh=/fF/T41pC2nqWrQ1NcarZZJwsxqUbxIUF7dgMv+XM5M=;
	h=X-UI-Sender-Class:From:MIME-Version:Date:Message-ID:Subject:To:
	 Content-Type:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=VCoxcK5VmvZOqAIGrM5UDEBvVwXbWnjQMrIdGtmvMEx/n64sa/4TsGm5fcr2et2n
	 bPBN2ISZ6sE3FkY9GbkIM0/wBVw/b/+F06boi76sAca/KQ1aGWM/cc8PGWq2c4V3Z
	 Rud2M4iksbQb9IsGLn3+Aq5v1UDglIDZ307IKfON7kdeILGik/VBSoGqUN+ceu8eC
	 aje7eMVxeP1dZqKlMHJqOrtIRlspRI0+2niYrsvGbfP8DWlI9X0+PuCetDJCK5NuJ
	 trfvk987sFB4pXHeP6I0odDnKevbUX/UoKE82pESG0IViu0Ldg2W+dK7Bn6ycGzFr
	 bLBTlMeVu6gEPWOJ1A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MiMAO-1xCsmE3LxG-00eDUQ for
 <cryptsetup@lists.linux.dev>; Tue, 14 Jul 2026 12:27:45 +0200
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-664cdeab266so5978124d50.3
        for <cryptsetup@lists.linux.dev>; Tue, 14 Jul 2026 03:27:44 -0700 (PDT)
X-Gm-Message-State: AOJu0YyQkJ0a8dMmEM26v6xSvf5ejDCfzBL1onarlPPD04f24z5tz2EI
	Ac6BLAZgmSh8xQHv1cmFNiOD5Ktp8ZUtwR25Q7/T0j7mkUsV1a8PLygJKx+RNbvXkF+3OYOOVEy
	eLMk82pVCwRoo0vQdVy9wokeSiwZmo1c=
X-Received: by 2002:a05:690e:bc4:b0:668:ba3:fc02 with SMTP id
 956f58d0204a3-6680ba40343mr283263d50.79.1784024863540; Tue, 14 Jul 2026
 03:27:43 -0700 (PDT)
Received: from 374364070962 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jul 2026 03:27:43 -0700
Received: from 374364070962 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jul 2026 03:27:43 -0700
From: oSumAtrIX <johan.melkonyan1@web.de>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: FlowCrypt_Android_1.6.4
Date: Tue, 14 Jul 2026 03:27:43 -0700
X-Gmail-Original-Message-ID: <CAK+fmzxEkGy+8X9BAwFKyU415Z4xm2uHfL+yaah-U1Rkw9YDYA@mail.gmail.com>
X-Gm-Features: AUfX_mzHVaB49uRD8k4cyd6tZAILyDhom-zjeKV5LKmU82jNIyb-YNB5djnvx8U
Message-ID: <CAK+fmzxEkGy+8X9BAwFKyU415Z4xm2uHfL+yaah-U1Rkw9YDYA@mail.gmail.com>
Subject: Derive encryption key from PIN
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:z5GZuwIeJHYFpkxVyJlpoyH0k3qwG7RPH17vdjpKDxKhn9rAfvl
 zttCmsoy7tzlmmQk7T8O6sn80f0DCEgz7U5qnx/wUYoA7fj8F3bmY8kDpbwUiNxCElt2ksV
 BoaU+xRkpOLfwrfSf2FAO4dz2fAmq8W4jMO5C+5E/X1u8mqPbQYaa7cXw6B+hPQHdMu1lQv
 lqyzs2i8xda3mvPnr0lfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qtu1D7fJlcg=;7/q44c1AVfxKboOKUvMEmNQdw9z
 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

Hello,

I found this email in the README of the cryptsetup GitLab repository.

I am reaching out because I noticed that the PIN used to unseal the
decryption key from the TPM is not used to derive the decryption key.
The PIN is merely used as a policy, when it can also function in a
cryptographic context. The sealed key can further be encrypted with
the PIN, so that even a full compromise of the TPM including the
sealed key does not reveal the decryption key in cleartext. According
to
https://www.sstic.org/media/SSTIC2011/SSTIC-actes/bitlocker/SSTIC2011-Slides-bitlocker-bordes.pdf
BitLocker implements a KDF from the TPM PIN, but it seems to be
missing in LUKS.

Sincerely,
Ohan Melkonyan
