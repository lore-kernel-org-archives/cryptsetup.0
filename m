Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB557326D65
	for <cryptsetup@lists.linux.dev>; Thu, 27 Nov 2025 23:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764286634; cv=none; b=BP2JWgtTE1sEc4MHmHFUNM5xnJQRAqkz+rMijFXLUM0FHsHohlFCE743Dl9dD6O+4EVseL+ZGRuYJVmNqSfN+3QcUrLlOxR5Hr48fy8FJZKtN30WkHnZa9UZjWhakWGqyouHzZRBw1rRoD+S8SJK5Ae/IPUQutjcHJ+lw9HzRVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764286634; c=relaxed/simple;
	bh=FyxrC//9kv91GWU9c3B28b7LTZcKfaxsXeXlA53GSyc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nzgcqu76ewNoQbsAG2iyxmuXKde/Hb6mdEq1KMuP18TSFaNA9ExrIKE+zxHRIf5BgcxgVofWwbuAg1nJe3F/IelU7uS+k2dW+stAlyH8LOh24yCOsaQTo2kxvk7tJopSILuviDQOgVCqZHwK5e/vW7sb1PflFIA50drQC1Lvprs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WN6zQDD2; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WN6zQDD2"
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-43327aeb895so379055ab.0
        for <cryptsetup@lists.linux.dev>; Thu, 27 Nov 2025 15:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764286631; x=1764891431; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lk8iKAKQiPWWx1WeLeJvPjSrW4ytPNU/VipTWSO/YTo=;
        b=WN6zQDD2eVK2O4684Q7h0oLNnaSNAe6UL54/5eLNr4eqam4EEm2CEW3MwZDGVbjvKe
         YvtQ47+1IFXvA4As7ybtojAZO4CaN7DlGB/JfdAWqdF1IEMNpEZeshPYNGW/GbtWnpf1
         IslJSU1cBHp4eLod1D0EjGl0u1pNg2IlS2t/v5rAgCUXXYf1yFn7JTF6XFmk7f6wrsJQ
         52dIdE2F9hOd6Ozo86KaVeMCroCXKJwmJbtzQYy2KuarJXaim+Nz4ABN6NBt3TxeOHXn
         Ale1Lengw4CE1nFdXnUdFwC8WFBOd9qPwXxSnuRrZrzPzWJ4V7b6YjDQQYgLHj8dzwHA
         74PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764286631; x=1764891431;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lk8iKAKQiPWWx1WeLeJvPjSrW4ytPNU/VipTWSO/YTo=;
        b=eZXYNIv7GNs4dMTwL2LkHTnHynB8lbru32F2R/WVFnh86W16MtJCECSL1Jot5nbHRh
         +AJ9X+8+NZLUCjr7jmmC/J76w6lDOZa3biUZo3K/Bx/N6keYM5tnQ6wVcpPUzAtTZ+97
         HyPgbT7HJCro9Jvg86a5yvT1ZV+E8y0FoZX0fLLFGHdtdxC4zIkdX+PLw+X5D6UUqfV4
         d4aLyEkooXbBdyRw8L81r4AtLWlG6eWv6zfSrbQQLac3V0iKujEGFe5gGEpWYzEjUZNq
         z2ORt3dULnmSceRq0HUIW+65HQW1nr4qGf113bMx9uxIKAPCVR+rkE9V0rybpZFH37X+
         Bp1g==
X-Forwarded-Encrypted: i=1; AJvYcCWaKF6YrnJUZTsM+oKdovWBGykdqybDqsLCax+O6pozT3GHkNBlAj9iIA9Y5Te6h3FfoUG144O/I/Qz@lists.linux.dev
X-Gm-Message-State: AOJu0YxGDmW8obpxZIEnI44zAh82dvX1GgSaCobD3LjA15ObDsie2wID
	9Ik1mq671s8x7Lu1/rO7XlhVNwTZZO90e0jieddDNOy1Ew150OweIc7z
