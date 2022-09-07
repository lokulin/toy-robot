package com.lauchlin.toyrobot;

public class Table
{
    private Point llc, urc;

    public Table(Point llc, Point urc)
    {
       this.llc = llc;
       this.urc = urc;
    }

    public boolean contains(Point point)
    {
      return point.ge(llc) && point.le(urc);
    }
}
