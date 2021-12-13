package tmux

import (
	"os"
	"os/exec"
	"sync"
)

func CreateSession(session Session) bool {
	cmd := exec.Command("tmux", "new-session", "-d", "-s", session.Name)
	cmd.Env = os.Environ()

	_, err := cmd.Output()

	if err != nil {
		panic(err)
	}

	return true
}

func CreateWindow(session Session, win Window, win_idx int) bool {
	var args []string

	// if it's the first window, we just rename the existing one (created with the session)
	if win_idx == 0 {
		args = []string{"rename-window", "-t", session.Name + ":1", win.Name}
	} else {
		args = []string{"new-window", "-t", session.Name, "-n", win.Name}
	}

	cmd := exec.Command("tmux", args...)
	cmd.Env = os.Environ()

	_, err := cmd.Output()

	if err != nil {
		panic(err)
	}

	buildWindow(session, win)
	return true
}

func buildWindow(session Session, win Window) bool {
	if win.WorkDir != "" {
		args := []string{"send-keys", "-t", session.Name + ":" + win.Name, "cd " + win.WorkDir, "C-m", "C-l"}

		cmd := exec.Command("tmux", args...)
		cmd.Env = os.Environ()
	
		_, err := cmd.Output()
	
		if err != nil {
			panic(err)
		}
	}

	if len(win.Commands) > 0 {
		for i := range win.Commands {
			extra := []string{}

			if win.Commands[i].WaitForIt {
				extra = append(extra, "; tmux wait -S wait_for_it")
			}

			if win.Commands[i].Enter {
				extra = append(extra, "C-m")
			}
			
			if win.Commands[i].Clear {
				extra = append(extra, "C-l")
			}

			args := []string{"send-keys", "-t", session.Name + ":" + win.Name, win.Commands[i].Run}
			args = append(args, extra...)

			cmd := exec.Command("tmux", args...)
			cmd.Env = os.Environ()
		
			if win.Commands[i].WaitForIt {
				win.WaitGroup.Add(1)

				go func (wg *sync.WaitGroup) {
					defer wg.Done()

					cmd.Run()

					wait_cmd := exec.Command("tmux", "wait", "wait_for_it")
					wait_cmd.Env = os.Environ()
					wait_cmd.Run()
		
				}(&win.WaitGroup)
			} else if !win.Commands[i].NeedWaitGroup {
				_, err := cmd.Output()
		
				if err != nil {
					panic(err)
				}
			}
		}

		win.WaitGroup.Wait()

		for i := range win.Commands {
			extra := []string{}

			if win.Commands[i].Enter {
				extra = append(extra, "C-m")
			}
			
			if win.Commands[i].Clear {
				extra = append(extra, "C-l")
			}

			args := []string{"send-keys", "-t", session.Name + ":" + win.Name, win.Commands[i].Run}
			args = append(args, extra...)

			cmd := exec.Command("tmux", args...)
			cmd.Env = os.Environ()
		
			if win.Commands[i].NeedWaitGroup {
				_, err := cmd.Output()
		
				if err != nil {
					panic(err)
				}
			}
		}
	}

	return true
}