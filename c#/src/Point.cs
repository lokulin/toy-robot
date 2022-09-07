namespace com.lauchlin.toyrobot
{
    public struct Point
    {
        public int x;
        public int y;

        public Point(int x, int y) {
            this.x = x;
            this.y = y;
        }

        public Point plus(Point p) {
            return new Point(x+p.x, y+p.y);
        }

        public static bool operator >=(Point p1, Point p2) {
            return p1.x >= p2.x && p1.y >= p2.y;
        }

        public static bool operator <=(Point p1, Point p2) {
            return p1.x <= p2.x && p1.y <= p2.y;
        }
    }
}

