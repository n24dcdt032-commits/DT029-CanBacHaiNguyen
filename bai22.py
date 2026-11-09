class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

def insert(g, x):
    if g is None:
        return Node(x)
    if x < g.value:
        g.left = insert(g.left, x)
    elif x > g.value:
        g.right = insert(g.right, x)
    return g

def preorder(g):
    if g is None:
        return []
    return [g.value] + preorder(g.left) + preorder(g.right)

def delete(g, x):
    if g is None:
        return None
    if x < g.value:
        g.left = delete(g.left, x)
    elif x > g.value:
        g.right = delete(g.right, x)
    else:
        if g.left is None:
            return g.right
        if g.right is None:
            return g.left
        # TODO: tìm kế vị bên phải, chép giá trị, xoá vị trí kế vị cũ.
        raise NotImplementedError('TODO: xoá nút hai con')
    return g

root = None
for x in [45, 15, 79, 12, 38]:
    root = insert(root, x)
root = delete(root, 12)
print(preorder(root))
