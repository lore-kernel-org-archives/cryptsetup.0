Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1E07C
	for <cryptsetup@lists.linux.dev>; Thu, 31 Mar 2022 19:01:46 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 80013140042
	for <cryptsetup@lists.linux.dev>; Thu, 31 Mar 2022 20:52:12 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 8FE2C17A454; Thu, 31 Mar 2022 20:52:19 +0200 (CEST)
Date: Thu, 31 Mar 2022 20:52:19 +0200
From: Arno Wagner <arno@wagner.name>
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: Re: [Question] Distinction responsibilities LUKS and dm-crypt
Message-ID: <20220331185219.GA18410@tansi.org>
References: <PR3P192MB1087C0EE38951D6391C3B1D5F1E19@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PR3P192MB1087C0EE38951D6391C3B1D5F1E19@PR3P192MB1087.EURP192.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)

First, dm-crypt is the base-mechanism on block-layer.
There is a "plain dm-crypt" encryption mechanism in 
cryptsetup, sometimes abbreviated as "dm-crypt". 
This ione comes with no meta-data. You enter a paword
and if you do not use the default parameters, you state 
them as well each time you open the device.

LUKS adds a header with metadata, possibilities to use
more passwords and use non-default settings withouth
having to state them each time. But LUKS basically only
does a more elaborate set-up and then passes the actual
work on to dm-crypt. 

I hope that clears up some of the confusuion.

Regards,
Arno




On Thu, Mar 31, 2022 at 20:21:00 CEST, Surmont Jasper wrote:
> Dear, keep in mind I’m fairly new to Linux kernel development and
> similar, so my question might sound stupid. 
>  
> Reading through the documentation of both dm-crypt and LUKS, 
> I understand that LUKS is a format specification 
> to allow FDE, and that dm-crypt is a dm target which allows
> encryption / decryption of writes / reads to the block device. 
> 
> However, I'm unsure about
> what each of these now exactly provides (ie what are the responsibilities). In
> the slides  (look link at the bottom) that the author (Milan Broz) made,
> it mentions that LUKS2 can also provide integrity protection (hence making the
> encryption authenticated). From this, and also reading the Luks1 specification
> I think this is not possible in LUKS1. However, later in the slides it talks
> how dm-crypt allows for authenticated encryption. This is where I'm confused;
> do we assume we use LUKS2? 
> 
> I feel like I'm not really grasping the main function and responsibilities of both LUKS and dm-crypt. 
> Thanks! 
>  
> Slides: https://archive.fosdem.org/2018/schedule/event/cryptsetup/attachments/slides/2506/export/events/attachments/cryptsetup/slides/2506/fosdem18_cryptsetup_aead.pdf 
>  
> Sincerely, Jasper Surmont  

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
