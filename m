Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A502FB3
	for <cryptsetup@lists.linux.dev>; Thu, 13 Jul 2023 16:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 45B0C3F294
	for <cryptsetup@lists.linux.dev>; Thu, 13 Jul 2023 18:29:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.164
X-Spam-Level:
X-Spam-Status: No, score=-1.164 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, T_SCC_BODY_TEXT_LINE=-0.01,
	UNPARSEABLE_RELAY=0.001, URIBL_BLOCKED=0.001]
	autolearn=no autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vEcm4MfizOBq for <cryptsetup@lists.linux.dev>;
	Thu, 13 Jul 2023 18:29:40 +0200 (CEST)
Received: 
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 92A113F26F
	for <cryptsetup@lists.linux.dev>; Thu, 13 Jul 2023 18:29:39 +0200 (CEST)
Received: from owner (uid 1000)
	(envelope-from 152cc69a347e@ewoof.net)
	id 6003b
	by home.arpa (DragonFly Mail Agent v0.13);
	Thu, 13 Jul 2023 16:29:12 +0000
Date: Thu, 13 Jul 2023 16:29:12 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: A new container with an old header
Message-ID: <a19dc3c4-d5d3-4d66-aa52-cfaa66a374ba@home.arpa>
References: <168917759492.6.4364561119493214109.152005529@aleeas.com>
 <7cb9e19c-eddc-4c2c-a2ac-2673a1e208e8@home.arpa>
 <168926225260.6.8499250006616259794.152440275@aleeas.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <168926225260.6.8499250006616259794.152440275@aleeas.com>

On 13 Jul 2023 15:30 +0000, from darek.hisc@aleeas.com (Darek Hisc):
> Thank you Michael for your suggestions!
> Particularly valuable for me is the ability to check the checksum of a fragment of a file (I did not know this before):
> $ dd if=luks-container bs=1048576 count=100 | md5sum -b

You can also use skip= and/or different values for bs= and count= to
get a checksum for any arbitrary portion of a file (of known offset
and length); or really, pass the data to any arbitrary program. I used
md5sum for illustrative purposes and because any non-malicious change
is likely to have a significant impact on even a MD5 hash, making
obvious any corruption from the enlargement. I strongly advise against
using MD5 for anything where cryptographic strength matters.


> Instead of `truncate -s 200M` I found a better solution for my use case:
> `head -c 200M /dev/urandom >> my-container`

Yes, something like that should work just as well (though of course
with that particular command and starting with a 100 MB container
you'd get a 300 MB container instead of 200 MB). There are other ways
as well, like using dd to graft data from one file into another; I
picked one method, not really to the exclusion of others but to keep
things reasonably straight-forward in my example.

**In short**, there are multiple ways to enlarge the container file,
and once that has been done, there should be nothing special about
your setup compared to having a LUKS container backed by a partition
or a portion of LVM-managed storage.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

