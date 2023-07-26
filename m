Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF04A111A3
	for <cryptsetup@lists.linux.dev>; Wed, 26 Jul 2023 15:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id EB15E3F38D
	for <cryptsetup@lists.linux.dev>; Wed, 26 Jul 2023 17:50:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.166
X-Spam-Level:
X-Spam-Status: No, score=-1.166 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHTbFTZDaEOx for <cryptsetup@lists.linux.dev>;
	Wed, 26 Jul 2023 17:50:37 +0200 (CEST)
Received: 
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 08C093F264
	for <cryptsetup@lists.linux.dev>; Wed, 26 Jul 2023 17:50:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 682461D00175
	for <cryptsetup@lists.linux.dev>; Wed, 26 Jul 2023 17:50:36 +0200 (CEST)
Date: Wed, 26 Jul 2023 15:50:35 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Looking for confirmation as I enter the acceptance stage.
Message-ID: <a8146e16-1d32-4952-9b38-af1affefb1cb@home.arpa>
References: <2159917.irdbgypaU6@laptop>
 <5860622.MhkbZ0Pkbq@laptop>
 <a543a204-c0c7-4936-8eb0-38fd3ac825b9@home.arpa>
 <4863669.GXAFRqVoOG@laptop>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4863669.GXAFRqVoOG@laptop>

On 26 Jul 2023 11:38 -0400, from blobfish@gmx.com (blobfish):
> Further I did:
> 
> sudo cryptsetup luksOpen sdb1.head.shift mapped1
>   I was prompted for passphrase and entered it.
>   command finished without error.
>   new path at /dev/mapper/mapped1
> 
> I am guessing that is a pretty good sign?

That is an EXTREMELY good sign; it means that cryptsetup is happy with
the LUKS header itself. Having run that, try

sudo file -s /dev/mapper/mapped1

(`-s` tells `file` to treat special files such as block device nodes
no differently from regular files.)

If you are exceptionally lucky, that will return the file system type
(and some metadata) for what you've had inside the LUKS container all
along. If it does, then it just _might_ be the case that getting
actual access to your data only requires one way or another accounting
for whatever caused the LUKS header to be logically shifted within the
partition, which can be done with tools typically available on any
Linux system. But one step at a time.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

