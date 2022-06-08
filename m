Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537BD17D4
	for <cryptsetup@lists.linux.dev>; Wed,  8 Jun 2022 06:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id EEB083F4DA
	for <cryptsetup@lists.linux.dev>; Wed,  8 Jun 2022 08:13:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.909
X-Spam-Level:
X-Spam-Status: No, score=-1.909 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
	autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnCZwZ2J0W_f for <cryptsetup@lists.linux.dev>;
	Wed,  8 Jun 2022 08:13:30 +0200 (CEST)
Received: 
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id ACF623F478
	for <cryptsetup@lists.linux.dev>; Wed,  8 Jun 2022 08:13:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 124BB2E0077
	for <cryptsetup@lists.linux.dev>; Wed,  8 Jun 2022 08:13:30 +0200 (CEST)
Date: Wed, 8 Jun 2022 06:13:28 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <michael@kjorling.se>
To: cryptsetup@lists.linux.dev
Subject: Re: To make LUKS detached header even more secure?
Message-ID: <7bc1cb96-dd96-4c5d-9d68-745f9c2ddc13@home.arpa>
References: <54cc6381-7c40-471e-a902-1dadfb95c5d0@home.arpa>
 <CAF_ETu5COFQ8D09K3YrqOD4XnFb7MzLrJXvSqMGenw_DFcaJiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF_ETu5COFQ8D09K3YrqOD4XnFb7MzLrJXvSqMGenw_DFcaJiw@mail.gmail.com>

On 8 Jun 2022 08:05 +0800, from midnite.hk@gmail.com (midnite zandiro):
> As I am far from a professional in cryptography, I aim to replicate
> the algorithms of LUKS, hoping to achieve the same level of
> cryptographic strength.

If you aren't well-versed in cryptography, I strongly urge you to not
fiddle with cryptography, but to rather use what's available and
already thoroughly vetted. Even tiny details can matter A LOT, and
even experts get things wrong from time to time. For the vast, vast,
VAST majority of people, to use a widely reviewed, well-vetted design
and implementation of similarly well-vetted algorithms is the best way
to avoid such traps.

I get it. It's fun to try to improve on things, but the odds are good
that one subtly breaks something in the process, which in turn makes
an attack easier; sometimes _much_ easier.


>> (Detached header) No, that is not proper 2FA. As is clearly demonstrated by your
>> argument about how the second storage device can be copied (and
>> relatively easily, at that), both are "something you know".

You misrepresent the intention of what I wrote. My statement about 2FA
was about the combination of a detached header and a keyslot
passphrase, or alternatively having two detached-header parts and a
keyslot passphrase. Not least since the detached header is trivial to
copy, it remains "something you know"; the physical storage device
itself may be "something you have", but that's immaterial since the
storage device itself (as opposed to what's stored on it) has no
significant bearing on the overall system security.

> I would like to point out that, even if the detached header is in the
> hand of another person who does not know the passphrase, an attacker
> who acquired the detached header is sufficient to start the cracking.
> It is identical to the non-detached header scenario.

This much I agree with.

> The attacker is
> just yet to obtain the actual data. Given that (as far as I can find)
> no security advice on the Internet which encourages re-encryption of
> the entire volume on a regular basis, the data is at plain risk until
> the hard disk dies. In which, a patient attacker can have 3 to 5 more
> years to work on cracking.

As I see it, the value of reencryption for these purposes basically
requires three things to be true:

(a) the attacker has access to the LUKS header
(b) the attacker will, at some future point in time, have access to
the locked container, but does not have such access now
(c) the attacker does not and will not have access to the legitimately
unlocked container

If the attacker has access to the unlocked volume, then LUKS provides
no additional security, hence (c); that is the nature of full-disk
encryption.

The combination of (a) and (b) pretty much means that this only
applies for detached header containers.

Overall, this is a pretty narrow use case. There are also downsides to
reencryption, not least that in LUKS 1, reencryption is a potentially
catastrophic operation; if the process is interrupted for some reason,
it can lead to significant data loss. (Restartable reencryption in
LUKS 2 solves that.) It's also a long-running, write-heavy operation;
for any media with write endurance limits, such as SSDs and some
rotational HDDs, that can be a consideration. (I'm not in the "you
must worry about SSD write endurance" camp, but there's a difference
between not worrying and doing unnecessary full-disk writes
repeatedly.)


>> You claim increased resistance to passphrase guessing by an attacker
>> who has access to the detached header but not the encrypted (locked)
>> container itself, but there's already a simple way to do that:
>> increase iteration count, passphrase length, or both.
> 
> I do agree that the current LUKS, with the contemporary hashes, is
> already very strong. But the strengths of encryption algorithms depend
> mostly on the speed of processing power. It is strong today. It may be
> breakable next year.

Your claim that "the strengths of encryption algorithms depend mostly
on the speed of processing power" is incorrect. Take a 256-bit
symmetric key as an example, such as with AES-256 without XTS. (I'm
not quite sure myself how XTS plays into this, but it doesn't make it
easier for an attacker.) There are _physical_ limitations with
anything that even resembles a classical computer that pretty much
guarantee that even _counting_ through all the values up to 2^256
would take more energy than the total energy output of the Sun for the
remainder of its life, and that's before you even _do_ anything with
the counted value. If you assume a useful quantum computer running
Grover's algorithm, that reduces to 2^128 operations, but for an
attack on, say, AES, those operations still might be complex and
certainly in public we're nowhere near a quantum computer that can
actually do that (just look at quantum computer error rates and how
they scale with increasing numbers of qubits for one aspect of this).

The slightly less unlikely _cryptographic_ attack is that someone
finds a flaw that allows them to shave more than fractions of bits
work factor off an attack against, say, AES, but at this point AES
certainly looks robust enough that this possibility appears very
remote. We don't even really have that against DES, it's just that
computational ability caught up with its relatively short key length.
Wikipedia still puts the current best attack against full AES-256,
which is what we would be talking about here, still at a 2^254.6 work
factor; that's cryptographically interesting, but meaningless for a
practical attack.

The _far more plausible_ scenario is that, as in the XKCD cartoon I
pointed out in my previous reply, someone drugs, physically abuses the
user (or someone the user cares about), or otherwise coerces the user,
until the user reveals the passphrase or other material required to
unlock the container, which is _hardly_ a covert attack; or goes after
some other part of the overall security system through for example an
evil maid attack, in which case the problem isn't the cryptographic
design or implementation in the first place.

Again, I'm assuming that the user has a strong passphrase (and
possibly an increased key derivation function iteration count), and
believe that for a scenario in which something like what you propose
might be used this is a reasonable assumption. This means that
attacking the passphrase will also come at a significant cost,
potentially comparable to an attack on the cryptographic key material
directly.


> One more point to note in real life scenarios, users tend to have
> multiple copies (the need of backups) of the header USB Keys carrying
> around, to the office, to the cafe, etc.

Backups don't need to be stored unencrypted and readily readable or
usable themselves. By their very nature, backups are rarely read
(which is not to say that they shouldn't occasionally be confirmed to
be readable and usable).

-- 
Michael Kjörling • https://michael.kjorling.se • michael@kjorling.se
 “Remember when, on the Internet, nobody cared that you were a dog?”

