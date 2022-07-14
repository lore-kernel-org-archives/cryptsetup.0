Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25537E
	for <cryptsetup@lists.linux.dev>; Thu, 14 Jul 2022 00:18:22 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id l190so161410vsc.0
        for <cryptsetup@lists.linux.dev>; Wed, 13 Jul 2022 17:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=xM2lBiU0rWc2Wnl1S1ug5lxnK5xxpxBk+26ksVa1tfk=;
        b=ENo/f2OmjwesCJPDPidyT4WHhGX4R/BLMNQWB4meaX0mlX/A8zsqixX/0JoAn7hhh0
         qoDNN+11lTJNx+WPqWcD469wdaNJvHydqZxV9WibF0WP7N87uStIEM4IbUBpZjpppuDU
         oVRtRBX2Y+Lf3zw7T7Ff37gy6sf9U14EKMMeKA3QSlAL2Jj5bdBqSmN6q6j4gHEqqtPB
         HRi3w4KkySyytxjF8W9nc/hSizfin16Tps69VU+tR6xmOWfP9H5MPxsx/W6pzOnxl6JJ
         QLGWgWsZJGty/QWDTHqDwuc6XbVOTNwzaGmoPssU0qgNBNsOChmO1gQklR2bCC6g+I9Z
         QpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=xM2lBiU0rWc2Wnl1S1ug5lxnK5xxpxBk+26ksVa1tfk=;
        b=KMm3JaC8LP07YQow9zjtvhd8HP3uzPWlP4UjIhlPfYxTMzidXIK83pc0oGUDasnqBW
         4F1VgLja40FR+RUq4nlCD7kWG1bIhfHAdOdaC4Ge8qdOI0EhhLYF9piCfFntwrfn5Jfx
         awt8/qddBBQxJmiKxvcfmMF5TP1YnmzzGb8iOuGe9TlaVO4+ePTBKjz0xuKLlXA2o8we
         Feja5+HMqfqhTdAZ3yRr0C8Z5uigHLTXpu7c+ecqFPZ7SLK5VOp7JSXmzc8+MvYZDiDT
         VbOq8grbshdsrGvaavxTuKH0VMaivP8q7HGybw9X3uYgdIQOjAxVeU4AihgRHQbkNVPh
         4c+w==
X-Gm-Message-State: AJIora9xWmXc7iUcVI/P6GrIg9gWfpCSMo2FnEhKuqi4Y8rMAJsJtR37
	1C9IyOyk+Gk44VjBApWne7H55c9unIgbpJVvv8hcWGzvohGdeA==
X-Google-Smtp-Source: AGRyM1vZAFMm4wzqXKTiKzNCDOhO9yzQelO9j3g6U2A1PyWoQ4Tu0Dfh/48J1ZPc7R9wz+o4ixML9vEVDO4+CCBQTdE=
X-Received: by 2002:a05:6102:3e29:b0:357:77e8:badc with SMTP id
 j41-20020a0561023e2900b0035777e8badcmr2744190vsv.20.1657757901424; Wed, 13
 Jul 2022 17:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Mois=C3=A9s_Pineda?= <mois.mp8@gmail.com>
Date: Wed, 13 Jul 2022 19:18:10 -0500
Message-ID: <CAOwzBqg4UGQOhDGDDFHXDh-aAdMfOJnLhoDZLFpAYNfZ6GsvGA@mail.gmail.com>
Subject: I want to decrypt mi PC
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I'm using ipop OS, it's based on ubuntu and at the setup of this it
suggested me to crypt mi disc, I did but actually I do not have a
reason to, so I decided to decrypt mi PC but I don't know how to.
Can you help me?
Thank you
