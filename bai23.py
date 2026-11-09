class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

def preorder(g):
    if g is None:
        return []
    return [g.value] + preorder(g.left) + preorder(g.right)

def build(pre, ino):
    if not pre:
        return None
    k = ino.index(pre[0])
    g = Node(pre[0])
    g.left = build(pre[1:1+k], ino[:k])
    # TODO: g.right = build(đoạn pre bên phải, đoạn ino bên phải).
    return g

pre = [50, 30, 20, 40, 70, 60, 80]
ino = [20, 30, 40, 50, 60, 70, 80]
root = build(pre, ino)
print('Cây hiện có:', preorder(root))
print('Mục tiêu sau TODO:', pre)
