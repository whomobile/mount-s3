#!/usr/bin/env bash

set -o errexit

mount-s3 ${AWS_S3_BUCKET} /mnt/s3

if [ $? -ne 0 ]; then
    echo "Failed to mount s3 bucket"
    exit 1
fi

cat <<EOF
use docker compose exec s3 bash
to access the s3 bucket

> docker-compose exec s3 bash
> ls /mnt/s3
> cp /mnt/s3/abc /mnt/local/abc

./local/abc will be created on the host machine

EOF

while true; do
    sleep 10000
    echo -n "."
done
