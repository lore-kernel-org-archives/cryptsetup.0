Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB84D2BEC3A
	for <cryptsetup@lists.linux.dev>; Sat, 10 Jan 2026 07:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768029025; cv=none; b=X5TPuSfVuLP4yRPgJuOQDiEZO9fKYQau+E2AyEkh1KpuXrJS+gCII+QZZlvdEHT9EPBemsad1LkBaQ3DToePpZyWmLjfcLj65flQWy/nh/grazV2DRREn3tsH5poPVYXDo2YhDTW53jnM4SDglQg+YzswhYV4NqCKudpM8MoTsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768029025; c=relaxed/simple;
	bh=4XriQmRRCBxvD8TDs3O/sWJ1XtZ/QatOIxLH752kL70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfhK1t+MWn+VcptIc/oxPwQMBAB1ArIoBZMI0qgB4WfgOJEjCwpwiSSidfO9UR+unPK2T2oaXjbmz8tnzmmE/I6HMM6a023Cuj86OcwFYrhMJlOI4y5+kIteL1CLEnEF4xKcWgtSlR+u4VBlB9yq2nt6aOk1gORBIlJwZnvzoSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAySQt9x; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAySQt9x"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fc84772abso54977107b3.1
        for <cryptsetup@lists.linux.dev>; Fri, 09 Jan 2026 23:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768029021; x=1768633821; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9zhJ/KnJ4nuVYRbgh5GHLh2WMXnDEuhfiTbk330bQs=;
        b=BAySQt9xD70XzfOxuJ26stNn4x5xvmf2EW3UheqO4s2XLNv5Ua78QWm7tbMYcw7oJb
         lJKE8AhbI1anA33onajwsoka01G5fe+FsugbvEi9qJ0AnN7Fmzvguvx+lmwq2dJwXGIU
         5FND2EThre5zOtZ9ZzaBngPm2qb1CvQ64Ed0v881vhWa0lyYVP8r2bbdGGr0uh/3zppa
         FFggFHvYlnzWTRZ5T0hEaJYA+zw+b/ENb6GCC/TyP2YHtIsxR5DlPX/PZYYKf8RixDbz
         c63UzNJbXDiElp89l0Uj7e1j3nYX7ZbfvdbywDF26z2hF7rSNhmsMj8D27lmJg6wg3Bv
         KKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768029021; x=1768633821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b9zhJ/KnJ4nuVYRbgh5GHLh2WMXnDEuhfiTbk330bQs=;
        b=eUHPakF9oqAxq5088eRtmJ9wMB3ISTfGb9RagO7N42q5S0S7VV7wiCxOo98XUzsPcE
         uy8p6+PW214uCFIma+k3ymYd+nSp4van5A+k84bTuB76oqfIw21u8ObVL3fxU8EWwo54
         72sHI1BX6CiObbjStuBUQzhckwVx5FBhj18RhTQR900AZkB3IZUHDdc2WjTxVNNLUOwu
         1qp8dLIujJc6ehjItWayDHss9wkqQC3W2Krh7AZ8k4xjeSHGjWsUjaXez0UMNNpwWR7f
         usa8yfmcZdcfh6avBZBDQhO7v+m5FJnzPh9FXSo77jtKhSiuyRVCOqyerGaRxJiVxjoS
         yaqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlZsmnM7VPgTL5lMLHpWQujnz053iuVOZvMYDsBF0wzQWe2QPPQHv0CNegDTgdao+jozeovBz40oZT@lists.linux.dev
X-Gm-Message-State: AOJu0YwTWv+4vTtV95cxNjGr080VRNVKa/eCvNc15NMYA1p4M4ioyDut
	Qr8BGkaPE9Ub4S2SU8Jjhe6SkxCWD7I2qyW9SIZg6cIdMsOUbjJdn2tF4d95lz4uLo/3VitcPfM
	hakasG6oZkzw9/2LvJOwZoqUwrUhZZm4=
X-Gm-Gg: AY/fxX7EihIq2qmDwIW1N7mh/iFiXcsvWaejHH53+2xYoEmrtocTPXlj/fTw5qrtLsv
	Mle69eNQIIoUPPOpT0QHABJnlWhceUhsz3wbfwmDWHx782C2iTH2XfWAO9OpxYqrXUPtj2SdZnb
	szH9UxPtCDjpS/WG9V+Mnq7UecNPOMR7gi2xATF89lscrphaDpU1SPEQ2BReN3AdoTP1xuJYdmW
	krQF5/7K8LUHnI3l93GS0aZywV2JtAMXD03ihRYnEGp72qSL9mn5PUyLRYMIyWslcO3nG4=
X-Google-Smtp-Source: AGHT+IHIllpd7q/rJGzUdqWFNm+J7R1gHevcr8pWramX8OHrYLw1D8uVZpNDk+w/jhy+xG+xc7kXdV+AyejbU7TMxbs=
X-Received: by 2002:a05:690c:7a1:b0:78c:29aa:2798 with SMTP id
 00721157ae682-790b55d779emr116634487b3.24.1768029020880; Fri, 09 Jan 2026
 23:10:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3f3d871a-6a86-354f-f83d-a871793a4a47@redhat.com>
 <20251211182429.3300562-1-safinaskar@gmail.com> <eb3a9746-83a0-8271-6bd6-867ecfa49aad@redhat.com>
