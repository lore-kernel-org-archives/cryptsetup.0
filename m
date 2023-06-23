Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8033B5247
	for <cryptsetup@lists.linux.dev>; Fri, 23 Jun 2023 14:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 2C8883FDA4
	for <cryptsetup@lists.linux.dev>; Fri, 23 Jun 2023 16:12:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.166
X-Spam-Level:
X-Spam-Status: No, score=-1.166 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oYAD-ck9ejQ1 for <cryptsetup@lists.linux.dev>;
	Fri, 23 Jun 2023 16:12:21 +0200 (CEST)
Received: 
	by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0E6EF3FD57
	for <cryptsetup@lists.linux.dev>; Fri, 23 Jun 2023 16:12:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id 9117B2E031A
	for <cryptsetup@lists.linux.dev>; Fri, 23 Jun 2023 16:12:20 +0200 (CEST)
Date: Fri, 23 Jun 2023 14:12:19 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Bypass kdf step with LUKS2
Message-ID: <3246ac45-4ea8-4c29-96b7-16c46eb3737e@home.arpa>
References: <CAJbs9BHP=bu37WAEM_ztReiFUP+rNUVLnPWBdNOmRzjW8Kb_OA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJbs9BHP=bu37WAEM_ztReiFUP+rNUVLnPWBdNOmRzjW8Kb_OA@mail.gmail.com>

On 23 Jun 2023 10:01 -0400, from rishid@gmail.com (Rishi Dhupar):
> I am using a high entropy 256-bit key as my
> keyfile [...]
> thousands of devices and want to
> rotate the passphrases on them

This sounds contradictory, and quite frankly smells of a XY problem.

If you are already using a high-entropy key file (that is,
effectively, passphrase), then _why do you need to rotate passphrases
en masse?_ What are you looking to solve by rotating passphrases?

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

