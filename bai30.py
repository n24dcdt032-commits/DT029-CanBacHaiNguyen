def la_bst(g,lo=None,hi=None):
    if g is None: return True
    x,trai,phai=g
    # TODO: kiểm x nằm trong khoảng mở.
    # TODO: trái dùng (lo,x), phải dùng (x,hi).
    raise NotImplementedError("kiểm cận và hai cây con")
dung=(4,(2,(1,None,None),(3,None,None)),(6,None,None))
sai=(50,(30,None,(60,None,None)),(70,None,None))
print("Mong đợi: True, False")
try:
    print(la_bst(dung),la_bst(sai))
except NotImplementedError as e: print("TODO:",e)
