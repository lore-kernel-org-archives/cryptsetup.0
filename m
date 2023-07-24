Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A00EF9F2
	for <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 18:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id F37D340646
	for <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 20:17:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.165
X-Spam-Level:
X-Spam-Status: No, score=-1.165 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, T_SCC_BODY_TEXT_LINE=-0.01,
	URIBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5v61M1XT1rL for <cryptsetup@lists.linux.dev>;
	Mon, 24 Jul 2023 20:17:30 +0200 (CEST)
Received: 
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 124C8404B4
	for <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 20:17:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 55E5C1D00116
	for <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 20:17:29 +0200 (CEST)
Date: Mon, 24 Jul 2023 18:17:28 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Looking for confirmation as I enter the acceptance stage.
Message-ID: <31712b7d-402e-452b-9ebb-5ede7afd5186@home.arpa>
References: <2159917.irdbgypaU6@laptop>
 <a59bcd66-474e-4844-b9d1-1996ce503ebb@home.arpa>
 <5860622.MhkbZ0Pkbq@laptop>
 <a543a204-c0c7-4936-8eb0-38fd3ac825b9@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a543a204-c0c7-4936-8eb0-38fd3ac825b9@home.arpa>

On 24 Jul 2023 16:03 +0000, from 152cc69a347e@ewoof.net (Michael Kjörling):
> I think that there actually just MIGHT be some hope for you. No
> guarantees, but certainly to the point of "don't give up JUST yet".

Well, this is a bit of a bummer.

I did some more testing, and I can't seem to get cryptsetup to accept
the "lukskey" you sent earlier as a key file for an extended version
of the container starting with the header I was able to extract.

This doesn't _have_ to be a showstopper; it's possible that LUKS
simply needs data that's outside of what you've sent, or maybe you've
been using that file differently. (And please think thrice before
sending more; remember, anyone who has a valid key slot passphrase to
a header has access to the plain text data of the container if they
can get their hands on the ciphertext data, and this mailing list _is_
publicly archived. Absolutely do consider that key file compromised,
possibly alongside your other, memorized passphrase for the
container.) But it's somewhat of a downer.

I would still say you have some chance when doing it with more data,
though, so what I suggested previously is absolutely still worth
trying. After all, the extraction I did left only 19823 bytes
including the header signature at the start, which is plenty less than
the canonical size of the full LUKS 1 header.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

