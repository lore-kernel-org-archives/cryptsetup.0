Received: from arnowagner.info (mail.tansi.org [84.19.178.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C7913B7BC
	for <cryptsetup@lists.linux.dev>; Sat, 12 Oct 2024 07:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.19.178.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728719827; cv=none; b=q6qy9fVYtBbyPXcjtuXIqEi+jBCuJiJ7M78mBj+DLF0jBPnd9g16jMNj6Xc64CYz6H9OR7y3lM66uvWoslFRvqH8+LFjbWnHkJZTBBWH1ebjJFP7JPjyQ0490hl7tPaA4K3GHkzPg/SYuJ+hqgnqIvMcoCqIR4d7ohfUwoI01TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728719827; c=relaxed/simple;
	bh=6OC3gRmawAC4FYM5Gl15U7pQ24Y+Qe9aJXWzt4lBedw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boelvio96A18b4JRHM1JxKbFHJNod8WI0AQtcp8xFFVs26sH1oUQpzD4VdhVAXau/ap5zIGQZRColTKRLqhohKvp9ShaOuBBUop67BlV8VdUSy1nXccVFS0kdQwRBfz5c3tr7y0Fmditm/e88bzYZOIHhktthNY2OBRjw9nUchs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info; spf=pass smtp.mailfrom=arnowagner.info; arc=none smtp.client-ip=84.19.178.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arnowagner.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnowagner.info
Received: from gatewagner.dyndns.org (81-6-44-245.init7.net [81.6.44.245])
	by v1.tansi.org (Postfix) with ESMTPA id 2EF25140145;
	Sat, 12 Oct 2024 09:51:15 +0200 (CEST)
Received: by gatewagner.dyndns.org (Postfix, from userid 1000)
	id B50DC17AA0A; Sat, 12 Oct 2024 09:51:40 +0200 (CEST)
Date: Sat, 12 Oct 2024 09:51:40 +0200
From: Arno Wagner <wagner@arnowagner.info>
To: iam.frightful278@slmail.me
Cc: Kiss =?iso-8859-1?Q?Istv=E1n?= <keraform@gmail.com>,
	cryptsetup@lists.linux.dev
Subject: Re: Issues with LUKS Password Management Options
Message-ID: <ZwoqjPbj7WSgTeF2@tansi.org>
Reply-To: Arno Wagner <arno@wagner.name>
References: <32be1215-bcab-425b-99cd-3adc26590b14@gmail.com>
 <172865527522.7.15832692550076661927.460247870@slmail.me>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172865527522.7.15832692550076661927.460247870@slmail.me>

I do not disagree, but you are on the wrong mailing list here.
This is just for cryptetup (the CLI tool) and LUKS (the spec
and implementation), not for GUIs some other people have
written for it.

Regards,
Arno

On Fri, Oct 11, 2024 at 16:01:09 CEST, iam.frightful278@slmail.me wrote:
> i had the same response and request that Kiss istvan has...  im surprised
> the devs don't seem to be aware of this feature (maybe you's don't utilise
> any GUI at all for cryptsetup usage?...)
> 
> but for us GUI users, that when plug in a drive to the computer, we get
> the GUI with LUKS password box, under this there is the option to forget
> password immediately or til logout etc (as kiss described)..  and the
> default, IMO, 'should'/could be the 'forget password immediately'...  i
> also felt this, and wondered how i could change this feature...  as it
> take another few clicks to access my drives.
> 
> im running a linux mint machine, cinnamon desktop, if that helps. 
> 
> regards
> phil
> 
> Sent with Proton Mail secure email.
> 
> On Friday, October 11th, 2024 at 7:08 AM, Kiss István <keraform@gmail.com> wrote:
> 
> > Dear Developers,
> > 
> > I would like to bring to your attention an issue regarding the password
> > management of LUKS-encrypted volumes. Currently, the LUKS password
> > prompt offers three options for remembering the password, with the
> > default setting being to remember the password until logout. However, I
> > rarely turn off my computer, and I often keep it in standby mode for
> > weeks. As a result, the LUKS-encrypted volume remains unlocked for
> > extended periods, which is not ideal from a security perspective.
> > 
> > Every time, I have to manually ensure that the password is only stored
> > temporarily (forgotten immediately), which can be inconvenient and is
> > easy to overlook. I believe it would be helpful if users had the option
> > to set "forget the password immediately" as the default behavior,
> > perhaps through a simple checkbox, avoiding unnecessary compromises
> > between convenience and security.
> > 
> > I would like to ask if such a change is planned for the future or if you
> > have any suggestions on how this can be more efficiently handled with
> > the current system configuration.
> > 
> > Thank you for your attention, and I look forward to your response.
> > 
> > Best regards,
> > István Kiss
> >
> 

-- 
Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of 
"news" is "something that hardly ever happens." -- Bruce Schneier
