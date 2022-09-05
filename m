Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1707E
	for <cryptsetup@lists.linux.dev>; Mon,  5 Sep 2022 03:52:19 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id p18so7924541ljc.9
        for <cryptsetup@lists.linux.dev>; Sun, 04 Sep 2022 20:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=xrPO0at99PWxLhzNZkjK0x+GgLdqOlDAbwNCAkUix94=;
        b=K97oVcMxq1tLk4S44HZrTU4erH70EuDnPcxJAD7ZxRSvrrFak/V7PE9FxW1F8wlWor
         EqJ22ABP5H8uh1LrMLwYVZwNoYYcgbbQjz9RQj9awraDq+LiULVLFS8Slfj/pwfqNar+
         hCIvPzHrdOlPfVnvHgoBJ6AWF2Rd9hG/Gwk8KB83UIFOyKyH12B6VsL4s5CYZWetz8YA
         73vwwbARtS3md/l54DcOQUtoiVBsNZ0Pt9ZUey0ebDtXevvoJjqxl9KgpV8E/4r/soPq
         5plx3+bP4nK4bNV4C61KcG2cxcvJyfLmqMAVE33TEvC0QkYhnCkglIMdapLf5iKRaiuO
         15/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=xrPO0at99PWxLhzNZkjK0x+GgLdqOlDAbwNCAkUix94=;
        b=zzZHPxbVcSkP6WWI2xo2iDwNaackE8VwhKQS+8vSz5nq1yRhptBMd6J7Xgd3X22u5O
         vAwIAGv6gsixUZT/AeARrORkoy1FQ+xU+LeT8/nNvFNWI6bP2OzGKeNXUUGUDubhPqlG
         9a/vrrFHOFfRyleVoNjI/5mmnPgfY9rurAxmFKka1GL7Br7f1sCUhp8cz7PUeTXWzJ29
         2MeeJVzgBuIo15H0+ieMxgYWzGZ0dUaltvdjhM+3qVDzXL7kopUXaeHK2UglOv4GlJHz
         TUZ1ZZR/G2+yiBBtfs9V/dM3s3gemeJYikgTSFDAiuuDcJ5stPg/uJZQAyFyMw4Ur9aF
         4ZfA==
X-Gm-Message-State: ACgBeo3VouyYNJjQ/vsSaA/D1uua/pPXouWG1NTUwXShjr8xp+WGc/D4
	N+ugu+Kz2zL8vvjtBrLBxrvIfjv06+3EClTT1JMy+J4reZo=
X-Google-Smtp-Source: AA6agR5r1zb0zMcD2o5Rx8ALWItvCFsie41uKLYJkHPy1HNAb14u8/r29kl9F6RA4Pp+v97y4PST1GJLdPcnzNOCbBA=
X-Received: by 2002:a2e:7207:0:b0:269:1f9:6365 with SMTP id
 n7-20020a2e7207000000b0026901f96365mr3198517ljc.201.1662349937652; Sun, 04
 Sep 2022 20:52:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Krist=C3=B3f_Csillag?= <csillag.kristof@gmail.com>
Date: Mon, 5 Sep 2022 05:52:06 +0200
Message-ID: <CAEBTHXYF+90eqqOnrW7M9BjiGomBCqj43xbQ47WBNam0-krbAA@mail.gmail.com>
Subject: performance and threads
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Dear all,

I would like to ask you if what I am seeing is normal, or it's some
configuration problem.

Short summary: reading my encrypted is a lot slower than reading it
raw, while the CPU is underutilized.

Detailed version:

I have a RAID1 device, consisting of two identical NVMe devices.
On the top of the RAID device, I have LUKS encryption.

These are the read speeds:

- Raw device read: 2,3 GB/s
- RAID device read: 2,3 GB/s
- Reading from the encrypted device: 1,6 GB/s

As you can see, there is a pretty serious performance penalty for the
decryption.
The cipher running is the default aes-xts-plain64 cipher.
This is an AMD Ryzen 9 5900X 12-Core CPU, so I'm not sure what this is.
What is even more interesting, is that the CPU doesn't seem to be all
that busy during the reading. as far as I can tell, I only get 4
threads of kworker / kcryptd, and their total system load is less than
100% (of 1 core.)

So I'm getting the impression that even though decryption is a
CPU-bound process, my CPU is still underutilized.

Is this interpretation correct? If yes, is this to be expected, or am
I doing something wrong? Can dm-crypt be configured to run the
encryption on more CPU cores, with better performance?

Thank you for your help:

    Kristof Csillag

ps. I'm on kernel 5.19
