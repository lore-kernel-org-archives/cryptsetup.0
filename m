Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4671C26B25
	for <cryptsetup@lists.linux.dev>; Tue, 25 Jul 2023 21:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 549B83FF51
	for <cryptsetup@lists.linux.dev>; Tue, 25 Jul 2023 23:04:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.165
X-Spam-Level:
X-Spam-Status: No, score=-1.165 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, T_SCC_BODY_TEXT_LINE=-0.01,
	URIBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nw2kPFu5qa4H for <cryptsetup@lists.linux.dev>;
	Tue, 25 Jul 2023 23:04:24 +0200 (CEST)
Received: 
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id A65A83FD56
	for <cryptsetup@lists.linux.dev>; Tue, 25 Jul 2023 23:04:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 930441D00168
	for <cryptsetup@lists.linux.dev>; Tue, 25 Jul 2023 23:04:23 +0200 (CEST)
Date: Tue, 25 Jul 2023 21:04:22 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: What is the aes-xts key-size?
Message-ID: <d331c097-8c7a-484b-b0cc-f122cbd0c34d@home.arpa>
References: <85b99cefc9505c90db6010c60d66992e88ae1db0@rjp.ie>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85b99cefc9505c90db6010c60d66992e88ae1db0@rjp.ie>

On 25 Jul 2023 19:48 +0000, from ronan@rjp.ie (Ronan Pigott):
> What should the argument of --key-size be, 256 or 512, to achieve this superior
> performance?

256.

You can conclude this based on the output from the fact that there are
no -xts lines with a 128 bit key size, nor any non-XTS lines with a
512 bit key size. Therefore the key size specified in the benchmark
output must be the doubled key size, since the underlying AES cipher
is only defined for key sizes of 128, 192 and 256 bits.

Also, (the underlying) AES with a 128 bit key uses 10
encryption/decryption rounds; with a 256 bit key, it uses 14 rounds.
Therefore AES-256 will always be slower than AES-128; although by less
than 40%, since the key expansion prior to the encryption or
decryption rounds takes non-zero time.

Still, _I_ would probably use --key-size 512 for the extra security
margin and the negligible (~10% in your case) loss in throughput.
Whether you're getting 5.5 GiB/s or 6 GiB/s through LUKS is unlikely
to be the limiting factor in I/O performance. SATA, for example, tops
out at 6 Gbit/s; about a tenth of the throughput you're seeing. Even
M.2 NVMe is (per Wikipedia) equal to up to four lanes of PCI Express
3.0, which would get you just under 4 GB/s theoretical maximum
throughput, still well below saturating a 5-6 GB/s encryption pipeline.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

