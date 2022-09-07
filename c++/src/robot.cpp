#include <cmath>
#include <iostream>
#include <string>
#include "robot.hpp"

const double pi() { return std::acos(-1); }

void Robot::move() {
  Point new_location = Point(location.x + sin(pi()*facing)
                            , location.y + cos(pi()*facing));
  place(new_location, facing, table);
}

void Robot::left() {
  facing = rmod(facing - 0.5, 2.0);
}

void Robot::right() {
  facing = rmod(facing + 0.5, 2.0);
}

void Robot::report(const boost::bimap<std::string, int>& dirs) {
  if(table.isSome()) std::cout << location.x << "," << location.y << "," << dirs.right.at(facing) << "\n";
}

void Robot::place(Point location, float facing
                 , Option<Table> table) {
  if (table.isSome() && table.get().contains(location)) {
    this->location = location;
    this->facing = facing;
    this->table = table;
  }
}

const float rmod(const float a, const float b) {
  return a - b * floor(a/b);
}
