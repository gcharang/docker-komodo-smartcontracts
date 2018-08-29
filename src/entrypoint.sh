#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
passwd -d user
export HOME=/home/user
echo "HOME is ${HOME}"
exec /usr/local/bin/gosu user "/bin/bash"
