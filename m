Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C50F64F
	for <cryptsetup@lists.linux.dev>; Mon, 26 Dec 2022 19:13:59 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-47fc4e98550so16888997b3.13
        for <cryptsetup@lists.linux.dev>; Mon, 26 Dec 2022 11:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A9aMH7+vm0Y+BReRGTHui6aqxFddkn88WReGonvbORQ=;
        b=Ba3d3RGlY7oZS0U9ELPKZK58iZldPuqjU25DjdkLqyjIsWHYG55TpkRilHZavaUaJR
         iw509idP+ZfyA9JgeTgQ1zBoc6H/sg6oLm78pFTA1kmBkk4jS4xTTJF4dsu3PUkK8rjo
         9QwGcHknWWsH+Vkb3u7zf4cTg/zBbUplCOcRQ5pfWy2tHf2nqDU2iOZ0F6ZiBAQDRWCP
         8wbDMHtHkDYmSPd6LYUaWSE1ORRrkXVjKi58JsK3JpFgUYFh0fOe71kaYTGWGdTi0IU3
         aK3eH+mfUNGhWFZ5GcvdUI5dFaE7VV0HibAHJU9J2TZ8jr5CiR4VjIykVVY0/q6wwNHV
         Fvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A9aMH7+vm0Y+BReRGTHui6aqxFddkn88WReGonvbORQ=;
        b=oIkWaLf+1TeoSef4pkwgUYoAwodW0+0MqD2e4s77nvVRBbGGlmyHFUqbtyxcWInkcP
         cpAH27WZi+UqG/GAJwsN0pTnBg+Ne9aWc6hJl3VYGFapxqi+cD767NaJpuYH2JZsAsZ6
         j/U5JfCSYWOgQyR74ZN8DxElJJ3I4446uu5sktFYPv15ddzrA+qSx/ej07+TNI/nDvoU
         q9sfXqrrSGYHPVjPcHgjmLmKxf1a423owXR4ZVHk7Mh4C1nSvjcbigNVCXcI4dXdyTc7
         pxBREcFseKjW1yn2K6Po2lCGwGSEUSO3QMwiEU4+i3LacPRfActjpNr0uoMKhMyCcuw8
         K0Aw==
X-Gm-Message-State: AFqh2kpBWuQ6IKjE0hYShI7hWfFl9HWmMQM+HT+2F5zmRH2GIqukOhUQ
	BxvUS8xmB+zyoxjvzflpGdw2S7uFQuVcuyGTTYNyfJRh
X-Google-Smtp-Source: AMrXdXvt+wtuNVea+f8MAbdTyMNNFzkPouer+JyU7QDbECvZ6Z5qxIcJRxuUnFgUG1Ipf4FMIuq4KodU9dsHlMMjI1w=
X-Received: by 2002:a81:8886:0:b0:367:7d5a:3403 with SMTP id
 y128-20020a818886000000b003677d5a3403mr1347329ywf.148.1672082038629; Mon, 26
 Dec 2022 11:13:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: John Smith <dingrite@gmail.com>
Date: Mon, 26 Dec 2022 19:13:32 +0000
Message-ID: <CA+5JoNqEPTTCAppS8EFDwBVtkfK8f_xWhf3ZYE+9bAQRNca4aw@mail.gmail.com>
Subject: Are the keys of mounted encrypted disks secured during reboot?
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

During the course of proper shutdown/reboot/suspend-to-disk, does the
kernel securely erase (or at least free memory of - as it pertains to
init_on_free=1) encryption keys of all dmcrypt/luks systems which
remained mounted?
