Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD03310EB
	for <cryptsetup@lists.linux.dev>; Fri,  4 Nov 2022 07:49:07 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 587611400DA;
	Fri,  4 Nov 2022 08:39:23 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 5B16117A22A; Fri,  4 Nov 2022 08:39:42 +0100 (CET)
Date: Fri, 4 Nov 2022 08:39:42 +0100
From: Arno Wagner <arno@wagner.name>
To: Lamy Geier <lamyergeier@gmail.com>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Questions about Backup and Restore Strategy for LVM2 on LUKS2
 and for LUKS1 on boot partition
Message-ID: <20221104073942.GB12504@tansi.org>
References: <56bfad6c-2ddc-b095-f57e-b6675ce29cc0@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56bfad6c-2ddc-b095-f57e-b6675ce29cc0@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Just one comment on LVM:

LVM makes partitiopn set-up easy for distribution installers,
but it makes things much more complicated. LVM is one of these
tools that are incredibly powerful, but you should only use them
if you have a really good reason to, because it also makes
fixing problems incredibly complex. Unfortunately, there are 
a lot of lazy people out there that will gladly accept a simpler
job now for a much, much harder job in case of problems in 
the future. This is going on all over the software world, 
unfortunately, because the process of engineering software
is not mature at all yet.

So, to be clear, LVM will make it basically impossible to 
recover your LUKS partition if anything goes wrong, because
if it is used, you need to not only understand the technical
details of LUKS (relatively sinmple) but also the technical
details of LVM (pretty complex) to fix anything. 

And that is why I recommend not mixing LUKS and LVM and generally
not using LVM unless there is a very good reason to use it. 
More convenience in writing an installer is not even a regular
good reason. Classical partitions work just fine.

That said, if you have good backup, the danger is a lot smaller.

Regards,
Arno



On Thu, Nov 03, 2022 at 21:59:54 CET, Lamy Geier wrote:
> Hello!
> 
> This is my first ever post in any mailing list, please be a bit forgiving.
> First of all do I need to subscribe to cryptsetup+subscribe@lists.linux.dev
> to receive a reply? Or replies to my email would be delivered to me
> automatically?
> 
> I have read the entire [FrequentlyAskedQuestions · Wiki · cryptsetup /
> cryptsetup · GitLab](https://gitlab.com/cryptsetup/cryptsetup/-/wikis/FrequentlyAskedQuestions),
> but I am a beginner and inexperiences and I would be happy to receive any
> suggestions.
> 
> ## Operating System Installation with LUKS and LVM
> 
> I have installed
> 
>     - LUKS1 on ext4 `/boot` partition.
> 
>     - LVM2 on LUKS2 in a separate partition.
> 
>     - In LVM2, I have one physical volume (my NVME SSD), one volume group
> consisting of 3 logical volume all formatted with ext4: `/`, `/home`,
> `swap`.
> 
>     - I followed the installation of Ubuntu 22.04 instruction from Ubuntu
> Community Wiki [Full_Disk_Encryption_Howto_2019 - Community Help
> Wiki](https://help.ubuntu.com/community/Full_Disk_Encryption_Howto_2019).
> 
> ## Backup Startegy
> 
> On an external drive,
> 
>     - I want to use rsync based [linuxmint/timeshift: System restore tool
> for Linux](https://github.com/linuxmint/timeshift) to backup `/` logical
> volume.
> 
>     - Further, I want to use rsync based [bit-team/backintime: Back In Time
> - A simple backup tool for Linux](https://github.com/bit-team/backintime)
> solution to backup my `/home` logical volume.
> 
>     - I am going to backup the LUKS header of both of the above partitions
> (one of which is `/boot` and the other is the LVM on LUKS partition).
> 
> ## Questions
> 
> 1. It was mentioned in the FAQ to avoid the LVM if possible, but
> unfortunately I read the FAQ only after installing my operating system.
> Could you please tell me if my backup strategy is enough to mitigate any
> disaster (expect that I am not keeping a third backup as per 3-2-1
> strategy)?
> 
> 2. What exactly I need to  be careful about while using LVM on LUKS?
> 
> 3. If the pre-boot authentication fails in case of disaster, I am wondering
> how will I mitigate it. Should I be using a LIVE USB and do LUKS1 Header
> restore for boot partition and then open it using `cryptsetup open` and
> inspect if the data got decrypted? And the same process for the LVM on LUKS
> partition to inspect if the root directory is decrypted?
> 
> 4. Regarding timeshift:
> 
> 4a. Do you think I would be able to restore my system?
> 
> 4b. Also, do you think I also need to backup the `/boot` partition with
> timeshift?
> 
> 4c. I am not exactly sure how the system restore with timeshift work. If the
> LUKS header have been restored as mentioned in step 3, will the timeshift be
> able to restore the system from the external drive after the pre-boot
> authentication. Because the LVM on LUKS partition is unlocked during the
> bootinf and not right after pre boot authentication.
> 
> 5. To restore  the  home logical volume I can do it after the operating
> system is loaded. I was just not sure when and how will I be able to restore
> the  root  logical volume and the boot partition .
> 
> 6. Anything else I need to be careful about LVM on LUKS?
> 
> Thanks and Regards
> 
> Lamy
> 

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
