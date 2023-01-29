Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B226BD0D
	for <cryptsetup@lists.linux.dev>; Sun, 29 Jan 2023 03:06:25 +0000 (UTC)
Received: from dggpemm500014.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4P4GPH5s7Vz16MjK
	for <cryptsetup@lists.linux.dev>; Sun, 29 Jan 2023 11:04:19 +0800 (CST)
Received: from [10.174.178.78] (10.174.178.78) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sun, 29 Jan 2023 11:06:17 +0800
Message-ID: <38f0c2c1-0391-9ade-37c4-9c60427a20bf@huawei.com>
Date: Sun, 29 Jan 2023 11:06:16 +0800
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
To: <cryptsetup@lists.linux.dev>
CC: <liuzhiqiang26@huawei.com>, <linfeilong@huawei.com>,
	<lijinlin3@huawei.com>
From: "wangzhiqiang (Q)" <wangzhiqiang95@huawei.com>
Subject: [PATCH] check whether the forced iteration count is out of range
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.78]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected

From 303dee7999ea8297dad2961020d96710ee87714b Mon Sep 17 00:00:00 2001
From: wangzhiqiang <wangzhiqiang95@huawei.com>
Date: Sat, 28 Jan 2023 15:09:44 +0800
Subject: [PATCH] check whether the forced iteration count is out of range

1. struct crypt_pbkdf_type has a uint32_t variable iterations, but
   PKCS5_PBKDF2_HMAC interface of openssl accept int variable, so
   return fail when it greater than INT_MAX.

2. add boundary check for the iterations counts.

Signed-off-by: wangzhiqiang <wangzhiqiang95@huawei.com>
---
 lib/crypto_backend/crypto_openssl.c |  2 +-
 lib/luks2/luks2_keyslot_luks2.c     |  1 +
 man/cryptsetup.8                    | 14 ++++++++++++++
 src/cryptsetup.c                    |  5 +++++
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/lib/crypto_backend/crypto_openssl.c b/lib/crypto_backend/crypto_openssl.c
index 2edec7b..d76d89f 100644
--- a/lib/crypto_backend/crypto_openssl.c
+++ b/lib/crypto_backend/crypto_openssl.c
@@ -329,7 +329,7 @@ int crypt_pbkdf(const char *kdf, const char *hash,
 {
        const EVP_MD *hash_id;

-       if (!kdf)
+       if (!kdf || iterations > INT_MAX)
                return -EINVAL;

        if (!strcmp(kdf, "pbkdf2")) {
diff --git a/lib/luks2/luks2_keyslot_luks2.c b/lib/luks2/luks2_keyslot_luks2.c
index 156f0c1..fe5f1ed 100644
--- a/lib/luks2/luks2_keyslot_luks2.c
+++ b/lib/luks2/luks2_keyslot_luks2.c
@@ -254,6 +254,7 @@ static int luks2_keyslot_set_key(struct crypt_device *cd,
                        pbkdf.iterations, pbkdf.max_memory_kb,
                        pbkdf.parallel_threads);
        if (r < 0) {
+               log_err(cd, "Invalid parameter.");
                crypt_free_volume_key(derived_key);
                return r;
        }
diff --git a/man/cryptsetup.8 b/man/cryptsetup.8
index bc3fff6..f6f1fe0 100644
--- a/man/cryptsetup.8
+++ b/man/cryptsetup.8
@@ -1096,6 +1096,20 @@ Note it can cause extremely long unlocking time. Use only is specified
 cases, for example, if you know that the formatted device will
 be used on some small embedded system.
 In this case, the LUKS PBKDF2 digest will be set to the minimum iteration count.
+
+\fBMINIMAL AND MAXIMAL PBKDF COSTS:\fR
+For \fBPBKDF2\fR, the minimum iteration count is 1000 and
+maximum is 4294967295 (maximum for 32bit unsigned integer),
+except openssl, which supports only 2147483647 (maximum for 32bit integer).
+Memory and parallel costs are unused for PBKDF2.
+For \fBArgon2i\fR and \fBArgon2id\fR, minimum iteration count (CPU cost) is 4 and
+maximum is 4294967295 (maximum for 32bit unsigned integer).
+Minimum memory cost is 32 KiB and maximum is 4 GiB. (Limited by addresable
+memory on some CPU platforms.)
+If the memory cost parameter is benchmarked (not specified by a parameter)
+it is always in range from 64 MiB to 1 GiB.
+The parallel cost minimum is 1 and maximum 4 (if enough CPUs cores are available,
+otherwise it is decreased).
 .TP
 .B "\-\-iter\-time, \-i <number of milliseconds>"
 The number of milliseconds to spend with PBKDF passphrase processing.
diff --git a/src/cryptsetup.c b/src/cryptsetup.c
index a0dc14b..decb39a 100644
--- a/src/cryptsetup.c
+++ b/src/cryptsetup.c
@@ -3921,6 +3921,11 @@ int main(int argc, const char **argv)
                _("PBKDF forced iterations cannot be combined with iteration time option."),
                poptGetInvocationName(popt_context));

+       if (opt_pbkdf_iterations < 0 || opt_pbkdf_iterations > UINT32_MAX)
+               usage(popt_context, EXIT_FAILURE,
+                _("the minimum iteration count is 1000 and maximum is 4294967295."),
+                poptGetInvocationName(popt_context));
+
        if (opt_sector_size && strcmp(aname, "reencrypt") && strcmp(aname, "luksFormat") &&
            (strcmp(aname, "open") || strcmp_or_null(opt_type, "plain")))
                usage(popt_context, EXIT_FAILURE,
--
2.27.0
