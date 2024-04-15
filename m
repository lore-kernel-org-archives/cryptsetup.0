Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833B43D3B9
	for <cryptsetup@lists.linux.dev>; Mon, 15 Apr 2024 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713171000; cv=none; b=nMqSixHmBY3kBM5E0OeHxLVUq+J8QZ56Y26wwvBb+or/BQeme2aKkcN65/AQJHZZ+a+/1WGKa7wnwUnoJEdwq8Ufy5DVhTEQMbM4CDHcTZRTtT2znyzbMFW1vYmr+v3Jq1vz71D+dLLQ36Tm63H3YVV1keycF4rItdscSPTDonk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713171000; c=relaxed/simple;
	bh=q/oyaADR6y1Yq6DCRTNBX42MV7N6DcDfF1sT7CgSabA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=XRqRzrhWjgunBnQDtwGmP6oxTdRmS+5q7XnEJocTrlxeE+NUMphzR9AkMnGDSCAnyikYY6hnFfHPBleDja8xsRhhPVB3H95nqW4E6x54+9gZFGkdb8y95uyuBrjyuEm/EZbP3gVBUDsoNFyzZH9IK2Yz1/KKf8gzjZqkcRn5bNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDormi9e; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDormi9e"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5aa28cde736so1706577eaf.1
        for <cryptsetup@lists.linux.dev>; Mon, 15 Apr 2024 01:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713170998; x=1713775798; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VAWJsbeIDSPygX7YaLR6isLPd2p07JOTl8DsjelWL0A=;
        b=SDormi9eqGEy/v3lt7X2jH+nmCpFjXcGOpkZagBXBomJX39fyYpDDX7Rwio9GtWmJ8
         c2k46svsI1rngfMuHA2yPEjvsy3o8JFOFvZzQQul3nomvsHDkzpfM93OcsXU/lli5mue
         3EuGxTm0cuKyErTA1pyLG5QbycqUWRjf5/SQzkuCBAgTuFmOmW0jUYMhmr/lDUIAhWnW
         auYDhMjJF38PGWPi7fwVYdouC38SI78casInCvxHxzG89oWdNvyvOx2rraDOsxi2aa2J
         K2QJY/tcBQRIDomaWKUE48OwT7EhlRrL4LiQfBjXKaGPsYSFUZlLgvpvCgdKfraryI8G
         UOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713170998; x=1713775798;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VAWJsbeIDSPygX7YaLR6isLPd2p07JOTl8DsjelWL0A=;
        b=pvlEw2y0l1m2DC9muQjVdQYNvIuw5bu3BdoluAmkzigQ+BWfKyc2H8/nOcMizJC0V8
         DaUP5u499BwfCCgHUJNUJTgQBQInPihIG6ltQ+i1jYBcNgXPnRx2+lX18AfhvjYqqVyd
         sCoTrgfAIrW/hQLYO6ThK82AW6VUSLSOWgA7DOgxfTvtopEBMcAo8pBUwxBE6NcXQqCp
         ZvNkptXk7svRvc6GNxdOu+rnwnoCjry1onZBI+h8mp8EluTCPDm+yjeBR2pR+49+subU
         BTSyMwsDKR1tgp5izidhP5GuUXiqc8rXCpLBmGkF8pNbIAkmhAvs8IWSzMAyR1/MycHk
         Z+0Q==
X-Gm-Message-State: AOJu0YyWJgyWsIf00m95zGhWqVvQ5c82op7uM/cLBkjIMUFK4PyzshSt
	tZFwTk8GLuZA4BOgZVvp4+PX9rUJ+NupsYGWrV0KvHBkEhEe3YM26YGEo/KUN16FdfYgKC3vAjG
	sP/+qMJebnSC9DvooSvfI3qEI6shI1vL+
X-Google-Smtp-Source: AGHT+IGloK/L1fd3kJth4sNL//X6A/wvOmR8ORn8weun9i5V2Bq/NisgBVeeWBapt7pyloCjQih9xnnvGzh0Wk7DxBo=
X-Received: by 2002:a05:6870:1019:b0:22e:a61f:d59b with SMTP id
 25-20020a056870101900b0022ea61fd59bmr8884409oai.33.1713170998466; Mon, 15 Apr
 2024 01:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: dE <de.techno@gmail.com>
Date: Mon, 15 Apr 2024 14:19:47 +0530
Message-ID: <CADofXPDMsOh_wWDM52bVxC4-eU6VgBSoHNF=jSF1h05njUT5Mg@mail.gmail.com>
Subject: Decrypting only uses 2 threads.
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi.
    I'm trying to encrypt some block devices and trying to use a
cipher and mode which is multithreaded. I'm trying out
aes-ctr-essiv:sha256 to test multithreading, but have also tried
aes-xts-essiv:sha256 with the same result.

The encryption is definitely multithread (massively), but while
reading from the encrypted block device, I see that only 2 threads are
being used. As a result when the CPU is throttled (deliberately), I
see a drop in throughput while increased CPU utilization only in 2
cores.
The following commands were used to setup the encryption --

cryptsetup -y -d - -c aes-ctr-essiv:sha256 --key-size 256 create disk1 /dev/sda

Is there anything I can do to increase concurrency while decrypting?
