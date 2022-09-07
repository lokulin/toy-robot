package toyrobot

import "testing"

func TestPlace(t *testing.T) {
	var robot = NewRobot(NewTable(0, 0, 4, 4))
	robot.Place(-1, 0, "NORTH")
	if robot.placed {
		t.Error("Expected robot to not be placed.")
	}
	robot.Place(0, 0, "UP")
	if robot.placed {
		t.Error("Expected robot to not be placed.")
	}
	robot.Place(0, 0, "NORTH")
	if !robot.placed {
		t.Error("Expected robot to be placed.")
	}
}

func TestMove(t *testing.T) {
	var robot = NewRobot(NewTable(0, 0, 4, 4))
	robot.Place(0, 0, "NORTH")
	robot.Move()
	if robot.x != 0 && robot.y != 1 {
		t.Error("Expected robot to move north.")
	}
	robot.Place(0, 0, "SOUTH")
	robot.Move()
	if robot.x != 0 && robot.y != 0 {
		t.Error("Expected robot to not move.")
	}
}
