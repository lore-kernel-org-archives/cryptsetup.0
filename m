Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0763E4C7D
	for <cryptsetup@lists.linux.dev>; Mon, 20 Mar 2023 19:01:25 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 008E51400E4;
	Mon, 20 Mar 2023 19:53:24 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id F226217A283; Mon, 20 Mar 2023 19:53:51 +0100 (CET)
Date: Mon, 20 Mar 2023 19:53:51 +0100
From: Arno Wagner <arno@wagner.name>
To: Martin Olsson <martinolsson311@yahoo.com>
Cc: Michael =?iso-8859-1?Q?Kj=F6rling?= <152cc69a347e@ewoof.net>,
	cryptsetup@lists.linux.dev
Subject: Re: Password hash as LUKS key
Message-ID: <20230320185351.GC32226@tansi.org>
References: <1738775229.2387123.1678372528163.ref@mail.yahoo.com>
 <1738775229.2387123.1678372528163@mail.yahoo.com>
 <20230310011952.GA1141@tansi.org>
 <885982240.717525.1678893078734@mail.yahoo.com>
 <06e718ed-b377-4b8d-b1f1-31abd40a4dc7@home.arpa>
 <20230320170642.dscsp2nlqos55cpk@debian64.Core>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320170642.dscsp2nlqos55cpk@debian64.Core>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Mar 20, 2023 at 18:06:42 CET, Martin Olsson wrote:
[...]
> >In priciple,
> >this works and is supported, but interactive, pipe and
> >read-from-file are all a bit different.
> 
> So I decided to give it another try. But I'm pretty sure now that Arno
> misunderstood what I wanted to accomplish.
> 
> I want to encrypt the password before piping it to cryptsetup.
> mkpasswd was just an example of that operation. You can also use python
> for example:

As long as you pipe in the same thing on slot password setup and 
on slot unlock, it should work. Does not matter what it looks
like. So using an encrypted password works as long as it is
encrypted the same way each time and the rules for giving
it to cryptsetup are observed.

> "I want to encrypt a drive for a user and I don't want the user to send me
> their password in clear text."

Sure. See above. You may want to have a look at the section
"NOTES ON PASSPHRASE PROCESSING FOR LUKS" in the cryptsetup
man page.

Regards,
Arno 

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
