package tmux

import "sync"

type Session struct {
	Name string
	Windows []Window
}

type Window struct {
	Name string
	WorkDir string
	WaitGroup sync.WaitGroup
	Commands []Command
}

type Command struct {
	Enter bool
	Clear bool
	WaitForIt bool
	NeedWaitGroup bool
	Init bool
	Run string
}
