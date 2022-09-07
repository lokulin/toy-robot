#!/usr/bin/gawk -f
BEGIN {
	PI = 355/114;

	facing = 0.0;
	x = 0;
	y = 0;

	placed = 0;

	table_width = 4;
	table_height = 4;

	compass["NORTH"] = 0.0;
	compass["EAST"] = 0.5;
	compass["SOUTH"] = 1.0;
	compass["WEST"] = 1.5;
	compass[0.0] = "NORTH";
	compass[0.5] = "EAST";
	compass[1.0] = "SOUTH";
	compass[1.5] = "WEST";
}

function round(x,	integer, absolute, fraction) {
	integer = int(x);

	if(x == integer)
		return integer;

	if(x < 0) {
		absolute = -x;
		integer = int(absolute);
		fraction = absolute - integer;
		if(fraction >= 0.5)
			return int(x) - 1;
		else
			return int(x);
	} else {
		fraction = x - integer;
		if (fraction >= 0.5)
			return integer + 1;
		else
			return integer;
	}
}


function left() {
	facing = facing == 0 ? 1.5 : (facing - 0.5) % 2;
}

function right() {
	facing = (facing + 0.5) % 2;
}

function move() {
	x = x + round(sin(facing*PI));
	y = y + round(cos(facing*PI));
}

/^LEFT$/ { left() }
/^RIGHT$/ { right() }
/^MOVE$/ { move() }
/^PLACE.*$/ {
	match($0,/^PLACE ([0-9]+),([0-9]+),(NORTH|SOUTH|EAST|WEST)$/,m)
		facing = compass[m[3]];
		x = m[1];
		y = m[2];
	}
/^REPORT$/ { printf("%d,%d,%s\n", x, y, compass[facing]) }
