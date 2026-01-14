# 10250번
t = int(input())
mylist = []
for i in range(t):
  h,w,n = map(int, input().split())
  mylist.append(int(str((n-1)%h+1)+str(((n-1)//h+1)).zfill(2)))
print(*mylist, sep='\n')