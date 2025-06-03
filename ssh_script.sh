#!/bin/bash

# SSH tunnel script for production metrics
# Run this on your developer server

PROD_SERVER="henri@volton.ee"
#LOCAL_PROMETHEUS_PORT=19090
LOCAL_NODE_EXPORTER_PORT=19100
LOCAL_CADVISOR_PORT=18080
LOCAL_POSTGRES_PORT=19187

# Create tunnels
ssh -L 192.168.0.186:${LOCAL_NODE_EXPORTER_PORT}:localhost:9100 \
  -L 192.168.0.186:${LOCAL_CADVISOR_PORT}:localhost:8082 \
  -L 192.168.0.186:${LOCAL_POSTGRES_PORT}:localhost:9187 \
  -N -f ${PROD_SERVER}

echo "SSH tunnels established:"
#echo "- Production Prometheus: localhost:${LOCAL_PROMETHEUS_PORT}"
echo "- Production Node Exporter: localhost:${LOCAL_NODE_EXPORTER_PORT}"
echo "- Production cAdvisor: localhost:${LOCAL_CADVISOR_PORT}"
