Received: from mail-gate.swisscows.email (mail-gate.swisscows.email [146.185.79.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003E419466
	for <cryptsetup@lists.linux.dev>; Wed, 22 Nov 2023 20:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swisscows.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swisscows.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=swisscows.ch header.i=@swisscows.ch header.b="v7QN2gGB"
Received: from mail-gate (localhost [127.0.0.1])
	by mail-gate.swisscows.email (Proxmox) with ESMTP id 1ADF282B83
	for <cryptsetup@lists.linux.dev>; Wed, 22 Nov 2023 21:54:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=swisscows.ch;
	s=postfix; t=1700686440;
	bh=Czt57YYAW3GvXwv2OEp7ViAemnBXqnMCcWMRxfokPd8=;
	h=Date:To:From:Subject;
	b=v7QN2gGB1KnZ0PVpKcBrwPnMuKKbkeSkXKKawiwu1rsdfemwW3N+JhMdNlHxKxAAa
	 riHNRxsD7iJvbBFl/pehEiz9X2CuUsyMMW6PqX4mbmzaXu08peUkd4kcXhOgJN6Tmo
	 +jkdvFARFJ4Vn4/q8VBNmWOybMuLPx09cQH6pZiIcqYoo7WgVWCEtRshdLpKqAyzhJ
	 XO+u8dXwumYUocCnunwx+qHFrshtsXm9WhWCXqcywjjI0xJctzBgWeim2uqeyAlWk/
	 vPbkXrXMPBNjzc17xuPAefHZ57h9th9uuxz2NPAM2jvVkbi00Y/mdItX83lG8DBUkS
	 10Serg3sYCnHw==
Message-ID: <7aac4982-b795-4de6-90f8-ad3f3d806edf@swisscows.ch>
Date: Wed, 22 Nov 2023 21:53:59 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cryptsetup@lists.linux.dev
Content-Language: en-US, de-DE, ru
From: =?UTF-8?Q?Christian_F=C3=B6rster?= <christian.foerster@swisscows.ch>
Subject: Recovery of LUKS keyslot during PBKDF phase of overwrite ChangeKey
 possible?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Good evening,

to make it short: I have started a luksChangeKey operation on keyslot 0 
with --keyslot=0 (overwrite) and bad parameters for argon2id (1000000 
iterations). As letting that run to completion would take at least a 
week, I am looking for a way to recover from this command while the 
volume is still mounted (decrypted). I do not have a header backup. Is 
this possible?

I'm using cryptsetup 2.3.5 and the volume is a LUKS2 volume.

Longer explanation: due to impatience, hangover and inexperience with 
LUKS I misinterpreted the "Iterations" parameter in the "Tokens" section 
of luksdump as being the iterations of the "main" KDF; I wanted to 
increase security by increasing the number of iterations and since the 
parameter shown was about 120,000 I thought I'd just try one million to 
see if that was too much (it was...heh). The command was:

sudo cryptsetup luksChangeKey --key-slot=0 --pbkdf=argon2id 
--pbkdf-memory=4000000 --pbkdf-parallel=12 
--pbkdf-force-iterations=1000000 /dev/

but the last time I tried it with pbkdf-memory=4000000 it only used 2 GB 
due to peculiarities with my system, where the component controlling the 
LUKS container administratively only has 4 GB of RAM, so it probably is 
using only 2 again, now. The parallelity also seems to be limited to 4 
instead of 12 as I've learned reading the FAQ now.

I chose the overwrite parameter (--keyslot=0) because my setup is a bit 
complicated and the key needs to be in keyslot 0 for other system 
components to work properly. There are no other keys or header backups 
or keyslot backups.

I did not know about the cryptsetup benchmark program and did not think 
about creating a header backup first. I do have a full system backup and 
since the system is live I just backed up the important changes I made 
since that last full backup, but I'd prefer not to have to reinstall and 
restore everything, as it's a complicated system.

Having just run the benchmark, it shows 5 iterations for argon2id with 
~1GB of RAM for 2 secs; given the above mentioned parameters of my 
command, I estimate that allowing the command to finish (it is currently 
paused with Ctrl+Z) would take at least a week of full time computing 
with the CPU churning away all this time; I'd like to avoid that.

On the plus side, I've learned some things about LUKS and cryptography 
and the first thing I'll do after recovering from this is make a header 
backup.

So, I reiterate my initial question: is it possible to recover from this 
situation without a complete reinstall or letting the command complete 
for a long time? The disk encryption key should still be in RAM IIUC, 
but since it's LUKS2, according to the FAQ extracting it from there is 
not trivial.

Thank you for any help,

C.F.


