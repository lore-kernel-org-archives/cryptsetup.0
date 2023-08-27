Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F461428C
	for <cryptsetup@lists.linux.dev>; Sun, 27 Aug 2023 23:38:17 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6bd8639e7e5so2016115a34.1
        for <cryptsetup@lists.linux.dev>; Sun, 27 Aug 2023 16:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693179496; x=1693784296;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vj/N2WSTXCFGFogzcsE/z91vZ2oV+9u+0xKHQPVlTOg=;
        b=Wj3mL1CC33sLJFHSmmMch1oqM6q80v17TeVEnKIFmP7IB0qAEDdM7UfcfnS57tq9vx
         tY9ymNtPwx8l+MbmKTcQTuz6L2hANMnnfsuIJ0usG+X5skiQlueU3EoynBVZ5vFzgZ7W
         Kl5D3ZIqO8Foq4x/I+RvVvkCl3Iy2bN8auT4I9zE2T4AlfUTyaHKP6Sc9XYD9t6MmqH6
         aL+cvNhlePqITIDidzqc8IYXi96kCpeCM7o7L/jAlHncUdxD1GIzILY5WmtE67FPIlS/
         KezLyRf3WponBjjkkquItvVHolDAmFsvUKOaI1eZkSQ9o/yY3fjUQlUjS/UhpwpL61+E
         5CwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693179496; x=1693784296;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vj/N2WSTXCFGFogzcsE/z91vZ2oV+9u+0xKHQPVlTOg=;
        b=UpHqRR5FCnL5ZYo0/MqgAidD6/QVVjyMk7jdptRE0yZ8wV7QD3fzunJ5YRNKL7+m2h
         VfrSvt0MrJuDtqlgELAhK9bzxMTUWgsfevsRFeQQ2pK3XhSJLzN7seO7CWtxwgFTSpWp
         ePF9uxan8Cr+q7008Fdw2a2rOE1u+QvYLpR+evKxHjFMiPENet8j8ZAmAo51EF+dTV+z
         Ke2dol9ZhCBm0pfU1WAuFLc2nnnoaIpcuLPoOraCtTQcx9sAGPczK8r9XTLVdY7EYHEX
         YhkFQ7QEHNb0Am5UfawXesjDPyQUFHAltZWfWqBTIWjvRYBGiLVRKb+kFulOzj+Da9SF
         4pcg==
X-Gm-Message-State: AOJu0YzBOFTwvk55fGaTRmlbXm/+ETsjSs0APhIAiFNLkSCw1SA7k55i
	2keSjaDzjDJic/tNqngjbg2k0cUXPwT4f6RWrfwejfq3fyRc
X-Google-Smtp-Source: AGHT+IFXGgH0DtqJFRCpEEhp2IoOfuUtYDyD8eaEaH9SuIGyafi/m87Xn0WMGex62jZEFPQ5M4lFZLbNWOU3gnlwz2E=
X-Received: by 2002:a05:6358:4285:b0:134:d467:b751 with SMTP id
 s5-20020a056358428500b00134d467b751mr24403423rwc.21.1693179495800; Sun, 27
 Aug 2023 16:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Fabian Stargalla <fabestah@gmail.com>
Date: Mon, 28 Aug 2023 01:37:58 +0200
Message-ID: <CAMEBZxWhAmwuJqpvtk0mh5vceEp_9AEs46DKC94vGQkrqW6uCg@mail.gmail.com>
Subject: How to use Serpent
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello everyone!

Please excuse me if my post in this mailing list seems a bit out of
place; I am fairly new to mailing lists, and this is actually my very
first post.

I would like to seek advice from someone who is familiar with the
Serpent cipher, encryption and cryptsetup in general.
Currently, I'm planning my new Arch installation with a BTRFS
filesystem that is encrypted using cryptsetup and LUKS, and I'm
finding little to no information on how to properly use the Serpent
cipher for system encryption, as well as for encrypting hard drives
solely for data storage, and for a swap partition to enable
hibernation support.
From what I've read and understood so far, it would be best to use
Serpent for my system encryption in the same way AES is used by
default with LUKS, that would be serpent-xts-plain64, but I'm not 100%
sure and can't verify it any other way than to ask here.
Furthermore, I would also like to know if the XTS mode with plain64 is
also appropriate and works well for my swap partition and my data
storage drives/partitions?

Just in case someone says I should just be using default AES (like in
one thread on the Arch forum):
My primary concern is the higher level of security that Serpent
offers, which is why I prefer it over the default AES encryption. That
also means that speed is completely irrelevant to me, as long as it
remains within a bearable range.

I would be really pleased and very grateful if someone would be so
kind as to offer me some advice on these 3 questions.

Thanks,
fabestah
