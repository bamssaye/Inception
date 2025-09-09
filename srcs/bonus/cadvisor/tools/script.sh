#!/bin/sh
set -e

CADVISOR_URL="https://github.com/google/cadvisor/releases/download/v0.49.2/cadvisor-v0.49.2-linux-amd64"

curl -sSL "$CADVISOR_URL" -o /usr/local/bin/cadvisor

chmod +x /usr/local/bin/cadvisor
echo "cAdvisor installed to /usr/local/bin/cadvisor"

VOLUMES="/rootfs /var/run /sys /var/lib/docker"
for vol in $VOLUMES; do
    mkdir -p "$vol"
done

echo "Starting cAdvisor..."
exec /usr/local/bin/cadvisor -logtostderr -port=8080
