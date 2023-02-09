Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367FF2F29
	for <cryptsetup@lists.linux.dev>; Thu,  9 Feb 2023 19:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB703C433EF;
	Thu,  9 Feb 2023 19:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675969433;
	bh=G67PfuaF4K0VNMO+Lh/+B+UN6Q3gMEiNR03rBiCg52Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEa53t3/Ie9cd5WxUxzOBV47F0iihJ5Awt0q/GNPJhy4fGA4rXAenio3cXflotZUw
	 ChxycOAMgveVR6IKttRfIe1j2yNDtfe6Il+tjFA/IYCv53HTQ5rNf7rYoKtp7qD3Ai
	 hSlYJH7asFPqypvwK5gCAm/fUc6Hj993xzh0/40CCf4JPbJDHtTtyOYBQEmLoCV31Q
	 X40pZlj9VrsWrc16LQx22Kzve5QKyZxyVbD0QUTiB56UsboJHsE9ZLle2azmV/LOjj
	 eYma4/lwlABWgsDtUPZ1zZpX0JAKzPUF88DpY8iop+kCAfwxSQ7Iu1FWfy2HqAsCLU
	 oLJYNJdhNIVGA==
Date: Thu, 9 Feb 2023 19:03:52 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Michael =?iso-8859-1?Q?Kj=F6rling?= <152cc69a347e@ewoof.net>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Filling a device with random data
Message-ID: <Y+VDmGLcSavEBFig@gmail.com>
References: <aec223f2-34f1-45ca-83a4-024e66490ee5@app.fastmail.com>
 <20230209040200.GA3642@tansi.org>
 <d30a4af6-8a91-42ea-973d-f16f1f361023@app.fastmail.com>
 <c2a2929d-29dd-48c4-9b37-b3ac7a6f072f@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2a2929d-29dd-48c4-9b37-b3ac7a6f072f@home.arpa>

On Thu, Feb 09, 2023 at 03:37:56PM +0000, Michael Kjörling wrote:
> On 9 Feb 2023 16:01 +0100, from david@djsp.eu (David Joaquín Shourabi Porcel):
> > $ dd if=/dev/urandom of=/dev/null status=progress
> > 4819285504 bytes (4,8 GB, 4,5 GiB) copied, 12 s, 402 MB/s^C
> > 9708379+0 records in
> > 9708378+0 records out
> > 4970689536 bytes (5,0 GB, 4,6 GiB) copied, 12,379 s, 402 MB/s
> 
> That's doing I/O in blocks of 512 bytes, so syscall overhead is likely
> to be a large limiting factor. (Each block requires at least a few
> kernel/userspace context switches through syscalls; at an _absolute_
> minimum, for each block, it's likely going to go through userspace dd
> to kernel read through kernel /dev/urandom driver to userspace dd to
> kernel write through kernel /dev/null driver to userspace dd.) Compare
> and contrast that to a cryptsetup benchmark which is likely (I haven't
> looked) primarily one or the other. If you want to gauge the
> performance of /dev/urandom, I suggest trying with something like
> bs=1M to reduce that overhead. Going from bs=512 to bs=1M I get an
> about 60% speed increase, although it still comes up far short of a
> cryptsetup benchmark (with bs=1M at about a quarter of the throughput
> of the cryptsetup benchmark on my particular system). So for fast
> storage media, going through a crypt mapping can still be beneficial,
> although the degree of benefit will obviously depend on the relative
> performance of CPU (including encryption instructions) and storage
> device. Whether you use a plain dm-crypt mapping or a LUKS container
> should be largely irrelevant for these purposes, however.
> 
> Similarly, when you're writing to a real-life storage device, doing so
> in blocks of 512 bytes is going to utterly devastate performance
> compared to using blocks on the order of tens of megabytes or even
> larger. (I realize that's not what either of your tests do.)
> 
> Also, what kernel version are you running?
> 
> The major advantage to doing a separate full-disk write with a
> throwaway key is that the data is going to be meaningless also through
> the eyes of the final LUKS container mapping. Depending on your use
> case, this can provide a slight confidentiality advantage.
> 
> Doing a full-disk overwrite pass on SSDs has its problems, though;
> primarily that it forces the SSD to consider every user-accessible
> block as being in use, hampering wear leveling. That becomes a far
> more delicate balancing act between storage metadata confidentiality
> (the full-disk overwrite hampers an attacker's ability to determine
> what blocks are in use) and giving the SSD's firmware a decent chance
> of doing wear leveling (for which you want to leave the underlying
> storage pristine and perhaps also allow TRIM passthrough, but which
> leaks information about which parts of the storage device are in use).
> 

While this is a creative use of dm-crypt, a cleaner way to generate very high
throughput cryptographically secure random data (specifically, even higher
throughput than /dev/urandom which is usually good enough) is to just generate
it in userspace.  For example, the command 'openssl rand $LENGTH' does this.

- Eric
