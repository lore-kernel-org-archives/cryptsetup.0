Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECCAD306
	for <cryptsetup@lists.linux.dev>; Tue, 21 Mar 2023 17:52:53 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 37B14140026;
	Tue, 21 Mar 2023 18:52:23 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 24E4017A283; Tue, 21 Mar 2023 18:52:50 +0100 (CET)
Date: Tue, 21 Mar 2023 18:52:50 +0100
From: Arno Wagner <arno@wagner.name>
To: Michael =?iso-8859-1?Q?Kj=F6rling?= <152cc69a347e@ewoof.net>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Password hash as LUKS key
Message-ID: <20230321175249.GA29177@tansi.org>
References: <1738775229.2387123.1678372528163.ref@mail.yahoo.com>
 <1738775229.2387123.1678372528163@mail.yahoo.com>
 <20230310011952.GA1141@tansi.org>
 <885982240.717525.1678893078734@mail.yahoo.com>
 <06e718ed-b377-4b8d-b1f1-31abd40a4dc7@home.arpa>
 <20230320170642.dscsp2nlqos55cpk@debian64.Core>
 <20230320185351.GC32226@tansi.org>
 <1cc08835-9878-4a38-94e0-ea812fa22c37@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cc08835-9878-4a38-94e0-ea812fa22c37@home.arpa>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Mar 20, 2023 at 21:38:56 CET, Michael Kjörling wrote:
> On 20 Mar 2023 19:53 +0100, from arno@wagner.name (Arno Wagner):
> > As long as you pipe in the same thing on slot password setup and 
> > on slot unlock, it should work. Does not matter what it looks
> > like. So using an encrypted password works as long as it is
> > encrypted the same way each time and the rules for giving
> > it to cryptsetup are observed.
> > 
> >> "I want to encrypt a drive for a user and I don't want the user to send me
> >> their password in clear text."
> > 
> > Sure. See above. You may want to have a look at the section
> > "NOTES ON PASSPHRASE PROCESSING FOR LUKS" in the cryptsetup
> > man page.
> 
> But then the encrypted or hashed value corresponding to the passphrase
> _becomes_ the container passphrase, and the plaintext passphrase that
> was used to generate that value never figures into container creation
> or usage.
> 
> If I understand correctly what Martin is trying to do, it is more
> along the lines of:
> 
> 1. Alice picks a secret LUKS container passphrase x.
> 
> 2. Alice generates value x' = f(x), for some f(), such that x cannot
> be derived from x'.
> 
> 3. Alice provides Bob with the value x'.
> 
> 4. Bob somehow uses the value x' to create a LUKS container and
> ideally also populates the container with data based on plaintext data
> provided by Alice.
> 
> 5. Bob provides Alice with the container created in step 4.
> 
> 6. Alice uses the secret value x to open the container and use it.
> 
> 7. Eve, having seen the value x' and the full LUKS container
> ciphertext including the LUKS header, is unable to use this knowledge
> to access the plaintext contents of the LUKS container. (Eve may be
> Bob.)
> 
> The question then boils down to: is there a way to provide especially
> luksFormat with _something_ that is _not_ itself the passphrase, and
> from which the desired passphrase cannot be derived (because if the
> passphrase can be derived from what's provided, then there's really no
> point to all this), yet which results in a known passphrase being
> usable for unlocking the resultant LUKS container?
> 
> My gut feeling is that no, there isn't. 

Ah. If that is the intent, no there very likely is not. As 
the container is created by Bob and hence the container 
needs to be written by Bob and the container uses symmetric 
crypto, Bob can read it now and in the future, unless 
the master-key gets changed after Bob passes the container 
onwards. I sort-of ruled this use-case out as it is likely 
impossible to implement. 

This use-case would need a public-key scheme right at the 
base of the encryption (no symmetric layer) and that would be 
a different thing than the dm-crypt base used by LUKS and it
would have absolutely horrible performance.

The only way I see here is to create a setup-program that 
Alice can run at her site to create the container. Of course
if Bob does that program, he can still include various forms
of backdoors. If Bob is honest at container creation, he can
just forget the passwords handed to him. And if this is about
transport security during passphrase transfer, use any of the 
established solution for that.

Bottom line: You typically do not get any security against the
person creating your encrypted containers.

Regards,
Arno

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
