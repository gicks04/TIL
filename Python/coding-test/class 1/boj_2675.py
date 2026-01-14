# 2675
n = int(input())
l1 = []
l2 = []
for i in range(n):
  a, b = input().split()
  l1.append(int(a))
  l2.append(b)
for i in range(n):
  for j in l2[i]:
    print(j*l1[i], end='')
  print()