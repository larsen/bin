cd ~/www/stefanorodighiero.net/blog/
rsync -av \
  --exclude=posts/ --exclude=drafts/ \
  ~/www/stefanorodighiero.net/blog/ \
  larsen@home:/srv/www/stefanorodighiero.net/blog/ \
  --delete
