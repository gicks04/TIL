n, k = map(int, input().split())

acm1 = 1
for i in range(1,n+1):
    acm1 *= i
acm2 = 1
for i in range(1, k+1):
    acm2 *= i
acm3 = 1
for i in range(1, (n-k) + 1):
    acm3 *= i

print(acm1 // (acm2 * acm3))