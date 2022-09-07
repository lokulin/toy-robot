import space2d
import option

type
  Robot* = object
    location: Point
    facing: Heading
    table: Option[Table]


proc newRobot*(location = newPoint(0, 0)
              , facing = newHeading(NORTH)
              , table = None(Table)): Robot =
  Robot(location: location, facing: facing, table: table)


proc place*(this: var Robot
           , location: Point
           , facing: Heading
           , table: Option[Table]) =
  if isSome(table) and table.get().contains(location):
    this.location = location
    this.facing = facing
    this.table = table


proc move*(this: var Robot) =
  var location = this.location & move(this.facing)
  place(this, location, this.facing, this.table)


proc left*(this: var Robot) =
  rotate90(this.facing)


proc right*(this: var Robot) =
  rotate270(this.facing)


proc report*(this: Robot) =
  if isSome(this.table):
    echo(this.location.x.toInt,",",this.location.y.toInt,",",this.facing.toDirection)
