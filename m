Received: from v1.tansi.org (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1741627
	for <cryptsetup@lists.linux.dev>; Tue, 31 Jan 2023 23:12:40 +0000 (UTC)
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 9649A140172;
	Wed,  1 Feb 2023 00:06:52 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id A2ACD17A44D; Wed,  1 Feb 2023 00:07:16 +0100 (CET)
Date: Wed, 1 Feb 2023 00:07:16 +0100
From: Arno Wagner <arno@wagner.name>
To: Michael =?iso-8859-1?Q?Kj=F6rling?= <152cc69a347e@ewoof.net>
Cc: cryptsetup@lists.linux.dev
Subject: Re: Assistance required
Message-ID: <20230131230716.GA29665@tansi.org>
References: <CAP9n+XEKNXm5YByQ_LiKcu3H4cY1SSRfCsAs6+=v-9HnVFCqOw@mail.gmail.com>
 <d08a3c6e-aa13-4af8-88a1-7375e827f3e6@home.arpa>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d08a3c6e-aa13-4af8-88a1-7375e827f3e6@home.arpa>
User-Agent: Mutt/1.10.1 (2018-07-13)




On Tue, Jan 31, 2023 at 14:09:05 CET, Michael Kjörling wrote:
> On 31 Jan 2023 10:58 +0100, from sensei.of.darkness@gmail.com (Sascha Sander):
> > But unfornutaley I need to know the previous passphrase to add a new one.
> > Is there *any* possibility to access the data?
> 
> Unfortunately, the general answer to this is no, there is not.
> 
> If it was possible to access the data inside a LUKS container without
> knowing a valid passphrase for the container, then that would
> completely undermine the entire purpose of having full disk encryption
> in the first place; so anything like that would be a serious design
> flaw.

I second that. What you are trying to do would completely
negate the LUKS security model if it was possible. 
Hence it is not. 

Regards,
Arno

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
