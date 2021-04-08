from discourse/base:2.0.20210217-2235

WORKDIR /root
COPY test.yml /root/test.yml
COPY env.rb /root/env.rb
COPY entrypoint.sh /entrypoint.sh

RUN /bin/bash -c 'ruby /root/env.rb < /root/test.yml ; \
set -a ; \
source /root/envs ; \
cd /pups && /pups/bin/pups --stdin < /root/test.yml;'

ENTRYPOINT /entrypoint.sh