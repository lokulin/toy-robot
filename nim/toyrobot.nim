from strutils import parseFloat, parseEnum
from re import re, `=~`
from math import PI
import space2d
import robot as robots
from option import Some

var
  table = Some(newTable(newPoint(0.0, 0.0), newPoint(4.0, 4.0)))
  robot = newRobot()

for line in lines stdin:
  case line
  of "MOVE": robot.move
  of "LEFT": robot.left
  of "RIGHT": robot.right
  of "REPORT": robot.report
  else:
    if line =~ re"^PLACE\s(\d+),(\d+),(NORTH|EAST|SOUTH|WEST)$":
      try:
        var
          x = parseFloat(matches[0])
          y = parseFloat(matches[1])
          facing = newHeading(parseEnum(matches[2], NORTH))
        robot.place(newPoint(x, y), facing, table)
      except:
        discard
