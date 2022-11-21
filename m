Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBB6443A
	for <cryptsetup@lists.linux.dev>; Mon, 21 Nov 2022 13:31:00 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 384C5140070;
	Mon, 21 Nov 2022 14:24:19 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 0020017A22E; Mon, 21 Nov 2022 14:24:38 +0100 (CET)
Date: Mon, 21 Nov 2022 14:24:38 +0100
From: Arno Wagner <arno@wagner.name>
To: Lamy Geier <lamyergeier@gmail.com>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Frequency of backup of headers for LUKS1 and LUKS2
Message-ID: <20221121132438.GA22361@tansi.org>
References: <5b560ee4-2813-6aa5-484d-1754e118bb90@gmail.com>
 <152dd874-c1ae-8190-9878-e69cada4edab@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152dd874-c1ae-8190-9878-e69cada4edab@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Header backup is only needed if you change the header.
Data-area backup is another question.

Arno


On Mon, Nov 21, 2022 at 12:06:57 CET, Lamy Geier wrote:
> Given that I won't add or remove any key from header key slot, or I won't
> re-encrypt (i.e. change the master key), how often do I need to backup the
> LUKS1 and LUKS2 header? Is doing the backup once enough and making sure that
> the backup is not corrupted?
> 
> Are there any other situation where one needs to backup the headers of LUKS1
> and LUKS2 more often?
> 
> I was wondering if the contents of header changes in any other way, that
> requires backup, if it affects restore possibility.
> 
> Thanks and Regards
> 
> Lamy

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
