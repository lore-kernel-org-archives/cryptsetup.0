Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D56D530
	for <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 16:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 93BEA40602
	for <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 18:03:16 +0200 (CEST)
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
	with ESMTP id 3YvYz4zVH2GP for <cryptsetup@lists.linux.dev>;
	Mon, 24 Jul 2023 18:03:15 +0200 (CEST)
Received: 
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 810DC405F8
	for <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 18:03:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 897EB1D00111
	for <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 18:03:14 +0200 (CEST)
Date: Mon, 24 Jul 2023 16:03:13 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Looking for confirmation as I enter the acceptance stage.
Message-ID: <a543a204-c0c7-4936-8eb0-38fd3ac825b9@home.arpa>
References: <2159917.irdbgypaU6@laptop>
 <a59bcd66-474e-4844-b9d1-1996ce503ebb@home.arpa>
 <5860622.MhkbZ0Pkbq@laptop>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5860622.MhkbZ0Pkbq@laptop>

On 23 Jul 2023 20:00 -0400, from blobfish@gmx.com (blobfish):
> Thanks for the response. I believe I have all the information you requested in 
> the attached files. Let me know, if not.

I think that there actually just MIGHT be some hope for you. No
guarantees, but certainly to the point of "don't give up JUST yet".

You haven't sent enough for me to properly verify this, but it looks
like somehow, the LUKS header is offset (by a fairly substantial
amount) from where it should be. That would be why cryptsetup isn't
finding it or any backup header, and therefore why it claims that your
HDD is not a valid LUKS device.

I _strongly_ advise you to make a sector-level copy of what you have
before experimenting further with _anything_ that might _possibly_
cause writes to that drive, if you haven't already. (You can use a
second HDD for backups later, so even buying an extra drive isn't a
waste of money.) I suggest to use ddrescue for that purpose. Once you
have a copy you can experiment on that and keep the original pristine;
if you make a mistake, you can simply make a new copy. Opening the
LUKS container should be safe but trying to mount a file system within
it is NOT guaranteed to be safe! (Keep in mind any possible
automounting.)

That said, try something like this (this should be safe _if_ you are
careful with what goes into if= and of= respectively in the dd
command), again adjusting the sdb1 portion if necessary:

$ sudo dd if=/dev/sdb1 skip=126974 bs=256 count=1M of=sdb1.head.shift

$ sudo cryptsetup luksDump ./sdb1.head.shift

$ sudo file ./sdb1.head.shift

(126974 == 0x1effe, 256 == 0x100, 0x1effe * 0x100 == 0x1effe00; using
a slightly larger block size for dd to hopefully make it complete a
little faster than it would with one-byte read/write cycles.)

Let's see what that gets you before we write this off as unfixable.

For comparison, here's what I get when I do something very similar
(using the same offsets) on what you have sent:

$ sudo cryptsetup luksDump ./sdb1.head.skip
Device ./sdb1.head.skip is too small. (LUKS1 requires at least 1049600 bytes.)
Device ./sdb1.head.skip is not a valid LUKS device.
$ file ./sdb1.head.skip 
sdb1.head.skip: LUKS encrypted file, ver 1 [aes, xts-plain64, sha256] UUID: 692c6942-e1e1-4794-a846-83a07ab03570, at 0x10000 data, 32 key bytes, MK digest 0x1e70d124726ed89b9b2b12b7f4fe1f7276496620, MK salt 0x5c704266205429794dde509f2f8954b0daaa5db752c8c8f01d0b0313cae11f0b, 240500 MK iterations; slot #0 active, 0x8 material offset; slot #1 active, 0x108 material offset
$

and if I simply extend sdb1.head.shift to 100M to help cryptsetup make
it past the device size check, it gladly spits out reasonable-looking
data, in the full output also including key slots 0 and 1 being
ENABLED:

$ sudo cryptsetup luksDump ./sdb1.head.skip | head -n8
LUKS header information for ./sdb1.head.shift

Version:       	1
Cipher name:   	aes
Cipher mode:   	xts-plain64
Hash spec:     	sha256
Payload offset:	65536
MK bits:       	256
$

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

