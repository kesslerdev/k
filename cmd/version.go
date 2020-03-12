package cmd

import (
	"fmt"

	"github.com/kesslerdev/k/internal/build"
	"github.com/spf13/cobra"
)

func init() {
	rootCmd.AddCommand(versionCmd)
}

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Print the version number of K",
	Long:  `All software has versions. This is K's`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Printf("K CLI v%v -- %v\n", build.Version, build.Revision)
		fmt.Printf("Built by %v at %v\n", build.User, build.Time)
	},
}
