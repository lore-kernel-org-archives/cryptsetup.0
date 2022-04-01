Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5605181D
	for <cryptsetup@lists.linux.dev>; Fri,  1 Apr 2022 08:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 129E53F94E
	for <cryptsetup@lists.linux.dev>; Fri,  1 Apr 2022 10:45:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.909
X-Spam-Level:
X-Spam-Status: No, score=-1.909 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
	autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pFntf4wg7weL for <cryptsetup@lists.linux.dev>;
	Fri,  1 Apr 2022 10:45:42 +0200 (CEST)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id E2A6C3F8CF
	for <cryptsetup@lists.linux.dev>; Fri,  1 Apr 2022 10:45:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 4C1E82E0459
	for <cryptsetup@lists.linux.dev>; Fri,  1 Apr 2022 10:45:42 +0200 (CEST)
Date: Fri, 1 Apr 2022 08:45:41 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <michael@kjorling.se>
To: cryptsetup@lists.linux.dev
Subject: Re: [Question] Distinction responsibilities LUKS and dm-crypt
Message-ID: <04746dcc-945a-400a-bad7-747bf881bd69@localhost>
References: <PR3P192MB1087C0EE38951D6391C3B1D5F1E19@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
 <84342ede4702058fff1deb61f6c9108de8e6ddcd.camel@scientia.org>
 <PR3P192MB10874E4159B71C71097583B4F1E19@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
 <8583a15d8b2a72eebb72950a3cbf210bc74649d1.camel@scientia.org>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8583a15d8b2a72eebb72950a3cbf210bc74649d1.camel@scientia.org>

On 31 Mar 2022 21:32 +0200, from calestyo@scientia.org (Christoph Anton Mitterer):
> Some people may say that with "plain" /.../
> /.../
> It may have some tiny advantages when using it for temporary devices
> (like temporarily encrypted swap devices).

For that use case I would prefer to say that using LUKS has no added
benefit over a plain dm-crypt mapping, because the key material would
be thrown away on a reboot anyway. (Effectively giving swap the same
largely-emphemeral storage properties as RAM.) You _can_ do the same
thing by reformatting a LUKS container before passing it to swapon(8),
but doing so has no significant benefit that I can see compared to
just re-opening a plain dm-crypt mapping with a key read each time
from /dev/{u,}random and treating any pre-existing data as garbage.

Another use case for plain dm-crypt mappings is when you want to
pre-fill a storage device with random data to conceal which parts are
in use by what's inside a LUKS container: my experience is that it's
much faster to open a dm-crypt mapping with a throwaway key and then
write from /dev/zero through it, than is writing from /dev/{u,}random
to the raw backing device, and absent the key the output of any
competent encryption algorithm _should_ be indistinguishable from
random anyway. But maybe with the up-and-coming changes to
/dev/{u,}random in Linux that'll be subject to change.

-- 
Michael Kjörling • https://michael.kjorling.se • michael@kjorling.se
 “Remember when, on the Internet, nobody cared that you were a dog?”

