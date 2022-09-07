from math import pi,sin,cos
from toyrobot.point import Point

class Robot(object):

    def __init__(self, location = Point(0.0, 0.0), facing = 0.0, table = None, dirs = None):
        self.location = location
        self.facing = facing
        self.table = table
        self.dirs = dirs

    def left(self):
        return self.place(self.location, (self.facing - 0.5)%2, self.table)

    def right(self):
        return self.place(self.location, (self.facing + 0.5)%2, self.table)

    def move(self):
        return self.place(self.location + Point(sin(pi * self.facing)
                                               ,cos(pi * self.facing))
                         ,self.facing, self.table)

    def report(self):
        if self.table is not None:
            print(round(self.location.x), round(self.location.y), self.dirs[round(self.facing*2)])
        return self

    def place(self, location, facing, table):
        if table is not None and table.contains(location):
            return Robot(location, facing, table, self.dirs)
        else:
            return self