In-Reply-To: <eb3a9746-83a0-8271-6bd6-867ecfa49aad@redhat.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sat, 10 Jan 2026 10:09:45 +0300
X-Gm-Features: AZwV_QgfwDamsOA316OsYVlATivpkfom3nXeSEAkD6V9RwdTqcHdaK1zQEU0IxI
Message-ID: <CAPnZJGAvA+SpkMeOdZx+SZG=qZxSXOThO+Or1bgw=3QqCoEDgw@mail.gmail.com>
Subject: Re: Hard system lock-ups when using encrypted swap and RAM is exhausted
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: adrelanos@whonix.org, arraybolt3@gmail.com, cryptsetup@lists.linux.dev, 
	dm-devel@lists.linux.dev, gmazyland@gmail.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 4:47=E2=80=AFPM Mikulas Patocka <mpatocka@redhat.com=
> wrote:
> Hi
>
> Dm integrity doesn't need to allocate memory when processing I/O requests

Thank you for answer!

Unfortunately, my experience shows the opposite thing.

[[ TL;DR: my experience shows that dm-integrity journaled mode is buggy, an=
d
non-journaled mode is not. I. e. journaled mode seems to allocate memory, a=
nd
this causes temporary (for 4 minutes) lockups (on high specced
machine). Or maybe journaled mode has
some another bug, which causes such lockups. They are not reproducible in
non-journaled mode. ]]

2025-11-06  I started to use swap on dm-integrity on my main system in
journaled mode. My kernel
is Debian's 6.12.48 with some local patches. As always, I had a lot of
browser tabs opened, and
my virtual memory didn't fit into physical memory, i. e. the system
actively used swap.
Note that this is very high-specced machine.
Swap is on SSD. Swap size is 378 Gb. Memory size is 64 Gb.
This is Dell Precision 7780.
CPU is Intel Core i9. 32 cores.
Then somewhere around 2025-12-15 I opened even more browser tabs.
And soon the system started to misbehave. The system froze for 4
minutes in some moment.
Then the system thawed on its own and I saw in journalctl:

Dec 17 10:29:01 comp kernel: INFO: task pipewire:1303 blocked for more
than 120 seconds.
Dec 17 10:29:01 comp kernel:       Not tainted 6.12.48+deb13-amd64 #1
Debian 6.12.48-1
Dec 17 10:29:01 comp kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Dec 17 10:29:01 comp kernel: task:pipewire        state:D stack:0
pid:1303  tgid:1303  ppid:1254   flags:0x00000002
Dec 17 10:29:01 comp kernel: Call Trace:
Dec 17 10:29:01 comp kernel:  <TASK>
Dec 17 10:29:01 comp kernel:  __schedule+0x505/0xc00
Dec 17 10:29:01 comp kernel:  schedule+0x27/0xf0
Dec 17 10:29:01 comp kernel:  io_schedule+0x46/0x70
Dec 17 10:29:01 comp kernel:  folio_wait_bit_common+0x132/0x320

(this repeats for multiple tasks.)

Here is "free -h" output:

|               total        used        free      shared  buff/cache
 available
|Mem:            62Gi        42Gi       2.6Gi       2.9Gi        20Gi
      19Gi
|Swap:          378Gi        87Gi       290Gi

I noticed similar freezes multiple times.

Then 2025-12-24 I changed dm-integrity mode from journaled to
non-journaled. And I rebooted.
(Note that I reboot very rarely. In other words, my system worked
without any reboot from 2025-11-06 to 2025-12-24 with zillions
of browser tabs opened. During this time I never rebooted, but
I sometimes suspended and hibernated.)

Okay, so, 2025-12-24 I changed dm-integrity mode. In fact,
I changed two things:

1) dm-integrity mode
2) I upgraded BIOS from 1.24.1 -> 1.26.0

Everything was the same. No software updated. Same kernel
binary with same patches.

And I didn't do any reboot since then. I. e. I didn't reboot from 2025-12-2=
4
to 2026-01-10 . And during this time I never noticed long freezes. Sometime=
s
my system freezes for 1-3 seconds, but never more than that.

Note that my load is very big, similar to that Dec 17 freeze.

(And I'm totally sure culprit is dm-integrity mode change, not BIOS update.=
)

So, it seems that there is some bug in journaling mode.

But this bug is not important for me. I simply plan to use
non-journaling mode.

Moreover, even if you provide a fix, I likely will not test it,
because this would require me to use my system for
several days with high load. I simply don't want to do this.
I'm sorry about that.

But note that another bug I reported recently, namely
that "dm-integrity + hibernation" bug is important for me.
And I totally will test any patches if needed.

--
Askar Safin
