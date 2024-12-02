Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009CA137C37
	for <cryptsetup@lists.linux.dev>; Mon,  2 Dec 2024 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.19.178.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733155353; cv=none; b=CaaImq1tH5NChsBALo2Ui+L8941cqsuz5gJ+ev8OSs3Ki66tNDgYkIOHA146EYz5apdAP/jnEShWMwS1ukqi9cJcdc+fBf7eanpfJYhwZq8ZO+Tph8/2cpU42e1J62t86jsX9geVHOggGRUn7Lw/wEZTEiWiGXrayICHISc0We0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733155353; c=relaxed/simple;
	bh=Pw8dX8zJhzzEFsHGApkvAzjsqlcy0pClkwSDj/fHv1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ6nQCO7XcjIXerQLxKJF2F5wew03A960rhMrIvkjXR5X3yYWsSXecXh0rAPGCNgBmLWo/pFRA4Rfwrkf4dYM6ju/9AfstvWHEB5hwx0zWitRZON3KjtBVK3Gia3D/q6yCp8PmmSqMdDoLYlw+UXxz9P/UDE1eVHl1YywPHw7oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info; spf=pass smtp.mailfrom=arnowagner.info; arc=none smtp.client-ip=84.19.178.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnowagner.info
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 1B2841400F0;
	Mon,  2 Dec 2024 17:01:36 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id E752C17AAA2; Mon,  2 Dec 2024 17:02:07 +0100 (CET)
Date: Mon, 2 Dec 2024 17:02:07 +0100
From: Arno Wagner <wagner@arnowagner.info>
To: cryptsetup@lists.linux.dev
Cc: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: Recover encrypted MD RAID1 member
Message-ID: <Z03Z/5+cV+uu+9O3@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <6133170cced6c5ebdf8d04c8cd557f4cdd5b1238.camel@interlinx.bc.ca>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6133170cced6c5ebdf8d04c8cd557f4cdd5b1238.camel@interlinx.bc.ca>

First, make an image-backup of sdd. It is far to easy to
mess things up when trying to recover.

Second, since this is RAID1, all you need to do is RAID 
recovery, LUKS is not involved.

Raid recovery is really simple here: Remove sdb, sde from the
computer, and start the array. mdadm will need some 
option to be willing to start a non-fresh array and degraded
array, probably someting like
  mdadm -A -R -f /dev/md0 /dev/sdd
or the like.

Fater that, your old LUKS container should behave as usual.

Regards,
Arno

On Mon, Dec 02, 2024 at 14:45:41 CET, Brian J. Murrell wrote:
> I was doing some maintenance of my RAID1 array and something seems to
> have gone sideways.  The array's structure looks like this:
> 
> sdb                                            8:16   0   3.7T  0 disk
> └─md0                                          9:0    0   3.7T  0 raid1
>   └─md0_encrypted                            253:39   0   3.7T  0 crypt
>     └─backups-backups                        253:40   0     3T  0 lvm 
> sdd                                            8:48   0   3.7T  0 disk
> └─md0                                          9:0    0   3.7T  0 raid1
>   └─md0_encrypted                            253:39   0   3.7T  0 crypt
>     └─backups-backups                        253:40   0     3T  0 lvm 
> sde                                            8:64   0   3.7T  0 disk
> └─md0                                          9:0    0   3.7T  0 raid1
>   └─md0_encrypted                            253:39   0   3.7T  0 crypt
>     └─backups-backups                        253:40   0     3T  0 lvm 
> 
> Except that sdd is not actually active in the array as in the failed
> state:
> 
> Personalities : [raid1] 
> md0 : active raid1 sdb[5] sde[3] sdd[4](F)
>       3906854744 blocks super 1.2 [3/2] [_UU]
>       bitmap: 14/15 pages [56KB], 131072KB chunk
> 
> unused devices: <none>
> 
> I think sdd was removed before things went sideways and so sdd might be
> my only good copy of the array.
> 
> The question is, how can I work with it independently of the array now?
> I'd like to get to the point of being able to check the content of
> backups-backups filesystem on that single disk, again, independently of
> the existing md0 array.
> 
> I know there is some crossover between LUKS and MD here, but I am
> suspecting that the LUKS part here is going to be the more complicated
> part and I am pretty green with regard to LUKS so hoping for some help
> in that regard.
> 
> Any help or suggestions would be much appreciated.
> 
> Cheers,
> b.
> 



-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
