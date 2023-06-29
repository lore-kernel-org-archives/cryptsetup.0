Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BABC2F1
	for <cryptsetup@lists.linux.dev>; Thu, 29 Jun 2023 13:23:37 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 2CD42140080;
	Thu, 29 Jun 2023 15:17:28 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 9B29B17A22A; Thu, 29 Jun 2023 15:18:02 +0200 (CEST)
Date: Thu, 29 Jun 2023 15:18:02 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: Fernando <s.frmattos@gmail.com>
Cc: cryptsetup@lists.linux.dev
Subject: Re: [Question] Luks container mounted on multiple devices via network
Message-ID: <20230629131802.GA2765@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <CAF8rEhp6KN18ZAMCs-vt1dfXt3CJyN3pQbxyKu7w2EUrSt0yQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF8rEhp6KN18ZAMCs-vt1dfXt3CJyN3pQbxyKu7w2EUrSt0yQA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Fernando,

you very likelt do not have a LUKS problem. As long as you 
can see anything in the LUKS container, LUKS is doing its job.

What I think may be the problem here is some file-system
incompatibility, like extended attributes on Debian or the
like. You may want to look at the mount-option each system uses.
I cannot really help you more, I have never run into this
type of problem.

Arno

On Wed, Jun 28, 2023 at 23:27:20 CEST, Fernando wrote:
> I have a 50GB container stored on a NAS I've been using for more than
> a year. Today, I needed to mount this container on multiple devices
> (Debian, Kali and WSL), and I had no problems, until I noticed that
> the files transferred from DEBIAN to the container were not displayed
> on KALI and WSL. I unmounted the container on all devices and
> remounted. The files are there, but I can only see it on the device
> that saved the files. All devices are using the same version of
> cryptsetup.
> 
> Is that normal? Am I missing something?
> I'm backing up all the files, and I noticed no damage to the files.

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
