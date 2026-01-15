n = int(input())
result = 0
for i in range(1, n):
    sum = i
    for j in str(i):
        sum += int(j)
    if n == sum:
        result = i
        break
if n == 1 or result == 0:
    print(result)
else:
    print(result)