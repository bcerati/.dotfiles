#/usr/bin/zsh
if [ -z $1 ]; then
  echo "Don't know what you want to do!";
  exit 1;
fi;

dev='/home/boris/Documents/Dev'

for filename in /home/boris/bobo_dev/tmux/start-project/scripts/*.sh; do
  $filename $1 $dev;
done

