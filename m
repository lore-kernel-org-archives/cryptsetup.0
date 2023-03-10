Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366187E6
	for <cryptsetup@lists.linux.dev>; Fri, 10 Mar 2023 01:20:00 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 2F08D140117;
	Fri, 10 Mar 2023 02:19:26 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 6D8D217A48B; Fri, 10 Mar 2023 02:19:52 +0100 (CET)
Date: Fri, 10 Mar 2023 02:19:52 +0100
From: Arno Wagner <arno@wagner.name>
To: Martin Olsson <martinolsson311@yahoo.com>
Cc: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: Re: Password hash as LUKS key
Message-ID: <20230310011952.GA1141@tansi.org>
References: <1738775229.2387123.1678372528163.ref@mail.yahoo.com>
 <1738775229.2387123.1678372528163@mail.yahoo.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1738775229.2387123.1678372528163@mail.yahoo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

You probably have an issue with line endings. In priciple,
this works and is supported, but interactive, pipe and 
read-from-file are all a bit different.

The man-page has more info on this. Best try it out with a
really simple password like "test".

Regards,
Arno


On Thu, Mar 09, 2023 at 15:35:28 CET, Martin Olsson wrote:
> Hey,
> 
> I want to encrypt drives for users. I want to avoid having their password sent to me in clear text. 
> I was thinking of having them use a tool like mkpasswd to create a password hash and then 
> pipe the generated hash into cryptsetup luksAddKey.
> 
> Unfortunately that didn't work when I tried it. 
> 
> So I guess it's not supported right? Maybe you know some other way to achieve what I want to accomplish?
> 
> BR,
> Martin

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
