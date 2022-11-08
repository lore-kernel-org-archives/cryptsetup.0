Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401195CB3
	for <cryptsetup@lists.linux.dev>; Tue,  8 Nov 2022 08:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 3A752402AB
	for <cryptsetup@lists.linux.dev>; Tue,  8 Nov 2022 09:53:25 +0100 (CET)
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
	with ESMTP id J83GALS3NGBa for <cryptsetup@lists.linux.dev>;
	Tue,  8 Nov 2022 09:53:24 +0100 (CET)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 2F8C640D1E
	for <cryptsetup@lists.linux.dev>; Tue,  8 Nov 2022 09:53:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id B177C2E0293
	for <cryptsetup@lists.linux.dev>; Tue,  8 Nov 2022 09:53:23 +0100 (CET)
Date: Tue, 8 Nov 2022 08:53:22 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: security of re-encryption
Message-ID: <4a629a87-9e30-44b4-b314-dd7f3caf926d@home.arpa>
References: <CAN+za=M8rBabbD841n=L55bP9KdCjiPDAAgGDtoUM6ydje0few@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN+za=M8rBabbD841n=L55bP9KdCjiPDAAgGDtoUM6ydje0few@mail.gmail.com>

On 8 Nov 2022 03:40 +0100, from philcerf@gmail.com (Philippe Cerfon):
> I mean if the payload data stays mostly or exactly the same and an
> attacker would be able to make an image (of the encrypted volume)
> before and after [re-encryption], could that help for statistical attacks in order to
> get the key?

Personally, while I am certainly open to being proved wrong in this, I
doubt it. That would imply that, with two unrelated keys both selected
at random, something in the underlying cipher (most likely AES) causes
the two ciphertexts of an identical plaintext to have correlations
that would provide an adversary with a significant advantage in
deriving either key. (Even just a few bits' work factor worth would
very likely count as significant here.)

Even if it was mode-specific (for example, applies only to AES-XTS, or
does not apply to any currently defined chaining modes), that would be
a _major_ break of any encryption algorithm, let alone of AES, and
something I would expect to be presented at a major cryptography
conference or at the very least in a field-relevant journal; certainly
not in a post on a mailing list.

It would also potentially have implications _far_ beyond full-disk
encryption. Consider just that the first several bytes of the HTTP
request portion of a HTTPS transaction are not just guessable, but can
pretty much be considered to be _known_ since they are essentially
dictated by the HTTP standard.

-- 
🪶 Michael Kjörling                  🏡 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

