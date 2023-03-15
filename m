Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B506FC3
	for <cryptsetup@lists.linux.dev>; Wed, 15 Mar 2023 20:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 4270D3F647
	for <cryptsetup@lists.linux.dev>; Wed, 15 Mar 2023 21:35:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.155
X-Spam-Level:
X-Spam-Status: No, score=-1.155 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, FROM_LOCAL_HEX=0.006,
	FROM_STARTS_WITH_NUMS=0.738, URIBL_BLOCKED=0.001]
	autolearn=no autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOzLql_blpzT for <cryptsetup@lists.linux.dev>;
	Wed, 15 Mar 2023 21:35:07 +0100 (CET)
Received: 
	by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 6E71D3F475
	for <cryptsetup@lists.linux.dev>; Wed, 15 Mar 2023 21:35:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPS id CBFD92E0404
	for <cryptsetup@lists.linux.dev>; Wed, 15 Mar 2023 21:35:06 +0100 (CET)
Date: Wed, 15 Mar 2023 20:35:05 +0000
From: Michael =?utf-8?B?S2rDtnJsaW5n?= <152cc69a347e@ewoof.net>
To: cryptsetup@lists.linux.dev
Subject: Re: Password hash as LUKS key
Message-ID: <06e718ed-b377-4b8d-b1f1-31abd40a4dc7@home.arpa>
References: <1738775229.2387123.1678372528163.ref@mail.yahoo.com>
 <1738775229.2387123.1678372528163@mail.yahoo.com>
 <20230310011952.GA1141@tansi.org>
 <885982240.717525.1678893078734@mail.yahoo.com>
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <885982240.717525.1678893078734@mail.yahoo.com>

On 15 Mar 2023 15:11 +0000, from martinolsson311@yahoo.com (Martin Olsson):
> I see maybe it's something wrong with the way I'm going about this. The following
> are the commands I'm running:
> 
> mkpasswd (asks me to enter a password, I enter test)
> Password:
> $y$j9T$35ITJ7yCc3kFUsasf3QDa/$n.HqacKYHPIEE6VxIHhT2vW8.7vfh.fn008SQS5ETb9
> 
> printf "%s\n%s\n%s\n" "12345" "$y$j9T$35ITJ7yCc3kFUsasf3QDa/$n.HqacKYHPIEE6VxIHhT2vW8.7vfh.fn008SQS5ETb9"| sudo /sbin/cryptsetup luksAddKey /dev/sda3

Aside from that already mentioned by Grzegorz Szymaszek, a more
general question: what leads you to believe that you can give the
output from mkpasswd (which at least on Debian is provided by the
"whois" package) to cryptsetup (provided by the "cryptsetup-bin"
package) and have the mkpasswd output be recognized by cryptsetup as
being somehow special?

A quick web search for the two didn't reveal anything obvious
connecting the two; and the cryptsetup man page does not mention
mkpasswd.

When I try what you're doing on my system, there is no indication that
cryptsetup recognizes the $y$j... string as in any way special; in
fact, quite the opposite. I also don't see why cryptsetup _should_
recognize it as being somehow special, as you are just providing a
string to the luksAddKey operation to use as a keyslot passphrase.

Example:

# truncate -s 1G ~/tmpluks
# losetup -f --show ~/tmpluks
/dev/loop0
# cryptsetup luksFormat /dev/loop0
...
Enter passphrase for /root/tmpluks: <enter 12345>
Verify passphrase: <enter 12345>
# printf '%s\n%s\n%s\n' '12345' '$y$j9T$35ITJ7yCc3kFUsasf3QDa/$n.HqacKYHPIEE6VxIHhT2vW8.7vfh.fn008SQS5ETb9' | cryptsetup luksAddKey /dev/loop0
# cryptsetup luksOpen /dev/loop0 devloop0
Enter passphrase for /root/tmpluks: <enter 12345>
# cryptsetup luksClose devloop0
# cryptsetup luksOpen /dev/loop0 devloop0
Enter passphrase for /root/tmpluks: <enter test>
No key available with this passphrase.
Enter passphrase for /root/tmpluks: <enter $y$j...Tb9>
# cryptsetup luksClose devloop0
# losetup -D /dev/loop0
# rm ~/tmpluks 

-- 
Michael Kjörling                     🔗 https://michael.kjorling.se
“Remember when, on the Internet, nobody cared that you were a dog?”

