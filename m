Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D531E884
	for <cryptsetup@lists.linux.dev>; Sat, 30 Nov 2024 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.136.2.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732984273; cv=none; b=IV1G3Xhjv4q5DO+w8bH62xqBpj/nucqN4q8W7bB+oMw/lu2pGet4pcavIDFwz0tBXibSoYtlsxzGMWKQKgwZDJ+5tN2mfbznPeym38JfgBEL7VthKoc+/jVjM4UseBf8FjQq4Dx1YMtNJTx6xQrSmp+iGdHiPQkhWD5YrDx7WOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732984273; c=relaxed/simple;
	bh=Kz9ac2Me9jqpy2pMkt+eVX0Iqa4TdB43ZLFKcQiA1R8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWQvohNtXBSYueIgZRf96iaE04GbQqq4Aq55bxnpZFUT4qJwfFLG3kjbhryb7AoXVo4vE701kJQb63+/yuBevHKRl2O8p4lLjH0CHg68pUMJ2X/OOPrOOiy3Fz3JwvHwIn/ZimEn0nDvQe+jTUdNCj1PMuwXMVH1cjr4U0eBdfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net; spf=pass smtp.mailfrom=ewoof.net; arc=none smtp.client-ip=79.136.2.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ewoof.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewoof.net
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id B4D263F322
	for <cryptsetup@lists.linux.dev>; Sat, 30 Nov 2024 17:23:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: 1.544
X-Spam-Level: *
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUlk5Io0Fpr7 for <cryptsetup@lists.linux.dev>;
	Sat, 30 Nov 2024 17:23:30 +0100 (CET)
Received: 
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 271A43F316
	for <cryptsetup@lists.linux.dev>; Sat, 30 Nov 2024 17:23:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 8CE8D1D00207
	for <cryptsetup@lists.linux.dev>; Sat, 30 Nov 2024 17:23:29 +0100 (CET)
Date: Sat, 30 Nov 2024 16:23:28 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: echo "pass" piped to sudo tee cryptsetup luksOpen overwritten
 LUKS partition
Message-ID: <0acf97fd-cc7f-4678-9f33-d7091e489325@home.arpa>
References: <CANbVO27bAb9E+Vt6k1J4VGSj18aY950Lq=ZqucBDJbfO4NLThQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANbVO27bAb9E+Vt6k1J4VGSj18aY950Lq=ZqucBDJbfO4NLThQ@mail.gmail.com>

On 30 Nov 2024 14:36 +0100, from babiniczr@gmail.com (Rafal Babinicz):
> TL:DR can I revert what I did there? Especially that line:
> $ echo "passphrase" | sudo tee cryptsetup luksOpen /dev/sdb3 enc
> 
> Basically I wanted to see passphrase to check whether I type it out
> correctly so echoed it and piped with sudo tee to cryptsetup luksOopen, and
> I think there is where I've overwritten something.

I think you may be in luck, actually, because it _looks_ at a glance
like only the first few dozen bytes (specifically the first 48 bytes)
have been damaged by your overwriting the first part of the partition
with the attempted passphrase.

In LUKS 1, that part of the header contains the LUKS magic constant,
LUKS version, cipher name and cipher mode. In LUKS 2, it contains the
magic constant, LUKS version, header size, sequence ID and the
beginning of the label. (For links to the on-disk format
specifications, see section 1.2 of the FAQ at
<https://gitlab.com/cryptsetup/cryptsetup/-/wikis/FrequentlyAskedQuestions>.)

If you hexdump the first 64 bytes or so of the header on-disk, this is
what it actually contains:

00000000: 6f64 7973 656a 6145 6665 6d65 7279 637a  odysejaEfemerycz
00000010: 6e61 4769 6c67 616d 6573 7a61 5469 6368  naGilgameszaTich
00000020: 6567 6f42 6961 6c65 676f 5769 6c6b 610a  egoBialegoWilka.
00000030: 6e36 3400 0000 0000 0000 0000 0000 0000  n64.............

Annotating this based on the LUKS 1 on-disk header format (the | mark
the first nibble of each byte for each field):

00000000: 6f64 7973 656a 6145 6665 6d65 7279 637a  odysejaEfemerycz
.         | |  | |  | |                                              LUKS_MAGIC
.                        | |                                         LUKS version
.                             | |  | |  | |  | |                     cipher name
00000010: 6e61 4769 6c67 616d 6573 7a61 5469 6368  naGilgameszaTich
.         | |  | |  | |  | |  | |  | |  | |  | |                     cipher name
00000020: 6567 6f42 6961 6c65 676f 5769 6c6b 610a  egoBialegoWilka.
.         | |  | |  | |  | |                                         cipher name
.                             | |  | |  | |  | |                     cipher mode
00000030: 6e36 3400 0000 0000 0000 0000 0000 0000  n64.............
.         | |  | |  | |  | |  | |  | |  | |  | |                     cipher mode

The "n64" followed by zeroes may conceivably be the end of "plain64",
so this looks like a plausible match.

If instead we try to annotate the binary data as a LUKS 2 header:

00000000: 6f64 7973 656a 6145 6665 6d65 7279 637a  odysejaEfemerycz
.         | |  | |  | |                                              magic
.                        | |                                         version
.                             | |  | |  | |  | |                     hdr_size
00000010: 6e61 4769 6c67 616d 6573 7a61 5469 6368  naGilgameszaTich
.         | |  | |  | |  | |                                         seqid
.                             | |  | |  | |  | |                     label[0..7]
00000020: 6567 6f42 6961 6c65 676f 5769 6c6b 610a  egoBialegoWilka.
.         | |  | |  | |  | |  | |  | |  | |  | |                     label[8..23]
00000030: 6e36 3400 0000 0000 0000 0000 0000 0000  n64.............
.         | |  | |  | |  | |  | |  | |  | |  | |                     label[24..39]

This appears less likely, but it's conceivable that you might have had
a 27 byte label ending in "n64". Still, without a more in-depth
analysis, my working hypothesis would be that this was a LUKS 1, not a
LUKS 2, header. Unfortunately I believe this means that there's only
one copy of the header, leaving recovery tools less to work with.

In either case, _the information stored in this part of the header is
relatively non-critical_. Key data does not begin until byte 108
(start of key-bytes) in the LUKS 1 header, or around byte 104 (start
of salt) in LUKS 2.

So _if_ you know the passphrase, whether the header is LUKS 1 or LUKS
2 (which stores an extra copy of the header, but seems a worse fit),
while I'm not sure whether there are ready-made tools available to do
it properly, it is _quite possibly_ the case that a valid, working
header can be constructed from what's left _given_ that you know the
passphrase.

-- 
Michael Kjörling
🔗 https://michael.kjorling.se

