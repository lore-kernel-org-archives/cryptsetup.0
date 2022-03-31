Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC197C
	for <cryptsetup@lists.linux.dev>; Thu, 31 Mar 2022 19:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id EF8543F5FF
	for <cryptsetup@lists.linux.dev>; Thu, 31 Mar 2022 20:58:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.909
X-Spam-Level:
X-Spam-Status: No, score=-1.909 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
	autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnE2sfn5WAc5 for <cryptsetup@lists.linux.dev>;
	Thu, 31 Mar 2022 20:58:04 +0200 (CEST)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id A42033F5AF
	for <cryptsetup@lists.linux.dev>; Thu, 31 Mar 2022 20:58:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 1A4482E0459
	for <cryptsetup@lists.linux.dev>; Thu, 31 Mar 2022 20:58:04 +0200 (CEST)
Date: Thu, 31 Mar 2022 18:58:03 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <michael@kjorling.se>
To: cryptsetup@lists.linux.dev
Subject: Re: [Question] Distinction responsibilities LUKS and dm-crypt
Message-ID: <e11ef601-e9c3-4509-9d3c-3e34fbdea0b1@localhost>
References: <PR3P192MB1087C0EE38951D6391C3B1D5F1E19@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PR3P192MB1087C0EE38951D6391C3B1D5F1E19@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>

On 31 Mar 2022 18:21 +0000, from jasper.surmont@aalto.fi (Surmont Jasper):
> Reading through the documentation of both dm-crypt and LUKS, 
> I understand that LUKS is a format specification 
> to allow FDE, and that dm-crypt is a dm target which allows
> encryption / decryption of writes / reads to the block device. 
> 
> However, I'm unsure about
> what each of these now exactly provides (ie what are the responsibilities).

Consider the simple case: a plain dm-crypt mapping that uses typical,
non-authenticated, length-preserving (when used for amounts of data
that is a multiple of the block size) encryption.

That gets you encryption, but the encryption metadata (algorithm, key
size, block size, cipher mode, key, ...) must be kept elsewhere,
because there's no room for it within the container itself (because if
there were, the mapping wouldn't be length-preserving). Maybe some of
it, such as the key, is derived from a passphrase provided by the
user, but then you need somewhere to store metadata on _how_ the
transformation from a passphrase to a cryptographic key is performed.
So suppose that, instead of relying solely on the user to memorize
such details, you allow for keeping it in a configuration file
somewhere. Maybe call it /etc/crypttab.

That's still moderately inconvenient, especially when /etc and the
container lives on different media, because the two work in tandem;
one is meaningless without the other. So suppose instead that we were
to reserve a small chunk out of the container itself to hold that
metadata. The encryption can still be length-preserving, but we accept
that the usable size of the container is slightly less than its total
size on the outside, because this metadata requires some non-zero
amount of storage space; just like how we accept that creating a file
system on a volume costs a non-zero amount of storage space out of
that volume in order to provide greater flexibility in its usage. Now
the container itself can hold enough information that it's usable
without any external knowledge that would change from one container to
the next, other than the passphrase.

That latter is basically what LUKS 1 does.

As well as what LUKS 2 does.

There are of course many, many more details to _how_ it's done in
order to make it both secure and usable in practice, but that should
give you a reasonable picture of the different responsibilities
between dm-crypt itself and LUKS.

-- 
Michael Kjörling • https://michael.kjorling.se • michael@kjorling.se
 “Remember when, on the Internet, nobody cared that you were a dog?”

