# 2577
olist = [ int(input()) for _ in range(3)]
acc = str(olist[0] * olist[1] * olist[2])
clist = [acc.count(str(i)) for i in range(10)]
print(*clist, sep='\n')