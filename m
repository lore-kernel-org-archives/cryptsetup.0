Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227111426E
	for <cryptsetup@lists.linux.dev>; Fri, 28 Jul 2023 18:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 9EAC43FAEA
	for <cryptsetup@lists.linux.dev>; Fri, 28 Jul 2023 20:50:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.165
X-Spam-Level:
X-Spam-Status: No, score=-1.165 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, T_SCC_BODY_TEXT_LINE=-0.01,
	URIBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNIOmAcmCDsV for <cryptsetup@lists.linux.dev>;
	Fri, 28 Jul 2023 20:50:05 +0200 (CEST)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 9F4C73F8F9
	for <cryptsetup@lists.linux.dev>; Fri, 28 Jul 2023 20:50:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id B53C71D00194
	for <cryptsetup@lists.linux.dev>; Fri, 28 Jul 2023 20:50:04 +0200 (CEST)
Date: Fri, 28 Jul 2023 18:50:03 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Looking for confirmation as I enter the acceptance stage. --
 SOLVED
Message-ID: <1f32e042-c3fc-40b0-96c1-5d81a0c82391@home.arpa>
References: <2159917.irdbgypaU6@laptop>
 <3554948.iIbC2pHGDl@laptop>
 <c5d4730e-a1d3-401b-9be5-aa5311ca3166@home.arpa>
 <13313734.uLZWGnKmhe@laptop>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13313734.uLZWGnKmhe@laptop>

On 28 Jul 2023 11:23 -0400, from blobfish@gmx.com (blobfish):
> Anyway, I have made it through and have successfully mounted my filesystem! 
> First look through an looks good.

Congratulations!


> just a little more hand holding, I promise:
> should I get btrfs involved before the copy? like:
>   btrfs check
>   btrfs check --repair
> as far as the copy I was just going to 'cp -avr'. Is there a better command 
> for what I am doing?

I'm only superficially familiar with Btrfs, so do take this with a
pitcher of salt, but if it's similar to ZFS (on which I believe much
of its behavior was initially modeled) in this regard, simply reading
each file in full should be sufficient to know that they are
uncorrupted, and should get you repaired data if something is
corrupted but repairable. Therefore a prior file system check
shouldn't be necessary.

I would suggest using something like `rsync -aAHX` (see the rsync man
page; you may or may not want -S as well) to get as accurate a copy as
possible along with restartability, but really, whichever file copying
tool feels good to you is probably good enough. Redirect its stderr to
a file so that once the copying finishes you'll hopefully have a list
of any files which couldn't be copied and you can decide on a
case-by-case basis what to do with those.

Once the copying finishes you _can_ run a check (on the copy that
you're copying from) if you want to and then re-run the copy to the
temporary storage (this is where restartability comes in) to catch
anything that the repair caused to become visible. I don't know
whether or not that will actually be meaningful or useful.

Then once you're through all that and have confirmed that everything
is working as it should, don't forget to set up for backups going
forward. :-)

I'm taking the liberty of adding SOLVED to the subject line since
you're now in a position that you can access the file system within
the container. Any further questions will probably be more along the
lines of how to deal with the Btrfs file system within, which is off
topic on the cryptsetup mailing list.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

