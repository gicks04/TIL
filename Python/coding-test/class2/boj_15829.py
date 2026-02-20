n = int(input())
mystr = input()
hashing = []
r = 31
ans = 0
for i in range(n):
    hashing.append(str(ord(mystr[i])- 96))

for i in range(n):
    ans += int(hashing[i]) * (31 ** i)

print(ans % 1234567891)