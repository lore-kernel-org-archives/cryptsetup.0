Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061AF1FA1
	for <cryptsetup@lists.linux.dev>; Fri,  3 Mar 2023 17:50:20 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 213B4140048;
	Fri,  3 Mar 2023 18:42:28 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id F040717A459; Fri,  3 Mar 2023 18:42:53 +0100 (CET)
Date: Fri, 3 Mar 2023 18:42:53 +0100
From: Arno Wagner <arno@wagner.name>
To: Milan Broz <gmazyland@gmail.com>
Cc: Lars Francke <lars.francke@gmail.com>,
	Michael =?iso-8859-1?Q?Kj=F6rling?= <152cc69a347e@ewoof.net>,
	cryptsetup@lists.linux.dev
Subject: Re: cryptsetup - No key available with passphrase
Message-ID: <20230303174253.GA24756@tansi.org>
References: <CAD-Ua_hj1hkymLbyEyT-eNyCj_naiqHqg7nr3nos8tp9XCERDg@mail.gmail.com>
 <64fc6294-ca5e-f7a9-302f-63b09d569586@gmail.com>
 <CAD-Ua_h2GDZexz=DC3YA88nO-OhXKyGp1v2D6rWvHHQVwtCgFw@mail.gmail.com>
 <3b08eace-b038-bab1-4f65-f9c322dc90a4@gmail.com>
 <CAD-Ua_j_AR4BJWJPXs9Lv+qO1-c33M59UPg_1_XQdB60s0MEXg@mail.gmail.com>
 <46a11902-fdbd-4c75-a589-840e4e1f3e27@home.arpa>
 <CAD-Ua_gQLB+6a8=eRQd7B8u76hmvGFH+xPtzJKXPwn=gjuF=uw@mail.gmail.com>
 <47da0423-7e8c-c059-c65c-fe6252b0e384@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47da0423-7e8c-c059-c65c-fe6252b0e384@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Mar 03, 2023 at 08:55:50 CET, Milan Broz wrote:
> But memory failure is just a recipe for disaster later...)

I agree. I usually run memtest86+ (there is a new version out)
for 2 days, just to be sure. Things have gotten better with
DDR5 (on-chip ECC), but you can still get failures in buses
or uncorrectable errors with low-quality RAM. Sometimes the
RAM is even completely fine, but the mainboard manufacturer
has screwed up the parameters that the BIOS uses. 

Regards,
Arno
-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
