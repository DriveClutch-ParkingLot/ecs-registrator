#!/bin/sh

IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4 | tr -d '\n')
echo "IP=${IP}"

/bin/registrator            \
  -ip ${IP}                 \
  -resync ${RESYNC_SECONDS} \
  consul://${IP}:8500
