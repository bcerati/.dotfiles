#/usr/bin/zsh

dev=$2

#managing Courses Project
coursesSessionName="courses"
if [ $1 = $coursesSessionName ]; then
  nbCoursesSession=`tmux ls 2> /dev/null | grep -c "$coursesSessionName:"`
  if [ $nbCoursesSession -eq 0 ]; then
    coursesPath="$dev/Perso/learnings"

    echo "Create \`$coursesSessionName\` session";
    tmux new-session -s $coursesSessionName -d

    tmux rename-window -t $coursesSessionName CLI
    tmux send-keys -t $coursesSessionName:CLI \
      "cd $coursesPath" C-m

    tmux new-window -t $coursesSessionName: -n CODE
    tmux send-keys -t $coursesSessionName:CODE "cd $coursesPath" C-m "vim ." C-m

    tmux new-window -t $coursesSessionName: -n CSS
    tmux send-keys -t $coursesSessionName:CSS "cd $coursesPath && npm run css:watch" C-m

    tmux new-window -t $coursesSessionName: -n REMIX
    tmux send-keys -t $coursesSessionName:REMIX "cd $coursesPath && npm run dev" C-m

    tmux new-window -t $coursesSessionName: -n VERCEL
    tmux send-keys -t $coursesSessionName:VERCEL "cd $coursesPath && npm run start" C-m

    tmux new-window -t $coursesSessionName: -n POSTGREST
    tmux send-keys -t $coursesSessionName:POSTGREST "postgrest $coursesPath/postgrest.conf" C-m

  fi
fi

