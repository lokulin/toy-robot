class Table(object):

    def __init__(self, llc, urc):
        self.llc = llc
        self.urc = urc

    def contains(self, point):
        return self.llc <= point and self.urc >= point

