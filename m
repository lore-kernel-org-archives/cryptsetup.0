Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E344F1BC9EE
	for <cryptsetup@lists.linux.dev>; Tue, 26 Nov 2024 09:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.19.178.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732613697; cv=none; b=heLG2XmNBgaR9CyyAh4q3bbCRQOeO1L4mTp7wmzE/0Th00wCRI2fdXhHnWQ7FW9JS2mxCHHmP5yXsVtV49BcnPaF3d+ngj8sWenavnrGpNygzsrsMn355KY3Tu8eQGwip4YBiWi4ApG8Kc0HS5CPUZJDenQOp7inURhwMWDf9pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732613697; c=relaxed/simple;
	bh=XD4gGIPOHtfPJv1joLqHmeQQ4SUfZk5GeJSEg+QDRck=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kg/JsvUdMRo6C+O1zVSqDm7iB+MgPYZoKtBoGe4dq+e5Pr1DCzuZjht3jyGHtQaNYot5n3GA9rA6ddzQjoZRo8Qe69MzIB5UARtRwLZ0GA++XFvkUStDlV8wHbKiHV6ZIB/X3iuZW+IBJ7CGWXaxEyC8MIG2GSwIIsKuohqL3q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info; spf=pass smtp.mailfrom=arnowagner.info; arc=none smtp.client-ip=84.19.178.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnowagner.info
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 1030214004F
	for <cryptsetup@lists.linux.dev>; Tue, 26 Nov 2024 10:34:11 +0100 (CET)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id ACD0B17AA7B; Tue, 26 Nov 2024 10:34:42 +0100 (CET)
Date: Tue, 26 Nov 2024 10:34:42 +0100
From: Arno Wagner <wagner@arnowagner.info>
To: "cryptsetup@lists.linux.dev" <cryptsetup@lists.linux.dev>
Subject: Re: LUKS and quantum computing
Message-ID: <Z0WWMgwXUdwODyzW@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <PH7P220MB1325C03018B9E4F926B5127CED2E2@PH7P220MB1325.NAMP220.PROD.OUTLOOK.COM>
 <94a6a2f6-dc55-44ad-9172-6ac76e83abe3@gmail.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94a6a2f6-dc55-44ad-9172-6ac76e83abe3@gmail.com>

On Tue, Nov 26, 2024 at 09:53:36 CET, Milan Broz wrote:
> On 11/25/24 11:13 PM, Patrick Callaghan wrote:
[...]
> BTW who is "we" in your pararaph?
> 
> Milan

I have been wondering that as well...

Arno

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
