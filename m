Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3852562F
	for <cryptsetup@lists.linux.dev>; Mon,  4 Mar 2024 16:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709570091; cv=none; b=YM5xsFah53CZpLWSnpZa/BV9bnjz/tNBp5GVep6L4gndtSlb2MEzCW7+hzjArfRcv2LbQ2j5OAp7lWQW0yKyNi302+V7h/8GRV9wjryFP2b6781HdG5WVvQUE77GM451h8bcRq8hFcL233RVQQet/4OzQxRrIoaRXl/sSQYmYnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709570091; c=relaxed/simple;
	bh=e1URxLWjvdcU7X5NkKIEpFfcv5bWbtyQNNEAUcrOrsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uVsi1PvCus3eypHyYn1JTz7oXWf6wLKInQa9od7C7L+If3i6CDjGtXJcXLDQX3U6y1Qy9JZjdq59YwAy68cBmKItdCqkdeUyCjyH+yG2ajfwM6g6K+ZUpARfMPpkIUXU9QaWMqBkXbY8OqGh2xXn1Q8rck2u2kJvHpHA/K1VSTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.co.uk; spf=pass smtp.mailfrom=gmx.co.uk; dkim=pass (2048-bit key) header.d=gmx.co.uk header.i=xanda@gmx.co.uk header.b=YGGJ79Gq; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.co.uk header.i=xanda@gmx.co.uk header.b="YGGJ79Gq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.co.uk;
	s=s31663417; t=1709570087; x=1710174887; i=xanda@gmx.co.uk;
	bh=e1URxLWjvdcU7X5NkKIEpFfcv5bWbtyQNNEAUcrOrsw=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=YGGJ79Gq9EhHKrKS8PidCPv1ePAATyJLOkjaFwYohQVQ0D2MFiOCX8yuwS4M9rxT
	 XJTjV8BT40a2i6znXKkr5SVE//BjF9KDiG7FhEAjoZsM7T7nAChVHEiFOKxXRUf+q
	 kcqsTNR2JT2IgQN/8u0F2ny8s3gD6uOt6Lwq49nP68xchcibMdUJzZ1x/hCBnw1kN
	 PYUr25cu1241m7pw+4eQTVWD4gDvqmLPAxoh2o1+/+Z7eGRYzbV6OJpAaraqPwsV6
	 9YK4IAPuU3cIRHKtIKO7oVg/gR9q1jea/xrJpUJZrDVa8GVQpZpYza3WpJLjp+osd
	 hJeOh2H/MmU9NMHeGg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.126] ([86.158.200.39]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MAONd-1raog80dR5-00BuH1 for
 <cryptsetup@lists.linux.dev>; Mon, 04 Mar 2024 17:34:47 +0100
Message-ID: <08281b96-b6c3-433e-83ae-3b6b382714ce@gmx.co.uk>
Date: Mon, 4 Mar 2024 16:34:45 +0000
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: How to resume decryption on LUKS1 in-place
To: cryptsetup <cryptsetup@lists.linux.dev>
References: <cd29a952-c9ce-4aa0-8903-a79c325824f0@gmx.co.uk>
 <764b4743-a61f-4e95-af07-d53c1e842e64@redhat.com>
 <3e4d1b13-7935-40b6-883a-68b2ef16545d@gmx.co.uk>
 <80c0a6a8-b710-4483-8e57-56e1951fa213@redhat.com>
 <76ca5ef4-5298-4c03-bdc1-8b1ce012c7b4@gmx.co.uk>
 <6caca783-5a30-434c-b9f1-234a1bff9310@redhat.com>
Content-Language: en-GB
From: xndr <xanda@gmx.co.uk>
In-Reply-To: <6caca783-5a30-434c-b9f1-234a1bff9310@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GgQDQbAwkV4nOHY20uEyPE4Fe/k6ztBu9Uhobspty25sZOp/gGj
 qTQZ+ubMCk/q2kEHvmrV+GkBkMyhwrZVkObpbon33IEBffbMRWIj16wvJyC09+Celu/KTwE
 EwSZSsgzkNLig6STopaPG5si59UEtO00WKm1wzUqzTIOVMvwdxFnWDWnPMRKFkvUDXWwN64
 A7Azf8bLQgCPI6adRVUsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LNmJzpf6z90=;4PjQydW6f/3OsvnyL/cFcXJ8vJ7
 4hVpqC/dIDC2VioTwmu6yL5yDTLZ9ercptJ4o93KPiI0022k4p4L5+aFiHjdO0TrzklwbC+1f
 /da4IUNCte9EkdkCOotPdWWwSzCAZzoZHPzzAidNq0Z3HurkHttRrNsThiPUeFPb+kV/BdPOD
 Xj/vOyoX0vyDxpvlyy9sWBQkkVonL3d+YdMTqLruOiJoH53z2bsVdvuY4Kx3a87EbP+56yqow
 9oUQkPOcYzOgG15JUrBGvThRjrPjjH7zYfGFfagU4SpY9fRZ+2+EvHuAQNM6m+MQ9F8JiLse8
 7BopqHVuaBm7Li5mVBY3cEisyPmDS57hcZdHpRskj12JDtJ/90fBmHyw+Hh20AyZOS7uFWRXW
 j18BEE5CpvNEMUh4ShVRri0cL3kcs4slItd8ipQOzm4fh8djXzLJqsIhyDX98+2n1zQruyiSe
 Z3oXCcrBQHvp83MIxyTD5KHMirZbYIl06NRk8j5RIzibzqucBWft6kPzTt27BntALQxeNtJ0K
 ZfSlvIbIzdH6cObB84IPhpkKPeS3eKum7eOvE/9d7KGEsegGkPu8FbCNrqeM4Wah/RRdtJkrV
 +J1N+EvDhXn2tOYSh1Lc88E4REE62USeOTXCc4GuDIfN/uSUO6LltrgnisPt8Wh7vJ39jT6X4
 +M6hzJzK7KlfcWJBAgsf+uxJDSBD672uWW6CK3pZ2MraJjnHJnGe/iZDnkokPlKoaj9OlVtPG
 5MqLAZjSEBkqFJDBMPK4dl7Kb4p24Fp+87Zmav2S8qYtc5egTDO2SWYXplLlaxkiGPhyogBmo
 Baw8hUMO7bf+wEmK4FgpMJlxTrfrnBhN8i1vGXDk1XzmI=


> In general? No I don't recommend to downgrade to 2.4.3 for normal
> operation. It's just currently the best option to workaround the bug
> introduced in 2.5.0 regarding resuming LUKS1 decryption operation.
>
Apologies - my bad; this is really what we meant.

In the meantime we'll update this thread with the result.

Ta lots,

xander

