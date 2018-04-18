#!/usr/bin/env bash

export PATH=/var/vcap/bosh/bin:$PATH
curl "$(credhub api)/management" -X POST -d '{"read_only_mode":"true"}' -H "Authorization: $(credhub --token)" -H 'content-type: application/json' -k
exec /var/vcap/jobs/credhub/bin/bbr/wait-for-stop
