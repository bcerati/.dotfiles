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

    tmux new-window -t $coursesSessionName: -n CSS -d \
      "cd $coursesPath && npm run css:watch"

    tmux new-window -t $coursesSessionName: -n REMIX -d \
      "cd $coursesPath && npm run dev"

    tmux new-window -t $coursesSessionName: -n VERCEL -d \
      "cd $coursesPath && npm run start"
  fi
fi

