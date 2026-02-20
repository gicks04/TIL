n, m = map(int, input().split())
if n > m :
    a = n
    b = m
else:
    a = m
    b = n

r = a % b
while r != 0:
    a = b
    b = r
    r = a % b

print(b, (n*m) // b, sep='\n')