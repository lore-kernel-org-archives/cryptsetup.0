Received: from artoo.va1der.ca (artoo.va1der.ca [66.70.202.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A9D21CFF6
	for <cryptsetup@lists.linux.dev>; Thu,  6 Nov 2025 22:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.70.202.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762469198; cv=none; b=kgWJLjKDsVd/zfNcgJx6NIbqLEznQSGnJvttYJ5GInOesiA2TXNYoXwkuXtkq46H88O9tuMBnH/8J38DdgkrzmNL+50u8OP9wd3xhRnFBqzPTr/Ddy8evgRITo+IsYnB85lpcBawg1dsExY+OlRJIcf8Ievn6k+eQPNiqOqPO8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762469198; c=relaxed/simple;
	bh=BVsPqSm+qW2kk6HJ0HqTfedEVNc14eW1rFI5fc1a53U=;
	h=MIME-Version:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=D3snIhAwbaQpccHBkEECx7vVpnjcc+A1YLYN1S7gpjDMvdx5cfsZOoel65gKkWz4eUTKyFNcK9m56cKuyYVIRY3B08sNqJuyyXWKuzes6wlnh7LY1eAxiBIp7GbX14JEkd8wHW8rIT6Bu1N8hSbfAGyRMfeLmndrrecZD1vrRlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=va1der.ca; spf=pass smtp.mailfrom=va1der.ca; dkim=pass (4096-bit key) header.d=va1der.ca header.i=@va1der.ca header.b=dXQfF7go; arc=none smtp.client-ip=66.70.202.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=va1der.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=va1der.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=va1der.ca header.i=@va1der.ca header.b="dXQfF7go"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=va1der.ca;
 i=@va1der.ca; q=dns/txt; s=rsa4k; t=1762469193; h=mime-version : date
 : from : to : subject : in-reply-to : references : message-id :
 content-type : content-transfer-encoding : from;
 bh=YXP9GgeD7viJ0aB5IsUFANImbIm3il2Nxb/3X3xX1nE=;
 b=dXQfF7go4IhNyvI/Iv+7s5sLtWhhC8wP1G4n9iGsGvVldDiZsMP9BKWYxfxRTYtSh3zzn
 HW8NWpHCUlR1/wbCeIjI3mDgyIRoikatKiXvIchsLbNMKcCRvI8EOkeUihZfxmjbVFKgnrF
 uR9U1kvToC3sbNJGg5VYJi4kw884933/hUT/lnEotoSKYatr4+J30jiW0FcWE1uGUXpurfk
 h30owtNWauyA65LQ/smcXZNveD0LCPHu7NXn4g6Z8TlWVj/9ZLiodN2Ho5Gxza27W+ZHTdc
 hmvu2omqyApTtrycU/bi7FqwjG4dhDi+QvJ7SJU1N4kOrxZ214KSMIVwUzzZhMJmQ5Wpy+F
 EKzdAOAGTFTqedxT0jrhTTZqLpXjvG4KXuwsvvipzcz63TEO61QrglGbk1Ei3T/+2C7FxLX
 79oXL81UBOxk1bSzvdQlc337T56+40gN2UMRmpDlSnFB1UJkHryRJ/UZ8dXenXILDu1eMwk
 pq84aUdjv72KqvbsAQTm6zkkCyo1QSHR4VgCE10p3OHD1EZuurGDbRz3UravIdl7CbeCQIR
 h4Qg1kxfzezuEkbeB3vbH64MD30qfnX4ockRk69iHlGtGPyjYWWWZOQSoXHilr54k4Be/a2
 gdaYTGn5LVf9tSVRZTaEDU+noqFfjbp4bXjwwPnV5MGgFM=
Received: from artoo (artoo.va1der.ca [66.70.202.72])
	by artoo.va1der.ca (Postfix) with ESMTPSA id 3D4443868C6
	for <cryptsetup@lists.linux.dev>; Thu,  6 Nov 2025 18:46:33 -0400 (AST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 06 Nov 2025 18:46:33 -0400
From: Kurt Fitzner <kurt_cryptsetup@va1der.ca>
To: cryptsetup@lists.linux.dev
Subject: Re: Question about FAQ 5.21: "Why is there no "Nuke-Option"?"
In-Reply-To: <vygshmb2sfy2fexy4556aqqc2dxiemelcudbec4o7lvtatsjuf@hy4kni6fnjz3>
References: <ycc43yz54ybgnal5t3rcment6vjvanalx2g2z6rly4wxxpietn@nn222ctnfqaz>
 <aQzAAvW7wmbFoOrv@xed.ch>
 <vygshmb2sfy2fexy4556aqqc2dxiemelcudbec4o7lvtatsjuf@hy4kni6fnjz3>
Message-ID: <06d9e2a075aa11c0a21e528151eeb5dc@va1der.ca>
X-Sender: kurt_cryptsetup@va1der.ca
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Nuke options are mommy medicine.  They rely on:
1a) the ignorance of the adversary to their presence and
1b) the adversary not taking the most basic precautions
Or
2) External hardware or mechanisms to enforce.

