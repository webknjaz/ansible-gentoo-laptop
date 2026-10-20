#! /usr/bin/env bash
# https://community.frame.work/t/guide-setup-tpm2-autodecrypt/39005/9
#
# PCR 15 dangers:
# * https://unix.stackexchange.com/a/804367/27133
# * https://en.opensuse.org/Portal:MicroOS/FDE#PCR_#15
# * https://www.reddit.com/r/archlinux/comments/1wykdmb/psa_if_youre_using_a_tpm2_luks_unlock_with_dracut/
# * https://wiki.archlinux.org/title/Systemd-cryptenroll#Trusted_Platform_Module
# * https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#Enrolling_the_TPM

systemd-cryptenroll "${1}"

systemd-cryptenroll \
  --tpm2-device=auto \
  --tpm2-pcrs=1+5+7+8+11+12+14+15:sha256=0000000000000000000000000000000000000000000000000000000000000000 \
  --tpm2-with-pin=true \
  --wipe-slot=tpm2 \
  "${1}"
