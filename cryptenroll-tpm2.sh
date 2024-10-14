#! /usr/bin/env bash
# https://community.frame.work/t/guide-setup-tpm2-autodecrypt/39005/9

systemd-cryptenroll "${1}"

systemd-cryptenroll \
  --tpm2-device=auto \
  --tpm2-pcrs=1+5+7+8+11+12+14+15 \
  --tpm2-with-pin=true \
  --wipe-slot=tpm2 \
  "${1}"
