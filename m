Received: from mail-200165.simplelogin.co (mail-200165.simplelogin.co [176.119.200.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512261851
	for <cryptsetup@lists.linux.dev>; Sat,  8 Jul 2023 17:17:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1688836618;
	cv=none; b=gj5BvTJw2BiwDcXRL9LqKuPuSu0rkUDU/nfQMNZtbIMUqhFn8OHk5+0wOaH3tnB4RYwB8118zjuCylQNFIzw+OXsoqLg2ZGnBon5nSRpokA68v85pzmIcNgP8//VCPbQmQsxm7FZOsmX8DUKH/mnJdYes3lFmHwFC11ZY2OUxk1YSj74uY7Ga0ash3cEBlHf/wTirBp55Eq8Y9hkKeHl5VQIy6dAzSkAJqeB6Wv6RiGXbZDeX0nSqoONlXxg58+7ibo0geQQ4G/cUqMfzdlgxQmVImWCfRLDcF0SkZIJfLD/abpPyMueTdU2D5Xd/BXYlQl5XqcPp9wjNJmSdQQiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1688836618; c=relaxed/simple;
	bh=uGPlWrCR+5TpLRR9LsCEd4yaTIQmYBN4TLzfjyVMwJw=;
	h=DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:To:Message-ID:References:
	 X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing; b=aLwrZGL0+0xVLHWC6XyAjONP80v2wgmHqkCn6r65Pj7Ps3bKkjuABu7zG9ijm3SSx1r2zVBjHb1qhfUrDcOxfOAri02xhNzCo5GdhctgRWWC/xUTIuzgPRdVovpDWfwN8F7rl1/aBwdE1A1V3Z8JHHfOiJkn6C/yqBzw9tdWT7TzgrLUaa82cpH9bcw4DBcg9Mei7h4U7gqIh0r69+W7F+lVxVsFRKEdpjPVYqLAUdur3Mk4PJ42ora2ALoo2eLbieRoaRffRpYZT8dVrznpPC/spBVBmRSkYcMoXxixJuuOEqWaEGBh8D8R7MjNJh5AqKvSioCXOkNYDxst11wHzg==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aleeas.com; s=dkim;
	t=1688836618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uGPlWrCR+5TpLRR9LsCEd4yaTIQmYBN4TLzfjyVMwJw=;
	b=Es1WNVTkpR6kNRoMdjv1EsO0Ngyuw3k0ajn0bCO+TXhG+Dyw2trHZlo9j01O+sCnGyFJjy
	rvzGb6PlWX6PlK9Am9UAolKVjak7u6Z0b8Faky4ic7Tzsr0Qu/TLp+1xlSfC7Hl62Cco9b
	V+ujMqednurrUS3n5gRkzFnvlEPrs/w=
Date: Sat, 08 Jul 2023 17:16:46 +0000
Subject: Re: When do any header interactions (read/write) occur?
In-Reply-To: <9e13a2a4-0173-453b-c7dc-67e83dc63c6b@gmail.com>
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
Message-ID: <168883661797.7.12558822544151419734.150496730@aleeas.com>
References: <168873868918.7.12128827004291450369.150072076@aleeas.com>
 <9e13a2a4-0173-453b-c7dc-67e83dc63c6b@gmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 150496730
X-SimpleLogin-Want-Signing: yes


Thanks for the info and for all your work on this project guys!

Cheers!


