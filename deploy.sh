#!/bin/bash

# Generate the main index file
pandoc README.md -o index.html

# Rewrite .gitignore
echo '.travis.yml' > .gitignore
echo 'LICENSE' >> .gitignore
echo '*.md' >> .gitignore
echo '*.sh' >> .gitignore

# Deploy to GitHub Pages
ghp-import -n .
git remote set-url origin "https://$GH_TOKEN@github.com/pyvec/talks.git"
git push origin gh-pages --force
