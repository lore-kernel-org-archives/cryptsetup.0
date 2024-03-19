Received: from w4.tutanota.de (w4.tutanota.de [81.3.6.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875CB7EB
	for <cryptsetup@lists.linux.dev>; Tue, 19 Mar 2024 00:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.3.6.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710807278; cv=none; b=uUq+IcuFmvAz5BLWm/lR1eeXf6KKU45qVAufWt0AfNWZMB96d03OdQrsvfxH8Jv/VK9tpNV7f4WnrwxvkNSC7B2PuuAjgkSIbP96dSkWAuhKQUsf2aTzgetXMk6GTIN/7myFpFfCgH1HyQn7Lkiue5RKkaZt3fdLARxjhb2Fsfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710807278; c=relaxed/simple;
	bh=zBCxitwY2zRNYMs2Ro9wo38B+W/yw/qyi0Myw1+YX/Q=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=jrUk5VLwtpCQCxshrtBByUo4RmrHLLLXNkcP3CncXt5Hp4MToM3AXYz45T07FPUFYPnFIBmGFd8qwHBHPgGjdD47OLomIydKJ1kUE7N4B5h68iex/cduRqUAL+JH8XVOQC7d5Vu+UtxNMHmNVYlNSajGVnLfKxpXxhQQTvNwBhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grigr.xyz; spf=pass smtp.mailfrom=grigr.xyz; dkim=pass (2048-bit key) header.d=grigr.xyz header.i=@grigr.xyz header.b=EzNf3DYl; arc=none smtp.client-ip=81.3.6.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grigr.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grigr.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grigr.xyz header.i=@grigr.xyz header.b="EzNf3DYl"
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
	by w4.tutanota.de (Postfix) with ESMTP id 522131060210;
	Tue, 19 Mar 2024 00:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1710807272;
	s=s1; d=grigr.xyz;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=zBCxitwY2zRNYMs2Ro9wo38B+W/yw/qyi0Myw1+YX/Q=;
	b=EzNf3DYle8ObZaSgDxTexKs/5lWtOJUUsqYllJE1JrKSbknfUuctt5hYWmyf0/q+
	3J0pQG05wqIRXQrVBhBu7tPyt8Hs/HRotzXjIrnzM+f1DM+rVWXkR7WdQCEtFW7ExW0
	LLkPTKr+xqNTEeax4YDGi/ZEi2sJoGZ8uXZ5Y+HCLqCk1LL4NsK76OQAJLQzElmzMgh
	JZyc0GxUIFH3VPQTURJPJufxe4pb7bY6QfyVlLwLB6msnQz575qBwDcKECCco+7lsyq
	AePu8v0HFuwTYgW2AgHqOz+vuu33coMbU7ABNC6QzIp7Hi7P4DHU7cFBCsGEvRLpvac
	N8nKsyrVUA==
Date: Tue, 19 Mar 2024 01:14:32 +0100 (CET)
From: Nikolai Grigoriev <nikolai@grigr.xyz>
To: Ondrej Kozina <okozina@redhat.com>
Cc: Cryptsetup <cryptsetup@lists.linux.dev>
Message-ID: <NtJ2omI--3-9@grigr.xyz>
In-Reply-To: <186111b2-f007-4812-8c62-0a8676d9528c@redhat.com>
References: <NtEMHPl--3-9@grigr.xyz> <c238a50b-e382-4dec-9b4b-9c33e420b541@redhat.com-NtFh9t5--7-9> <NtGgb5H--3-9@grigr.xyz> <186111b2-f007-4812-8c62-0a8676d9528c@redhat.com>
Subject: Re: OPAL setup for a new drive without sedutil initial setup
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I think I have found it.

It appears to be related to=C2=A0https://github.com/Drive-Trust-Alliance/se=
dutil/issues/291

Following the recommendation, I have performed the PSID revert. This did no=
t erase any data but the command has completed successfully.

Then I attempted to do cryptsetup again. That still did not work, although =
the message was different that time - "Incorrect OPAL Admin key".=C2=A0 Aga=
in, I have entered the OPAL Admin password I wanted to be set.

Then I have realized that I did power down the machine=C2=A0 between DriveA=
liance RESCUE image and Arch Linux installer. So I have=C2=A0 downloaded th=
e sedutil-cli official=C2=A0 binary and did the same PSID revert again. The=
n I ran cryptsetup again (cryptsetup --hw-opal-only --type luks2 luksFormat=
 /dev/nvme0n1p3). That command did something for a couple of seconds and th=
en failed with "Cannot setup OPAL segment." error message.
I assumed this error has left the drive in=C2=A0 semi-configured state so I=
 did PSID revert one more time. This time the drive=C2=A0 did get erased - =
which mean cryptsetup has at least configured the Admin1 password.

I have=C2=A0 recreated my partitions and now performed initialsetup with se=
dutil. That did work correctly, no errors. Then I retried cryptsetup, now u=
sing the actual Admin1 password already set. This command has failed again =
with the same "Cannot setup OPAL segment" error message.
If I list the locking ranges with sedutil after this failure, it shows 9=C2=
=A0 (0-8)=C2=A0 LRs, none of them is configured. It is clear that it=C2=A0 =
fails somewhere in=C2=A0opal_setup_ranges() function.

Just out of curiosity, I have attempted to set up the locking range manuall=
y with sedutil. In my case the start is 786688,=C2=A0 the len is 487591936 =
sectors (sectors are=C2=A0 4k physica/logical). That worked. And I could se=
e LR1 set up correctly. And I was able to lock it.

What I am trying to do is to enable encryption for LVM partition. Just to h=
ave EFI and boot partitions unencrypted and everything else encrypted and m=
anaged via LVM.
Interestingly enough, when I tried to "eraseLockingRange" with sedutil-cli,=
 I have got the following error: "eraseLockingRange is not implemented. It =
is not part of the Opal SSC."

cryptsetup debug output seems to suggest that it tries to erase the LR 3 (w=
hy 3?? I have only one used + 0 is for entire disk).
----------- debug output -------------------

# cryptsetup 2.7.0 processing "cryptsetup --hw-opal-only --debug luksFormat=
 /dev/nvme0n1p3"
# Verifying parameters for command luksFormat.
# Running command luksFormat.
# Installing SIGINT/SIGTERM handler.
# Unblocking interruption on signal.
# Allocating context for crypt device /dev/nvme0n1p3.
# Trying to open and read device /dev/nvme0n1p3 with direct-io.
# Initialising device-mapper backend library.
# Blkid check (filter none).

WARNING!
=3D=3D=3D=3D=3D=3D=3D=3D
This will overwrite data on /dev/nvme0n1p3 irrevocably.

Are you sure? (Type 'yes' in capital letters): # Interactive passphrase ent=
ry requested.
# Interactive passphrase entry requested.
# Crypto backend (OpenSSL 3.2.1 30 Jan 2024 [default][legacy][threads][argo=
n2]) initialized in cryptsetup library version 2.7.0.
# Detected kernel Linux 6.7.6-arch1-2 x86_64.
# PBKDF argon2id, time_ms 2000 (iterations 0), max_memory_kb 1048576, paral=
lel_threads 4.
# Formatting device /dev/nvme0n1p3 as type LUKS2 with OPAL HW encryption.
# OPAL GET_STATUS: flags:119
# Reusing open ro fd on device /dev/nvme0n1p3
# OPAL GET_GEOMETRY: align:1, lb_size:4096, gran:8, lowest_lba:0
# OPAL geometry: alignment: 'y', logical block size: 4096, alignment granul=
arity: 8, lowest aligned LBA: 0
# OPAL alignment (4096/8), offset =3D 0. Required alignment is 1048576.
# Formatting LUKS2 with JSON metadata area 12288 bytes and keyslots area 16=
744448 bytes.
# Creating new digest 0 (pbkdf2).
# Setting PBKDF2 type key digest 0.
# Running pbkdf2(sha256) benchmark.
# PBKDF benchmark: memory cost =3D 0, iterations =3D 4681142, threads =3D 0=
 (took 7 ms)
