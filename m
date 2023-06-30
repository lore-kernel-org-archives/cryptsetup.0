Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF7CEC3
	for <cryptsetup@lists.linux.dev>; Fri, 30 Jun 2023 02:50:28 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id DF89C140080
	for <cryptsetup@lists.linux.dev>; Fri, 30 Jun 2023 04:49:51 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 6286017A22A; Fri, 30 Jun 2023 04:50:26 +0200 (CEST)
Date: Fri, 30 Jun 2023 04:50:26 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: cryptsetup@lists.linux.dev
Subject: Re: Problem after detaching the header
Message-ID: <20230630025026.GA3372@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <168806625127.6.2008140751957055524.147127853@aleeas.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168806625127.6.2008140751957055524.147127853@aleeas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Looks like the initrd cannot deal with detached headers.
Can you manually map the LUKS container from the 
initrd console? If not, waht errot do you get?

Arno

On Thu, Jun 29, 2023 at 21:17:14 CEST, Darek Hisc wrote:
> Hi
> 
> I am trying to move my current included header from sda2 to a separate raw
> (no file system) partition of device sdb1, but after removing the original
> header the system does not start and stops at the initramfs console.
> 
> OS: LMDE 5 (Linux Mint Debian Edition = de facto Debian 11)
> Standard LVM installation on LUKS2
> 
> I did the following steps:
> 1. cryptsetup luksHeaderBackup /dev/sda2 --header-backup-file /header.img
> 2. dd if=/header.img of=/dev/sdb1
> 3. option luks,discard,tries=3,header=/dev/sdb1 > /etc/crypttab
> 4. update-initramfs -u -k all
> 5. cryptsetup luksErase /dev/sda2
> 
> Up to this point, everything works fine and the system boots up properly
> When, according to the instructions in the https://gitlab.com/cryptsetup/cryptsetup/-/blob/main/FAQ.md I do:
> 6. cryptsetup luksDump /dev/sdb1 > Data segments: offfset: 16777216 bytes
> 7. dd bs=512 count=32768 if=/dev/zero of=/dev/sda2
> the system no longer starts.
> 
> Have I screwed something up or am I missing a step?
> Please help!
> 
> Darek
> 
> 

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