X-Gm-Gg: ASbGncsJhfeI1r2vHkFQ5Lha4fq+CrBo8+X0W19rhAC27ooNWeKA2NNzZiM06D2xEnt
	CwPLP0sUsyVzYO/CkNvFV5hW7nKD7T6qBdPdA+G4wBxo2zsCFEwsq+OnG4AxYbzpqTOMC2oBg3i
	cdSZV5G2sc+LjsIwA+gek82Fw0DHGNAKPhgXe5y0sa7XPf/8M9tzFPPqsdgW8WxQ7PQj2XDmw0V
	YCJ0hgZta7ScUrNwjfkOxYJBbH3SFpIiZXBgc+9V8k052jUKnttfIkLRHgMLLtXuyBpTGGrbTXw
	rBRCwI82150eQXdhDE5NgtCaJFmhluODxvf/R5pkudeImDgoGfIiw3qknQzUWugr4Kp6qC8ajaa
	mYNCZBfTK1M4LfRNvtrNEjZzrNsN1zDzINiAVNYqT9lG+wAyF2DznvRuctY2Da98ZycEBg66B7f
	vBCj7Px+w=
X-Google-Smtp-Source: AGHT+IGreBlJthqbMD1RAWCcqBxs8A6SNjHp+XNg4XupKhfTAUt2Dl+zj7BYsLX7N0vJY781hdNvXQ==
X-Received: by 2002:a92:c247:0:b0:433:7818:d1c4 with SMTP id e9e14a558f8ab-435b8e474e6mr87255305ab.3.1764286630861;
        Thu, 27 Nov 2025 15:37:10 -0800 (PST)
Received: from kf-m2g5 ([2607:fb90:bf0b:8b65:e4a9:bd5:56d9:5426])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-436b85c5413sm14379825ab.27.2025.11.27.15.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 15:37:10 -0800 (PST)
Date: Thu, 27 Nov 2025 17:37:02 -0600
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: Milan Broz <gmazyland@gmail.com>
Cc: linux-mm@kvack.org, cryptsetup@lists.linux.dev,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 linux-kernel@vger.kernel.org, adrelanos@whonix.org, Mikulas Patocka
 <mpatocka@redhat.com>
Subject: Re: Hard system lock-ups when using encrypted swap and RAM is
 exhausted
Message-ID: <20251127173702.6c8a7ba2@kf-m2g5>
In-Reply-To: <2b8b83fa-5cf5-4f97-b796-0c738ce3a548@gmail.com>
References: <20251111231835.1232ad8f@kf-m2g5>
	<2b8b83fa-5cf5-4f97-b796-0c738ce3a548@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.XCJlYJqF5QI/5Sz1Tc2Qnf";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/.XCJlYJqF5QI/5Sz1Tc2Qnf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Nov 2025 08:59:13 +0100
Milan Broz <gmazyland@gmail.com> wrote:

> Hi,
>=20
> On 11/12/25 6:18 AM, Aaron Rainbolt wrote:
> > Not sure if this is a memory management issue, a LUKS issue, or
> > both, so I wrote both mailing lists. =20
>=20
> It is not a LUKS issue; cryptsetup/LUKS activates the encrypted
> device, so it is only the kernel/dm-crypt handling IOs.
>=20
> Adding cc to dm-devel as this would be another combination
> device-mapper and encrypted swap that could cause issues...
>=20
> However, could you please specify exactly your storage configuration?
>=20
>  From the subject, I expected you to have an encrypted swap, but it is
> not clear if there are other encrypted devices.
>
> Please paste at least lsblk, lsblk -f output, and also luksDump
> (or crypttab if it is not LUKS) for LUKS/dm-crypt configuration.

Mikulas seems to have reproduced the issue already, but just in case
it's still useful, here's the requested data, along with /etc/fstab.
(/dev/sda2 is a BIOS boot partition.)

-----

[sysmaint ~]% lsblk   =20
NAME   MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINTS
loop0    7:0    0    4G  0 loop =20
=E2=94=94=E2=94=80swap 254:0    0    4G  0 crypt [SWAP]
sda      8:0    0  100G  0 disk =20
=E2=94=9C=E2=94=80sda1   8:1    0  100M  0 part  /boot/efi
=E2=94=9C=E2=94=80sda2   8:2    0    1M  0 part =20
=E2=94=94=E2=94=80sda3   8:3    0 99.9G  0 part  /

