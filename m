Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3261CB80
	for <cryptsetup@lists.linux.dev>; Tue, 14 Feb 2023 22:17:22 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id E3DD4140155
	for <cryptsetup@lists.linux.dev>; Tue, 14 Feb 2023 23:16:47 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 1585A17A45F; Tue, 14 Feb 2023 23:17:11 +0100 (CET)
Date: Tue, 14 Feb 2023 23:17:11 +0100
From: Arno Wagner <arno@wagner.name>
To: cryptsetup@lists.linux.dev
Subject: Re: Filling a device with random data
Message-ID: <20230214221711.GA12121@tansi.org>
References: <aec223f2-34f1-45ca-83a4-024e66490ee5@app.fastmail.com>
 <20230209040200.GA3642@tansi.org>
 <d30a4af6-8a91-42ea-973d-f16f1f361023@app.fastmail.com>
 <c2a2929d-29dd-48c4-9b37-b3ac7a6f072f@home.arpa>
 <Y+VDmGLcSavEBFig@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+VDmGLcSavEBFig@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

As I said, it is old. Old like some not having 
hardware support and /dev/urandom being dog-slow.

Toaday, it is not really a problem doing this fast.

Regards,
Arno



On Thu, Feb 09, 2023 at 20:03:52 CET, Eric Biggers wrote:
> While this is a creative use of dm-crypt, a cleaner way to generate very
> high throughput cryptographically secure random data (specifically, even
> higher throughput than /dev/urandom which is usually good enough) is to
> just generate it in userspace.  For example, the command 'openssl rand
> $LENGTH' does this.
> 
> - Eric

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
