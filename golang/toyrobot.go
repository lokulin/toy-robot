package main

import (
	"bitbucket.org/lokulin/toyrobot/toyrobot"
	"bufio"
	"fmt"
	"os"
	"regexp"
	"strconv"
)

var robot *toyrobot.Robot
var regex, _ = regexp.Compile("^([A-Z]+)( ([0-9]+),([0-9]+),([A-Z]+)){0,1}$")

func validateLine(line string) (cmd string, args []string) {
	f := regex.FindStringSubmatch(line)
	if len(f) != 0 {
		cmd = f[1]
		args = f[3:]
	}
	return cmd, args
}

func validateArgs(args []string) (x int, y int, direction string) {
	if args[0] != "" && args[1] != "" && args[2] != "" {
		x, _ = strconv.Atoi(args[0])
		y, _ = strconv.Atoi(args[1])
		direction = args[2]
	}
	return x, y, direction
}

func runCmd(cmd string, args []string) {
	switch cmd {
	case "PLACE":
		robot.Place(validateArgs(args))
	case "MOVE":
		robot.Move()
	case "LEFT":
		robot.Left()
	case "RIGHT":
		robot.Right()
	case "REPORT":
		robot.Report()
	}
}

func run(filename string) {
	file, err := os.Open(filename)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	defer file.Close()

	robot = toyrobot.NewRobot(toyrobot.NewTable(0, 0, 4, 4))

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		runCmd(validateLine(scanner.Text()))
	}

	if err := scanner.Err(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}

func main() {
	if len(os.Args) != 2 {
		fmt.Fprintln(os.Stderr, "usage: toyrobot <inputfile>")
		os.Exit(1)
	}
	run(os.Args[1])
}
