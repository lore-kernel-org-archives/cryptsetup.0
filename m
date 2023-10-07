Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57B323B4
	for <cryptsetup@lists.linux.dev>; Sat,  7 Oct 2023 23:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutanota.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b="0XNE2fMn"
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
	by w1.tutanota.de (Postfix) with ESMTP id 657DDFA013E;
	Sat,  7 Oct 2023 23:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696719790;
	s=s1; d=tutanota.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=tO5dojK0XNeMeDQpjERCklmGg6uHNfIR1+x231/YdMY=;
	b=0XNE2fMn0ONg59OYD/9kOM6MvYYaP2uO7hSp6kvA1nOcJvOchQ7SR5pB5USRSiPc
	mUn5j6Lm1r5ePOR9m1rpOHOqlLrwcCR66KghFt70X8kvaFGh0v754JaCLU2oc2wGIzH
	iBjV85FYbMpAkv/hOAGav2C4hMoGArFN16wW3WyTfmPNAmGMbz/XwrffbxsmmTPhyK5
	ThWdnEh8jnY0ErbV2i2UxBSUiM+4jixC+uNHDTukKYSqW9KHMO1+ftnQpDv158M4/do
	6DZA2JsRiyiFdoIy4bLsJDS6RzfTRudkD2b1eEc/YIPmbRQ1iFI5L7tYUlyWnQBRUie
	joyrEFGYXA==
Date: Sun, 8 Oct 2023 01:03:10 +0200 (CEST)
From: charlesfdotz@tutanota.com
To: Milan Broz <gmazyland@gmail.com>
Cc: cryptsetup development <cryptsetup@lists.linux.dev>
Message-ID: <NgBNKju--3-9@tutanota.com>
In-Reply-To: <7a3f894e-8d86-4370-a1a9-768a41dda55d@gmail.com>
References: <Nfx_Hmi--3-9@tutanota.com> <7a3f894e-8d86-4370-a1a9-768a41dda55d@gmail.com>
Subject: Re: Feature Request: "Fake Trim"
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Oct 5, 2023, 11:19 by gmazyland@gmail.com:

> On 10/5/23 04:05, charlesfdotz@tutanota.com wrote:
>
>> Hello,
>>
>> I would like to request a feature regarding luks volumes. I had
>> wanted to post this to your gitlab but they want a credit card and
>> phone number (?!) to sign up. I hope doing this via the mailing list
>> is OK.
>>
>
> I am owner of cryptsetup project on GitLab and I never entered credit
> card number (and we have GitLab for OpenSource Ultimate license there).
> Email should be ok for registration, and many other people have account
> - are you sure it really needs these data? If so, ask Gitlab why.
> We do not need anything like that.
>
When I tried to sign up there were 3 verification steps (payment method, phone number, email). I had clicked sign up from the cryptsetup project but I don't think that matters. Searching around a bit I was able to find this https://forum.gitlab.com/t/concern-about-gitlab-asking-for-credit-card/54479 but that seems to imply there's a way to skip it. It wasn't obvious so I just dropped it and came here. 


> (Anyway, issue for cryptsetup is not the proper place anyway, dm-crypt
> is kernel part, perhaps dm-devel@redhat.com list is better for kernel
> feature discussion.)
>
>> I would like to request that a new mount option be added for luks
>> volumes that when enabled would allow the luks volume to accept trim
>> requests regardless of the underlying hardware and then to simply
>> write zeros to the sectors that are trimmed. This might seem like an
>> odd request but there are a few situations where I think it would be
>> useful.
>>
>
> IMO block layer is the proper place to emulate TRIM (so any block device
> can do that). I do not think device-mapper should implement own
> emulation. Not sure if it is a good idea, but if so, I would expect any block
> device should be emulate TRIM (then LUKS can support it just by enabling
> discard options).
>
I had been wondering if this was the correct place to ask. Thanks you for the pointer to the correct place.


