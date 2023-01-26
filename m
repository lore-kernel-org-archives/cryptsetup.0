Received: from mx0a-00445d01.pphosted.com (mx0a-00445d01.pphosted.com [205.220.171.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89025384
	for <cryptsetup@lists.linux.dev>; Thu, 26 Jan 2023 19:42:49 +0000 (UTC)
Received: from pps.filterd (m0303598.ppops.net [127.0.0.1])
	by mx0a-00445d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QCfbM1003830
	for <cryptsetup@lists.linux.dev>; Thu, 26 Jan 2023 14:42:49 -0500
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-00445d01.pphosted.com (PPS) with ESMTPS id 3n917wavhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <cryptsetup@lists.linux.dev>; Thu, 26 Jan 2023 14:42:49 -0500
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-482d3bf0266so31494987b3.3
        for <cryptsetup@lists.linux.dev>; Thu, 26 Jan 2023 11:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bostondynamics.com; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zs4zDYGhWIPpvRjki8ak9WBo3snBc4WIBlvkcsVhGr0=;
        b=cCNR1ubDVtxS0e145ifmmmwJBmJNcGpkkHASrbma7G44I3MHtx+Fiv31pDr9y6vyWB
         rSqOvrBF33B/51NrRmTeMSh+l95Mrh50kV77T8XvZ9OtNWGh2YuAWCdg5vBcJxmWQsH8
         Xy/OXGq5LqazFeTuXz0QPCJF+AyMbnEf/vqaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zs4zDYGhWIPpvRjki8ak9WBo3snBc4WIBlvkcsVhGr0=;
        b=ODiU+oHbxUpf3dcg3Nkp/a2qWAdTcYdYerlNWeZGuB7PnbR6R0VYumgjgEYhqzn4Ks
         ci+EZdImFu7+bHfeO8MGv6Bi50/Xr1HNU65WSwFhYKVuv9T3fGzxemqeIWrPolocky81
         uiI7lJ0Em92Mryhvacpwg3dFNwLvdLhqcshxLBuF55NsnP7Aem3z95TRUO1DOQIkuyUz
         6aRRs3EPITtM1N0vnwgBtY7eu7lNMumsXe/+rI0bjYRAMZKy42wGbv1O8Gz8WLoGi08Z
         CG2CMEbj5nzMTUBuLIK9DAIumbP8s7ENv/y0KUJSTxoZz+cBgKnG6SgJUCwdTEp9N3ZG
         uysA==
X-Gm-Message-State: AFqh2krPZS7Y8ZetQTes0Gy7jQVgDeu/nr/CvrWKq9qdMsczswrCmBJK
	kod80JaTH1XWsmrs6sIejG0Hz4F+x20JRdW/Qx2vNd+wFvompqxIoynOEC8dLqDEmBMOnasR3GB
	U8syDZEmxVCO4acDb8TIFmgZKhJDNj2BMHxwvsQ==
X-Received: by 2002:a25:cd83:0:b0:7fd:9249:cb94 with SMTP id d125-20020a25cd83000000b007fd9249cb94mr2992624ybf.242.1674762167595;
        Thu, 26 Jan 2023 11:42:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvnHidHCKNuRdfnOQ91BLcosef/Vg8fZ0R4O9OHOrqmIiAW9AVz3UYsGizmFMaFAIik3mC/whYWoYOBNpcgm+k=
X-Received: by 2002:a25:cd83:0:b0:7fd:9249:cb94 with SMTP id
 d125-20020a25cd83000000b007fd9249cb94mr2992620ybf.242.1674762167113; Thu, 26
 Jan 2023 11:42:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Robel Daniel <rdaniel@bostondynamics.com>
Date: Thu, 26 Jan 2023 14:42:36 -0500
Message-ID: <CAJm+cqpX7EU3KwS1RsRtGw=Ny9Ar8ygkvGzAT0_21pbGVzNshw@mail.gmail.com>
Subject: Question Regarding Decrypt Screen
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: u9yXCLXXzqnFI1OWe-U0Suom0p_GZqd8
X-Proofpoint-ORIG-GUID: u9yXCLXXzqnFI1OWe-U0Suom0p_GZqd8

Hi CryptSetup Dev Team,

I had a question that I was looking to get some insight into. On
Ubuntu machines of any version (18.04, 20.4, 22.04), it's quite well
known that after powering on the machine, and reaching the Decrypt
screen (the screen where the user has to enter their decryption key to
unlock the disk), the Caps Lock button doesn't illuminate on most, if
not all, machine models. Is there a specific reason as to why that is
the case? Is there a solution that exists?

Looking forward to your response, thank you.

Regards,

Robel Daniel (he/him)
