numlist = []
while True:
    n = input()
    if n == '0':
        break
    numlist.append(n)
result = []
for mystr in numlist:
    if mystr == mystr[::-1]:
        result.append('yes')
    else:
        result.append('no')

print(*result, sep='\n')