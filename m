Received: from mail-200161.simplelogin.co (mail-200161.simplelogin.co [176.119.200.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5F61ED55
	for <cryptsetup@lists.linux.dev>; Thu, 13 Jul 2023 15:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1689262252;
	cv=none; b=jxIGOtojhC3cUfoYHBdzmgnhFmLgrGTeDX8dDOzgH1KN9lKtBOTIVEoVfl+oRQGFT0JHW8FXGgDrRjUjBUtguOmj4qW6eRjEOuwuxrDG+TJxCUFBdqYyJDl773+EmwO5Y8q0+MrJSjc7VGufizS4NzQrKYQXaaWFBfgPRZH5VtsGE4QYJnCFgFotcD4QlM5SUZffSx22UawqkXY9Sb/ViV/NpGS+Cz7oLKuBNfFtnrrLCYOM8VSin0JLVSBxjPbdMHvmShhPHCkibrPfjPNXHdQH8PtacSWXwzk6jzvE4geT1TnipZX3YqfEcw0AbbyBc14KSDILVr/UNYxW6+ejPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1689262252; c=relaxed/simple;
	bh=r7khIozvLwNtK+vyTNJYFVfXkgKNxxQiSpWJI5XmBOE=;
	h=DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:To:Message-ID:References:
	 X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing; b=iYLxFfNW6g/qfnxV/Bh5bbqbbgwCny2NGStPME34Ae2lPUzjG4DK+Ois4LID39eKh9stMW8aBX0V0RgMTP74BIrWBdlltIG9zehQVWz4nLaNdo/hcKJResd5JmgdOGQT/z8oGvYdPeY591xufOyRd7YlcTwE2Cv8IduQQ3RVvxqlbMMXBOvjM6QV5KtEuGvH/xXkyoVe16rqvfA5vkxqJbEW//viNUzyWNzkjy+Amu8y/yNtZiz8e5EPnqNIMtTHdYsAYl5Omo0Jo4vpoURVlqCTmvW9ypMaUjZraLV/fVM3IkqAVLasBR6Xa757MqtE7A0VGE3JrOfDYnpBEiZxBQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aleeas.com; s=dkim;
	t=1689262252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7khIozvLwNtK+vyTNJYFVfXkgKNxxQiSpWJI5XmBOE=;
	b=IdRdKd8YGZrlXJGonTMJpwqSWomW2oK5p5JJP8tgIdJySCtraUwyxFc1L3bt3tBmU83jeO
	Mex9RftdDzHPmmT4GwqSemW6Kvo2yPAsJKrcLkcn29/jmXXpeU8kQj7uFUfJCbVaIobwCo
	t1n/ANCfbUBmFEfypfMpjPjL/vN6eD0=
Date: Thu, 13 Jul 2023 15:30:45 +0000
Subject: Re: A new container with an old header
In-Reply-To: <7cb9e19c-eddc-4c2c-a2ac-2673a1e208e8@home.arpa>
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
Message-ID: <168926225260.6.8499250006616259794.152440275@aleeas.com>
References: <168917759492.6.4364561119493214109.152005529@aleeas.com>
 <7cb9e19c-eddc-4c2c-a2ac-2673a1e208e8@home.arpa>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 152440275
X-SimpleLogin-Want-Signing: yes


Thank you Michael for your suggestions!
Particularly valuable for me is the ability to check the checksum of a frag=
ment of a file (I did not know this before):
$ dd if=3Dluks-container bs=3D1048576 count=3D100 | md5sum -b

Instead of `truncate -s 200M` I found a better solution for my use case:
`head -c 200M /dev/urandom >> my-container`
It creates "real data" instead of "sparse file" (whatever that means) and i=
s supposedly more secure.
Then I used `cryptsetup resize` and later `resize2fs /dev/mapper/xxx` and e=
verything looks fine now :)

Cheers!


