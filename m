Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BCF1362
	for <cryptsetup@lists.linux.dev>; Sun, 29 Jan 2023 08:36:35 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id m2so23571592ejb.8
        for <cryptsetup@lists.linux.dev>; Sun, 29 Jan 2023 00:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3JSrKbcoMpev9kBuZCJwZsRz2zgVl/gj1ER1u3oeUI=;
        b=U/3/BzLaCksdEaHSFt4JizuqD9O8NdV38f4gw93RgReZ8w27HvMFcXrDkhI4nkUnaA
         3JSLq/+WI/0b+Yj+MKfVTwS3NNmlxzHSmR2RrlAPbHuA1kMJaQICH4PUF1K1jQHNunS0
         TkC3LW2Sh/wH5STxAE3HMXflpmCme+McyjoDWMBqvHtdUidXNBVA2/RYOyLczrMfcCBH
         3HiVhzknheAcZSqkBoXyD3vL5oFJgi8U6G/YSUdjJc2h8Te8c/B7tDKGsN6UCQYfiM98
         ThChnA7uI89suXtM5wPJnuoBNv6nhrgMo6PDDNwd0CSswavpMqa0EgbM9hYmSjhaAjtG
         3Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3JSrKbcoMpev9kBuZCJwZsRz2zgVl/gj1ER1u3oeUI=;
        b=hoLTqq3L/leQQ9oDw3rqsxZHk4FIK3LVmPC5eLwNjPIQp3ml9Anx12S/nhWAIu+3aj
         TlvNK0GyuZHewgEeFU8QITh0O8Yle+eMh21PMnTeNTFU29PH3HmiwO3mNt+hnZE8xVzA
         pTNWfnt3kpQrgMVdL+7AZWcp/8ZfjOfxXyXsQ3LsT7b8D1Mhdxb8CpIgqOphmKt3RpgX
         m4xPpxg0nZpXDWe9l7eiMsul/TKfW1vONiooLRQYQ14H7AL+4f4OhkD7ryUOLVviWBe/
         WnQOxtREoSDNKYule61z9rTVqJHxCf5mPHU/stXTOf4FW0hGMNrIgddWfrUMHgWCXQ+W
         PviQ==
X-Gm-Message-State: AFqh2kob7rhhkpE7edaHrVPom8PsXunfB+JaJdA4UDt++LRQwi9+aV2e
	rqKmQ3/iizvqZT7aFzEEJGI=
X-Google-Smtp-Source: AMrXdXs0cPswYiPeNx5NvRei2AgpyAQXGJ+HIH0rzeYnglC47bOdW93Wfwitcq6DalDPun3ROFzpgw==
X-Received: by 2002:a17:907:d007:b0:829:59d5:e661 with SMTP id va7-20020a170907d00700b0082959d5e661mr49115648ejc.29.1674981393479;
        Sun, 29 Jan 2023 00:36:33 -0800 (PST)
Received: from [192.168.8.100] (37-48-24-36.nat.epc.tmcz.cz. [37.48.24.36])
        by smtp.gmail.com with ESMTPSA id hz17-20020a1709072cf100b0087879f8c65asm4658912ejc.89.2023.01.29.00.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 00:36:32 -0800 (PST)
Message-ID: <32a13a36-e2da-ec8d-5e21-8eb267272c69@gmail.com>
Date: Sun, 29 Jan 2023 09:36:30 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] check whether the forced iteration count is out of range
Content-Language: en-US
To: "wangzhiqiang (Q)" <wangzhiqiang95@huawei.com>, cryptsetup@lists.linux.dev
Cc: liuzhiqiang26@huawei.com, linfeilong@huawei.com, lijinlin3@huawei.com
References: <38f0c2c1-0391-9ade-37c4-9c60427a20bf@huawei.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <38f0c2c1-0391-9ade-37c4-9c60427a20bf@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I think you are patching some old version - manuals are now maintained
in adoc format (*.8 files are generated) and that min./max cost mmessage is there,
see MINIMAL AND MAXIMAL PBKDF COSTS section in main branch.

On 1/29/23 04:06, wangzhiqiang (Q) wrote:
>  From 303dee7999ea8297dad2961020d96710ee87714b Mon Sep 17 00:00:00 2001
> From: wangzhiqiang <wangzhiqiang95@huawei.com>
> Date: Sat, 28 Jan 2023 15:09:44 +0800
> Subject: [PATCH] check whether the forced iteration count is out of range
> 
> 1. struct crypt_pbkdf_type has a uint32_t variable iterations, but
>     PKCS5_PBKDF2_HMAC interface of openssl accept int variable, so
>     return fail when it greater than INT_MAX.

yes, but UINT32 limits should be be already checked, see below

> 
> 2. add boundary check for the iterations counts.

CLI arguments are checked in src/tools_parse_arg_value.c, see how
CRYPT_ARG_UINT32 is processed there. It just do not print nice
message but only "invalid value" (and that is enough here).

The PBKDF2 arguments for libcryptsetup API are checked in
lib/utils_pbkdf.c.

