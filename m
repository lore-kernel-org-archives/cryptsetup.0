Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67BF17739
	for <cryptsetup@lists.linux.dev>; Tue, 27 Jun 2023 11:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 7EF603F2B8
	for <cryptsetup@lists.linux.dev>; Tue, 27 Jun 2023 13:15:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.165
X-Spam-Level:
X-Spam-Status: No, score=-1.165 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, T_SCC_BODY_TEXT_LINE=-0.01,
	URIBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nq5U6ZB_0qLI for <cryptsetup@lists.linux.dev>;
	Tue, 27 Jun 2023 13:15:50 +0200 (CEST)
Received: 
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 7FDCF3F23B
	for <cryptsetup@lists.linux.dev>; Tue, 27 Jun 2023 13:15:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id C91672E0262
	for <cryptsetup@lists.linux.dev>; Tue, 27 Jun 2023 13:15:49 +0200 (CEST)
Date: Tue, 27 Jun 2023 11:15:48 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re:
Message-ID: <ea605c82-0306-46b7-9d35-4354653a61e0@home.arpa>
References: <CACJx3YpDV2=J8rStSG685iBSW6OSEV2UaS4oRL6=qVGGSsoRvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACJx3YpDV2=J8rStSG685iBSW6OSEV2UaS4oRL6=qVGGSsoRvQ@mail.gmail.com>

On 27 Jun 2023 13:10 +0200, from alvaroam007@gmail.com (Alvaro a-m):
> Do you know any solution for this? Can I enable the touch screen
> before LUKS gets up?

That is a distribution issue; not a LUKS, dm-crypt or cryptsetup
issue. You should ask your question in a forum more geared toward
whatever distribution you are using.

I do hope that you will be able to find an answer, but the cryptsetup
mailing list is the wrong forum for your question.

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