-----

[sysmaint ~]% lsblk -f
NAME   FSTYPE FSVER LABEL UUID                                 FSAVAIL FSUS=
E% MOUNTPOINTS
loop0  swap   1           0a06fb5a-39f5-4a89-b8a8-fdc2470ee0f3   =20
=E2=94=94=E2=94=80swap swap   1     swap  f9aa44bb-2214-4a32-ac7e-34360b0f3=
13b                [SWAP]
sda   =20
=E2=94=9C=E2=94=80sda1 vfat   FAT32 EFI   6907-5000                        =
                   /boot/efi
=E2=94=9C=E2=94=80sda2   =20
=E2=94=94=E2=94=80sda3 ext4   1.0         26ada0c0-1165-4098-884d-aafd2220c=
2c6   64.7G    29% /

-----

[sysmaint ~]% cat /etc/crypttab   =20
# <target name> <source device>         <key file>      <options>
swap /swapfile /dev/urandom swap,noearly

-----

[sysmaint ~]% cat /etc/fstab   =20
# /etc/fstab - created by grml-debootstrap on Sun Nov  2 20:23:37 UTC 2025
# Accessible filesystems, by reference, are maintained under '/dev/disk/'.
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info.
#
# After editing this file, run 'systemctl daemon-reload' to update systemd
# units generated from this file.
#
/dev/disk/by-uuid/26ada0c0-1165-4098-884d-aafd2220c2c6 /  auto    defaults,=
errors=3Dremount-ro,x-systemd.growfs 0   1  =20
UUID=3D6907-5000  /boot/efi       vfat    umask=3D0077      0       1  =20
proc           /proc        proc    defaults                      0   0  =20
/dev/cdrom     /mnt/cdrom0  iso9660 ro,user,noauto                0   0  =20
# some other examples:
# /dev/sda2       none         swap    sw,pri=3D0             0   0  =20
# /dev/hda1       /Grml        ext3    dev,suid,user,noauto 0  2
# //1.2.3.4/pub   /smb/pub     cifs    user,noauto,uid=3Dgrml,gid=3Dgrml 0 =
0=20
# linux:/pub      /beer        nfs     defaults             0  0
# tmpfs           /tmp         tmpfs   size=3D300M            0  0
# /dev/sda5       none         swap    sw                   0  0
/dev/mapper/swap none swap sw 0 0

--
Aaron

