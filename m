Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98EFC1FA1
	for <cryptsetup@lists.linux.dev>; Tue, 22 Aug 2023 10:09:07 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id E00D51402AD
	for <cryptsetup@lists.linux.dev>; Tue, 22 Aug 2023 12:08:25 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id CF0B017A1F4; Tue, 22 Aug 2023 12:09:05 +0200 (CEST)
Date: Tue, 22 Aug 2023 12:09:05 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: cryptsetup development <cryptsetup@lists.linux.dev>
Subject: Re: Unlock a Veracrypt/Truecrypt partition which uses a keyfile with
 a passphrase from /etc/crypttab
Message-ID: <20230822100905.GA8037@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <CALmZR2OZ0sKRui1Eu1FxQzBCBhvHHXbsHipGq+jfPUcteROS9A@mail.gmail.com>
 <20230822093701.GA7436@tansi.org>
 <42e1583e-2407-448b-8143-678480344a1a@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42e1583e-2407-448b-8143-678480344a1a@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Aug 22, 2023 at 12:01:37 CEST, Milan Broz wrote:
> On 8/22/23 11:37, Arno Wagner wrote:
> > That sounds like a question for the Veracrypt maintainers.
> > /etc/crypttab is not even used by cryptestup, the topic
> > of this mailing list.
> 
> Actually, this has nothing to do with Veracrypt code, systemd crypttab
> supports mounting of Veracrypt volumes through libcryptsetup.
> 
> Milan

Thanks for the correction. I would not know, I am still 
running systemd-free and have no intentions of changing that.

Arno

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
