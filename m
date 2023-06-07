Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58256118
	for <cryptsetup@lists.linux.dev>; Wed,  7 Jun 2023 19:23:34 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 2E864140119
	for <cryptsetup@lists.linux.dev>; Wed,  7 Jun 2023 21:23:00 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id A21DF17A45F; Wed,  7 Jun 2023 21:23:32 +0200 (CEST)
Date: Wed, 7 Jun 2023 21:23:32 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: cryptsetup@lists.linux.dev
Subject: Re: Wiping disk vs. initializing container
Message-ID: <20230607192332.GA8511@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <20230606230850.630aa048@moon>
 <20230607033038.GA26586@tansi.org>
 <20230607120331.2125480b@moon>
 <ea574f22-87c0-4751-a59f-8e20a01e1e37@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea574f22-87c0-4751-a59f-8e20a01e1e37@home.arpa>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jun 07, 2023 at 13:09:11 CEST, Michael Kjörling wrote:
> On 7 Jun 2023 12:03 +0200, from bugcounterism@malbolge.net:
> > 2. Is initializing a LUKS container with zeroes equivalent to filling a
> >    whole drive with crypto-grade random data if the LUKS container
> >    spans the whole disk?
> 
> It should be. If not, that would be a more general vulnerability.

Except for the header. There may be some space in the header or
between header and data that does not get written this way.
Hence I think I recommend using plain dm-crypt for a cyptsetup
based wipe. The header and empty space is not a concern for
data-patterns leaking from the container though. It is just a
concern for removing old data.

> > 3. The FAQ says:
> > 
> >      If the target was in use previously, it is a good idea to wipe it
> >      before creating the LUKS container in order to remove any trace of
> >      old file systems and data.
> > 
> >    So, isn't just filling the whole disk with random data before setting
> >    up the LUKS container the simplest solution if you want to a) destroy
> >    old data reliably, b) put the disk into a clean state, and c) make
> >    sure that parts of the LUKS container that have not been written to
> >    cannot be distinguished from those that have?
> 
> Generally, absent the key, ciphertext should be indistinguishable from
> random data. So for an adversary who does not have access to the key,
> the disk having been filled with random data (e.g. cat from
> /dev/urandom) or a container having been filled with predictable data
> (e.g. cat from /dev/zero) should be largely equivalent.

It is. Anything else would allow you to break the cipher used.
 
> Also, any random data should be as good as any other random data, so
> there would be no easy way to tell whether a particular chunk of
> random data is there because of an initial overwrite with random data,
> or because of useful data being stored through the later-created LUKS
> container.

That depends. Good quality non-crypto random data often allows you 
to determine the generator state and may even have blatantly obvious
patterns. For example, I remember one generator that just toggled
the smallest bit in the output stream. In that case, you can still 
determine what was written within the container later, because the
ovwerwrite randomness has those patterns while the encrypted data
does not.

> > 4. Should new hard disks that have not been used previously also be
> >    filled with random data in order to achieve c)?
> 
> I would argue that it should, and by extension also for another
> reason: allocation patterns can provide very strong clues both about
> the amount of data stored, and the type of file system within the
> container. A NTFS file system looks very different in terms of
> allocation patterns from an ext4 or Btrfs or exfat file system.

You put in the random data to reduce data leaking from 
the encrypted container. A new disk should hence be treated the
same.
 
> SSDs introduce other factors, particularly relating to wear leveling,
> where a different trade-off might be reasonable.

I would recommend to do it for SSDs also, just be aware it is not 
as good as for spinning disks. Still should help. Maybe do several
random overwrites with SSD. Usually you have a few hundred before
the disks becomes worn out.

Arno 

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
