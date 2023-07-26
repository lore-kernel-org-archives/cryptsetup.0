Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7FF1DA5F
	for <cryptsetup@lists.linux.dev>; Wed, 26 Jul 2023 15:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
 s=s31663417; t=1690385884; x=1690990684; i=blobfish@gmx.com;
 bh=u86igvp+WM5Dn2TC/21eH0ESjovURPMA8BvDjS7I4js=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=AHxzq8YFh1MPMfCLR56lkRkfHb5Uj8kut+NDL4K2Liz8ZAyyiGL/lAfNx0GWD2k3Kc5lziG
 HdWgXV5zUYpZ9Ybcl2vPp8NqpDJunh4WQxdfL8oDGuhdAv1jFUFEUgEoNJcarmjxXGnzKBJjs
 y0Gru44PxpF8jUE5zFkzGIZDcv8ltEOA/nKsLYxyFQPDDM6ZafujT8VCRyDe6GC4UxnwgDHuL
 Kyhd6TzxuHy8wnrKzuMQFhYlCVIE4WCiFV2p5vHwNJdXOmyROiuXRJyILuzEtSfqWDOGI4Srl
 vxS0GdMViOE1rpr6k9krL8NjFRmloz6NIel707OnHGPm9pvhUSPg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from laptop.localnet ([146.70.57.18]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MXp5Q-1qNadz1qiC-00YApO for
 <cryptsetup@lists.linux.dev>; Wed, 26 Jul 2023 17:38:03 +0200
From: blobfish <blobfish@gmx.com>
To: cryptsetup@lists.linux.dev
Subject: Re: Looking for confirmation as I enter the acceptance stage.
Date: Wed, 26 Jul 2023 11:38:00 -0400
Message-ID: <4863669.GXAFRqVoOG@laptop>
In-Reply-To: <a543a204-c0c7-4936-8eb0-38fd3ac825b9@home.arpa>
References:
 <2159917.irdbgypaU6@laptop> <5860622.MhkbZ0Pkbq@laptop>
 <a543a204-c0c7-4936-8eb0-38fd3ac825b9@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Provags-ID: V03:K1:IjTq2pIHFAnueKKD3KuT0gZmOv7Kk8IqLce78OFuqgSrhV2wDB0
 WmEDVlZh5VU92DA6dhH68GTu+G7ddJZrzZcVdBnnZBqi8vOpxgRdDXSCjtrUuV2WXVV/9Up
 B4FujzesiByXbPpu3FRI8arRjkmslB6B9QFenLGm0RyEdCYM9mua1jIOtQlq7p8Mz2/0LVg
 sR3U/c4sGS5J7w8N1oj+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KwxdOpjZZfg=;qlTAcc7PWkDERqW37pa8/AzQt+s
 XMElwBk8YxA7l+W+Jgn5a9dGwf5eS1MRfNFCzE8ujRA5N2AJ/w6AMYgyhfrxxMOnNqaMHonx9
 WWIKm5yf3Hb/v75desLTv0XX0JY7w7Cg3XKQrLvwKlNxDmC1D6y4ADr0dEOePAeXn0OzvfvWn
 unOYSjUBRjskIwTeLDX4BPzMf//KNXVX3PJlg9vfk0gsByPktKmB5Xo4x8JtOCh6SdOp8b1UG
 oBIonHytdk4wuIJeFy0UtkI56CUVyFlA3E/Rs3DaYgLvb7SqhMECkP9k3Wrs9gdxGp4je3U5h
 WtC8wFxDw/lrpObTdaO4S++xfxl+F8E0IMdanOwc2CEjqiFyKHXhcHA69j7WEZ9R/GFr/ac/R
 8bCWoMVDBu0Hg63dqTqlyIFCySglgPaUfy7HrEveOQjSpCE+iqQN9qbWcuUsIwUCkynR5sb1R
 tNg2U4ssVFrO9HBtAtrDaIYA383KxirdRV9eEBFlE04wON308BuOZp6ChAdpByks/mTi2x4gy
 VvCEpOtNdPYkvtVuChClfHzEK3Z9ifa4Mifo84cp4CZFyFa0ksccMFGuJxsPhB5WjRRya5HV+
 Dz5fJBwQ2ItpcjKvakDExEDA1z071rgMcvL38mM+IlOaZbhuR+03jwLf+z3Z1y61XORcIonYY
 AiN4ey5i8/MXflAqAyV/kyWb3yHmp8DJUmKs3KICgjtp0fkTFrW4AP7KA+vWVII7ySRT5FB9N
 Af8G/GopAHhdOAcQCclxSw04MmIpbcRhWHKcYpLmSYisV9Am/v099Rng7yXq10vuW/W1/mVWu
 Jv4Uw4H9T5ak5GVQ/sdksPiCLNR7gXKooAIyAbHRyxuY31mgTuMenh0xs6SyXWAv0gh/OlVKz
 d0pro5ZctE7LMb0hF+HzXbHas+EbxdjrK8rmeM2FW//wZUcXaK/e82YEWCkfqqJKwmjtVB2gB
 Eu0+GA==

On Monday, July 24, 2023 12:03:13 PM EDT Michael Kj=F6rling wrote:
=20
> $ sudo dd if=3D/dev/sdb1 skip=3D126974 bs=3D256 count=3D1M of=3Dsdb1.head=
=2Eshift
>=20
> $ sudo cryptsetup luksDump ./sdb1.head.shift
>=20
> $ sudo file ./sdb1.head.shift
>=20
> Let's see what that gets you before we write this off as unfixable.
>=20
> For comparison, here's what I get when I do something very similar
> (using the same offsets) on what you have sent:
>=20

=46inally finished the backup. Thanks for the ddrescue tip. Nice tool! I fo=
llowed=20
your procedure from above and got the exact same output as you did from the=
=20
test data. Further I did:

sudo cryptsetup luksOpen sdb1.head.shift mapped1
  I was prompted for passphrase and entered it.
  command finished without error.
  new path at /dev/mapper/mapped1

I am guessing that is a pretty good sign?




