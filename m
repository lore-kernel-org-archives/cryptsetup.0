Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se [213.80.101.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D093EA2
	for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 09:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 95EDC3FB38
	for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 11:21:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.909
X-Spam-Level:
X-Spam-Status: No, score=-1.909 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
	autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YybI4F8G0qzF for <cryptsetup@lists.linux.dev>;
	Sat, 10 Sep 2022 11:21:31 +0200 (CEST)
Received: 
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 4E1F73F57C
	for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 11:21:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 7EC532E01B4
	for <cryptsetup@lists.linux.dev>; Sat, 10 Sep 2022 11:21:30 +0200 (CEST)
Date: Sat, 10 Sep 2022 09:21:29 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <michael@kjorling.se>
To: cryptsetup@lists.linux.dev
Subject: Re: sha256 in "AF hash" despite using sha512 during luksFormat
Message-ID: <4ab9a956-3da1-4f54-ba38-66f741ba5eeb@home.arpa>
References: <CACHosL-Nxs5dHJddw8RjqnK4d7OewzA2FT6G1ZQcAhw=PzLLpQ@mail.gmail.com>
 <7f403984-bd0d-9b75-d0eb-0cacbb41810d@gmail.com>
 <CACHosL8YcOXCouZvhTX4rn_F7buVj7tdiefEbHvgGwbfC3t-CQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHosL8YcOXCouZvhTX4rn_F7buVj7tdiefEbHvgGwbfC3t-CQ@mail.gmail.com>

On 10 Sep 2022 10:26 +0300, from doffloster@gmail.com:
> I prefer sha512 over sha256 only because I've read that it is slightly
> more difficult for GPUs to brute force, because they normally have
> 32bit operations.

Someone correct me if I'm wrong, but my understanding is that GPUs per
se excel at vector operations, because that's a big part of what's
needed for 3D graphics. (They also happen to be very useful for some
other types of workloads.) The SHA* series of hashes, including SHA3,
rely primarily on simple integer arithmetic; addition and subtraction
modulo some value, XOR, and similar operations. That can of course be
offloaded to GPUs, and it might be easier to parallelize GPU workloads
in a single system, but it's not a GPU's primary strong suit.


>> it is much
>> faster to try to decrypt some sector where you can detect correct plaintext
>> than to use slow digest PBKDF2 here.
> 
> Do you mean that in the given scenario it is much faster to find the
> LUKS master key by decrypting a plaintext sector which is encrypted
> with AES rather than trying to find the LUKS master key via PBKDF2?
> Which means that in the given scenario AES is "weaker" than PBKDF2?

If you have a candidate key, a hash of the correct key, and some
amount of ciphertext encrypted with the correct key, then to check if
the candidate key is likely correct you can choose between hashing the
key and comparing H(K)=h, or decrypting the ciphertext with it and see
if D_K(C) is a probable plaintext. Which you choose depends on which
is faster on the system you're running on. Since AES is already
hardware-accelerated on many modern CPUs, it may well be faster. Once
H(K) is an expensive operation, such as with iterated hashes or hashes
designed to be expensive (such as Argon2), it's highly likely to be
faster. Keep in mind that in both cases, the search space is the same.
The search space also isn't really affected by the output hash size of
the hash algorithm, especially if that is larger than the unknown
portion of the input; in the latter case, the hash serves largely as a
diffuser.

> Also, I assume it is difficult to find an encrypted sector which has a
> high chance to be plaintext when it is decrypted.
> I assume that plaintext sectors probably are the least common type of
> sector (there are images, videos, executables etc. which easily take
> space on the storage )

Most useful data has some bias. Encrypted data, including when
decrypted with the wrong key, is essentially random; this is a
property of almost any good encryption algorithm (without knowledge of
the key, encrypted data is indistinguishable from random data).
Therefore, if the decrypted data has more than some threshold of one
bit value compared to the other (for example, more than 60% of bits
are of either value), then it's plausibly plaintext and you can apply
more expensive checks. Counting the number of bits of each value is a
rather simple operation that is commonly implemented in hardware; GCC,
for example, offers __builtin_popcount() for the purpose.

Also, if the device hasn't been filled with random data for padding,
storage allocation patterns can give a lot away even if you can't tell
what exactly is there. A volume holding an ext3 file system looks
_very_ different in terms of allocation patterns compared to, say, a
Btrfs volume or a NTFS volume. Once you have a reasonable guess as to
what file system a container holds, there are usually signatures in
known locations that you can use to hugely narrow down the set of
possible plaintexts and therefore confirm whether a candidate key is
plausibly correct. Or you can take a shot and look for signatures for
any of the few dozen most common file systems. "Known plaintext"
sounds like it would be a meaningless attack against encrypted data
(why try to decrypt the ciphertext if you already have the
plaintext?), but surprisingly often, it's a _very_ practical starting
point precisely because you can make very good educated guesses about
what the plaintext might look like.

-- 
Michael Kjörling • https://michael.kjorling.se • michael@kjorling.se
 “Remember when, on the Internet, nobody cared that you were a dog?”

