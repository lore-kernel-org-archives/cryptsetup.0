Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3425257D
	for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 19:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 345B7403F4
	for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 21:35:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.91
X-Spam-Level:
X-Spam-Status: No, score=-1.91 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbDL7B3Yqyyh for <cryptsetup@lists.linux.dev>;
	Sat, 13 Aug 2022 21:35:52 +0200 (CEST)
Received: 
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 239383FB9D
	for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 21:35:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 4D7322E0202
	for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 21:35:51 +0200 (CEST)
Date: Sat, 13 Aug 2022 19:35:50 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <michael@kjorling.se>
To: cryptsetup@lists.linux.dev
Subject: Re: cryptsetup LUKS: Too low iteration count: only 14
Message-ID: <e05733d4-2e45-4075-b1cd-dadc753fb89e@home.arpa>
References: <CACHosL-U7pWY95fHP08D7FGoCk7=kZfRTudfSs4E1h8buxjaLQ@mail.gmail.com>
 <de150ba2-46fe-36f6-86b5-37411af760e6@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de150ba2-46fe-36f6-86b5-37411af760e6@gmail.com>

On 13 Aug 2022 18:11 +0200, from gmazyland@gmail.com (Milan Broz):
>> that the iteration count was 14 in my case.
>> The iteration time that I chose (arbitrarily) is 4123ms
> 
> If you set 100k iteration with 1G memory cost for Argon2, you will get
> unlocking time that is perhaps in years... :-)

Out of curiosity, how did you arrive at the "years" order of
magnitude? Is there an exponential component involved somewhere when
increasing the iteration count?

Naiively, OP's stated 14 iterations in 4123 ms is about 295 ms per
iteration (let's call it a nice and round 300 ms); 300 ms times 100K
is 30M ms = 30K s, or some eight hours. Certainly a good long while to
wait, but still a very far cry from even one year.

To get to a year at that performance, I'd expect an iteration count on
the order of 100M, not 100K, to be needed. (8 hours is about 1/1100 of
one year.)

-- 
Michael Kjörling • https://michael.kjorling.se • michael@kjorling.se
 “Remember when, on the Internet, nobody cared that you were a dog?”

