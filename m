Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD7F7C
	for <cryptsetup@lists.linux.dev>; Mon, 29 May 2023 02:03:02 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f6c81cc112so31301251cf.2
        for <cryptsetup@lists.linux.dev>; Sun, 28 May 2023 19:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685325781; x=1687917781;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LcDTCNBBLcLACkU0xM7m65KCfqwk4YULIfOYOpS0OU0=;
        b=eccW/geb/+qPjndqvoHqB+B/pU0deER1KH3WoktXqQyTZRx8pVoWEj4ok8Me67Y5mf
         Fr4n4mcSPvrbQl5iZjPZ/Bs+NFd/H7t3m2XgorpyWAUe/0R+oF40JRNKRbK7ug6kKd9u
         ON3CBGdDNib7iP88Na+6fJyATYqFQCzXQ/TNNJ72n43ZGt4mpDObTFwrGz0viIw9CPG+
         h8K0HKLv+gsDfm09nEBgGOYrO4vUI+kH0cshGIsHRDWbNiPhqGC/AD2OS7E6Kwr/Bfg0
         w/0mvY4Hrhg0LMCHJVnEfz+kqcdfr9Kyl1h3TTxd2AZZadQ0M3etGwKlhCrlsRoN30Tt
         ob2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685325781; x=1687917781;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LcDTCNBBLcLACkU0xM7m65KCfqwk4YULIfOYOpS0OU0=;
        b=cqNoiEhWXyTW4tQ4r7czD+qWsP7Y9hBSpplOKRStic0MOmc5VKJD/zlGRPFBC289NJ
         ts4KMM555ro/xYXYNfmuXQDe/oceOumMwOJw6HovhkxnM/rXBJ+Baumqz1q8w0PDDpg0
         jsfVf3VO5BC316xMHZTjz3ccnJaA62Rg74wlqNQUqg2I/lcnYYV1YqgwQU2oG1ow8PlL
         liHw9ngn2Tg6/ErfhyuLTWCn5B63LHGBGJeEQ21OMtvNNqRnHKTuJQRfEn4Y6OSRwxWn
         +5XCXqBDU44O0aElzVmJo94BasvpIE6TEHtFMJp1P6u97IszdK3OGqU5mznGtCLxZpr7
         ErOw==
X-Gm-Message-State: AC+VfDxs0v8ms+My6sjDV6Bn7d8pcWjWQqN2Yb+Y4FBtErXw2cE5Fa8C
	3l+5iVA578gySp1cLoilWZa/btGzLyKW49jSidHySK7MrGSraw==
X-Google-Smtp-Source: ACHHUZ488tSCCg1O5cLlnuzM8iXh5FuQFO25Gk0N0i+bhb6gIdAvD7MxsP4i2IbGWBT13Kcrz7D9K7/v9bLAVIDy1SI=
X-Received: by 2002:a05:622a:2d5:b0:3f4:400d:5249 with SMTP id
 a21-20020a05622a02d500b003f4400d5249mr10377527qtx.67.1685325781141; Sun, 28
 May 2023 19:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Russell Harmon <eatnumber1@gmail.com>
Date: Sun, 28 May 2023 19:02:35 -0700
Message-ID: <CA+zrezRB-PewcH_-h8PZmGOc1RVBwdS-uReago8XXLkVTw+EDg@mail.gmail.com>
Subject: DM-Integrity Under RAID Without Journalling
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey all,

I'm looking to use dm-integrity with its journal turned off as the
backing devices for a RAID-6 array. This is with two goals:
Closing the RAID456 write hole (md.4 section "RAID WRITE HOLE").

1. Detecting (other kinds of) silent data corruption coming from the drive.
2. The resulting configuration will have no journaling (both for
dm-integrity and for mdraid).

If I understand things correctly, it seems like this covers all the
cases I listed. If there's data corruption (either via the write hole,
or coming from the drive), periodic scrubs will detect and repair the
corruption (since mdraid will consider the corrupt data invalid).

Does this seem like a correct/valid combination to achieve my goals?

Aside, I see the value of dm-integrity's journal (in non-RAID
configurations), but what's the point of the bitmap? It seems like
that just reintroduces the potential for undiscovered data corruption
on the drive (e.g. if there's data corruption in an unsynchronized
region, at the next boot the corrupted data will falsely be considered
valid).
