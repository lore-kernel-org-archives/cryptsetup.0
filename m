Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se [213.80.101.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB0D7481
	for <cryptsetup@lists.linux.dev>; Mon, 20 Mar 2023 20:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 244B43F4E6
	for <cryptsetup@lists.linux.dev>; Mon, 20 Mar 2023 21:38:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.155
X-Spam-Level:
X-Spam-Status: No, score=-1.155 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, URIBL_BLOCKED=0.001]
	autolearn=no autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9vxaiwTX6dKS for <cryptsetup@lists.linux.dev>;
	Mon, 20 Mar 2023 21:38:58 +0100 (CET)
Received: 
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 02C5C3F3C3
	for <cryptsetup@lists.linux.dev>; Mon, 20 Mar 2023 21:38:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 87B652E0404
	for <cryptsetup@lists.linux.dev>; Mon, 20 Mar 2023 21:38:57 +0100 (CET)
Date: Mon, 20 Mar 2023 20:38:56 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Password hash as LUKS key
Message-ID: <1cc08835-9878-4a38-94e0-ea812fa22c37@home.arpa>
References: <1738775229.2387123.1678372528163.ref@mail.yahoo.com>
 <1738775229.2387123.1678372528163@mail.yahoo.com>
 <20230310011952.GA1141@tansi.org>
 <885982240.717525.1678893078734@mail.yahoo.com>
 <06e718ed-b377-4b8d-b1f1-31abd40a4dc7@home.arpa>
 <20230320170642.dscsp2nlqos55cpk@debian64.Core>
 <20230320185351.GC32226@tansi.org>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320185351.GC32226@tansi.org>

On 20 Mar 2023 19:53 +0100, from arno@wagner.name (Arno Wagner):
> As long as you pipe in the same thing on slot password setup and 
> on slot unlock, it should work. Does not matter what it looks
> like. So using an encrypted password works as long as it is
> encrypted the same way each time and the rules for giving
> it to cryptsetup are observed.
> 
>> "I want to encrypt a drive for a user and I don't want the user to send me
>> their password in clear text."
> 
> Sure. See above. You may want to have a look at the section
> "NOTES ON PASSPHRASE PROCESSING FOR LUKS" in the cryptsetup
> man page.

But then the encrypted or hashed value corresponding to the passphrase
_becomes_ the container passphrase, and the plaintext passphrase that
was used to generate that value never figures into container creation
or usage.

If I understand correctly what Martin is trying to do, it is more
along the lines of:

1. Alice picks a secret LUKS container passphrase x.

2. Alice generates value x' = f(x), for some f(), such that x cannot
be derived from x'.

3. Alice provides Bob with the value x'.

4. Bob somehow uses the value x' to create a LUKS container and
ideally also populates the container with data based on plaintext data
provided by Alice.

5. Bob provides Alice with the container created in step 4.

6. Alice uses the secret value x to open the container and use it.

7. Eve, having seen the value x' and the full LUKS container
ciphertext including the LUKS header, is unable to use this knowledge
to access the plaintext contents of the LUKS container. (Eve may be
Bob.)

The question then boils down to: is there a way to provide especially
luksFormat with _something_ that is _not_ itself the passphrase, and
from which the desired passphrase cannot be derived (because if the
passphrase can be derived from what's provided, then there's really no
point to all this), yet which results in a known passphrase being
usable for unlocking the resultant LUKS container?

My gut feeling is that no, there isn't. The closest I can come up with
which _might_ be possible to press into service for this usage is to
create a container with a specific master key and grafting a different
header onto the container after the fact, which would be a relatively
complex and fairly risky operation that a user who isn't able/willing
to encrypt their own data probably shouldn't be undertaking.

Since this user clearly already trusts Martin with access to the
plaintext data, maybe the easiest way is to set up a container with an
empty (or trivial) password, and provide the user with a command to
change the passphrase and provide the user with clear instructions
that THIS MUST BE DONE before doing anything else with the drive. If
there is physical delivery involved, Martin could even hook up the
drive containing the container, start the password change process, and
walk out of the room as the user enters their actual desired passphrase.

Martin could still have a copy of the master key, including through a
header backup with the known passphrase; this can be worked around by
the user reencrypting the container, since that changes the master
key. LUKS 2's restartable reencryption might come in handy here.

Martin could have copied the user's data in plaintext and thus retain
access to it indefinitely; this is clearly a risk that this user is
willing to accept.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

