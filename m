Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2621FB3
	for <cryptsetup@lists.linux.dev>; Fri,  3 Mar 2023 10:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id B90A440357
	for <cryptsetup@lists.linux.dev>; Fri,  3 Mar 2023 11:17:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.155
X-Spam-Level:
X-Spam-Status: No, score=-1.155 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, URIBL_BLOCKED=0.001]
	autolearn=no autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4zkWlyHJoc3o for <cryptsetup@lists.linux.dev>;
	Fri,  3 Mar 2023 11:17:05 +0100 (CET)
Received: 
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E088D40315
	for <cryptsetup@lists.linux.dev>; Fri,  3 Mar 2023 11:17:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id D16A82E041D
	for <cryptsetup@lists.linux.dev>; Fri,  3 Mar 2023 11:17:04 +0100 (CET)
Date: Fri, 3 Mar 2023 10:17:03 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: cryptsetup - No key available with passphrase
Message-ID: <0af33602-b679-4986-8cce-2e1f50248c88@home.arpa>
References: <CAD-Ua_hj1hkymLbyEyT-eNyCj_naiqHqg7nr3nos8tp9XCERDg@mail.gmail.com>
 <64fc6294-ca5e-f7a9-302f-63b09d569586@gmail.com>
 <CAD-Ua_h2GDZexz=DC3YA88nO-OhXKyGp1v2D6rWvHHQVwtCgFw@mail.gmail.com>
 <3b08eace-b038-bab1-4f65-f9c322dc90a4@gmail.com>
 <CAD-Ua_j_AR4BJWJPXs9Lv+qO1-c33M59UPg_1_XQdB60s0MEXg@mail.gmail.com>
 <46a11902-fdbd-4c75-a589-840e4e1f3e27@home.arpa>
 <CAD-Ua_gQLB+6a8=eRQd7B8u76hmvGFH+xPtzJKXPwn=gjuF=uw@mail.gmail.com>
 <47da0423-7e8c-c059-c65c-fe6252b0e384@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47da0423-7e8c-c059-c65c-fe6252b0e384@gmail.com>

On 3 Mar 2023 08:55 +0100, from gmazyland@gmail.com (Milan Broz):
> Actually it is quite interesting issue. Argon2 KDF uses a lot of memory
> and any glitch (even one bit flip) will change it's output.
> So memory failure explains what you see here.
> (You should see this rarely if --type luks1 was used for format,
> as LUKS1 does not use Argon2. But memory failure is just a recipe
> for disaster later...)

I agree. If you're seeing RAM errors on a system with non-ECC RAM, then
that's going to crop up at one point or another and bite you hard in
some hard-to-predict, difficult-to-debug and impossible-to-reproduce
manner. I'm actually surprised that if this is a RAM issue that it's as
reproducible as you reported; maybe just one memory module is bad? A
single bit stuck either as a 0 or a 1 wouldn't necessarily show up
during normal use, but something like Argon2 just might perhaps have
difficulties because of it because it's effectively an error amplifier,
and a stuck bit wouldn't necessarily cause checksum mismatches.

Consider running an extended memtest session (>24 hours or several full
passes, whichever takes longer) both after the computer has been
running for a while (and thus the components have warmed up to a
somewhat normal operating temperature), and immediately after it has
been turned off for a while, perhaps over night (allowing it to cool
down to room temperature).

At the very least, double-check the RAM specs to see what it's designed
to be clocked at, and make sure the BIOS reports that the RAM is
clocked at a specified compatible setting.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

