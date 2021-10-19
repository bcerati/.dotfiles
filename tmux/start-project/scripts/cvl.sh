#/usr/bin/zsh

dev=$2

#managing CVL session
cvlSessionName="cvl"
if [ $1 = $cvlSessionName ]; then
  nbCvlSession=`tmux ls 2> /dev/null | grep -c "$cvlSessionName:"`
  if [ $nbCvlSession -eq 0 ]; then
    cvlPath="$dev/Pro/CVDL/centre-val-de-loire";

    echo "Create \`$cvlSessionName\` session";
    tmux new-session -s $cvlSessionName -d

    tmux rename-window -t $cvlSessionName CLI
    tmux send-keys -t $cvlSessionName:CLI \
      "cd $cvlPath" C-m "docker-compose down" C-m "docker-compose up -d" C-m

    tmux new-window -t $cvlSessionName: -n CODE
    tmux send-keys -t $cvlSessionName:CODE "cd $cvlPath" C-m "vim ." C-m

    tmux new-window -t $cvlSessionName: -n GULP -d \
      "sleep 5 && cd $cvlPath && docker exec -ti cvl_cre_web gulp -f inte/gulpfile.js watch"

    tmux new-window -t $cvlSessionName -n WEBPACK_ENCORE -d \
      "sleep 15 && cd $cvlPath && docker exec -ti cvl_cre_web npm run watch"
  fi
fi


