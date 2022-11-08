Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775A6190
	for <cryptsetup@lists.linux.dev>; Tue,  8 Nov 2022 02:40:54 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id q1so12190013pgl.11
        for <cryptsetup@lists.linux.dev>; Mon, 07 Nov 2022 18:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FiFUJCXC/XsBsWFOMiwr6HA3tDNyeQFH4a3t8q19Q+4=;
        b=ONXYq5LjUM2H8wb/MsP+hw+yXS/zdlcCgb7o+5UlAkcMF4NMAH6g2tVUHwef7Y1J70
         HURZvGvftIhuj3GYVh0nqjZZzEE3HNMwJrEKuYCrRJAGNBjQmdEGaieC1cFWCr/7hbQ4
         PsiIRn4AQyJiI+v9OSg0upAUoyT7PJI59pMERvKALEZJLopFli5rKtZWpiTAEp8aD0Cz
         lVv0hMdZOzMVoyWH/0aaj7YAjLsamdlnuo2IvqHPlASiARMULW+i5oPIbJqxiXM8ZOEe
         F2mdIQCi0XDGfUmklAhkwInGVVmI2/FLxTX+DkR+KDQBPqfVT+EeqHQSx5NY/xUEgLx0
         3GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiFUJCXC/XsBsWFOMiwr6HA3tDNyeQFH4a3t8q19Q+4=;
        b=F+Z9t/1wVlJQpLkCNwL5p33k19rx8AWwY6ln5I4ooU5Fh1H3JGodbRmFiDn9koOxUO
         fYCgjmcGBuRNKvVR5dSUu+J1KehS4Nb64vwauvHU/xqgiUGgZqNaNgKUj/bqi81itBNq
         0kq4XMLK8uDDiH5VxNvBduypmb0SGhF9W0OXO9jF8AQNCF/OexxQd4evPUtVru8S/PW1
         LujWO3TQoHbcsv2jYaDZeoQAnrHw86c1iGHlBeLKHOal+oRijvSBqebkYXqqQshwJpEt
         iEEoOmUhgqyRUtNDgaqKgL9tZE0IYcZC+rhyAwY6Alb+aFGuzUpG9sz/OtnGQR/Rupt5
         i/ew==
X-Gm-Message-State: ACrzQf0+ghDTFnIXAJyMSBwQVA7ecEQ+NA0fh/C20bEZHr115IGsEjPI
	UjvXhkY+7vUG2PYL22bmoboziITx+wLuWl1ColYWt9VX
X-Google-Smtp-Source: AMsMyM7pF+7o+rTGbjzwZOobOh8WnQBymKXIy/rvIBzhOu8I0JPp9asntRX0vjPxiX7cCU396RC5nNC+tzSI8eoKYIk=
X-Received: by 2002:a62:d412:0:b0:56c:6f25:8b12 with SMTP id
 a18-20020a62d412000000b0056c6f258b12mr53643546pfh.60.1667875253884; Mon, 07
 Nov 2022 18:40:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Philippe Cerfon <philcerf@gmail.com>
Date: Tue, 8 Nov 2022 03:40:42 +0100
Message-ID: <CAN+za=M8rBabbD841n=L55bP9KdCjiPDAAgGDtoUM6ydje0few@mail.gmail.com>
Subject: security of re-encryption
To: cryptsetup@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey list.

I've just wondered whether there are any security implications of
re-encrypting a LUKS volume?

I mean if the payload data stays mostly or exactly the same and an
attacker would be able to make an image (of the encrypted volume)
before and after, could that help for statistical attacks in order to
get the key?


Thanks,
Philippe.
