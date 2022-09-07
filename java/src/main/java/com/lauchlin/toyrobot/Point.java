package com.lauchlin.toyrobot;

public class Point
{
    private double x, y;

    public Point(double x, double y)
    {
       this.x = x;
       this.y = y;
    }

    public Point plus(Point other)
    {
      return new Point(this.x + other.x, this.y + other.y);
    }

    public boolean ge(Point other)
    {
      return this.x >= other.x && this.y >= other.y;
    }

    public boolean le(Point other)
    {
      return this.x <= other.x && this.y <= other.y;
    }

    public String toString()
    {
      return this.x + "," + this.y;
    }
}
