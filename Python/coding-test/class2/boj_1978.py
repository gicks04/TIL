n = int(input())
prime_list = list(map(int, input().split()))
result = 0
for prime in prime_list:
    c= 0 
    for i in range(1,prime+1):
        if prime % i == 0:
            c += 1
    if c == 2 :
        result += 1
print(result)