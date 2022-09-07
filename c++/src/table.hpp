#ifndef TOYROBOT_TABLE_H_
#define TOYROBOT_TABLE_H_

#include "point.hpp"

class Table {
  public:
    Point llc, urc;

    Table() : llc(Point(0,0)), urc(Point(0,0))
    { /**/ }

    Table(const Point llc, const Point urc) : llc(llc), urc(urc)
    { /**/ }

    const bool contains(const Point& point) const;
};

#endif // TOYROBOT_TABLE_H_
