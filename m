Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7AD319847
	for <cryptsetup@lists.linux.dev>; Thu, 11 Dec 2025 18:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765477481; cv=none; b=PXj0qlIitTUrSsJHNk9EhcVpFC4p03QPMJmHRjTaQUizXicRSTmw0u+JsIVNOPI3YrJo+W9wngqYmILTTtPeBtdPdAdXWmchURyqC7uFKzUp+LJpko/XJ8v/DutDMRy6jc3qlD0Q5xSXSCR+CKeVhgxJiFnSBvEAeCuJt5kNLXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765477481; c=relaxed/simple;
	bh=EDMOplte/tGjhTTSCm/+jZSsBCs02rA4rbpme3uwP5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6EtJFYAn023yK/LneVxpp3GJD/Joj4fu9QZTHXFy7ZrnEp1jwf0tzmrpon25pr5YtksCBs4R7P2Il1SS1ptJXB8vCXBndf+LOoWtsFtv2odFFCB9zyW0BNgRn1y9x7IcBE3RRcblTzmjuMePdnXTAn3JA0+kLL3S3jLLcquB24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oej0AlI7; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oej0AlI7"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-597c83bb5c2so352403e87.3
        for <cryptsetup@lists.linux.dev>; Thu, 11 Dec 2025 10:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765477478; x=1766082278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFrFvBFoSBllsimam77yErITX9FHt6tAqE6M9ZfsDfs=;
        b=Oej0AlI7iPp9ifY1Eu2oY5j2laoexaL0OBCeQOLqtXhC+s0HaJrMokfCCraxtQfknW
         T99V06W5TnX1XtSD0vsArtQp9TFIw2CEWDqCP0bjQt60sxCfcO9B7x31Oq/t+3xtibhQ
         oXX1gpVLLYHZZskUEzMLwo/uZvYvF6+5lN9UAUCnE9JBTGqSqbZGd03iRY1r25qXE8ZW
         KajLTKe6zFk+pi24W2VL0a7wal1xm5OfE+ag/ljFP/AaKIo4Qz1/qbgRZReO/yY3zZ6a
         5DOSpWX5Cw1MPGfvSStEc/09zB59BcpivOLoXxsbqt9T30b71lIoS/T7BWCud4wOyh+t
         gD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765477478; x=1766082278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JFrFvBFoSBllsimam77yErITX9FHt6tAqE6M9ZfsDfs=;
        b=Z9YGoGIqjiAzOagImZMh5uIUMTU54/+8tGaeJCRFvr+g/YDIC+E+nSIZ3GtwI/0ikn
         pSMJNI1oc4raGTLgFNAK+wlR7UZWn2Afu+T00W5djqEleHJhEYRmlUjw6VxiI4HSaBvm
         2ql8snV96bR0cR4r/8Py5RNl23jrkNuqY6GyiAHSL2msVRvUwdolcE26xDeUESubUWiB
         68sFeF80d2GfkiB7yBWQ5z4kC2t6sC4xXTSs7gwaedVbAXt9ja0C52Dz05P55lZBE/PP
         6KmU4b183HILWeXRPIJPZLP1b4h/MLHRTN2YOUvGbUjXZZHCeGXD0lcoDIvm37omFxNv
         5IDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfUgWQhcJdpPSa0cFdllLvAOv2yoq2WJcBOpSi5fGtXGGPE71Dgsg/Yvt1d9Ni/6HmVcQhGdbKMQrh@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0ZNGxrl+ooB0rWq54OfP+dEXQGqo9bdiKI/raUzrTNEJMI4kR
	aBpTXWU9spZGSm9wnPFqkh92mM9K0ib8l8+cVkkN+TGUTN/Gn3XjqqOy
X-Gm-Gg: AY/fxX47Z8UdZ0z8pSzfmpe2YU3c74lKB1qz18bOPozd+8GyRMH9KL0Mj+aW2dtNFh6
	Ddcuno8JHZByF35jI+8QKq/4HJ4R8lp5Er3AFxGi3cg/4vfPkjNNLrnMCO1zmtm/FACC7C8wbUU
	eibIYEu+GSo+w0p/7/goQseplSriIo0Ux1P+aDEXfhlbg2VY7zwv1jqjuLqqH4U7OxdY3BA0p63
	orNRhkF49s4J9OJboMeI148dBUT5KueKWGlv8QppWbb50J0RBZpIc5X56qLSNzrbDlRfDNJwOUj
	qJUGGVG5mO0TKxFo+mz+46isym3DmSyBfiOMp5JrU4hF+ErGjHTKGPgKjMEdFlwxeeNg+iMaNzH
	i4lY4rVpd3XftDzOmhJqtaGvHDqJNAV9CYOwwVPBZ/P3HfLp8NVSUrmLPgDNvH2QnNYaT5jJVgV
	Ze7nT3KuPeTLaIz4DEpzQ=
X-Google-Smtp-Source: AGHT+IFVxKB8gDiBMiJbinTn0xv4lsyliE65oXrRemLZRXTKoRg4ZE3AckW0VEdwuOTGsUa7HltYPg==
X-Received: by 2002:a05:6512:3089:b0:598:ef2a:448e with SMTP id 2adb3069b0e04-598ef2a4493mr2784604e87.10.1765477477520;
        Thu, 11 Dec 2025 10:24:37 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-598f3195189sm1060918e87.83.2025.12.11.10.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 10:24:36 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: mpatocka@redhat.com
Cc: adrelanos@whonix.org,
	arraybolt3@gmail.com,
	cryptsetup@lists.linux.dev,
	dm-devel@lists.linux.dev,
	gmazyland@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: Hard system lock-ups when using encrypted swap and RAM is exhausted
Date: Thu, 11 Dec 2025 21:24:29 +0300
Message-ID: <20251211182429.3300562-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <3f3d871a-6a86-354f-f83d-a871793a4a47@redhat.com>
References: <3f3d871a-6a86-354f-f83d-a871793a4a47@redhat.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mikulas Patocka <mpatocka@redhat.com>:
> So, this is what happened to you - the machine runs out of memory, it 
> needs to swap out some pages, dm-crypt encrypts the pages and generates 
> write bios, the write bios are directed to the loop device, the loop 
> device directs them to the filesystem, the filesystem attempts to allocate 
> more memory => deadlock.

Does similar thing happen in my case? I. e. swap on top of dm-integrity on
top of partition? Is my use case supported? (I'm not talking about
hibernation now, just about swap.)

-- 
Askar Safin
