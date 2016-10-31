#!/bin/sh

IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4 | tr -d '\n')
echo "IP=${IP}"

RETRY_ATTEMPTS=${RETRY_ATTEMPTS:-10}
RETRY_INTERVAL=${RETRY_INTERVAL:-500}

/bin/registrator                    \
  -ip ${IP}                         \
  -resync ${RESYNC_SECONDS}         \
  -retry-attempts ${RETRY_ATTEMPTS} \
  -retry-interval ${RETRY_INTERVAL} \
  consul://${IP}:8500
