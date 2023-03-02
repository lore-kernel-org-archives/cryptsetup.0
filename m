Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CC4D524
	for <cryptsetup@lists.linux.dev>; Thu,  2 Mar 2023 21:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 5F0C23F33E
	for <cryptsetup@lists.linux.dev>; Thu,  2 Mar 2023 22:46:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.155
X-Spam-Level:
X-Spam-Status: No, score=-1.155 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, URIBL_BLOCKED=0.001]
	autolearn=no autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcJRrNZQD0yI for <cryptsetup@lists.linux.dev>;
	Thu,  2 Mar 2023 22:46:14 +0100 (CET)
Received: 
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 6270E3F313
	for <cryptsetup@lists.linux.dev>; Thu,  2 Mar 2023 22:46:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id E27722E0202
	for <cryptsetup@lists.linux.dev>; Thu,  2 Mar 2023 22:46:13 +0100 (CET)
Date: Thu, 2 Mar 2023 21:46:12 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: cryptsetup - No key available with passphrase
Message-ID: <46a11902-fdbd-4c75-a589-840e4e1f3e27@home.arpa>
References: <CAD-Ua_hj1hkymLbyEyT-eNyCj_naiqHqg7nr3nos8tp9XCERDg@mail.gmail.com>
 <64fc6294-ca5e-f7a9-302f-63b09d569586@gmail.com>
 <CAD-Ua_h2GDZexz=DC3YA88nO-OhXKyGp1v2D6rWvHHQVwtCgFw@mail.gmail.com>
 <3b08eace-b038-bab1-4f65-f9c322dc90a4@gmail.com>
 <CAD-Ua_j_AR4BJWJPXs9Lv+qO1-c33M59UPg_1_XQdB60s0MEXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD-Ua_j_AR4BJWJPXs9Lv+qO1-c33M59UPg_1_XQdB60s0MEXg@mail.gmail.com>

On 2 Mar 2023 21:34 +0100, from lars.francke@gmail.com (Lars Francke):
> I honestly don't understand what the problem could be. All of this did
> work last week and it did work _once_ earlier today for some reason.
> I checked smartctl to make sure that the hard drive is not reporting
> any errors and it doesn't

SMART data unfortunately is not always conclusive; particularly, it's
not always conclusive in indicating the _absence_ of a problem. Plain
and simple, storage devices _lie_, some more than others.

I would try again, but this time creating the LUKS container using a
file in a ramfs (not tmpfs, which is allowed to be swapped out) as
backing store, possibly mapped to a loopback device. Doing so will
eliminate persistent storage from the equation.

If that works, then my suspicion would be on the drive itself.

If that doesn't work either, then there's likely something problematic
about the software stack, at which point exact versions of everything
becomes interesting. Kernel, cryptsetup, libcryptsetup, ...

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

