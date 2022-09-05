Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048B34416
	for <cryptsetup@lists.linux.dev>; Mon,  5 Sep 2022 15:15:30 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id BB22314013A;
	Mon,  5 Sep 2022 17:09:14 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id AF3E217A45A; Mon,  5 Sep 2022 17:09:29 +0200 (CEST)
Date: Mon, 5 Sep 2022 17:09:29 +0200
From: Arno Wagner <arno@wagner.name>
To: =?iso-8859-1?Q?Krist=F3f?= Csillag <csillag.kristof@gmail.com>
Cc: cryptsetup@lists.linux.dev
Subject: Re: performance and threads
Message-ID: <20220905150929.GA3793@tansi.org>
References: <CAEBTHXYF+90eqqOnrW7M9BjiGomBCqj43xbQ47WBNam0-krbAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEBTHXYF+90eqqOnrW7M9BjiGomBCqj43xbQ47WBNam0-krbAA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

encryption is not actually CPU bound for AES, as modern CPUs
do AES hardware. So it may appear the CPU is idle, but its
AES hardware is not.

At these speeds, the penalty you see is probably just memory
bandwidth limitations stemming from the copy that has to be
made when encrypting or decrypting. I would say these speeds
look as expected.

Kind Regards,
Arno

P.S.: I just leaned that signing with "Regards" basically means
"You are the worst!", so I am not using that anymore:
https://www.youtube.com/watch?v=owzPL9jaSU8&t=478s



On Mon, Sep 05, 2022 at 05:52:06 CEST, Kristóf Csillag wrote:
> Dear all,
> 
> I would like to ask you if what I am seeing is normal, or it's some
> configuration problem.
> 
> Short summary: reading my encrypted is a lot slower than reading it
> raw, while the CPU is underutilized.
> 
> Detailed version:
> 
> I have a RAID1 device, consisting of two identical NVMe devices.
> On the top of the RAID device, I have LUKS encryption.
> 
> These are the read speeds:
> 
> - Raw device read: 2,3 GB/s
> - RAID device read: 2,3 GB/s
> - Reading from the encrypted device: 1,6 GB/s
> 
> As you can see, there is a pretty serious performance penalty for the
> decryption.
> The cipher running is the default aes-xts-plain64 cipher.
> This is an AMD Ryzen 9 5900X 12-Core CPU, so I'm not sure what this is.
> What is even more interesting, is that the CPU doesn't seem to be all
> that busy during the reading. as far as I can tell, I only get 4
> threads of kworker / kcryptd, and their total system load is less than
> 100% (of 1 core.)
> 
> So I'm getting the impression that even though decryption is a
> CPU-bound process, my CPU is still underutilized.
> 
> Is this interpretation correct? If yes, is this to be expected, or am
> I doing something wrong? Can dm-crypt be configured to run the
> encryption on more CPU cores, with better performance?
> 
> Thank you for your help:
> 
>     Kristof Csillag
> 
> ps. I'm on kernel 5.19

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
