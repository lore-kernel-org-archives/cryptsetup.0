Received: from mail-200162.simplelogin.co (mail-200162.simplelogin.co [176.119.200.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCB3214EC
	for <cryptsetup@lists.linux.dev>; Wed, 12 Jul 2023 16:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1689177595;
	cv=none; b=nzDu87ZD2A41IxGxRsFMujhOUIob69UH6teVctV8WoVLzoo9OVVZs/VvkErZvOCw+2mN2T1nUV3hIg4oo95nyhhMf4HlTxFEHyVxZVMYc/PZVMRRHR315K433lBtF7ijTkKsWBDc2xzWlGdI/3qu1fRSIUDDA6HzhaFCqUuWqdblPnWl3MB1uTnVV1eLF1XRyu+/wrqcZ+a1ufYqMM04ifC3CTAKxNteA73M9vwfAxDzmSP9aYdT+TsoepwJx10XHA9MgqlP+sxPK0BfKiSsiBUGoKc3r43b9BZlgPJ4DFNO5V7dsIkIWAr2hd+mdouyXy5NN9YVidj2hvVd1z0V9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1689177595; c=relaxed/simple;
	bh=UyOOWJBWL+UYhgcxnWELByakyy5LcV0TQu9LM+RNP2M=;
	h=DKIM-Signature:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:To:Message-ID:X-SimpleLogin-Type:
	 X-SimpleLogin-EmailLog-ID:X-SimpleLogin-Want-Signing; b=h43RW3LviSZ6PFeWuRrKacon3IojeULgdsFsjz2T+aQasIsN6V9ZAxZr2l6I6O8a82efK/nO/5Y4mkVnWGc2O/5LSYAS5rGZORD+G1pGt/b5goiNo3CrYvx7pBxZyjL608VgVV3x15baYoccER9VujrrRUFbYJT7nckRxxsqJ/YyEFpJXVAX0PF3bTkxVdautTOhZ2G8FtEHbvc/sSappKsR+rWsqB1rmBz0Mn+Drf+erSPn/N85VR17/inzWyurXXGsf/08tY0FLlImbvWfO3ehwKSWj7LkHjT6zCEBa6qbSYWwsSuU2els2BshKUtGRHhoICNlZlFkaVPghp7TWg==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aleeas.com; s=dkim;
	t=1689177595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UyOOWJBWL+UYhgcxnWELByakyy5LcV0TQu9LM+RNP2M=;
	b=JUCkw4IYO2LRoH3lDfPxhaaRfRBFslC3nFWKVq7fljVqBTcSKRUV6/ntx/sYRkNXmLkSlB
	0+VqnlDos9TU4cenCrvG+TEXStb9C5/rm2BriKMob1fa56yEBWn9YXsHXJC8xxrktSA/Bn
	r7V1u5OOqD+MIiKCa4fC2i4+1libOLg=
Date: Wed, 12 Jul 2023 15:59:41 +0000
Subject: A new container with an old header
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Darek Hisc <darek.hisc@aleeas.com>
To: cryptsetup@lists.linux.dev
Message-ID: <168917759492.6.4364561119493214109.152005529@aleeas.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 152005529
X-SimpleLogin-Want-Signing: yes

Hi

I have a 100MB LUKS2 "file1" file-container with detached "header1".
I now need to create a new 200MB container "file2", but still use the old h=
eader "header1" for it.
I haven't found an option for luksFormat that allows you to use "header1".

I tried FAQ 6.10, but:
- the script https://gitlab.com/cryptsetup/cryptsetup/blob/main/misc/luks-h=
eader-from-active returns "Incompatible device"
- manual execution of the procedure returns different Salt and Digest

Is there a way to create a second file-container served by the old header?

Alternatively, a way to increase the size of "file1" to 200MB. All the info=
rmation I've found is about resizing a partition or LVM. But I don't know h=
ow to increase LUKS2 file-container.

Please help...


