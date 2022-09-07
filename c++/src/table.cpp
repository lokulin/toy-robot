#include "table.hpp"

const bool Table::contains(const Point& point) const {
  return llc<=point && urc>=point;
}
