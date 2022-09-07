#include "toyrobot.hpp"
#include <iostream>
#include <regex>
#include <string>
#include <vector>
#include <boost/bimap.hpp>

int main () {
  using namespace std;
  using namespace boost;

  const vector<bimap<string, int>::value_type> v{{"NORTH", 0}, {"EAST", 1}, {"SOUTH", 2}, {"WEST", 3}};
  const bimap<string, int> dirs(v.begin(),v.end());

  const regex place("^PLACE (\\d),(\\d),(NORTH|EAST|SOUTH|WEST)$");

  Robot robot = Robot();
  const Option<Table> table = Some(Table(Point(0,0),Point(4,4)));

  smatch m;
  string line;
  while (getline(cin, line))
  {
        line == "MOVE" ? robot.move() :
        line == "LEFT" ? robot.left() :
        line == "RIGHT" ? robot.right() :
        line == "REPORT" ? robot.report(dirs) :
        regex_match (line,m,place) ? robot.place(Point(stoi(m[1]), stoi(m[2]))
                                                , dirs.left.at(m[3])/2.0, table) :
        (void)0;
  }
}
