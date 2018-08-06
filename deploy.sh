echo "Installing 'node-cmd'"
npm install node-cmd
echo "Installing 'node-ssh'"
npm install node-ssh
echo "Running 'deploy.js'"
node deploy.js

#!/bin/bash

eval "$(ssh-agent -s)" # Start ssh-agent cache
chmod 600 .travis/id_rsa # Allow read access to the private key
ssh-add .travis/id_rsa # Add the private key to SSH

git config --global push.default matching
git remote add deploy ssh://git@$IP:$PORT$DEPLOY_DIR
git push deploy master