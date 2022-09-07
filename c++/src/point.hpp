#ifndef TOYROBOT_POINT_H_
#define TOYROBOT_POINT_H_

class Point {
 public:
  double x, y;

  Point() : x(0), y(0)
  { /**/ }

  Point(const double xx, const double yy) : x(xx), y(yy)
  { /**/ }

  const bool operator>=(const Point& rhs) const;

  const bool operator<=(const Point& rhs) const;

  const Point operator&=(const Point& rhs) const;

};

#endif // TOYROBOT_POINT_H_
