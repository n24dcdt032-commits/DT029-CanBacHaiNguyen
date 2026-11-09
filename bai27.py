def gini(rows):
    if not rows:
        return 0.0
    counts = {}
    for row in rows:
        label = row[-1]
        counts[label] = counts.get(label, 0) + 1
    return 1 - sum((c/len(rows))**2 for c in counts.values())

def gini_split(rows, col):
    groups = {}
    for row in rows:
        groups.setdefault(row[col], []).append(row)
    total = 0.0
    for group in groups.values():
        total += len(group)/len(rows) * gini(group)
    return total

rows = [
    ['nắng','nhẹ','có'], ['nắng','mạnh','không'],
    ['mây','nhẹ','có'], ['mây','mạnh','có'],
    ['mưa','nhẹ','không'], ['mưa','mạnh','không'],
    ['nắng','nhẹ','có'], ['mưa','mạnh','không'],
]
weather = gini_split(rows, 0)
wind = gini_split(rows, 1)
print(gini(rows), weather, wind)
# TODO: so weather/wind và in cột được chọn; giải thích bằng bảng tính tay.
