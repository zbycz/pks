#macos
# from https://www.drupal.org/docs/administering-a-drupal-site/creating-a-static-archive-of-a-drupal-site


httrack https://www.praguechamberchoir.cz/ -O static -N "%h%p/%n/index%[page].%t" -WqQ%v --robots=0 --footer ''

# cd static/...

# only xmlrpc, whatever:
# find . -name "*.php" -type f



mv index/index.html .; sed -i '' 's|\.\./||g' index.html
mv de/index/index.html de; sed -i '' 's|\.\./\.\./|\.\./|g' de/index.html
mv en/index/index.html en; sed -i '' 's|\.\./\.\./|\.\./|g' en/index.html

# /index.html -> /
find . -name "*.html" -type f -print0 | xargs -0 perl -i -pe "s/\/index.html/\//g"

# /index/ -> /
find . -name "*.html" -type f -print0 | xargs -0 perl -i -pe "s/\/index\//\//g"

# index.html -> ./
find . -name "*.html" -type f -print0 | xargs -0 perl -i -pe "s/index.html/.\//g"


# move favicon + replace in files  (done with webstorm)