Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C57F627
	for <cryptsetup@lists.linux.dev>; Thu,  9 Feb 2023 04:08:22 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id D791114003F;
	Thu,  9 Feb 2023 05:01:35 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 3959817A48B; Thu,  9 Feb 2023 05:02:00 +0100 (CET)
Date: Thu, 9 Feb 2023 05:02:00 +0100
From: Arno Wagner <arno@wagner.name>
To: David =?iso-8859-1?Q?Joaqu=EDn?= Shourabi Porcel <david@djsp.eu>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Filling a device with random data
Message-ID: <20230209040200.GA3642@tansi.org>
References: <aec223f2-34f1-45ca-83a4-024e66490ee5@app.fastmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aec223f2-34f1-45ca-83a4-024e66490ee5@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

/dev/urandom has gotten a lot faster. You should be able to
write the data from it directly to the device without  
the plain dm-crypt mapping in between and still get decent
speed.

That said, you can also zero-overwrite a mapped LUKS
container for pretty much the same level of security.
The method with the plain dm-crypt mapping in between 
is _old_. 

Regards,
Arno

On Wed, Feb 08, 2023 at 22:09:54 CET, David Joaquín Shourabi Porcel wrote:
> Hey there :)
> 
> Section 2.19 of the [FAQ][1] explains how to fill devices with random data using dm-crypt: cryptsetup opens a plain mapping, zeros are written to it and it is closed. If LUKS is set up on the device afterwards, this translates to the following commands:
> 
> ```
> cryptsetup open --type=plain --key-file=/dev/urandom -- /dev/foo temporary
> dd if=/dev/zero of=/dev/mapper/temporary
> cryptsetup close -- temporary
> cryptsetup luksFormat -- /dev/foo
> cryptsetup open -- /dev/foo bar
> # mkfs / pvcreate -- /dev/mapper/bar
> ```
> 
> I would like to skip the first mapping and shorten the procedure as follows:
> 
> ```
> cryptsetup luksFormat -- /dev/foo
> cryptsetup open -- /dev/foo bar
> dd if=/dev/zero of=/dev/mapper/bar
> # mkfs / pvcreate -- /dev/mapper/bar
> ```
> 
> Does filling a device with random data under a separate dm-crypt mapping
> offer any security benefit?
> 
> Kind regards,
> 
> David J. Shourabi Porcel
> 
> 
> [1]: https://gitlab.com/cryptsetup/cryptsetup/-/wikis/FrequentlyAskedQuestions

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
