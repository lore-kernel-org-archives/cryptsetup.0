Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C1C2F55
	for <cryptsetup@lists.linux.dev>; Sat, 29 Jul 2023 12:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
 s=s31663417; t=1690635495; x=1691240295; i=blobfish@gmx.com;
 bh=OlF7or+wqBGAarlhp+HohqoUoynTPgwyGI4KKinQjtQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=QSkP1QeIDjkBmIPZ39ebRIPvI0Zz0GZzlrzwelQGdDkffbHW028Af/bcewA6vPOX1G60kBy
 zKylD6GB2v9R3eKRoRZmtMRMA3bfczJ3LxeOe3kAq8YA1wJuc5b1A9/aHbqovHyx8vPYsgyK5
 l+PEi6OIVkhwlbrk4j6AgYuoSpsFmxjK3QvpcDKoRyzyPhlr0eDR2KkRAuwars3H6D3OWvOdF
 WH9ngi+JhYAibXGkCPGAUBlLzsv2KijR0+DLvfwwXXdQARCDYg9e0n3lc3keYtUGsUB3LFUsf
 2Iy/TNnuAn+j5x7odoLFvT98rHwB3ooL+J7YpZBhUaXm6ztxnGQg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from laptop.localnet ([146.70.57.18]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MbzyJ-1ps2On3pvD-00dWKz for
 <cryptsetup@lists.linux.dev>; Sat, 29 Jul 2023 14:58:15 +0200
From: blobfish <blobfish@gmx.com>
To: cryptsetup@lists.linux.dev
Subject:
 Re: Looking for confirmation as I enter the acceptance stage. -- SOLVED
Date: Sat, 29 Jul 2023 08:58:12 -0400
Message-ID: <8249258.T7Z3S40VBb@laptop>
In-Reply-To: <1f32e042-c3fc-40b0-96c1-5d81a0c82391@home.arpa>
References:
 <2159917.irdbgypaU6@laptop> <13313734.uLZWGnKmhe@laptop>
 <1f32e042-c3fc-40b0-96c1-5d81a0c82391@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Provags-ID: V03:K1:CTjpR78ZrBDmUwJAuqo6rwvFbslsQWlwfB9bjalf9Z4a3GPjDMg
 B6hTC4Gv8xpFuvmfSNiRnQy/ipiikBTRjO7hktvP7eJj1Z1Y4E+8vOdpGLZNk/HUhEXMC3K
 OpL8DZDZUkucp+RNFigxjZjDDkGDbxBR4cP8ynwshB+LBba495Kau2M2yXHS0gwe7aJt+UM
 DNaH4M46NMaJgClkhKxSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:42Y9tZunIRs=;OPHZ50+01VkZtqQjao+9Ml/aSxz
 vQs29cVnQe+iozsX7Z1jfccwK56koUSYN2oPsYhAJMvJVtJPxN0ZIftZontnzZNfmqGJui5Sh
 eUe3yTJC++znmIrvC6UaGC6ILjWfz+quVCzoaxCplf/0aclyl+tPKPiRoIKjdolPY6ryMAGNA
 zk93H44m3OczuXZ4BGWDSu/a0pbQWPC44kqahTuiltbqLPSHnWTfGzCfnSxPYCNVC+MYZ3Sqe
 ZSn2BCtJaSkGT7GO1/9yHxdu30WF/zbAtSHfj+H06zXdpzYGbHe71daeDDAyVHd41brTkUIw8
 0CJGxmm0vkFN2pqNQGql9d955mjrxC0bfpq3A/nmqWdamwVm+kOyl5SJKxmgCNu1MZmO79ozm
 Hc3NlnsYvQj3dIuTRqR8Yi3KsEw2OWIopNEgAYv4dBE90ZwAD4xG2RKG0YFjpRUP8Uq6gyZn0
 0FaretD+L0s4+fzi8x6eOstViwtbHibmqiR5ZdqhXH8XH5r9FhWuNUOCnvNfbbBZWPfI7OLOA
 /BXAHxJBD7rMxDXUJO33Qx9iSt2zcp3GQ/MutUevQoR3UHUVAEwwNwFS6iKEdBgS64Ep5Ve/6
 fuVK4hXhr1OLWB01iGDL0pHnjz+3chP1f25SgBBprvOWkzfUpTZL+EHbG2pJ+zh+/x8cComoT
 6uokpLWEV3+urrVBFVJOIqU/pECeuCO7inhnRozlukmkkj1KvgUHBxyTHcRghQ36u+MIU/YNL
 EvWqM1k2agMoyuKS/sor3zpQGcq03ZkLMDs2cWjElQmEhI1hVpXN9DGgBDJ61VQwz+h5tqBPP
 +3SJrW5pSJw54orM6+wYuKHv3TpvvG27HNrVSPjse4ksiRNgtkg+Cbqg8aV0N9/zO8ol1e0AY
 M88RVqICp4sAjR2F36C3MfiuTAmxZGAwPc2/mFDfC+Z43gedBIm9AKPXtYKGEI4/2LLpo3q89
 o3cIshFMvN2/lW3pcCAjsTN9WiY=

On Friday, July 28, 2023 2:50:03 PM EDT Michael Kj=F6rling wrote:
> I'm taking the liberty of adding SOLVED to the subject line since
> you're now in a position that you can access the file system within
> the container. Any further questions will probably be more along the
> lines of how to deal with the Btrfs file system within, which is off
> topic on the cryptsetup mailing list.

Sounds good.
Thank you!!!!



