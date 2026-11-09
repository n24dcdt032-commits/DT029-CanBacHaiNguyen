class Nut:
    def __init__(self,gt,trai=None,phai=None):
        self.gt,self.trai,self.phai=gt,trai,phai
def chen(g,x):
    if g is None: return Nut(x)
    if x==g.gt: return g
    raise NotImplementedError("chèn vào con đúng phía")
def tim(g,x):
    while g is not None:
        if x==g.gt: return g
        raise NotImplementedError("tiến xuống con phù hợp")
    return None
def xoa(g,x):
    if g is None: return None
    # TODO: nối lại con; hai con dùng kế vị bên phải.
    raise NotImplementedError("xóa 0/1/2 con")
def duyet(g,kieu):
    if g is None: return []
    # TODO: ghép gốc và hai dãy con theo kieu.
    raise NotImplementedError("truoc/giua/sau")
def thong_ke(g):
    if g is None: return (0,0,0)
    # TODO: trả (số nút,số lá,chiều cao).
    raise NotImplementedError("kết hợp thống kê hai con")
g=Nut(4,Nut(2,Nut(1),Nut(3)),Nut(6,Nut(5),Nut(7)))
print("Mong đợi: giữa1..7, thống kê(7,4,3); sau xóa1,2,4: [3,5,6,7]")
try:
    print(duyet(g,"giua"),thong_ke(g))
    for x in [1,2,4]: g=xoa(g,x)
    print(duyet(g,"giua"))
except NotImplementedError as e: print("TODO:",e)
