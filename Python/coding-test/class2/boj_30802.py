n = int(input())
tlist = map(int, input().split())
t, p = map(int, input().split())
c = 0
for size in tlist:
    c += (size-1) // t + 1
print(c)
print(n//p, n%p)                                             