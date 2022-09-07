package com.lauchlin.toyrobot;

import com.lauchlin.toyrobot.Util.*;

import java.util.List;

public class Robot {

    private Point location;
    private double facing;
    private Table table;

    public Robot(Point location, double facing, Table table) {
        this.location = location;
        this.facing = facing;
        this.table = table;
    }

    public void move() {
        this.place(this.location.plus(new Point(Math.sin(Math.PI * facing),
                        Math.cos(Math.PI * facing))),
                this.facing,
                this.table);
    }

    public void left() {
        this.place(this.location, Util.fmod(this.facing - 0.5, 2.0), this.table);
    }

    public void right() {
        this.place(this.location, Util.fmod(this.facing + 0.5, 2.0), this.table);
    }

    public String report(List<String> directions) {
        if (table != null) {
            return this.location.toString() + ","
                    + directions.get((int) Math.round(this.facing * 2.0));
        } else {
            return "";
        }
    }

    public void place(Point location, double facing, Table table) {
        if (table != null && table.contains(location)) {
            this.table = table;
            this.location = location;
            this.facing = facing;
        }
    }

}
