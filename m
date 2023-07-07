Received: from mail-200165.simplelogin.co (mail-200165.simplelogin.co [176.119.200.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61520C8E6
	for <cryptsetup@lists.linux.dev>; Fri,  7 Jul 2023 14:04:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1688738689;
	cv=none; b=KGfF5cZEslNCnhtQ1FBzWNi6MQoeu+Z4xcJINNlMZSwUjKiAi/CkdGVThWE2EmuoED6wifDHprXdXFgAfvD6/15UFnVZp9qdaKeORdQTKKPjeK3qCvtcrrmjomj9YFteRVhCNh1Hz03EfLfXuYJqtWgQFhrUOWOIoPRWZ4rv4P+JPFymHnnTBZz5B1FYUJDDGLIawtha5oRB1I75/x0UadIHbvQiedy4YR4mXNZgwkMy9wD2BOLOjCH6SEuizfPiz4bvPhPfD6xwXpMyYJ6blBFqkE3xvlVBaGHzf8LXVfZLe/4P00SyswpUsOPy4uJVbVXYQQXguzaC0PChZa/6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1688738689; c=relaxed/simple;
	bh=/RBL6O/Klbdnd/YWJFEo5EqeGIqNIG+n3vyIVSoRTjw=;
	h=DKIM-Signature:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:To:Message-ID:X-SimpleLogin-Type:
	 X-SimpleLogin-EmailLog-ID:X-SimpleLogin-Want-Signing; b=KEu0/8oQihh3TcTOsf1Q3m/9JCYRh/SjY6CSeVt7Shl6PwcqCz5/VZdLEO8p3gsEAgbkFbHNsUFsLNR9op+GAYiibZbDOowQJFhJHkAtg5uFNdmc6jIkGGxz7bE9leF/KD1ZlAW5Ueox/SurGfpTT7rAIFQxi6piEi1lCBuXAkLTbdvBEf3sWCQ0E/cCu2gqEjpwk5E3CdUiX4MdkekyYvxjYY2A4RW/zIYOmdHHgK/Ah3e0dHbtFe9xAzwEME5baB1kvmLVgr5StZY14WibHmgVxthZ4ree/aCiD+q6mCy2FNVDYT7onHzs5lHFta/PbTMMraawUEThQdC9hYElIQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aleeas.com; s=dkim;
	t=1688738689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/RBL6O/Klbdnd/YWJFEo5EqeGIqNIG+n3vyIVSoRTjw=;
	b=WtiUjr33wsdXZUk40t1iM3ihWux5javt8Eef3x/sNNGKNQdlpKnzi6G9/K9i6Sq6jbu6NW
	1vCvpqQ7GanOiXfjpXrfk1lQsItyszepZLL9PQyA3h9W4951w/qJgWxi+kpafkNCcuy1Uh
	FmwfNPEYiNtzVWQAHOeipeoyITha+qE=
Date: Fri, 07 Jul 2023 14:04:40 +0000
Subject: When do any header interactions (read/write) occur?
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Darek Hisc <darek.hisc@aleeas.com>
To: cryptsetup@lists.linux.dev
Message-ID: <168873868918.7.12128827004291450369.150072076@aleeas.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 150072076
X-SimpleLogin-Want-Signing: yes

Hi

Do I understand correctly that the header is only needed when booting the O=
S + executing any cryptsetup commands?
If I have a detached header on a USB flashdrive, can I remove this flashdri=
ve from the computer during routine work on the computer?

Best Regards!


