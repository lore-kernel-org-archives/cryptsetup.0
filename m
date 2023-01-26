Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD7D4C9B
	for <cryptsetup@lists.linux.dev>; Thu, 26 Jan 2023 19:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 3720C3F5D4
	for <cryptsetup@lists.linux.dev>; Thu, 26 Jan 2023 20:45:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.155
X-Spam-Level:
X-Spam-Status: No, score=-1.155 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, URIBL_BLOCKED=0.001]
	autolearn=no autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VpKFBJdyO1KF for <cryptsetup@lists.linux.dev>;
	Thu, 26 Jan 2023 20:45:38 +0100 (CET)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id C4CCA3F486
	for <cryptsetup@lists.linux.dev>; Thu, 26 Jan 2023 20:45:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 9B9F32E018C
	for <cryptsetup@lists.linux.dev>; Thu, 26 Jan 2023 20:45:37 +0100 (CET)
Date: Thu, 26 Jan 2023 19:45:36 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Question Regarding Decrypt Screen
Message-ID: <ae7d8a78-ac2c-4164-9a8d-0b5aed5ccad1@home.arpa>
References: <CAJm+cqpX7EU3KwS1RsRtGw=Ny9Ar8ygkvGzAT0_21pbGVzNshw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJm+cqpX7EU3KwS1RsRtGw=Ny9Ar8ygkvGzAT0_21pbGVzNshw@mail.gmail.com>

On 26 Jan 2023 14:42 -0500, from rdaniel@bostondynamics.com (Robel Daniel):
> On
> Ubuntu machines of any version (18.04, 20.4, 22.04), it's quite well
> known that after powering on the machine, and reaching the Decrypt
> screen (the screen where the user has to enter their decryption key to
> unlock the disk), the Caps Lock button doesn't illuminate on most, if
> not all, machine models.

This does not sound like something that cryptsetup does. You should
probably pose that question in a distribution-specific forum.

-- 
Michael Kjörling                     🏡 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

