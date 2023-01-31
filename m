Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB32A93D
	for <cryptsetup@lists.linux.dev>; Tue, 31 Jan 2023 19:50:36 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id lu11so7592682ejb.3
        for <cryptsetup@lists.linux.dev>; Tue, 31 Jan 2023 11:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ATmL08aueWdOynNf3DHE/2jL/MxgGQ2piY7CNFEEK0=;
        b=GcFwGeLsAjim9HF8reo+S6q10BSNhNM6RgpmJho87sTciin20N1h7NMlORIhSDJ3+O
         hDYo1WwG/QWP6fPTUcvkKS8bWoBrmUUz7Kg0ooCZQ+sOZVyAVFvQG178GM7G8j5jtCfm
         oozAGI4hps+BQcHi9r4YyjBe4f/53PYqRy25lE51ttzqkBZAJUOykYix37osmWPXD+qQ
         3SHD8yOkzvxYUDUwPjwE73CclbPFXWM6e40knJZOBejACxL6JqXXBjEnRUH0tt8RI9HR
         zJc7i1uWlQutsfQteYTLnSOj8asYUTXfp2xY1Uw0NmXn0lcPmjvhFniyGi68tm6Ypu19
         vUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ATmL08aueWdOynNf3DHE/2jL/MxgGQ2piY7CNFEEK0=;
        b=dNQTG8BgrZW7rEwPJEjuS+MbzlIGWvGEmHa2w2l/QFusuCXuhXKri1ozQHJGEuoNG4
         LaC+4EUrkKPTnrYmtlMfsy9xkf+B1cxFybpFa/NFTyMPvEH+ZvfRTL/fU4qDAZEgLuf+
         TRfoUMZOylxxbWkOYZp51HewIIeECQ7g5ZY+AuHUAHSB2MWIAe66o71BcVExW33q4/9P
         n/IMogZdMLxbtoZX8PFZGSIkRn9Enlp2Y8N4SwQvBbJ/R6ZrqR1Z3QUahiBVMeZ2/87X
         jDGhaMKeg5GMsY6p33SZ4wmSMamIRyZrkU+Xilo/kOKQ6W1xgWF0vIXIyn91KaLDhVM0
         YdDg==
X-Gm-Message-State: AO0yUKUE5u6vQvdlxR2ZNYB7m7J2ebucAeTOxd5LNhULJWc1iDLJ7Aa1
	HOG0HT16W+LK7iGpQ35b5/c=
X-Google-Smtp-Source: AK7set8ArLo6az+Wiy/c0MZtgQgqEEMjptsUUtOKvt550Z5zuKEgvLOuuPjSOML8lDW1FQ5XDAO1+Q==
X-Received: by 2002:a17:907:7ea2:b0:88d:72c0:611 with SMTP id qb34-20020a1709077ea200b0088d72c00611mr619038ejc.3.1675194634410;
        Tue, 31 Jan 2023 11:50:34 -0800 (PST)
Received: from [192.168.2.30] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id jl15-20020a17090775cf00b00878812a8d14sm8195397ejc.85.2023.01.31.11.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 11:50:33 -0800 (PST)
Message-ID: <da4dc6ca-1dea-8307-7dac-8d51169789f4@gmail.com>
Date: Tue, 31 Jan 2023 20:50:31 +0100
Precedence: bulk
X-Mailing-List: cryptsetup@lists.linux.dev
List-Id: <cryptsetup.lists.linux.dev>
List-Subscribe: <mailto:cryptsetup+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:cryptsetup+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] check whether the forced iteration count is out of
 range
Content-Language: en-US
To: "wangzhiqiang (Q)" <wangzhiqiang95@huawei.com>, cryptsetup@lists.linux.dev
Cc: liuzhiqiang26@huawei.com, linfeilong@huawei.com, lijinlin3@huawei.com
References: <38f0c2c1-0391-9ade-37c4-9c60427a20bf@huawei.com>
 <32a13a36-e2da-ec8d-5e21-8eb267272c69@gmail.com>
 <58e45d98-4ffb-4ff9-8d02-0b9590fe931b@huawei.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <58e45d98-4ffb-4ff9-8d02-0b9590fe931b@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I tried to fix it a little bit differently,
please see https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/481

Does this solve the issue for you?

This is really misconception in older OpenSSL API, so I limit it only there,
new version supports unsigned iteration count (as other libraries).


Thanks for the report!

Milan

