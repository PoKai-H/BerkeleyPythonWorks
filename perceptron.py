w_a = [1, 0]
w_b = [1, 1]
w_c = [3, 0]

traning_samples = [[1, 1], [-1, 1], [1, -1], [-1, -1]]
labels = ['A', 'B', 'C', 'A']

def update_weight(label, sample):
    res_a = get_dot_product(w_a, sample)
    res_b = get_dot_product(w_b, sample)
    res_c = get_dot_product(w_c, sample)
    max_res = max(res_a, res_b, res_c) 
    if label == 'A' and max_res!= res_a:
        max_res, res_a = update(max_res, res_a, sample)
    elif label == 'B' and max_res!= res_b:
        max_res, res_b = update(max_res, res_b, sample)
    elif label == 'C' and max_res!= res_c:
        max_res, res_c = update(max_res, res_c, sample)
def update(max_res, res, sample):
    max_res[0] -= sample[0]
    max_res[1] -= sample[1]
    res[0] += sample[0]
    res[1] += sample[1]
    return max_res, res
def get_dot_product(weight, sample):
    return weight[0]*sample[0] + weight[1]*sample[1]

def yield_sample(sample, label):
    while True:
        yield from sample
        yield from label

samples = [next(yield_sample(traning_samples, labels)) for i in range(100)]
print(samples)