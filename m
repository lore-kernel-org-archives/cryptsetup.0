Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0160C136A
	for <cryptsetup@lists.linux.dev>; Tue, 26 Dec 2023 00:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ialbrecht@gmx.net header.b="G/9NtbPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1703548835; x=1704153635; i=ialbrecht@gmx.net;
	bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=G/9NtbPJyF03wOBjgKwZL5e7hSCMEZeNUOypLz+dQ6wE13IJDhNYL3PE4SCRt3ib
	 Z8JlsKvOoTICQuTquuxucgeaaa0XT35Qm4r6ozWRRYtPTvNFnxGPqF5eSNvF55CvW
	 7VIU2JTzuUdYBMKh1HJ/TB3bewPqDCGaIoUyB+zrncbrvjQdGvokZ1VbaCEVHnVjr
	 AchfMbF5iYmJ/L5U1xwY6ZLSvviFXKUDGCOSCJr6owbv2qbgqbXStcfC5P6SmoPb5
	 3bG6WkC5enaPpmn1cge89j7Hml1f/dJ7Y+qcSi98jAxo3XGXtICjpquM8OLqVleKj
	 Op//Xr/m7AD2QSRaZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [78.159.107.65] ([78.159.107.65]) by web-mail.gmx.net
 (3c-app-gmx-bap35.server.lan [172.19.172.105]) (via HTTP); Tue, 26 Dec 2023
 01:00:35 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <trinity-5fb34a85-0558-4b49-ac35-a937eb2fe882-1703548835187@3c-app-gmx-bap35>
From: Ingo Albrecht <ialbrecht@gmx.net>
To: cryptsetup@lists.linux.dev
Subject: subscribe
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 Dec 2023 01:00:35 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:hUBmRdbluVYB6OQqC7tzzBBVya+RfHZwM9KaW75KAXHM+4TvO/J3PYb4iRGVuDG/gqYIS
 KK3hvs8yApUz4oOSDV4CXq8afNBYaGQNN3E09uVkuRAFPfNkWuftAgaiD6ESqaiqYBeDzvtY1C21
 Az3/vYzcyA7Bo6p9sXKomU8y/QS0IOlRPjNzAHk9MTj2f76t0byRI4urGxwCa/GovKl5giOqYSrK
 1yEIHEucNd949RVTLF2gQNyEpvIWXaFXohTMuQ6xo6BovDcuPvQTr8ieNHHvWOx1Ce0CAV1/rOi5
 i4=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OItIZqny8fI=;7qidH+oG4sR+CvV3tjy3elebZdZ
 NRWgEK4yc2q4vVPaVjSN5DJqNxpPqrdT5cuBY32cDAs+Hwg037pdZmzidIOMJZtHJxGxNo8lD
 2eqwjCy13MtDz6jDDtYWCweDlApeS/lcOt/rTZ0vturbReLtjksrnIVGRAniS+bYva3qmmWxk
 VNQq9OT2+c4Fp0U/YAAooS7LS/Z9peCpUYyZVvWnBxxg5H6HlA8MAWYFOuT7iVrMVTe6mkSxj
 jyTct0sDgHWFZDxDHjm7et7kC82eYe2MjzzQEeCXj4r1F4qZofVPKX1opN+jIZpXi1iVI8Nol
 QgZGHvv/hpS1qDw9xevW2uuughBZ8AD2FR2v61JzOj5Y0AssXcqG9rFiBMPIHOsE+Ia9pZ6tX
 gKCd9WsKOw7XNU9NOzNw4YK9wlcuOqSPW0D0c1P9WtZ/3R+3cRGtAZ3ceUumI53Pp4N6ieaG1
 6XaZ7katwWts/6LeLOCQ1BGqnAdiPrVgR3gmK795QfLXxNJvwl67xtmpd35rPF0FUn0JYk23F
 RkqtTqaV+JsE6d57VlMsWog6L+YpG6aHLCHR7P6EMzF4hlbEqnchJr61f4z3SGb/0D22+5f0H
 kz7fW9Yh4Ta9encf1uGgIr/DsiwELly3FZA0U2JkPiBpuIoKBZ7DQzQAu5bCu9tSyc9o3G/UR
 SRUN1b1NsWiyoJU2iynvblMa3Ujxy1KDe2BFrMOzKdFzGcLJJWbOpzwhP0a83W2sz3HugKVjx
 eIL0AYYVrgSgyZckccPyde7bZ1S1s8e8FioruOiV2yfaIvabGjvJu4f0TMA39vHatNjosc9Op
 RsD58HnrXrb83OzuwbJ9fE2Q==


