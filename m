Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A298F6B
	for <cryptsetup@lists.linux.dev>; Tue, 22 Aug 2023 09:43:09 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 3FD58140162
	for <cryptsetup@lists.linux.dev>; Tue, 22 Aug 2023 11:36:22 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id 2DF2017A1F4; Tue, 22 Aug 2023 11:37:02 +0200 (CEST)
Date: Tue, 22 Aug 2023 11:37:02 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: cryptsetup@lists.linux.dev
Subject: Re: Unlock a Veracrypt/Truecrypt partition which uses a keyfile with
 a passphrase from /etc/crypttab
Message-ID: <20230822093701.GA7436@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <CALmZR2OZ0sKRui1Eu1FxQzBCBhvHHXbsHipGq+jfPUcteROS9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALmZR2OZ0sKRui1Eu1FxQzBCBhvHHXbsHipGq+jfPUcteROS9A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

That sounds like a question for the Veracrypt maintainers.
/etc/crypttab is not even used by cryptestup, the topic
of this mailing list.

Regards,
Arno

On Tue, Aug 22, 2023 at 11:31:33 CEST, Kent Larsson wrote:
> Hi! I have a Veracrypt (/Truecrypt) volume, which I can successfully
> unlock manually by providing a key file and passphrase:
> 
>     # cryptsetup --type tcrypt --key-file /.keyfile open /dev/nvme0n1p5 shared
>     Enter passphrase for /dev/nvme0n1p5:
> 
> Only root has `rw` on the key file, a binary file of 64 bytes.
> 
>     # ls -l /.keyfile
>     -rw------- 1 root root 64 aug 21 08:09 /.keyfile
>     # file /.keyfile
>     /.keyfile: data
>     # du -b /.keyfile
>     64 /.keyfile
> 
> Is there a way to unlock a Veracrypt (/Truecrypt, `/dev/nvme0n1p5` in
> my case) partition that uses a key file with a password in
> `/etc/crypttab`?
> 
> I have tried constructing a file with the structure
> `{passphrase}{newline}{key file contents}` and manually using it to
> unlock as above, but I still got the passphrase question. To create
> that file, I did the following:
> 
>     # echo 'mypassword' > /.keyfile_psw
>     # cat /.keyfile >> /.keyfile_psw

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
