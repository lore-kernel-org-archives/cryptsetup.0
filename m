Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C90E134CC
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 17:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id E8D773F759
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 19:27:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.154
X-Spam-Level:
X-Spam-Status: No, score=-1.154 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, URIBL_DBL_BLOCKED=0.001,
	URIBL_ZEN_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXpAgstH4fVP for <cryptsetup@lists.linux.dev>;
	Thu, 24 Aug 2023 19:27:58 +0200 (CEST)
Received: 
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id C49F23F6DF
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 19:27:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id EBBE31D00243
	for <cryptsetup@lists.linux.dev>; Thu, 24 Aug 2023 19:27:57 +0200 (CEST)
Date: Thu, 24 Aug 2023 17:27:56 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Can AddKey not use stdin for the new key?
Message-ID: <f28150bc-89d0-4998-95b4-a4509d3a0624@home.arpa>
References: <ZOcoDVa4p+vJfAm9@xed.ch>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZOcoDVa4p+vJfAm9@xed.ch>

On 24 Aug 2023 05:51 -0400, from chris@xed.ch (Chris X Edwards):
> I create an encrypted secret that I only have to unlock once:
> 
>     dd if=/dev/urandom bs=512 count=1 | gpg --symmetric --output drivekey.gpg

If you are willing to unlock once, you can also use a small LUKS
container to hold a file system holding passphrase or key files for
other LUKS containers. Or you can derive further keys from contents or
metadata of another LUKS container; I've seen suggestions for how to
do this scattered about the Web.


> Now I'd like to add that to a LUKS keyslot so that the following
> works.
> 
>     gpg --decrypt drivekey.gpg | cryptsetup luksOpen --key-file=- /dev/sdb backup

Assuming bash, you might want to try:

    cryptsetup luksOpen --key-file=<(gpg --decrypt drivekey.gpg) /dev/sdb backup

and corresponding variations of your other commands as well.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

