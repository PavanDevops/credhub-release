#!/usr/bin/env bash

set -u

export PATH=/var/vcap/bosh/bin:/var/vcap/jobs/credhub/bin:$PATH
curl "$(credhub api)/management" -X POST -d '{"read_only_mode":"false"}' -H "Authorization: $(credhub --token)" -H 'content-type: application/json' -k
exec /var/vcap/jobs/credhub/bin/bbr/post-bbr-start
