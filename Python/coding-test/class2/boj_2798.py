n , m = map(int, input().split())
mylist = list(map(int, input().split()))
ans = 0

for i in range(len(mylist)):
    for j in range(i + 1, len(mylist)):
        for k in range(j + 1, len(mylist)):
            acm = mylist[i] + mylist[j] + mylist[k]
            if ans < acm <= m:
                ans = acm

print(ans)