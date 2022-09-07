package;

import Math.*;

import Point;
import Table;

class Robot {

    var location: Point;
    var facing: Float;
    var table: Table;

    public function new(location:Point, facing:Float, table:Table) {
      this.location = location;
      this.facing = facing;
      this.table = table;
    }

    public function toString() {
      return location.toString() + "," + facing;
    }

    public function move() {
      place(location.plus(new Point(sin(PI*facing), cos(PI*facing))), facing, table);
    }

    public function left() {
      place(location, fmod(facing-0.5,2), table);
    }

    public function right() {
      place(location, fmod(facing+0.5,2), table);
    }

    public function place(location:Point, facing:Float, table:Table) {
      if(table.contains(location)) {
        this.location = location;
        this.facing = facing;
        this.table = table;
      }
    }

    private static function fmod(a:Float, b:Float) : Float {
      return a-b*floor(a/b);
    }

    static function main() {
      var l = new Point(1,1);
      var t = new Table(new Point(0,0), new Point(4,4));
      var robot = new Robot(l, 0.5, t);
      Sys.println(robot.toString());
      robot.left();
      Sys.println(robot.toString());
      robot.left();
      Sys.println(robot.toString());
      robot.right();
      Sys.println(robot.toString());
      robot.move();
      Sys.println(robot.toString());
      robot.move();
      Sys.println(robot.toString());
      robot.move();
      Sys.println(robot.toString());
      robot.move();
      Sys.println(robot.toString());
      robot.move();
      Sys.println(robot.toString());
      robot.move();
      var stdin = Sys.stdin();
      var input = stdin.readLine();
      Sys.println(input);
    }

}
