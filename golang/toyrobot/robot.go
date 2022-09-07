package toyrobot

import "fmt"

type Robot struct {
	table   *Table
	x, y    int
	compass []Direction
	placed  bool
}

type Direction struct {
	name string
	x, y int
}

func NewRobot(table *Table) *Robot {
	return &Robot{compass: []Direction{Direction{"NORTH", 0, 1},
		Direction{"EAST", 1, 0},
		Direction{"SOUTH", 0, -1},
		Direction{"WEST", -1, 0}},
		placed: false,
		table:  table}
}

func (r *Robot) lookingAt() (x int, y int) {
	return (r.x + r.compass[0].x), (r.y + r.compass[0].y)
}

func (r *Robot) Move() {
	if r.table.Contains(r.lookingAt()) {
		r.x, r.y = r.lookingAt()
	}
}

func (r *Robot) Left() {
	r.compass = append(r.compass[len(r.compass)-1:], r.compass[:len(r.compass)-1]...)
}

func (r *Robot) Right() {
	r.compass = append(r.compass[1:], r.compass[:1]...)
}

func (r *Robot) Place(xx int, yy int, d string) {
	if r.table.Contains(xx, yy) {
		i := 0
		for _, c := range r.compass {
			if c.name != d {
				r.Right()
				i++
			} else {
				break
			}
		}
		if i < len(r.compass) {
			r.x, r.y, r.placed = xx, yy, true
		}
	}
}

func (r *Robot) Report() {
	if r.placed {
		fmt.Printf("%d,%d,%s\n", r.x, r.y, r.compass[0].name)
	}
}
