n = int(input())
numlist = list(map(int, input().split()))

m = max(numlist)
result = []
for num in numlist:
    result.append(num / m * 100)

print(sum(result) / n)