Do you have some example, where this is not applied and value overflows?
If so, it should be fixed in these places.

For the OpenSSL - this is a nice find that it used int in PKCS5_PBKDF2_HMAC()
but AFAIK new OSSL_PARAMS OpenSSL3 uses *unsigned* int..
And checking providers PBKDF2 implementation in OpenSSL3 I even see they
use uint64 when parsing params.

I'll ask OpenSSL - this iteration count should be clearly treated as unsigned.
(Cryptsetup has different crypto backends, it must behave the same regarding maximums.)

Please, if you can, use main git branch, create an issue or merge request in cryptsetup project,
discussion about patches is much easier there.

Thanks,
Milan


> 
> Signed-off-by: wangzhiqiang <wangzhiqiang95@huawei.com>
> ---
>   lib/crypto_backend/crypto_openssl.c |  2 +-
>   lib/luks2/luks2_keyslot_luks2.c     |  1 +
>   man/cryptsetup.8                    | 14 ++++++++++++++
>   src/cryptsetup.c                    |  5 +++++
>   4 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/crypto_backend/crypto_openssl.c b/lib/crypto_backend/crypto_openssl.c
> index 2edec7b..d76d89f 100644
> --- a/lib/crypto_backend/crypto_openssl.c
> +++ b/lib/crypto_backend/crypto_openssl.c
> @@ -329,7 +329,7 @@ int crypt_pbkdf(const char *kdf, const char *hash,
>   {
>          const EVP_MD *hash_id;
> 
> -       if (!kdf)
> +       if (!kdf || iterations > INT_MAX)
>                  return -EINVAL;
> 
>          if (!strcmp(kdf, "pbkdf2")) {
> diff --git a/lib/luks2/luks2_keyslot_luks2.c b/lib/luks2/luks2_keyslot_luks2.c
> index 156f0c1..fe5f1ed 100644
> --- a/lib/luks2/luks2_keyslot_luks2.c
> +++ b/lib/luks2/luks2_keyslot_luks2.c
> @@ -254,6 +254,7 @@ static int luks2_keyslot_set_key(struct crypt_device *cd,
>                          pbkdf.iterations, pbkdf.max_memory_kb,
>                          pbkdf.parallel_threads);
>          if (r < 0) {
> +               log_err(cd, "Invalid parameter.");
>                  crypt_free_volume_key(derived_key);
>                  return r;
>          }
> diff --git a/man/cryptsetup.8 b/man/cryptsetup.8
> index bc3fff6..f6f1fe0 100644
> --- a/man/cryptsetup.8
> +++ b/man/cryptsetup.8
> @@ -1096,6 +1096,20 @@ Note it can cause extremely long unlocking time. Use only is specified
>   cases, for example, if you know that the formatted device will
>   be used on some small embedded system.
>   In this case, the LUKS PBKDF2 digest will be set to the minimum iteration count.
> +
> +\fBMINIMAL AND MAXIMAL PBKDF COSTS:\fR
> +For \fBPBKDF2\fR, the minimum iteration count is 1000 and
> +maximum is 4294967295 (maximum for 32bit unsigned integer),
> +except openssl, which supports only 2147483647 (maximum for 32bit integer).
> +Memory and parallel costs are unused for PBKDF2.
> +For \fBArgon2i\fR and \fBArgon2id\fR, minimum iteration count (CPU cost) is 4 and
> +maximum is 4294967295 (maximum for 32bit unsigned integer).
> +Minimum memory cost is 32 KiB and maximum is 4 GiB. (Limited by addresable
> +memory on some CPU platforms.)
> +If the memory cost parameter is benchmarked (not specified by a parameter)
> +it is always in range from 64 MiB to 1 GiB.
> +The parallel cost minimum is 1 and maximum 4 (if enough CPUs cores are available,
> +otherwise it is decreased).
>   .TP
>   .B "\-\-iter\-time, \-i <number of milliseconds>"
>   The number of milliseconds to spend with PBKDF passphrase processing.
> diff --git a/src/cryptsetup.c b/src/cryptsetup.c
> index a0dc14b..decb39a 100644
> --- a/src/cryptsetup.c
> +++ b/src/cryptsetup.c
> @@ -3921,6 +3921,11 @@ int main(int argc, const char **argv)
>                  _("PBKDF forced iterations cannot be combined with iteration time option."),
>                  poptGetInvocationName(popt_context));
> 
> +       if (opt_pbkdf_iterations < 0 || opt_pbkdf_iterations > UINT32_MAX)
> +               usage(popt_context, EXIT_FAILURE,
> +                _("the minimum iteration count is 1000 and maximum is 4294967295."),
> +                poptGetInvocationName(popt_context));
> +
>          if (opt_sector_size && strcmp(aname, "reencrypt") && strcmp(aname, "luksFormat") &&
>              (strcmp(aname, "open") || strcmp_or_null(opt_type, "plain")))
>                  usage(popt_context, EXIT_FAILURE,
> --
> 2.27.0
> 
