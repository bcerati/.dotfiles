#/usr/bin/zsh

dev=$2

#managing Adimeo Project for the CI
ciSessionName="ci"
if [ $1 = $ciSessionName ]; then
  nbCiSession=`tmux ls 2> /dev/null | grep -c "$ciSessionName:"`
  if [ $nbCiSession -eq 0 ]; then
    ciPath="$dev/Perso/CI/adimeo"
    echo "Create \`$ciSessionName\` session";
    tmux new-session -s $ciSessionName -d

    tmux rename-window -t $ciSessionName CLI
    tmux send-keys -t $ciSessionName:CLI \
      "cd $ciPath" C-m "docker-compose down" C-m "docker-compose up -d" C-m

    tmux new-window -t $ciSessionName: -n CODE
    tmux send-keys -t $ciSessionName:CODE "cd $ciPath" C-m "vim ." C-m
  fi
fi

