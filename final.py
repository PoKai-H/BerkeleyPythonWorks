class Counter:
    def  __init__(self):
        self.obs = []
    def observe(self, vs):
        self.obs.append([i for i in vs])
    def count(self, v):
        return sum([s.count(v) for s in self.obs])
    def forget(self):
        self.obs.pop()