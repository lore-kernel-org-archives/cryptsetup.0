Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A79511F
	for <cryptsetup@lists.linux.dev>; Sat, 19 Feb 2022 07:08:31 +0000 (UTC)
Date: Sat, 19 Feb 2022 07:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fomin.one;
	s=protonmail2; t=1645254508;
	bh=EBi42C3zpyMP3vEVx1ogTntoeFGGYjD2Sl3VDio1U2A=;
	h=Date:To:From:Reply-To:Subject:Message-ID:In-Reply-To:References:
	 From:To:Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
	b=bGRuf153yb9RTIs2sBU14T33pPww4i+i87gwdvtUvVHXR+FK0t00lsZ1JePvtXwzx
	 oUo7cZCJcK/SZx8PP7Z7PreuEIVsrPvR6VvjYmGkYygiZl3kaVY8jnhVWEZLdGtHGo
	 P5v9AZVbT/0qImswRpQKo/q6PO1XAzwXFypCXR9Nn9aWeF2EZ7C+Awb+pik6x3KgvG
	 PyW2S9BJNwzUhu0/9P4pwu3Sq1533ZkXcYpnsynelSPJzOenLLZTxqGVi6n4u+yOiV
	 3C1MNejiehlSRMTK+/ahE8wpxyJJg90cq/KGt2Bb8QmO2KGjwKlnEexuAqAuyvIwO8
	 cZvO5renkbqWg==
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>, "dm-crypt@saout.de" <dm-crypt@saout.de>
From: Maxim Fomin <maxim@fomin.one>
Reply-To: Maxim Fomin <maxim@fomin.one>
Subject: [dm-crypt] New cryptsetup development list
Message-ID: <BzIwjC2M51LuNupbxKSwacIsPL6XZqefmenfoSp2a_vm8FHoaTwX4usbRInKzSPcDkIRp8SKea2UDMrgIJKuFqiY97rtDcYIoXv6xQIVjOo=@fomin.one>
In-Reply-To: <82c29d3e-7b15-dcb1-8f00-450b6eb336f3@gmail.com>
References: <82c29d3e-7b15-dcb1-8f00-450b6eb336f3@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

------- Original Message -------

On Thursday, February 17th, 2022 at 22:05, Milan Broz <gmazyland@gmail.com>=
 wrote:

> Hello,
> there is a new mailing list cryptsetup@lists.linux.dev dedicated
> to cryptsetup development.
>
> This mailing list should replace the existing dm-crypt mailing list.
>
> Thanks,
> Milan
> _______________________________________________
>
> dm-crypt mailing list -- dm-crypt@saout.de
>
> To unsubscribe send an email to dm-crypt-leave@saout.de

So, from now cryptsetup is offtopic at dm-crypt@saout.de?

Best regards,
Maxim Fomin

