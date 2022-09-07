import basic2d
from math import PI

export rotate90, rotate270, `&`, move

type
  Direction* = enum EAST, NORTH, WEST, SOUTH
  Point* = TPoint2d
  Heading* = TVector2d
  Table* = object
    llc, urc: Point

proc newPoint*(x, y: float): Point =
  Point(x: x, y: y)

proc newHeading*(direction: Direction): Heading =
  polarVector2d( ord(direction) / 2 * PI , 1.0)

proc toDirection*(heading: Heading): Direction =
  Direction(( angleTo(heading, polarVector2d(0, 1.0)) / PI * 2).toInt)

proc contains*(t: Table, p: Point): bool =
  case radToDeg(angle(t.llc, p)):
    of 0..90:
      case radToDeg(angle(p, t.urc)):
        of 0..90:
          true
        else:
          false
    else:
      false

proc newTable*(llc, urc: Point): Table =
  Table(llc: llc, urc: urc)

proc newTable*(): Table =
  Table()
