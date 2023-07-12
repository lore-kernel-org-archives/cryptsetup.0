Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se [213.80.101.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427BE20FB2
	for <cryptsetup@lists.linux.dev>; Wed, 12 Jul 2023 18:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 9765F406A2
	for <cryptsetup@lists.linux.dev>; Wed, 12 Jul 2023 20:25:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.165
X-Spam-Level:
X-Spam-Status: No, score=-1.165 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, T_SCC_BODY_TEXT_LINE=-0.01,
	UNPARSEABLE_RELAY=0.001] autolearn=no autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBDC_UZx7g6F for <cryptsetup@lists.linux.dev>;
	Wed, 12 Jul 2023 20:25:49 +0200 (CEST)
Received: 
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 8005640560
	for <cryptsetup@lists.linux.dev>; Wed, 12 Jul 2023 20:25:48 +0200 (CEST)
Received: from owner (uid 1000)
	(envelope-from 152cc69a347e@ewoof.net)
	id 60185
	by home.arpa (DragonFly Mail Agent v0.13);
	Wed, 12 Jul 2023 18:25:35 +0000
Date: Wed, 12 Jul 2023 18:25:35 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: A new container with an old header
Message-ID: <7cb9e19c-eddc-4c2c-a2ac-2673a1e208e8@home.arpa>
References: <168917759492.6.4364561119493214109.152005529@aleeas.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <168917759492.6.4364561119493214109.152005529@aleeas.com>

On 12 Jul 2023 15:59 +0000, from darek.hisc@aleeas.com (Darek Hisc):
> Alternatively, a way to increase the size of "file1" to 200MB. All
> the information I've found is about resizing a partition or LVM. But
> I don't know how to increase LUKS2 file-container.

There should be nothing special about the LUKS container being within
a file.

Of course DO make a backup of your container (and header, if separate)
before you do this, and I'd triple-check to ensure the container isn't
open at the time just to avoid the risk of something getting confused
by the change in size, but something adapted from the following should
work.

$ dd if=/dev/urandom of=luks-container bs=1048576 count=100
$ stat luks-container
  File: luks-container
  Size: 104857600 ...
$ md5sum -b luks-container
<something>
$ truncate -s 200M luks-container
$ dd if=luks-container bs=1048576 count=100 | md5sum -b
<same something, proves that the first half is unaltered>
$ stat luks-container
  File: luks-container
  Size: 209715200 ...
$

Then enlarge the file system within the container normally. Exactly
how you do that will of course depend on exactly what the contents of
the container is.

The key here is using "truncate -s" to set the new size of the file
without otherwise altering its contents.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

