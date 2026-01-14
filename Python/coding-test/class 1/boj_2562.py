# 2562
mylist = []
maxs = 0
for i in range(9):
  n = int(input())
  mylist.append(n)
  if maxs < n:
    maxs = n
print(maxs, (mylist.index(maxs))+1, sep='\n')

# 짧은 버전
# 2562
# mylist=[int(input()) for _ in range(9)]
# print(max(mylist), mylist.index(max(mylist))+1, sep='\n')