On 1/29/23 13:59, wangzhiqiang (Q) wrote:
> 在 2023/1/29 16:36, Milan Broz 写道:
>> Hi,
>>
>> I think you are patching some old version - manuals are now maintained
>> in adoc format (*.8 files are generated) and that min./max cost mmessage is there,
>> see MINIMAL AND MAXIMAL PBKDF COSTS section in main branch.
> 
> Yes. I use the old version(cryptsetup-2.3.3) and openssl version less than 3.
> MINIMAL AND MAXIMAL PBKDF COSTS section in main branch is well.
>>
>> On 1/29/23 04:06, wangzhiqiang (Q) wrote:
>>>   From 303dee7999ea8297dad2961020d96710ee87714b Mon Sep 17 00:00:00 2001
>>> From: wangzhiqiang <wangzhiqiang95@huawei.com>
>>> Date: Sat, 28 Jan 2023 15:09:44 +0800
>>> Subject: [PATCH] check whether the forced iteration count is out of range
>>>
>>> 1. struct crypt_pbkdf_type has a uint32_t variable iterations, but
>>>      PKCS5_PBKDF2_HMAC interface of openssl accept int variable, so
>>>      return fail when it greater than INT_MAX.
>>
>> yes, but UINT32 limits should be be already checked, see below
> 
>>
>>>
>>> 2. add boundary check for the iterations counts.
>>
>> CLI arguments are checked in src/tools_parse_arg_value.c, see how
>> CRYPT_ARG_UINT32 is processed there. It just do not print nice
>> message but only "invalid value" (and that is enough here).
> 
> In main branch, tools_parse_arg_value can process UINT32 limits.
>>
>> The PBKDF2 arguments for libcryptsetup API are checked in
>> lib/utils_pbkdf.c.
> 
> Function verify_pbkdf_params in lib/utils_pbkdf.c has check PBKDF2 arguments.
>>
>> Do you have some example, where this is not applied and value overflows?
>> If so, it should be fixed in these places.
>>
> I run follow command
> cryptsetup -c aes-xts-plain64 --key-size=512 --hash sha256 luksFormat --pbkdf=pbkdf2 --pbkdf-force-iterations=4294967295 /dev/sdb
> The program is over soon, it is not good because the iterations set to UINT32_MAX,
> the program should take a long time.
>> For the OpenSSL - this is a nice find that it used int in PKCS5_PBKDF2_HMAC()
>> but AFAIK new OSSL_PARAMS OpenSSL3 uses *unsigned* int..
>> And checking providers PBKDF2 implementation in OpenSSL3 I even see they
>> use uint64 when parsing params.
>>
>> I'll ask OpenSSL - this iteration count should be clearly treated as unsigned.
>> (Cryptsetup has different crypto backends, it must behave the same regarding maximums.)
>>
> All crypto backends should remain the same, but the program cannot be encrypted as expected due to
> type conversion in the environment where OpenSSL of an earlier version is installed.
>> Please, if you can, use main git branch, create an issue or merge request in cryptsetup project,
>> discussion about patches is much easier there.
>>
> Now i have fixed the patch base on main branch.
> 
> struct crypt_pbkdf_type has a uint32_t variable iterations, but
> PKCS5_PBKDF2_HMAC accept int variable in openssl(major version
> less than 3), so return EINVAL when it greater than INT_MAX.
> 
> Signed-off-by: wangzhiqiang <wangzhiqiang95@huawei.com>
> ---
> v1->v2:
> - delete changes of manuals
> - delete check of UINT32 limits
> 
>   lib/crypto_backend/crypto_openssl.c | 2 +-
>   lib/luks2/luks2_keyslot_luks2.c     | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/crypto_backend/crypto_openssl.c b/lib/crypto_backend/crypto_openssl.c
> index 24a49549..39dd13a1 100644
> --- a/lib/crypto_backend/crypto_openssl.c
> +++ b/lib/crypto_backend/crypto_openssl.c
> @@ -571,7 +571,7 @@ static int openssl_pbkdf2(const char *password, size_t password_length,
>          EVP_KDF_free(pbkdf2);
>   #else
>          const EVP_MD *hash_id = EVP_get_digestbyname(crypt_hash_compat_name(hash));
> -       if (!hash_id)
> +       if (!hash_id || iterations > INT_MAX)
>                  return -EINVAL;
> 
>          r = PKCS5_PBKDF2_HMAC(password, (int)password_length, (const unsigned char *)salt,
> diff --git a/lib/luks2/luks2_keyslot_luks2.c b/lib/luks2/luks2_keyslot_luks2.c
> index 78f74242..f01e196b 100644
> --- a/lib/luks2/luks2_keyslot_luks2.c
> +++ b/lib/luks2/luks2_keyslot_luks2.c
> @@ -264,6 +264,7 @@ static int luks2_keyslot_set_key(struct crypt_device *cd,
>                          pbkdf.parallel_threads);
>          free(salt);
>          if (r < 0) {
> +               log_err(cd, "Invalid parameter.");
>                  crypt_free_volume_key(derived_key);
>                  return r;
>          }
> --
> 2.33.0
>> Thanks,
>> Milan
>>
>>
>>>
>>> Signed-off-by: wangzhiqiang <wangzhiqiang95@huawei.com>
>>> ---
>>>    lib/crypto_backend/crypto_openssl.c |  2 +-
>>>    lib/luks2/luks2_keyslot_luks2.c     |  1 +
>>>    man/cryptsetup.8                    | 14 ++++++++++++++
>>>    src/cryptsetup.c                    |  5 +++++
>>>    4 files changed, 21 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/lib/crypto_backend/crypto_openssl.c b/lib/crypto_backend/crypto_openssl.c
>>> index 2edec7b..d76d89f 100644
>>> --- a/lib/crypto_backend/crypto_openssl.c
>>> +++ b/lib/crypto_backend/crypto_openssl.c
>>> @@ -329,7 +329,7 @@ int crypt_pbkdf(const char *kdf, const char *hash,
>>>    {
>>>           const EVP_MD *hash_id;
>>>
>>> -       if (!kdf)
>>> +       if (!kdf || iterations > INT_MAX)
>>>                   return -EINVAL;
>>>
>>>           if (!strcmp(kdf, "pbkdf2")) {
>>> diff --git a/lib/luks2/luks2_keyslot_luks2.c b/lib/luks2/luks2_keyslot_luks2.c
>>> index 156f0c1..fe5f1ed 100644
>>> --- a/lib/luks2/luks2_keyslot_luks2.c
>>> +++ b/lib/luks2/luks2_keyslot_luks2.c
>>> @@ -254,6 +254,7 @@ static int luks2_keyslot_set_key(struct crypt_device *cd,
>>>                           pbkdf.iterations, pbkdf.max_memory_kb,
>>>                           pbkdf.parallel_threads);
>>>           if (r < 0) {
>>> +               log_err(cd, "Invalid parameter.");
>>>                   crypt_free_volume_key(derived_key);
>>>                   return r;
>>>           }
>>> diff --git a/man/cryptsetup.8 b/man/cryptsetup.8
>>> index bc3fff6..f6f1fe0 100644
>>> --- a/man/cryptsetup.8
>>> +++ b/man/cryptsetup.8
>>> @@ -1096,6 +1096,20 @@ Note it can cause extremely long unlocking time. Use only is specified
>>>    cases, for example, if you know that the formatted device will
>>>    be used on some small embedded system.
>>>    In this case, the LUKS PBKDF2 digest will be set to the minimum iteration count.
>>> +
>>> +\fBMINIMAL AND MAXIMAL PBKDF COSTS:\fR
>>> +For \fBPBKDF2\fR, the minimum iteration count is 1000 and
>>> +maximum is 4294967295 (maximum for 32bit unsigned integer),
>>> +except openssl, which supports only 2147483647 (maximum for 32bit integer).
>>> +Memory and parallel costs are unused for PBKDF2.
>>> +For \fBArgon2i\fR and \fBArgon2id\fR, minimum iteration count (CPU cost) is 4 and
>>> +maximum is 4294967295 (maximum for 32bit unsigned integer).
>>> +Minimum memory cost is 32 KiB and maximum is 4 GiB. (Limited by addresable
>>> +memory on some CPU platforms.)
>>> +If the memory cost parameter is benchmarked (not specified by a parameter)
>>> +it is always in range from 64 MiB to 1 GiB.
>>> +The parallel cost minimum is 1 and maximum 4 (if enough CPUs cores are available,
>>> +otherwise it is decreased).
>>>    .TP
>>>    .B "\-\-iter\-time, \-i <number of milliseconds>"
>>>    The number of milliseconds to spend with PBKDF passphrase processing.
>>> diff --git a/src/cryptsetup.c b/src/cryptsetup.c
>>> index a0dc14b..decb39a 100644
>>> --- a/src/cryptsetup.c
>>> +++ b/src/cryptsetup.c
>>> @@ -3921,6 +3921,11 @@ int main(int argc, const char **argv)
>>>                   _("PBKDF forced iterations cannot be combined with iteration time option."),
>>>                   poptGetInvocationName(popt_context));
>>>
>>> +       if (opt_pbkdf_iterations < 0 || opt_pbkdf_iterations > UINT32_MAX)
>>> +               usage(popt_context, EXIT_FAILURE,
>>> +                _("the minimum iteration count is 1000 and maximum is 4294967295."),
>>> +                poptGetInvocationName(popt_context));
>>> +
>>>           if (opt_sector_size && strcmp(aname, "reencrypt") && strcmp(aname, "luksFormat") &&
>>>               (strcmp(aname, "open") || strcmp_or_null(opt_type, "plain")))
>>>                   usage(popt_context, EXIT_FAILURE,
>>> -- 
>>> 2.27.0
>>>
