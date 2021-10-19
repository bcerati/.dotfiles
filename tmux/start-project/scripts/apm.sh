#/usr/bin/zsh

dev=$2

#managing APM session
apmSessionName="apm"
if [ $1 = $apmSessionName ]; then
  nbApmSession=`tmux ls 2> /dev/null | grep -c "$apmSessionName:"`
  if [ $nbApmSession -eq 0 ]; then
    apmPath="$dev/Pro/internal-tools/apm"
    echo "Create \`$apmSessionName\` session";
    tmux new-session -s $apmSessionName -d

    tmux rename-window -t $apmSessionName CLI
    tmux send-keys -t $apmSessionName:CLI \
      "cd $apmPath" C-m "docker-compose down" C-m "docker-compose up -d" C-m

    tmux new-window -t $apmSessionName: -n CODE
    tmux send-keys -t $apmSessionName:CODE "cd $apmPath" C-m "vim ." C-m

    tmux new-window -t $apmSessionName -n WEBPACK_ENCORE -d \
      "sleep 3 && cd $apmPath && docker exec -ti apm_web npm run watch"
  fi
fi


