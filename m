Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17330BA28
	for <cryptsetup@lists.linux.dev>; Tue, 29 Nov 2022 20:46:53 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id C58F114004F;
	Tue, 29 Nov 2022 21:39:32 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id AE9CC17A249; Tue, 29 Nov 2022 21:39:51 +0100 (CET)
Date: Tue, 29 Nov 2022 21:39:51 +0100
From: Arno Wagner <arno@wagner.name>
To: Lamy Geier <lamyergeier@gmail.com>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Slow unlock of the LUKS device at boot
Message-ID: <20221129203951.GA26364@tansi.org>
References: <15a19597-423a-8fc0-02d9-3ea4da34b490@gmail.com>
 <84bc33e5-c264-c1bc-a17a-9e4229a08a1e@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84bc33e5-c264-c1bc-a17a-9e4229a08a1e@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Lamy,

if you created the slow-to-unlock LUKS container on this
device and with default parameters, then there seems to be 
some bug or configuration problem at play. 

I have never used keyfiles (except for some tests),
so I do not know what it could be.

Regards,
Arno


On Tue, Nov 29, 2022 at 21:19:50 CET, Lamy Geier wrote:
> # Observation
> 
> For the slow partition (that uses LUKS2 and has LVM) takes about 6 minutes
> to test passphrase as follows and returns a warning "No usable token is
> available."
> 
> ```bash
> sudo cryptsetup -v open --test-passphrase --type luks /dev/nvme0n1p5
> --key-file /etc/luks/boot_os.keyfile
> sudo cryptsetup -v open --test-passphrase --type luks /dev/nvme0n1p5
> ```
> 
> For the boot partition (LUKS1), which used the same passphrase and keyfile
> as the above partition it takes just 5 seconds to test passphrase
> 
> 
> ```bash
> sudo cryptsetup -v open --test-passphrase --type luks /dev/nvme0n1p1
> --key-file /etc/luks/boot_os.keyfile
> sudo cryptsetup -v open --test-passphrase --type luks /dev/nvme0n1p1
> ```
> 
> ---
> 
> Also, I did cryptsetup benchmark as follows
> 
>   ``` bash
>   $ cryptsetup benchmark
>   # Tests are approximate using memory only (no storage IO).
>   PBKDF2-sha1      2631307 iterations per second for 256-bit key
>   PBKDF2-sha256    5637505 iterations per second for 256-bit key
>   PBKDF2-sha512    2118335 iterations per second for 256-bit key
>   PBKDF2-ripemd160 1115506 iterations per second for 256-bit key
>   PBKDF2-whirlpool 1006310 iterations per second for 256-bit key
>   argon2i       9 iterations, 1048576 memory, 4 parallel threads (CPUs) for
> 256-bit key (requested 2000 ms time)
>   argon2id      9 iterations, 1048576 memory, 4 parallel threads (CPUs) for
> 256-bit key (requested 2000 ms time)
>   #     Algorithm |       Key |      Encryption |      Decryption
>           aes-cbc        128b      1727.7 MiB/s      6931.8 MiB/s
>       serpent-cbc        128b       116.2 MiB/s       868.9 MiB/s
>       twofish-cbc        128b       252.9 MiB/s       566.7 MiB/s
>           aes-cbc        256b      1313.0 MiB/s      5684.8 MiB/s
>       serpent-cbc        256b       120.3 MiB/s       867.2 MiB/s
>       twofish-cbc        256b       257.5 MiB/s       563.5 MiB/s
>           aes-xts        256b      5342.5 MiB/s      5333.8 MiB/s
>       serpent-xts        256b       748.8 MiB/s       783.1 MiB/s
>       twofish-xts        256b       517.7 MiB/s       530.6 MiB/s
>           aes-xts        512b      4779.9 MiB/s      4819.2 MiB/s
>       serpent-xts        512b       756.1 MiB/s       779.9 MiB/s
>       twofish-xts        512b       521.5 MiB/s       529.2 MiB/s
>   ```
> 
> 
> 
> - Is the warning responsible for this slow behavior: "No usable token is
> available." Or can you suggest if I should tweak some key parameters or
> change the order of keys in keyslots.
> 
> 
> -- 
> Thanks and Regards
> 
> Lamy

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
