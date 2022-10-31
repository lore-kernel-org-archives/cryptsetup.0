Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se [213.80.101.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3997E
	for <cryptsetup@lists.linux.dev>; Mon, 31 Oct 2022 14:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2D2E73FC78
	for <cryptsetup@lists.linux.dev>; Mon, 31 Oct 2022 15:30:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level:
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
	autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qoEjXKotWhqv for <cryptsetup@lists.linux.dev>;
	Mon, 31 Oct 2022 15:30:49 +0100 (CET)
Received: 
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id CCFC53FC10
	for <cryptsetup@lists.linux.dev>; Mon, 31 Oct 2022 15:30:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 685F52E01B5
	for <cryptsetup@lists.linux.dev>; Mon, 31 Oct 2022 15:30:49 +0100 (CET)
Date: Mon, 31 Oct 2022 14:30:48 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <michael@kjorling.se>
To: cryptsetup@lists.linux.dev
Subject: Re: Quantum-Resistant Cryptographic Algorithms
Message-ID: <5e7897bd-a6a3-4eb0-b077-5e85d6fc0db6@home.arpa>
References: <CACHosL9Wjtm_2tXyQNzsg1DwOGcYBLQouOst-Kxi7BHRxaQA8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHosL9Wjtm_2tXyQNzsg1DwOGcYBLQouOst-Kxi7BHRxaQA8Q@mail.gmail.com>

On 31 Oct 2022 16:09 +0200, from doffloster@gmail.com:
> Soon in LUKS / cryptsetup?
> 
> "NIST Announces First Four Quantum-Resistant Cryptographic Algorithms"

If you are referring to those listed at [1], they are public key
algorithms. LUKS' use case does not depend on that and to my knowledge
LUKS currently does not implement any public key cryptography, so it
is my belief that they would not immediately apply.

Last I looked, symmetric key encryption was affected by quantum
computing at most by the square root key search work factor reduction
offered by Grover's algorithm, which can be mitigated by selecting a
twice as long key. Hence AES-256 would offer similar security against
a quantum capable adversary that AES-128 offers against a classic-only
adversary.

[1] https://csrc.nist.gov/projects/post-quantum-cryptography/selected-algorithms-2022

-- 
🪶 Michael Kjörling                  🏡 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

