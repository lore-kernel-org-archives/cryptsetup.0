Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF81FA6
	for <cryptsetup@lists.linux.dev>; Sat,  5 Nov 2022 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.ch; s=s31663417;
	t=1667643312; bh=Lf5hWqXLjzV0nwqcVN7kC7de9uZ2zarxhQSEQwF68+U=;
	h=X-UI-Sender-Class:To:From:Subject:Date;
	b=SAxKf00iJgvZKVUak0HJ329qZaH7bFHXrJQMZgnf3LGeW9IMPY3VNPVtVLON1O96a
	 qQRxphwLbo6gg6yIkRF2TElUGZem9BPfUO6m/3CvtAN1PG2Vv33ei46BFW9Ncvajbm
	 BBDxW0JmkVRhUlxNGTW6HddluELM2YGYOFxX70SoY/nGaOWVzSwNnUtg21DgQFaq2r
	 GhGbYn74F7P3z49hG6FZKfs4KIrJqgzo6hoGciAdwPxY1Z6iesa7mWx0lYlBVOBxa+
	 qys98MCDj2NSyHuBhU8E4/YCy57usOGr5p/GosH8r304+gh4VXlsK5lLfEAqehq3JD
	 okeOKzNe8YJuw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.1.4.32] ([212.25.11.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mwwdf-1pFNUp1Hlz-00yTu7 for
 <cryptsetup@lists.linux.dev>; Sat, 05 Nov 2022 11:15:12 +0100
To: cryptsetup@lists.linux.dev
From: Fourhundred Thecat <400thecat@gmx.ch>
Subject: mapping with --readonly option
Message-ID: <0e25bcff-4cc7-5416-90fe-0a3f630688c9@gmx.ch>
Date: Sat, 5 Nov 2022 11:15:12 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pf2+uG7Ykrag/vRVtuZRfTJ8FsY3eiRjHL0qghn5lMVJ2M8y4D3
 5xHwTcdQwyT7ip6VWhy85ChE6hwPalqSOMOFufetz6nsGA5inRdlgYsevyVdTjdOlganfgT
 LmKnDuE/NiWwzrZSS+5SPbE8bZhwqme3GPKDJksohYHOISJHlU/i8v6fESOYTL9Nl4iAS2w
 VZ1/5RCPF/vUDKMAWHNlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GevWct5LHYE=;BS7YScK4p7GCSpw9eClOAIpchkC
 XAHjq1mfG9In2VE4AXvd0Ezdqu8v9xz+l/uluWqummHUQ0g2L99ROcynYstPQMKwOM+wiaAx1
 zBqML4ifJnarFFuNz0RrDRNO1uk8v2ZJA+K456e10EjlBGv+r+mRjzL0tGY7eBeSP/3XIX2aG
 OTFOQiaTJgQNaVX+xonsL+2jFG8XKZkVnlgCH+s2gqwIgiDrL9b0Kb0j4utA4WAQrSgeXa9cg
 yOmuQQ+BhDavXphcOS8R4z684oQGsnTpkqPQQYzL+9qfcxiZPI20T64vN5Bgz4tsVzJsbKS/u
 6J0h7dASEcmKZaWtroDL3Sw5o+Ls9Sig0usLUCBNqOG4URYFA5Zbj828T0U6bYum2Cbn0o5QN
 lA+3sKnWWfWm2WOoRBjSNkKIsXN/VvBmgJ2LURkANC441qdtbBiujXcTsYjJIvmjIl67wXioX
 SvYibXVhry77Ot0soRgrZrOMHNJbcH5uFxnwjkpbUZgo5BJmP83l1HaTbOKHuCGjvTA7JLIzE
 mJRkQ9dt+Le7y1i67+0OftlfGP20rXNFw7dVqCcgWtO7eH7xssMLOTMUyncP95dL2iQ60J5tn
 NKHsRvpzyR8O9tz5/ApEN0ypdA7SRAzCX4ONsaxqPqj1KhFD93ryCroETzQgvnfk7lyyn4oKg
 +EoRmGTQyno6yYGm4QafeU3tDWP1vOA/J+12/Zst5QqGsbnRq7oYuvPUNfHCaaw8SQ7NHV+Ys
 6TLxuOehQ3CXw45b0chvrqr7BphPpRBmj/NYWhppK1vy//FKHRXYxIDle1QqUtJWFH2JSMqH/
 F6e317cjvFeT3vIX18VxmI88YAPvkCBVMvD9WJaC/UCGwMT3j4jDNWLkepPBcUQA/vSd5Rdxl
 5Mw6lKGYf1e/4Ni7/jqtr6xRhV8zubnmL3s7lvnsgnpGHV5wQl0pxK5YCR0TaJhC7/Eeamsmq
 MBCR+yjHuj+xYFxnEw8rKktlzN0=

Hello,

if I use the --readonly option to create a mapping, and mount it as my
root partition, can the mapping later be changed during runtime to
read-write ?

Or, in other words, if mapping was created as readonly, can I be sure
that it cannot be remapped to read-write while being mounted as my root
filesystem?

Ofcourse mapping can be closed and opened again, but I am asking here
specifically for mapping that is mounted as root filesystem, which
cannot be unmounted at runtime (as far as I know)

I am interested whether I can use readonly mapping as sort of security
feature to enforce read-only filesystem?

thank you
