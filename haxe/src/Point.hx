package;

class Point {

    var x: Float;
    var y: Float;

    public function new(x:Float, y:Float) {
      this.x = x;
      this.y = y;
    }

    public function plus(other:Point) : Point {
      return new Point(this.x + other.x, this.y + other.y);
    }

    public function ge(other:Point) : Bool {
      return this.x >= other.x && this.y >= other.y;
    }

    public function le(other:Point) : Bool {
      return this.x <= other.x && this.y <= other.y;
    }

    public function toString() {
      return x + "," + y;
    }
}
