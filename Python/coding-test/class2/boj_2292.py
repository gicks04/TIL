n = int(input())
num_range = 1
end = 6
count = 1
while True:
    if n <= num_range:
        print(count)
        break
    
    count += 1
    num_range += end
    end += 6