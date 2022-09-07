package toyrobot

type Table struct {
	x, y, xx, yy int
}

func NewTable(x int, y int, xx int, yy int) *Table {
	return &Table{x, y, xx, yy}
}

func (t Table) Contains(x int, y int) bool {
	return x >= t.x && x <= t.xx && y >= t.y && y <= t.yy
}
