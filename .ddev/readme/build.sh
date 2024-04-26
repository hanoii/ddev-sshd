#!/bin/bash
#ddev-generated
set -e -o pipefail

$(npm config get prefix)/bin/prettier /var/www/html/README.md --cache-location /var/www/html/.ddev/readme/.cache/prettier --write --config=/var/www/html/.ddev/readme/.prettierrc
$(npm config get prefix)/bin/markdown-toc -i /var/www/html/README.md
