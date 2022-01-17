#/bin/sh
rm /disable-root-ro
if [ -x /bin/systemctl ]; then
  echo Removing the random seed file
  systemctl stop systemd-random-seed.service
  if [ -f /var/lib/systemd/random-seed ]; then
    rm -f /var/lib/systemd/random-seed
  fi
else
  echo systemctl not found, skipping removal of random seed file
fi
reboot
