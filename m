Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FED65D
	for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 16:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id CF2F43F702
	for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 18:24:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.91
X-Spam-Level:
X-Spam-Status: No, score=-1.91 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0TmyOoj_fMe for <cryptsetup@lists.linux.dev>;
	Sat, 13 Aug 2022 18:24:41 +0200 (CEST)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D11D33F674
	for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 18:24:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 146FE2E0202
	for <cryptsetup@lists.linux.dev>; Sat, 13 Aug 2022 18:24:41 +0200 (CEST)
Date: Sat, 13 Aug 2022 16:24:39 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <michael@kjorling.se>
To: cryptsetup@lists.linux.dev
Subject: Re: cryptsetup LUKS: Too low iteration count: only 14
Message-ID: <de1a725c-2a0e-4635-8813-ed84ebc01a69@home.arpa>
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
>> the iteration count was 14 in my case.
>> The iteration time that I chose (arbitrarily) is 4123ms which is above
>> 4 seconds!
> 
> Please do not confuse iteration for PBKDF2 (default in LUKS1) and memory-hard Argon2 KDF.
> 
> These are completely different algorithms, you cannot compare iteration costs here.

14 iterations in 4123 ms is also about 300 ms per iteration, which
would not be at all unreasonable for password hashing. Compare [1]
which provides sample output from running the Argon2i reference
implementation for two iterations in 188 ms (with four parallell
threads) on unspecified hardware; the order of magnitude is certainly
about right.

[1] https://github.com/P-H-C/phc-winner-argon2/blob/master/README.md#command-line-utility

-- 
Michael Kjörling • https://michael.kjorling.se • michael@kjorling.se
 “Remember when, on the Internet, nobody cared that you were a dog?”

