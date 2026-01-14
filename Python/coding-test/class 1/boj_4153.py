# 4153
result = []
while True:
    nums = sorted(map(int, input().split()))
    if sum(nums) == 0:
        break
    elif nums[0] ** 2 + nums[1] ** 2 == nums[2] ** 2:
        result.append('right')
    else:
        result.append('wrong')
print(*result, sep='\n')