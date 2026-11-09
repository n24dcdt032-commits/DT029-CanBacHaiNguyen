def gini_counts(counts):
    # TODO: kiểm số đếm nguyên, không âm.
    n = sum(counts)
    if n == 0:
        return 0.0
    s = 0.0
    for c in counts:
        p = c / n
        s += p*p
    return 1 - s

for counts in [[5, 0], [3, 3], [4, 1]]:
    print(counts, gini_counts(counts))
