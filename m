Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4290C6ADE
	for <cryptsetup@lists.linux.dev>; Tue, 31 Jan 2023 13:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 420213F944
	for <cryptsetup@lists.linux.dev>; Tue, 31 Jan 2023 14:09:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.155
X-Spam-Level:
X-Spam-Status: No, score=-1.155 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, URIBL_BLOCKED=0.001]
	autolearn=no autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VyTwgZzNZeet for <cryptsetup@lists.linux.dev>;
	Tue, 31 Jan 2023 14:09:07 +0100 (CET)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 50A693F81D
	for <cryptsetup@lists.linux.dev>; Tue, 31 Jan 2023 14:09:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 8A6812E025F
	for <cryptsetup@lists.linux.dev>; Tue, 31 Jan 2023 14:09:06 +0100 (CET)
Date: Tue, 31 Jan 2023 13:09:05 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Assistance required
Message-ID: <d08a3c6e-aa13-4af8-88a1-7375e827f3e6@home.arpa>
References: <CAP9n+XEKNXm5YByQ_LiKcu3H4cY1SSRfCsAs6+=v-9HnVFCqOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP9n+XEKNXm5YByQ_LiKcu3H4cY1SSRfCsAs6+=v-9HnVFCqOw@mail.gmail.com>

On 31 Jan 2023 10:58 +0100, from sensei.of.darkness@gmail.com (Sascha Sander):
> But unfornutaley I need to know the previous passphrase to add a new one.
> Is there *any* possibility to access the data?

Unfortunately, the general answer to this is no, there is not.

If it was possible to access the data inside a LUKS container without
knowing a valid passphrase for the container, then that would
completely undermine the entire purpose of having full disk encryption
in the first place; so anything like that would be a serious design
flaw.

I'm sorry.

Your best bet would be a backup that you are able to access. Is it
correct to assume that such backups do not exist in this case?

If you remember _something_ about the passphrase, then you might be
able to use that knowledge to set up a password cracker, but even so,
it would take a long time for it to work through even a small number
of possibilities with cryptsetup's default settings (which IIRC is 1-2
seconds' worth of key derivation iteration count on the system where
the LUKS container is created). This is helpful mostly when you
remember _almost_ all of a passphrase.

_IF_ the container was still open on a system where you have root
privileges, then there exist ways to set up a key slot with a known
passphrase even if you do not know any current passphrase. It doesn't
sound like this is the case in your situation, but on the odd chance
that it is, DO NOTHING THAT WOULD CAUSE THE CONTAINER TO BE CLOSED. Do
not "luksClose" it, do not reboot the system, do not unplug the
underlying storage device, or anything else like that. That situation
is salvageable.

-- 
Michael Kjörling                     🏡 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

