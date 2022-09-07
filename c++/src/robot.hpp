#ifndef TOYROBOT_ROBOT_H_
#define TOYROBOT_ROBOT_H_
#include <string>
#include <boost/bimap.hpp>

#include "option.hpp"
#include "table.hpp"
#include "point.hpp"

class Robot {
public:
  Point location;
  float facing;
  Option<Table> table;

  Robot() : location(Point()), facing(0.0), table(None<Table>())
  { /**/ };

  Robot(const Point& location, const float& facing, const Option<Table>& table)
    : location(location), facing(facing), table(table)
  { /**/ };

  void move();

  void left();

  void right();

  void report(const boost::bimap<std::string, int>& dirs);

  void place(Point location, float facing, Option<Table> table);

};

const float rmod(const float a, const float b);

#endif // TOYROBOT_ROBOT_H_
