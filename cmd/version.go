package cmd

import (
	"fmt"

	"github.com/kesslerdev/kli/internal/build"
	"github.com/spf13/cobra"
)

func init() {
	rootCmd.AddCommand(versionCmd)
}

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Print the version number of KLI",
	Long:  `All software has versions. This is KLI's`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Printf("KLI v%v -- %v\n", build.Version, build.Revision)
		fmt.Printf("Built by %v at %v\n", build.User, build.Time)
	},
}
