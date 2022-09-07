#include "point.hpp"

const bool Point::operator>=(const Point& rhs) const {
  return x >= rhs.x && y >= rhs.y;
}

const bool Point::operator<=(const Point& rhs) const {
  return x <= rhs.x && y <= rhs.y;
}

const Point Point::operator&=(const Point& rhs) const {
  return Point(x + rhs.x, y + rhs.y);
}