> Thanks,
> Milan
>=20
>=20
> >=20
> > I'm seeing an issue with both the latest mainline kernel (6.18-rc5)
> > and Debian 13's 6.12 kernel package. When physical memory fills up,
> > the entire system locks up hard, as if it hit rather severe
> > thrashing, despite the fact that there appears to be disk cache
> > that can still be evicted, and there is ample amounts of swap space
> > remaining (gigabytes of it). This issue did not occur with the 6.1
> > kernel in Debian 12. I'm seeing this occur in very low-memory
> > Debian VMs, with between 512 and 900 MB RAM, running under
> > VirtualBox and KVM. (I suspect, but have not verified, that I'm
> > seeing similar behavior under Xen as well.) These VMs generally use
> > a swappiness of 1, though I have seen a lockup occur even with a
> > swappiness of 60. The filesystem in use, in case it matters, is
> > ext4.
> >=20
> > To reproduce on a system running Linux 6.18-rc5, with :
> >=20
> > * Follow the steps from
> >    https://gitlab.com/cryptsetup/cryptsetup/-/wikis/FrequentlyAskedQues=
tions,
> >    section "2.3 How do I set up encrypted swap?", but creating a
> >    swapfile rather than a swap partition. I created an 8 GB swapfile
> >    with fallocate. Reboot the system when done.
> > * In a TTY, open a terminal multiplexer (or something you can abuse
> > as one, Vim works well), and open two terminals. In one terminal,
> > run `htop` so you can observe memory and swap usage.
> > * In the `htop` terminal, sort by M_RESIDENT.
> > * In the other terminal, create a new file `test.py`, that will
> >    gradually fill memory at a relatively fast pace and print an
> >    indicator that it's still alive. I used the following code for
> > this:
> >=20
> >      import time
> >=20
> >      count =3D 0
> >      mem_list =3D []
> >      while True:
> >          mem_list.append([x for x in range(2048)])
> >          count +=3D 1
> >          time.sleep(0.002)
> >          print(count)
> >=20
> > * Run the script with `python3 test.py`.
> > * While the script runs, observe the growing memory usage in `htop`.
> >    Swap usage should start at or near 0, RAM usage will gradually
> >    increase. Once RAM usage starts getting high, some data will
> > start being swapped out as expected, but after a short while the
> > whole VM will lock up despite there being gigabytes of swap left.
> > (On my KVM VM, the last time htop updated its screen, it showed RAM
> > usage of 712M/846M, and swap usage of 328M/7.40G. The python3
> > process running the script was consuming 551M memory. The VM is
> > entirely unresponsive. Incidentally, the python3 process also was in
> >    uninterruptible sleep when htop last updated its screen, but that
> >    could mean nothing since it might have come out of sleep between
> > the last screen update and the VM lockup.)
> >=20
> > Under Bookworm with Linux 6.1, the Python script would occasionally
> > freeze, but the VM would remain responsive, and the script would
> > eventually resume. Even with kernel 6.12, both unencrypted
> > swapfiles and swapfiles that are technically unencrypted but live
> > on a LUKS volume both behave as expected. It's only swapfiles that
> > are themselves encrypted that seem to trigger these lockups.
> >=20
> > I haven't looked at the code at all, but it seems like maybe memory
> > LUKS needs available in order to operate is being consumed, thus
> > making it impossible to swap anything in and out of the swapfile?
> > That seems like it would cause these symptoms or similar, though I
> > don't know.
> >=20
> > Let me know if I can provide any further information on the issue.
> > I'm happy to bisect the kernel if it will help.
> >=20
> > --
> > Aaron =20
>=20


--Sig_/.XCJlYJqF5QI/5Sz1Tc2Qnf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmko4J4ACgkQpwkWDXPH
kQmMIhAAvF1ssmiCQ+nw1++89u8VMQnbSRCywdjHphhTMKbxhnnwEsNiH55N1w6b
5ssVxIvA2KrJ5+Ac3KVNr7h4o7t3hb5nEQL/MXWpfMISdyaBZR5n6GlG2Y/AIhJA
dzv3yEyCSXCYvH+TIhe8l+eBzrEUeVJg7vh88Tmm7XwMawBuhPx4UxA25POEzh07
rLwCy+o1AagTJJ7Ugvj+Ok9Oj5uZ8dMo68wWWDJuiLX5LXZ1Cvy2YGguco66xB6D
YaHKTVrsKAo6C57vXVfoiISXepgHD9+2SVd8jJdA5O0SFc907ITPMCqD68QQcdWi
jr2V1CKktd0HnzjuY2+IlOp1qVALUHmxhqULO6eNKaBDhSejwEamGeuWmBzUfv2f
STm6PTrWBjI93laXCkWW1cCQWvwRubAte/IorJfvoj2P4j/pk1MrMb+19FFGeRCb
rE1H12uJYP88PiZOxtdEdtnlBiR06pI4kOWVvjv6lHhlsTg9y3BUxyXPB8ydzNV8
wDqkPQPnFkQSQ1kHpNYomcmBw8izoTojjglpL3ifcpeuWQFzMKWJ6PFpA/236e/k
7WOpgp2FcF8ZuWaoGsq8n+QhTmac78P3LjYqBiEaq0KdaKRBppIkOTC6IJkVoe49
2PK+nPjCpq6HzTzw6hCrNGmPn++2ryJkiJKuIdor38SRRhuV4EA=
=snQJ
-----END PGP SIGNATURE-----

--Sig_/.XCJlYJqF5QI/5Sz1Tc2Qnf--
