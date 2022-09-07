require "./libs/robotrunner"

abort("usage: toyrobot < [input.txt]\n") unless ARGV.length == 0

RobotRunner.new.run
