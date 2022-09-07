require "./robot"
require "./table"

class RobotRunner

  def initialize
    @dirs = %w{NORTH EAST SOUTH WEST}
  end

  def placeargs(x, y, dir)
    return x.to_i, y.to_i, @dirs.index(dir).to_i*0.5, Table.new(0,0,4,4)
  end

  def run
    robot = Robot.new(0,0,0,nil,@dirs)

    while line = STDIN.gets
      match = /(?<=^)(MOVE$|LEFT$|RIGHT$|REPORT$|PLACE(?=\s?(\d+),(\d+),(NORTH|EAST|SOUTH|WEST)$))/.match(line)
      cmd = match.try &.[1]
      x = match.try &.[2]
      y = match.try &.[3]
      dir = match.try &.[4]
      case cmd
        when "MOVE"
          robot = robot.move
        when "REPORT"
          robot = robot.report
        when "LEFT"
          robot = robot.left
        when "RIGHT"
          robot = robot.right
        when "PLACE"
          nx, ny, ndir, table = placeargs(x, y, dir)
          robot = robot.place(nx, ny, ndir, table)
      end
    end
  end
end