# PBKDF benchmark: memory cost =3D 0, iterations =3D 5518821, threads =3D 0=
 (took 95 ms)
# PBKDF benchmark: memory cost =3D 0, iterations =3D 5433036, threads =3D 0=
 (took 772 ms)
# Benchmark returns pbkdf2(sha256) 5433036 iterations, 0 memory, 0 threads =
(for 256-bits key).
# Segment 0 assigned to digest 0.
# Adding LUKS2 OPAL requirement flag.
# LUKS2 requirements detected:
# opal - known
# LUKS2 requirements detected:
# opal - known
# LUKS2 requirements detected:
# opal - known
# Device size 1997176569856, offset 16777216.
# Wiping LUKS areas (0x000000 - 0x1000000) with zeroes.
# Wiping keyslots area (0x008000 - 0x1000000) with random data.
# Reusing open rw fd on device /dev/nvme0n1p3
# Reusing open ro fd on device /dev/nvme0n1p3
# Acquiring blocking write lock for resource OPAL_259:3.
# Opening lock resource file /run/cryptsetup/LN_OPAL_259:3
# Verifying lock handle for OPAL_259:3.
# WRITE lock for resource OPAL_259:3 taken.
# Reusing open ro fd on device /dev/nvme0n1p3
# Reusing open ro fd on device /dev/nvme0n1p3
# OPAL GET_STATUS: flags:119
# OPAL ERASE_LR: sum:0, who:0, lr:3
# OPAL ERASE_LR failed: not authorized
# Failed to reset (erase) OPAL locking range 3 on device '/dev/nvme0n1p3': =
not authorized
# OPAL SECURE_ERASE_LR: sum:0, who:0, lr:3
# OPAL SECURE_ERASE_LR failed: not authorized
# Failed to reset (secure erase) OPAL locking range 3 on device '/dev/nvme0=
n1p3': not authorized
# Unlocking WRITE lock for resource OPAL_259:3.
# Releasing crypt device /dev/nvme0n1p3 context.
# Releasing device-mapper backend.
# Closing read only fd for /dev/nvme0n1p3.
# Closing read write fd for /dev/nvme0n1p3.
Command failed with code -1 (wrong or missing parameters).

------------ end ----------------------------

--
Nikolai Grigoriev



Mar 18, 2024, 09:45 by okozina@redhat.com:

> On 18/03/2024 14:13, Nikolai Grigoriev wrote:
>
>> I tried to enter a password expecting it to become my new Admin1 passwor=
d. That did not work. The message was something like "Invalid Admin1 passwo=
rd or permission denied". I ran it with "--hw-opal-only" against /dev/nvme0=
n1p3. The drive us brand-new Crucial T500 2Tb. Never used sedutil on it. I =
will try sedutil now to see what is going on and to set my password.
>>
> Well, sedutils will ask for the Admin1 pin as well before it can report a=
nything interesting (e.g.: list existing/active locking ranges).
>
> Feel free to open an issue on upstream tracker: https://gitlab.com/crypts=
etup/cryptsetup/-/issues, just add --debug parameter in luksFormat command.
>
> Also the device model would be nice to further debug the issue provided i=
t's this very device it does not work with (e.g. "nvme list" command output=
)
>
> Kind regards
> O.
>

