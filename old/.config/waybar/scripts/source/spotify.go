package main

import (
	"fmt"
	"os"
	"os/exec"
	"strconv"
	"strings"
)

func getOutput(argument string) string {
	out, err := exec.Command("playerctl", "metadata", "--player=spotify", "--format", argument).Output()
	if err != nil {
		fmt.Printf("{\"class\": \"%s\", \"alt\": \"%s\", \"percentage\": %d, \"text\": \"%s\"}", "stopped", "stopped", 0, "")
		os.Exit(0)
	}
	return strings.TrimSpace(string(out))
}

func main() {
	status := getOutput("{{lc(status)}}")
	position := getOutput("{{position}}")
	total := getOutput("{{mpris:length}}")
	title := getOutput("{{title}} - {{artist}}")

	positionInt, _ := strconv.Atoi(position)
	totalInt, _ := strconv.Atoi(total)
	percentage := positionInt * 100 / totalInt

	if len(title) > 25 {
		title = title[0:25] + "..."
	}

	fmt.Printf("{\"class\": \"%s\", \"alt\": \"%s\", \"percentage\": %d, \"text\": \" %s\"}", status, status, percentage, title)
}
