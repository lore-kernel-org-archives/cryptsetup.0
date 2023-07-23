Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF28E3C1C
	for <cryptsetup@lists.linux.dev>; Sun, 23 Jul 2023 23:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id D115740C89
	for <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 01:04:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.166
X-Spam-Level:
X-Spam-Status: No, score=-1.166 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KF4STU-_OxSg for <cryptsetup@lists.linux.dev>;
	Mon, 24 Jul 2023 01:04:56 +0200 (CEST)
Received: 
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 017EF40C76
	for <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 01:04:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 239481D0019A
	for <cryptsetup@lists.linux.dev>; Mon, 24 Jul 2023 01:04:55 +0200 (CEST)
Date: Sun, 23 Jul 2023 23:04:54 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Looking for confirmation as I enter the acceptance stage.
Message-ID: <a59bcd66-474e-4844-b9d1-1996ce503ebb@home.arpa>
References: <2159917.irdbgypaU6@laptop>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2159917.irdbgypaU6@laptop>

On 23 Jul 2023 18:40 -0400, from blobfish@gmx.com (blobfish):
> command:    sudo hexdump -C /dev/sdb1 | head -n 1024 > badDriveHexDump1024.txt
> result:     see attached file.

I haven't looked closely at what you posted, but at a glance, it seems
to me that you are in a slightly better position than most. Depending
on exactly what triggers the error message, there just MIGHT POSSIBLY
be a glimmer of hope.

Please post the full output of `blkid /dev/sdb1` and `lsblk -bJO
/dev/sdb1`, along with the output from running `cryptsetup luksOpen`
on the container with `--debug` specified.

Also a clarification: you mention that you know the passphrase. Did
the container have more than one active key slot? (Say, one with a
passphrase you've memorized, and one with the key file you attached.)

Also, would it be possible for you to post the corresponding data
unencoded?

Something like

sudo dd if=/dev/sdb1 of=sdb1.head bs=32525167 count=1
sudo gzip sdb1.head

and post the resulting sdb1.head.gz.

It will contain the same data you have already posted here, only
formatted differently. (32525167 == 0x1f04b60 + 15)

In all cases, of course, adjusting the device name in case you've
rebooted or it otherwise might have changed in the interim.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

