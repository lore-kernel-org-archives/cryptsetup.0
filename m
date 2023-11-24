Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290DC15AFB
	for <cryptsetup@lists.linux.dev>; Fri, 24 Nov 2023 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnowagner.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id A43CF14021C;
	Fri, 24 Nov 2023 10:28:33 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 705B817A23C; Fri, 24 Nov 2023 10:29:22 +0100 (CET)
Date: Fri, 24 Nov 2023 10:29:22 +0100
From: Arno Wagner <wagner@arnowagner.info>
To: cryptsetup@lists.linux.dev
Cc: Christian =?iso-8859-1?Q?F=F6rster?= <christian.foerster@swisscows.ch>
Subject: Re: Recovery of LUKS keyslot during PBKDF phase of overwrite
 ChangeKey possible?
Message-ID: <20231124092922.GB17827@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <7aac4982-b795-4de6-90f8-ad3f3d806edf@swisscows.ch>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7aac4982-b795-4de6-90f8-ad3f3d806edf@swisscows.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Christian,

if the volume is mounted, make a backup 
of its contents and throw the container away.
You should have that backup anyways.

I do not recommend doing _anything_ else before 
you have that backup.

Regards,
Arno

On Wed, Nov 22, 2023 at 21:53:59 CET, Christian Förster wrote:
> Good evening,
> 
> to make it short: I have started a luksChangeKey operation on keyslot 0 with
> --keyslot=0 (overwrite) and bad parameters for argon2id (1000000
> iterations). As letting that run to completion would take at least a week, I
> am looking for a way to recover from this command while the volume is still
> mounted (decrypted). I do not have a header backup. Is this possible?
> 
> I'm using cryptsetup 2.3.5 and the volume is a LUKS2 volume.
> 
> Longer explanation: due to impatience, hangover and inexperience with LUKS I
> misinterpreted the "Iterations" parameter in the "Tokens" section of
> luksdump as being the iterations of the "main" KDF; I wanted to increase
> security by increasing the number of iterations and since the parameter
> shown was about 120,000 I thought I'd just try one million to see if that
> was too much (it was...heh). The command was:
> 
> sudo cryptsetup luksChangeKey --key-slot=0 --pbkdf=argon2id
> --pbkdf-memory=4000000 --pbkdf-parallel=12 --pbkdf-force-iterations=1000000
> /dev/
> 
> but the last time I tried it with pbkdf-memory=4000000 it only used 2 GB due
> to peculiarities with my system, where the component controlling the LUKS
> container administratively only has 4 GB of RAM, so it probably is using
> only 2 again, now. The parallelity also seems to be limited to 4 instead of
> 12 as I've learned reading the FAQ now.
> 
> I chose the overwrite parameter (--keyslot=0) because my setup is a bit
> complicated and the key needs to be in keyslot 0 for other system components
> to work properly. There are no other keys or header backups or keyslot
> backups.
> 
> I did not know about the cryptsetup benchmark program and did not think
> about creating a header backup first. I do have a full system backup and
> since the system is live I just backed up the important changes I made since
> that last full backup, but I'd prefer not to have to reinstall and restore
> everything, as it's a complicated system.
> 
> Having just run the benchmark, it shows 5 iterations for argon2id with ~1GB
> of RAM for 2 secs; given the above mentioned parameters of my command, I
> estimate that allowing the command to finish (it is currently paused with
> Ctrl+Z) would take at least a week of full time computing with the CPU
> churning away all this time; I'd like to avoid that.
> 
> On the plus side, I've learned some things about LUKS and cryptography and
> the first thing I'll do after recovering from this is make a header backup.
> 
> So, I reiterate my initial question: is it possible to recover from this
> situation without a complete reinstall or letting the command complete for a
> long time? The disk encryption key should still be in RAM IIUC, but since
> it's LUKS2, according to the FAQ extracting it from there is not trivial.
> 
> Thank you for any help,
> 
> C.F.
> 
> 

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