In either case they are beyond the scope of DM-CRYPT / LUKS.  Any 
implementation in LUKS would do more harm than good, either giving the 
user a false sense of security, or in inadvertent activations.

If your threat model anticipates torture and in spending your life to 
protect the secrets on your hard drive, then LUKS is not for you.

And no one, literally no one, will try and brute force a password using 
the software ON the device.

You can already accomplish almost all the same  goals using simple 
methods.  Get yourself a frangible USB stick.  Or a small USB microsd 
reader and physically score the card to render it easily snapped.  There 
are even hackaday projects to make USB sticks with buttons that dump a 
fatal shock into the electronics.  Put your storage device key file on 
that device and retain it on your person.

I will also add that your threat model is naive and implausible.  No one 
who wants your data that bad will get your password with a bat.  They 
will put a camera watching your keyboard.  Or they will install a 
physical RAM grabber in your computer.  Or subvert the update process 
for some piece of software on your computer.  Or any one of a thousand 
different variations.  And in the remotest chance your threat scenario 
ever materialized, I promise you a trained interrogator will know when 
you're trying to feed them a fake password before your conscious brain 
even gets the handoff and the idea percolates to your forebrain.

Lastly, I will add that if such threat models as you anticipate exist, 
then such measures as nuke options are then more of a danger to others 
than they are useful to you.  Do you really want to make it impossible 
for any person who doesn't actually employ a nuke password to be trusted 
to give the password?

LUKS does not address any of this nor should it.

On November 6, 2025 3:46:51 p.m. UTC, techmetx11 
<techmetx11@disroot.org> wrote:
> Yes, that is what would happen if computers didn't come with a
> integrated cryptoprocessor to store secrets or something like TPM2, but
> computers do come with that now.
> You could require a secret stored in it as apart of the process of
> unlocking the drive, either deriving a key from both parameters (the
> key-derived password and the secret in TPM) or having the TPM secret
> decrypt the configuration that stores the password hash and parameters
> 
> Since you can't easily mirror data from a TPM chip, especially if it's
> integrated deep into the CPU, wiping it would render the contents on 
> the
> drive useless even if they mirrored it beforehand
> 
> On Thu, Nov 06, 2025 at 10:34:26AM -0500, Chris X Edwards wrote:
>> I don't really have any true expertise to comment publicly but how
>> about this:
>> 
>> You have an encrypted drive with important stuff on it. There are two
>> passwords, one is "?LR3*F%@hdQa7Db3d=L7&A27LQ%aAd3aA@?H?adL" and this
>> unlocks the drive. The other password is "mypassword" and it nukes it.
>> Simple brute force attempts will be hindered. Though if they're smart,
>> they are mirroring.
>> 
>> Maybe I'm overlooking something. There's always something!
>> Good luck,
>> Chris
>> 
>> On 2025-11-06 15:38 +0100, techmetx11 wrote:
>> > Imagine if you were being tortured by people to unlock a hard drive that
>> > you didn't want them to see the contents of, and so you give them the
>> > password to hopefully make it so that it wipes the TPM/HSM/etc. of the
>> > computer and destroy any chance of unlocking the contents, thus making
>> > their job futile and saving information from ending up on your
>> > adversaries' hands (even if it meant it cost you your life)
>> 
>> --
>> ++++++++++[>++++++++++++<-]>-...<++++++[>>+++++++<<-]>>++++.<+.<++++[>
>> Chris X Edwards-----<-]>+.- Have a nice day. >.<-.+++++><chris@xed.ch>
> 
