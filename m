Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D07F8825
	for <cryptsetup@lists.linux.dev>; Sun, 10 Sep 2023 22:14:52 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 1ACFF14013F
	for <cryptsetup@lists.linux.dev>; Mon, 11 Sep 2023 00:04:32 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id EF07317A4ED; Mon, 11 Sep 2023 00:05:13 +0200 (CEST)
Date: Mon, 11 Sep 2023 00:05:13 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: cryptsetup@lists.linux.dev
Subject: Re: Is it possible to set the amount of CRC32C hashes per a data
 sector in integritysetup?
Message-ID: <20230910220513.GA30714@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <4685725c-4b76-47c2-86b8-377b4e1fc7fd@gmail.com>
 <207ef66a-7797-480e-8ffd-75fd8c5c1d97@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <207ef66a-7797-480e-8ffd-75fd8c5c1d97@home.arpa>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Sep 10, 2023 at 18:53:04 CEST, Michael Kjörling wrote:
> On 10 Sep 2023 18:12 +0300, from bodqhrohro@gmail.com (Горбешко Богдан):
> > AFAIU, the primary goal of dm-integrity is checking if the data are not
> > corrupted and throwing read errors otherwise. Though it still supports
> > checksums besides of hashes. Can they be used for recovering the data
> > on-the-fly?
> 
> _My understanding_ (which may be wrong) is that this is not what
> dm-integrity is intended for; nor does it look like it supports it.
 
It is not. What this needs is things like RAID 1/5/6 (which can 
be done in files) and some specialized tools. 

Incidentally, "checksums" do never support recovery from 
errors. What you need for that is error correcting codes.
Transparently, RAID is probably the easiest option in Linux
and the one the works on sector-level. Given that modern drives
(HDD and SSDs) already do extensive error-correction, you probably
need to deal with whole-sector loss (or worse) to get any
additional effect. 

You can do RAID wia the md layer or integrated in some 
filesystems. 

If this is about some embedded device having its storage 
survive long-term, I suggest going for industrial flash
instead (often PCMCIA, sometimes SD) as that can be 
gotten with 10 years and more data lifetime. 

Regards,
Arno


-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