> Anyway, I think you are trying to fix hw problem in sw here...
>
>> The first is that currently it is just not feasible using luks on top
>> of an SMR drive if it doesn't support trim. Currently an SMR drive if
>> left untrimmed while using an encrypted volume will have performance
>>
>
> So SMR drives should support TRIM if they really on it...
>
> I am not going add any support for SMR "optimizations" to cryptsetup.
> These crappy drives just should not exist :)
>
> But seriously, if the drive has some special use (like long-time recording
> - writing continuously stream of data) and you want to use it with
> random write (and encrypted) access (data deduplication cannot be done
> internally) you are screwed anyway. It will never work properly.
>
>> falls off a cliff permanently after enough data is written to it. For
>> drives with trim support this obviously isn't an issue but at first
>> glance drives that do not support trim would seem to be worthless.
>> Fortunately most drives that don't support trim are smart enough to
>> "time" a sector if it gets filled with zeros (you can find several
>> accounts of people "refreshing" their drives by simply dd'ing them
>> from /dev/zero). Obviously you can't do that if there's a luks volume
>> on the drive because it won't actually write zeros to the disk but if
>> my "fake trim" request were implemented it would solve the issue.
>> This would make proper encryption possible on a large subset of
>> previously unusable drives.
>>
>>
While I agree these drives suck and aren't very useful software fixes to work around hardware quirks are very common. We have usb quirks, cpu microcodes, and on and on. Unlike other hardware flaws that were just mistakes most of the SMR drives not supporting TRIM were sold to customers without saying this. Some were even sold specifically as NAS drives which western digital was sued successfully over. And the problem is not only with random writes. If one of these drives is encrypted then any writes over the capacity of the disk will be extremely slow.


>> The second situation is using a luks volume on a virtual machine
>> disk. Often time the VM disk will either be compressed or a sparse
>> file but if encrypted with luks once all the space has been written
>> there is no way to reclaim space. I'm aware some virtual disks
>> support "normal" trim but I believe this would still be useful in
>> some cases.
>>
> I do not understand what is missing in the second case.
>
> You can use thin provisioning, it uses TRIM exactly as you mentioned.
>
> But loopback (/dev/loop) should support TRIM too, so reclaiming unused space
> in file image is just to allow discards for LUKS device and issue fstrim
> (or blkdiscard for the whole block device). This works for years.
>
> Loopback is allocated automatically by cryptsetup, so all you need
> is to add --allow-discards on open of file image.
>
> Milan
>
I had run into several older posts with this issue while trying to search for a way to write zeros to the SMR disks. I did not realize that support for this had become so ubiquitous that this was no longer a problem. My apologies.


Oct 5, 2023, 09:12 by yoann.congal@smile.fr:

> On 10/5/23 04:05, > charlesfdotz@tutanota.com>  wrote:
>
>> Hello,
>>
>
> Hi,
> (mail resent as text-only for the list, sorry)
>
>> I would like to request a feature regarding luks volumes. I had wanted to post this to your gitlab but they want a credit card and phone number (?!) to sign up. I hope doing this via the mailing list is OK.
>>
>> I would like to request that a new mount option be added for luks volumes that when enabled would allow the luks volume to accept trim requests regardless of the underlying hardware and then to simply write zeros to the sectors that are trimmed. This might seem like an odd request but there are a few situations where I think it would be useful.
>>
>> The first is that currently it is just not feasible using luks on top of an SMR drive if it doesn't support trim. Currently an SMR drive if left untrimmed while using an encrypted volume will have performance falls off a cliff permanently after enough data is written to it. For drives with trim support this obviously isn't an issue but at first glance drives that do not support trim would seem to be worthless. Fortunately most drives that don't support trim are smart enough to "time" a sector if it gets filled with zeros (you can find several accounts of people "refreshing" their drives by simply dd'ing them from /dev/zero). Obviously you can't do that if there's a luks volume on the drive because it won't actually write zeros to the disk but if my "fake trim" request were implemented it would solve the issue. This would make proper encryption possible on a large subset of previously unusable drives.
>>
>> The second situation is using a luks volume on a virtual machine disk. Often time the VM disk will either be compressed or a sparse file but if encrypted with luks once all the space has been written there is no way to reclaim space. I'm aware some virtual disks support "normal" trim but I believe this would still be useful in some cases.
>>
>> Sincerely,
>> Chuck
>>
>> p.s. I figure most of you already know why SMR drives don't play nicely with encrypted volumes so I glossed over it but I can elaborate if you'd like. Thank you.
>>
>
> Not 100% sure but I wonder if it's possible to implement a device-manager element which take trim request from upper layers and transform them in "writing zeroes" to lower layers (this element being otherwise transparent).
>
> All you would have to do is, then, to put this dm-faketrim just under the dm-crypt in the DM stack.
>
> Would that work for your use-cases?
>
> Regards,
> --
> Yoann Congal
> Smile ECS - Tech Expert
>
I am still kind of new to this but that seems like it would work. That also sounds like it would be part of the kernel as Milan mentioned. Do you agree that mailing dm-devel@redhat.com would be the right way to go?

Sincerely,
Chuck
