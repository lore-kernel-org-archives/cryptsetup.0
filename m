Received: from mail-200165.simplelogin.co (mail-200165.simplelogin.co [176.119.200.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF061FB8
	for <cryptsetup@lists.linux.dev>; Fri, 30 Jun 2023 09:04:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1688115888;
	cv=none; b=SxVtAjg0rQFV1AAALCTBGYN8aXNGblvDSh+H6SrX+letE9UNeuewbpAjxY8SqxGlumFSr45rkTt81qu6sPhmsLJR+bWBQp32aenEOeHOhv+4ykQwHQNCGpAEsP7O351Ej+eVBMSU7r4qCWUAfs3A/1vz24D0RmgeoV0ZiYa5sntTLTSf3MhLwWmVuE3tBsAEt6c64hmZvRmea6MtVEI29W4kgvUPr02eNbinZ44ptW5ZuHYpFfqKWRNXp+43Nab5OgLHF3ZEkJH7JUnN6dHhpWJ22A1QgD4hP6+B9e7PYXsFGrfKK1A3C47lS0mCkziZ25UamY7dzcdKxXNWnSZL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1688115888; c=relaxed/simple;
	bh=6ToJAkTDlx8uC6cwVCLdexQrfKldqv3YblO5j2wH1bU=;
	h=DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:To:Message-ID:References:
	 X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing; b=BjRu3RxLzGwj7Iv8hdgMWdY8mjhl+FWus6+XW4mIjwkAXrwvAgL94o+kX9LUkp7JfvSTdbe6PVGlnVHvvh5LMbt0qSQ2G7+8KN3Dn1YTxjzzLvhhBhTuja13bE8tIGkN6DMdZifwKuRyjn7NSysp1Fzm4k9SSCfgy8nMkBO4CtA0b1/wWbE7lfB+eTTCf6qifbOa8Yko80fvOZ3G0mnouG7nlvX4npFkz0t5V3d5TFD6QehUZbZFFRS5c7f0e1YOP2alkJEaNl9xvGF7CGMUfvNp1sMG/nbjBvTOypLP9BzMk/U+ttgcYhtkrlWT7AWe6jo5vvLW3rIccPPoua0WEw==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aleeas.com; s=dkim;
	t=1688115888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ToJAkTDlx8uC6cwVCLdexQrfKldqv3YblO5j2wH1bU=;
	b=t3vRL9z4DygDGJjBnCQI/hByWfej8qr9zrOJQgOushqhQz/lzQd6Xh5BKwilDjsVgrnfZQ
	vDnkJv5iWPcjFNFrPUSgl19lc/DattiW/CmUIKTDd1VyphQ2eLmazmQhqHrw6EmsCac8Vj
	K9Uyb9Wq/1twIpHMwZcydntBZmoyk0s=
Date: Fri, 30 Jun 2023 09:04:34 +0000
Subject: Re: Problem after detaching the header
In-Reply-To: <20230630025026.GA3372@tansi.org>
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
Message-ID: <168811588839.6.11593174509180454664.147320636@aleeas.com>
References: <168806625127.6.2008140751957055524.147127853@aleeas.com>
 <20230630025026.GA3372@tansi.org>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 147320636
X-SimpleLogin-Want-Signing: yes


> Looks like the initrd cannot deal with detached headers.
Please note that until the luksErase operation everything is fine and the h=
eader is read from the detached location (since the original slots no longe=
r exist)

> Can you manually map the LUKS container from the
> initrd console? If not, waht errot do you get?
I'm sorry but I don't know how to do it :(
Can you provide the command to type in the console initramfs?


