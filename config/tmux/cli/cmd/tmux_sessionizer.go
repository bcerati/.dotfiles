package cmd

import (
	"boris/packages/tmux"
	"encoding/json"
	"os"

	"github.com/spf13/cobra"
)

var tmuxSessionizerCommand = &cobra.Command{
	Use: "tmux-sessionizer",
	Short: "Create all the tmux sessions you need!",
	Long:  `CReate tmux sessions according to a config file`,
	Run: func(cmd *cobra.Command, args []string) {
		var config []tmux.Session

		//TODO: yeah change this filepath
		data, configErr := os.ReadFile("packages/tmux/config.json")

		if configErr != nil {
			panic(configErr)
		}

		jsonErr := json.Unmarshal(data, &config)

		if jsonErr != nil {
			panic(jsonErr)
		}

		for _, c := range config {
			if tmux.CreateSession(c) {
				for win_idx, win := range c.Windows {
					tmux.CreateWindow(c, win, win_idx)
				}
			}
		}
	},
}

func init() {
	rootCmd.AddCommand(tmuxSessionizerCommand)
}
