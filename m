Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D623328EA
	for <cryptsetup@lists.linux.dev>; Mon,  5 Sep 2022 06:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id AE8CB3F4F9
	for <cryptsetup@lists.linux.dev>; Mon,  5 Sep 2022 08:34:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.909
X-Spam-Level:
X-Spam-Status: No, score=-1.909 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
	autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WG_ECXZI2zHh for <cryptsetup@lists.linux.dev>;
	Mon,  5 Sep 2022 08:34:02 +0200 (CEST)
Received: 
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 95F963F4EE
	for <cryptsetup@lists.linux.dev>; Mon,  5 Sep 2022 08:34:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id DB04D2E026D
	for <cryptsetup@lists.linux.dev>; Mon,  5 Sep 2022 08:34:01 +0200 (CEST)
Date: Mon, 5 Sep 2022 06:34:00 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <michael@kjorling.se>
To: cryptsetup@lists.linux.dev
Subject: Re: performance and threads
Message-ID: <9b3dbcd0-c047-4308-bba4-61323424cebd@home.arpa>
References: <CAEBTHXYF+90eqqOnrW7M9BjiGomBCqj43xbQ47WBNam0-krbAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEBTHXYF+90eqqOnrW7M9BjiGomBCqj43xbQ47WBNam0-krbAA@mail.gmail.com>

On 5 Sep 2022 05:52 +0200, from csillag.kristof@gmail.com (Kristóf Csillag):
> - Raw device read: 2,3 GB/s
> - RAID device read: 2,3 GB/s
> - Reading from the encrypted device: 1,6 GB/s

What does `cryptsetup benchmark` report for the relevant combination
of cipher and key size?

-- 
Michael Kjörling • https://michael.kjorling.se • michael@kjorling.se
 “Remember when, on the Internet, nobody cared that you were a dog?”

